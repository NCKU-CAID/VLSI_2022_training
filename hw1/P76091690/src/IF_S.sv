`include "./Def.sv"

module IF_S (
    input                                     clk,
    rst,
           inf_IF_ID.IF2ID                    if2id_o,
    input                                     stall_i,
    flush_i,
    input                  [`DATA_BITS  -1:0] inst_i,
    output                 [`ADDR_BITS  -1:0] inst_pc_o,
    input                  [`ADDR_BITS  -1:0] exe_pc_imm_i,
    exe_pc_aluout_i,
    input                  [`BRANCH_BITS-1:0] exe_branch_ctrl_i,
    input                                     exe_zero_flag_i
);
  logic [`ADDR_BITS-1:0] pc_in, pc_out, pc_outadd4;
  assign pc_outadd4 = pc_out + 32'h4;
  // Branch Ctrl
  always @(*) begin
    case (exe_branch_ctrl_i)
      `BRANCH_NEXT: pc_in = pc_outadd4;
      `BRANCH_BEQ:  pc_in = exe_zero_flag_i ? pc_outadd4 : exe_pc_imm_i;
      `BRANCH_JAL:  pc_in = exe_pc_imm_i;
      `BRANCH_JALR: pc_in = {exe_pc_aluout_i[31:1], 1'b0};
    endcase
  end
  // PC
  assign inst_pc_o = pc_out;
  always @(posedge clk or posedge rst) begin
    if (rst) pc_out <= `ADDR_BITS'h0;
    else if (stall_i) pc_out <= pc_out;
    else pc_out <= pc_in;
  end
  always @(posedge clk or posedge rst) begin
    if (rst) if2id_o.pc <= `ADDR_BITS'h0;
    else if (stall_i) if2id_o.pc <= if2id_o.pc;
    else if2id_o.pc <= pc_out;
  end
  // Inst
  always @(posedge clk or posedge rst) begin
    if (rst) if2id_o.inst <= `DATA_BITS'h0;
    else if (flush_i) if2id_o.inst <= `DATA_BITS'h0;
    else if (stall_i) if2id_o.inst <= if2id_o.inst;
    else if2id_o.inst <= inst_i;
  end

endmodule
