`include "./Def.sv"

interface inf_ID_EX;
  logic [`ADDR_BITS  -1:0] pc;
  logic [`ALUOP_BITS -1:0] aluop;
  logic [`FUNC3_BITS -1:0] func3;
  logic [`FUNC7_BITS -1:0] func7;
  logic [`IMM_BITS   -1:0] imm;
  logic [`TYPE_BITS  -1:0] datatype;
  logic [`BRANCH_BITS-1:0] branch_ctrl;
  logic [`REG_BITS   -1:0] rs1_addr, rs2_addr, rd_addr;
  logic [`DATA_BITS  -1:0] rs1_data, rs2_data;
  logic alu_src;
  logic pc2reg_src;
  logic reg_wr;
  logic rd_src;
  logic dm2reg, dm_rd, dm_wr;

  modport ID2EX(
      output pc,
      output aluop,
      output func3, func7,
      output imm,
      output datatype,
      output rs1_addr, rs2_addr, rd_addr,
      output rs1_data, rs2_data,
      output branch_ctrl,
      output alu_src,
      output pc2reg_src,
      output reg_wr,
      output rd_src,
      output dm2reg, dm_rd, dm_wr
  );
  modport EX2ID(
      input pc,
      input aluop,
      input func3, func7,
      input imm,
      input datatype,
      input rs1_addr, rs2_addr, rd_addr,
      input rs1_data, rs2_data,
      input branch_ctrl,
      input alu_src,
      input pc2reg_src,
      input reg_wr,
      input rd_src,
      input dm2reg, dm_rd, dm_wr
  );

endinterface : inf_ID_EX
