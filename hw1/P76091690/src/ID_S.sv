`include "./Def.sv"

module ID_S (
    input                                   clk,
    rst,
           inf_IF_ID.ID2IF                  id2if_i,
           inf_ID_EX.ID2EX                  id2ex_o,
    input                                   stall_i,
    flush_i,
    input                  [`DATA_BITS-1:0] rs1_data_i,
    rs2_data_i,
    output                 [`REG_BITS -1:0] rs1_addr_o,
    rs2_addr_o
);
  logic [`OPCODE_BITS-1:0] op;
  logic [`FUNC7_BITS -1:0] func7;
  logic [`FUNC3_BITS -1:0] func3;
  logic [`REG_BITS   -1:0] rs1, rs2, rd;

  assign func7 = id2if_i.inst[31:25];
  assign rs2   = id2if_i.inst[24:20];
  assign rs1   = id2if_i.inst[19:15];
  assign func3 = id2if_i.inst[14:12];
  assign rd    = id2if_i.inst[11: 7];
  assign op    = id2if_i.inst[ 6: 0];
  assign rs1_addr_o = rs1;
  assign rs2_addr_o = rs2;

  // {{{ Imm
  logic [`DATA_BITS-1:0] inst;
  logic [`IMM_BITS -1:0] imm;
  assign inst = id2if_i.inst;
  always_comb begin
    case (op)
      `ROP: imm = `IMM_BITS'h0;
      `IOP_LOAD: imm = {{20{inst[31]}}, inst[31:20]};
      `IOP_ALU: imm = {{20{inst[31]}}, inst[31:20]};
      `IOP_JALR: imm = {{20{inst[31]}}, inst[31:20]};
      `SOP: imm = {{20{inst[31]}}, inst[31:25], inst[11:7]};
      `BOP: imm = {{20{inst[31]}}, inst[7], inst[30:25], inst[11:8], 1'b0};
      `UOP_AUPIC: imm = {inst[31:12], 12'b0};
      `UOP_LUI: imm = {inst[31:12], 12'b0};
      `JOP_JAL:
      imm = {{12{inst[31]}}, inst[19:12], inst[20], inst[30:21], 1'b0};
      default: imm = `IMM_BITS'h0;
    endcase
  end
  // }}}
  // {{{ Aluop
  logic [`ALUOP_BITS-1:0] aluop;
  always_comb begin
    case (op)
      `ROP:       aluop = `R_ALUOP;
      `IOP_LOAD:  aluop = `ADD_ALUOP;
      `IOP_ALU:   aluop = `I_ALUOP;
      `IOP_JALR:  aluop = `ADD_ALUOP;
      `SOP:       aluop = `ADD_ALUOP;
      `BOP:       aluop = `BEQ_ALUOP;
      `UOP_AUPIC: aluop = `NO_ALUOP;
      `UOP_LUI:   aluop = `LUI_ALUOP;
      `JOP_JAL:   aluop = `NO_ALUOP;
      default:    aluop = `NO_ALUOP;
    endcase
  end
  // }}}
  // {{{ Branch ctrl
  logic [`BRANCH_BITS-1:0] branch_ctrl;
  always_comb begin
    case (op)
      `ROP:       branch_ctrl = `BRANCH_NEXT;
      `IOP_LOAD:  branch_ctrl = `BRANCH_NEXT;
      `IOP_ALU:   branch_ctrl = `BRANCH_NEXT;
      `IOP_JALR:  branch_ctrl = `BRANCH_JALR;
      `SOP:       branch_ctrl = `BRANCH_NEXT;
      `BOP:       branch_ctrl = `BRANCH_BEQ;
      `UOP_AUPIC: branch_ctrl = `BRANCH_NEXT;
      `UOP_LUI:   branch_ctrl = `BRANCH_NEXT;
      `JOP_JAL:   branch_ctrl = `BRANCH_JAL;
      default:    branch_ctrl = `BRANCH_NEXT;
    endcase
  end
  // }}}
  // {{{ Data type
  logic [`TYPE_BITS-1:0] datatype;
  always @(*) begin
    case (func3)
      3'b000:  datatype = `BYTE;
      3'b001:  datatype = `HWORD;
      3'b100:  datatype = `BYTE_U;
      3'b101:  datatype = `HWORD_U;
      default: datatype = `WORD;
    endcase
  end
  // }}}
  // {{{ Register
  logic [`REG_BITS -1:0] rs1_addr, rs2_addr, rd_addr;
  always_comb begin
    case (op)
      `ROP: {rs1_addr, rs2_addr, rd_addr} = {rs1, rs2, rd};
      `IOP_LOAD: {rs1_addr, rs2_addr, rd_addr} = {rs1, `REG_BITS'h0, rd};
      `IOP_ALU: {rs1_addr, rs2_addr, rd_addr} = {rs1, `REG_BITS'h0, rd};
      `IOP_JALR: {rs1_addr, rs2_addr, rd_addr} = {rs1, `REG_BITS'h0, rd};
      `SOP: {rs1_addr, rs2_addr, rd_addr} = {rs1, rs2, `REG_BITS'h0};
      `BOP: {rs1_addr, rs2_addr, rd_addr} = {rs1, rs2, `REG_BITS'h0};
      `UOP_AUPIC:
      {rs1_addr, rs2_addr, rd_addr} = {`REG_BITS'h0, `REG_BITS'h0, rd};
      `UOP_LUI:
      {rs1_addr, rs2_addr, rd_addr} = {`REG_BITS'h0, `REG_BITS'h0, rd};
      `JOP_JAL:
      {rs1_addr, rs2_addr, rd_addr} = {`REG_BITS'h0, `REG_BITS'h0, rd};
      default:
      {rs1_addr, rs2_addr, rd_addr} = {
        `REG_BITS'h0, `REG_BITS'h0, `REG_BITS'h0
      };
    endcase
  end
  logic [`DATA_BITS-1:0] rs1_data, rs2_data;
  always_comb begin
    case (op)
      `ROP:       {rs1_data, rs2_data} = {rs1_data_i, rs2_data_i};
      `IOP_LOAD:  {rs1_data, rs2_data} = {rs1_data_i, `DATA_BITS'h0};
      `IOP_ALU:   {rs1_data, rs2_data} = {rs1_data_i, `DATA_BITS'h0};
      `IOP_JALR:  {rs1_data, rs2_data} = {rs1_data_i, `DATA_BITS'h0};
      `SOP:       {rs1_data, rs2_data} = {rs1_data_i, rs2_data_i};
      `BOP:       {rs1_data, rs2_data} = {rs1_data_i, rs2_data_i};
      `UOP_AUPIC: {rs1_data, rs2_data} = {`DATA_BITS'h0, `DATA_BITS'h0};
      `UOP_LUI:   {rs1_data, rs2_data} = {`DATA_BITS'h0, `DATA_BITS'h0};
      `JOP_JAL:   {rs1_data, rs2_data} = {`DATA_BITS'h0, `DATA_BITS'h0};
      default:    {rs1_data, rs2_data} = {`DATA_BITS'h0, `DATA_BITS'h0};
    endcase
  end
  // }}}
  // {{{
  logic pc2reg_src, rd_src, alu_src, reg_wr, dm_rd, dm_wr, dm2reg;
  always_comb begin
    case (op)
      `ROP:
      {pc2reg_src, rd_src, alu_src, reg_wr, dm_rd, dm_wr, dm2reg} = 7'b0001000;
      `IOP_LOAD:
      {pc2reg_src, rd_src, alu_src, reg_wr, dm_rd, dm_wr, dm2reg} = 7'b0011101;
      `IOP_ALU:
      {pc2reg_src, rd_src, alu_src, reg_wr, dm_rd, dm_wr, dm2reg} = 7'b0011000;
      `IOP_JALR:
      {pc2reg_src, rd_src, alu_src, reg_wr, dm_rd, dm_wr, dm2reg} = {
        3'b011, |rd, 3'b000
      };
      `SOP:
      {pc2reg_src, rd_src, alu_src, reg_wr, dm_rd, dm_wr, dm2reg} = 7'b0010010;
      `BOP:
      {pc2reg_src, rd_src, alu_src, reg_wr, dm_rd, dm_wr, dm2reg} = 7'b0000000;
      `UOP_AUPIC:
      {pc2reg_src, rd_src, alu_src, reg_wr, dm_rd, dm_wr, dm2reg} = 7'b1101000;
      `UOP_LUI:
      {pc2reg_src, rd_src, alu_src, reg_wr, dm_rd, dm_wr, dm2reg} = 7'b0001000;
      `JOP_JAL:
      {pc2reg_src, rd_src, alu_src, reg_wr, dm_rd, dm_wr, dm2reg} = {
        3'b011, |rd, 3'b000
      };
      default:
      {pc2reg_src, rd_src, alu_src, reg_wr, dm_rd, dm_wr, dm2reg} = 7'b0000000;
    endcase
  end
  // }}}
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      id2ex_o.pc          <= `ADDR_BITS'h0;
      id2ex_o.func3       <= `FUNC3_BITS'h0;
      id2ex_o.func7       <= 2'h0;
      id2ex_o.imm         <= `IMM_BITS'h0;
      id2ex_o.aluop       <= `ALUOP_BITS'h0;
      id2ex_o.branch_ctrl <= `BRANCH_BITS'h0;
      id2ex_o.datatype    <= `TYPE_BITS'h0;
      id2ex_o.rs1_addr    <= `REG_BITS'h0;
      id2ex_o.rs2_addr    <= `REG_BITS'h0;
      id2ex_o.rd_addr     <= `REG_BITS'h0;
      id2ex_o.rs1_data    <= `DATA_BITS'h0;
      id2ex_o.rs2_data    <= `DATA_BITS'h0;
      id2ex_o.pc2reg_src  <= 1'b0;
      id2ex_o.rd_src      <= 1'b0;
      id2ex_o.alu_src     <= 1'b0;
      id2ex_o.reg_wr      <= 1'b0;
      id2ex_o.dm_rd       <= 1'b0;
      id2ex_o.dm_wr       <= 1'b0;
      id2ex_o.dm2reg      <= 1'b0;
    end else if (stall_i | flush_i) begin
      id2ex_o.pc          <= id2ex_o.pc;
      id2ex_o.func3       <= `FUNC3_BITS'h0;
      id2ex_o.func7       <= 2'h0;
      id2ex_o.imm         <= `IMM_BITS'h0;
      id2ex_o.aluop       <= `ALUOP_BITS'h0;
      id2ex_o.branch_ctrl <= `BRANCH_BITS'h0;
      id2ex_o.datatype    <= `TYPE_BITS'h0;
      id2ex_o.rs1_addr    <= `REG_BITS'h0;
      id2ex_o.rs2_addr    <= `REG_BITS'h0;
      id2ex_o.rd_addr     <= `REG_BITS'h0;
      id2ex_o.rs1_data    <= `DATA_BITS'h0;
      id2ex_o.rs2_data    <= `DATA_BITS'h0;
      id2ex_o.pc2reg_src  <= 1'b0;
      id2ex_o.rd_src      <= 1'b0;
      id2ex_o.alu_src     <= 1'b0;
      id2ex_o.reg_wr      <= 1'b0;
      id2ex_o.dm_rd       <= 1'b0;
      id2ex_o.dm_wr       <= 1'b0;
      id2ex_o.dm2reg      <= 1'b0;
    end else begin
      id2ex_o.pc          <= id2if_i.pc;
      id2ex_o.func7       <= func7;
      id2ex_o.func3       <= func3;
      id2ex_o.imm         <= imm;
      id2ex_o.aluop       <= aluop;
      id2ex_o.branch_ctrl <= branch_ctrl;
      id2ex_o.datatype    <= datatype;
      id2ex_o.rs1_addr    <= rs1_addr;
      id2ex_o.rs2_addr    <= rs2_addr;
      id2ex_o.rd_addr     <= rd_addr;
      id2ex_o.rs1_data    <= rs1_data;
      id2ex_o.rs2_data    <= rs2_data;
      id2ex_o.pc2reg_src  <= pc2reg_src;
      id2ex_o.rd_src      <= rd_src;
      id2ex_o.alu_src     <= alu_src;
      id2ex_o.reg_wr      <= reg_wr;
      id2ex_o.dm_rd       <= dm_rd;
      id2ex_o.dm_wr       <= dm_wr;
      id2ex_o.dm2reg      <= dm2reg;
    end
  end
  // }}}
endmodule
