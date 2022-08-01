`include "IFE.sv"
`include "ID.sv"
`include "EXE.sv"
`include "MEM.sv"
`include "WB.sv"
`include "ForwardUnit.sv"
`include "BranchCtrl.sv"
`include "HazardCtrl.sv"
`include "SRAM_wrapper.sv"
module top (
    input clk,  // Clock
    input rst
);
  wire [1:0] wire_BranchCtrl;
  wire InstrFlush;
  wire IFID_RegWrite;
  wire [31:0] IF_pc_out;
  wire [31:0] IF_instr_out;

  wire [31:0] pc_imm;
  wire [31:0] pc_immrs1;

  wire PCWrite;

  wire [31:0] instr_out;
  wire [31:0] pc_out;

  IFE IFE (
      .clk(clk),  // Clock
      .rst(rst),
      .BranchCtrl(wire_BranchCtrl),
      .pc_imm(pc_imm),
      .pc_immrs1(pc_immrs1),

      .InstrFlush(InstrFlush),
      .IFID_RegWrite(IFID_RegWrite),

      .PCWrite(PCWrite),

      .instr_out(instr_out),

      .IF_pc_out(IF_pc_out),
      .IF_instr_out(IF_instr_out),

      .pc_out(pc_out)
  );

  SRAM_wrapper IM1 (
      .CK(~clk),
      .CS(1'b1),
      .OE(1'b1),
      .WEB(4'b1111),  // low active
      .A(pc_out[15:2]),
      .DI(32'b0),
      .DO(instr_out)
  );

  wire [31:0] WB_rd_data;
  wire [4:0] WB_rd_addr;
  wire WB_RegWrite;

  wire CtrlSignalFlush;

  wire [31:0] ID_pc_out;
  wire [31:0] ID_rs1;
  wire [31:0] ID_rs2;
  wire [31:0] ID_imm;
  wire [2:0] ID_funct3;
  wire [6:0] ID_funct7;
  wire [4:0] ID_rd_addr;
  wire [4:0] ID_rs1_addr;
  wire [4:0] ID_rs2_addr;
  wire [2:0] ID_ALUOP;
  wire ID_PCtoRegSrc;
  wire ID_ALUSrc;
  wire ID_RDSrc;
  wire ID_MemRead;
  wire ID_MemWrite;
  wire ID_MemtoReg;
  wire ID_RegWrite;
  wire [1:0] ID_branch;

  wire [4:0] rs1_addr;
  wire [4:0] rs2_addr;


  ID ID (
      .clk(clk),  // Clock
      .rst(rst),
      .IF_instr_out(IF_instr_out),
      .IF_pc_out(IF_pc_out),

      .WB_rd_data (WB_rd_data),
      .WB_rd_addr (WB_rd_addr),
      .WB_RegWrite(WB_RegWrite),

      .CtrlSignalFlush(CtrlSignalFlush),

      .ID_pc_out(ID_pc_out),
      .ID_rs1(ID_rs1),
      .ID_rs2(ID_rs2),
      .ID_imm(ID_imm),
      .ID_funct3(ID_funct3),
      .ID_funct7(ID_funct7),
      .ID_rd_addr(ID_rd_addr),
      .ID_rs1_addr(ID_rs1_addr),
      .ID_rs2_addr(ID_rs2_addr),
      .ID_ALUOP(ID_ALUOP),
      .ID_PCtoRegSrc(ID_PCtoRegSrc),
      .ID_ALUSrc(ID_ALUSrc),
      .ID_RDSrc(ID_RDSrc),
      .ID_MemRead(ID_MemRead),
      .ID_MemWrite(ID_MemWrite),
      .ID_MemtoReg(ID_MemtoReg),
      .ID_RegWrite(ID_RegWrite),
      .ID_branch(ID_branch),

      .rs1_addr(rs1_addr),
      .rs2_addr(rs2_addr)
  );

  wire [31:0] wire_MEM_rd_data;

  wire [1:0] ForwardRS1Src;
  wire [1:0] ForwardRS2Src;

  wire EXE_RDsrc;
  wire EXE_MemRead;
  wire EXE_MemWrite;
  wire EXE_MemtoReg;
  wire EXE_RegWrite;
  wire [31:0] EXE_pc_to_reg;
  wire [31:0] EXE_alu_out;
  wire [31:0] EXE_rs2_data;
  wire [4:0] EXE_rd_addr;
  wire [2:0] EXE_funct3;

  wire ZeroFlag;

  EXE EXE (
      .clk(clk),  // Clock
      .rst(rst),

      .ID_pc_out(ID_pc_out),
      .ID_rs1(ID_rs1),
      .ID_rs2(ID_rs2),
      .ID_imm(ID_imm),
      .ID_funct3(ID_funct3),
      .ID_funct7(ID_funct7),
      .ID_rd_addr(ID_rd_addr),
      .ID_rs1_addr(ID_rs1_addr),
      .ID_rs2_addr(ID_rs2_addr),
      .ID_ALUOP(ID_ALUOP),
      .ID_PCtoRegSrc(ID_PCtoRegSrc),
      .ID_ALUSrc(ID_ALUSrc),
      .ID_RDSrc(ID_RDSrc),
      .ID_MemRead(ID_MemRead),
      .ID_MemWrite(ID_MemWrite),
      .ID_MemtoReg(ID_MemtoReg),
      .ID_RegWrite(ID_RegWrite),

      .wire_MEM_rd_data(wire_MEM_rd_data),
      .WB_rd_data(WB_rd_data),

      .ForwardRS1Src(ForwardRS1Src),
      .ForwardRS2Src(ForwardRS2Src),

      .EXE_RDsrc(EXE_RDsrc),
      .EXE_MemRead(EXE_MemRead),
      .EXE_MemWrite(EXE_MemWrite),
      .EXE_MemtoReg(EXE_MemtoReg),
      .EXE_RegWrite(EXE_RegWrite),
      .EXE_pc_to_reg(EXE_pc_to_reg),
      .EXE_alu_out(EXE_alu_out),
      .EXE_rs2_data(EXE_rs2_data),
      .EXE_rd_addr(EXE_rd_addr),
      .EXE_funct3(EXE_funct3),

      .ZeroFlag(ZeroFlag),
      .pc_imm(pc_imm),
      .pc_immrs1(pc_immrs1)
  );

  wire MEM_MemtoReg;
  wire MEM_RegWrite;
  wire [31:0] MEM_rd_data;
  wire [31:0] MEM_lw_data;
  wire [4:0] MEM_rd_addr;

  wire [31:0] wire_lw_data;
  wire wire_chipSelect;
  wire [3:0] wire_writeEnable;
  wire [31:0] wire_dataIn;

  MEM MEM (
      .clk(clk),  // Clock
      .rst(rst),

      .EXE_RDsrc(EXE_RDsrc),
      .EXE_MemRead(EXE_MemRead),
      .EXE_MemWrite(EXE_MemWrite),
      .EXE_MemtoReg(EXE_MemtoReg),
      .EXE_RegWrite(EXE_RegWrite),
      .EXE_pc_to_reg(EXE_pc_to_reg),
      .EXE_alu_out(EXE_alu_out),
      .EXE_rs2_data(EXE_rs2_data),
      .EXE_rd_addr(EXE_rd_addr),
      .EXE_funct3(EXE_funct3),

      .MEM_MemtoReg(MEM_MemtoReg),
      .MEM_RegWrite(MEM_RegWrite),
      .MEM_rd_data(MEM_rd_data),  // Data from ALU
      .MEM_lw_data(MEM_lw_data),  // Data from Data memory
      .MEM_rd_addr(MEM_rd_addr),
      .wire_MEM_rd_data(wire_MEM_rd_data),

      .wire_lw_data(wire_lw_data),
      .wire_chipSelect(wire_chipSelect),
      .wire_writeEnable(wire_writeEnable),
      .wire_dataIn(wire_dataIn)
  );

  SRAM_wrapper DM1 (
      .CK (~clk),
      .CS (wire_chipSelect),
      .OE (EXE_MemRead),
      //.WEB({4{~EXE_MemWrite}}),
      .WEB(wire_writeEnable),
      .A  (EXE_alu_out[15:2]),
      //.DI(EXE_rs2_data),
      .DI (wire_dataIn),
      .DO (wire_lw_data)
  );

  WB WB (
      .clk(clk),  // Clock
      .rst(rst),

      .MEM_MemtoReg(MEM_MemtoReg),
      .MEM_RegWrite(MEM_RegWrite),
      .MEM_rd_data (MEM_rd_data),   // Data from ALU
      .MEM_lw_data (MEM_lw_data),   // Data from Data memory
      .MEM_rd_addr (MEM_rd_addr),

      .WB_rd_data (WB_rd_data),
      .WB_rd_addr (WB_rd_addr),
      .WB_RegWrite(WB_RegWrite)
  );

  ForwardUnit ForwardUnit (
      .ID_rs1_addr (ID_rs1_addr),
      .ID_rs2_addr (ID_rs2_addr),
      .EXE_RegWrite(EXE_RegWrite),
      .EXE_rd_addr (EXE_rd_addr),
      .MEM_RegWrite(MEM_RegWrite),
      .MEM_rd_addr (MEM_rd_addr),

      .ForwardRS1Src(ForwardRS1Src),
      .ForwardRS2Src(ForwardRS2Src)
  );

  BranchCtrl BranchCtrl (
      .ID_branch (ID_branch),
      .ZeroFlag  (ZeroFlag),
      .BranchCtrl(wire_BranchCtrl)
  );

  HazardCtrl HazardCtrl (
      .BranchCtrl(wire_BranchCtrl),
      .ID_MemRead(ID_MemRead),
      .ID_rd_addr(ID_rd_addr),
      .rs1_addr  (rs1_addr),
      .rs2_addr  (rs2_addr),

      .InstrFlush(InstrFlush),
      .CtrlSignalFlush(CtrlSignalFlush),
      .IFID_RegWrite(IFID_RegWrite),
      .PCWrite(PCWrite)
  );

endmodule : top


















