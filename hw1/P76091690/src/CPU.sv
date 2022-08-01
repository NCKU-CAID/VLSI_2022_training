`include "./Def.sv"
`include "./inf_IF_ID.sv"
`include "./inf_ID_EX.sv"
`include "./inf_EX_MEM.sv"
`include "./inf_MEM_WB.sv"
`include "./RegFile.sv"
`include "./Forward.sv"
`include "./Hazard.sv"
`include "./IF_S.sv"
`include "./ID_S.sv"
`include "./EXE_S.sv"
`include "./MEM_S.sv"
`include "./WB_S.sv"

module CPU (
    input                   clk,
    rst,
    input  [`DATA_BITS-1:0] inst_i,
    input  [`DATA_BITS-1:0] dm_data_i,
    output [`ADDR_BITS-1:0] inst_pc_o,
    output [`WEB_BITS -1:0] web_o,
    output [`ADDR_BITS-1:0] dm_addr_o,
    output [`DATA_BITS-1:0] dm_data_o
);
  inf_IF_ID inf_IF_ID ();
  inf_ID_EX inf_ID_EX ();
  inf_EX_MEM inf_EX_MEM ();
  inf_MEM_WB inf_MEM_WB ();
  logic [`BRANCH_BITS -1:0] exe_branch_ctrl;
  logic [`DATA_BITS   -1:0]
      id_rs1_data, id_rs2_data, exe_rd_data, mem_rd_data, wb_rd_data;
  logic [`REG_BITS    -1:0] id_rs1_addr, id_rs2_addr, exe_rs1_addr,
      exe_rs2_addr;
  logic [`REG_BITS    -1:0] exe_rd_addr, mem_rd_addr, wb_rd_addr;
  logic [`FORWARD_BITS-1:0] forward_rs1, forward_rs2;
  logic [`ADDR_BITS   -1:0] exe_pc_imm, exe_pc_add4, exe_pc_aluout;
  logic stall, flush;
  logic exe_zero_flag;
  logic mem_reg_wr, wb_reg_wr;
  logic exe_dm_rd;

  RegFile i_regfile (
      .clk        (~clk),
      .rst        (rst),
      .wb_reg_wr_i(wb_reg_wr),
      .rs1_addr_i (id_rs1_addr),
      .rs2_addr_i (id_rs2_addr),
      .rd_addr_i  (wb_rd_addr),
      .rs1_data_o (id_rs1_data),
      .rs2_data_o (id_rs2_data),
      .rd_data_i  (wb_rd_data)
  );
  Forward i_forward (
      .exe_rs1_addr_i(exe_rs1_addr),
      .exe_rs2_addr_i(exe_rs2_addr),
      .mem_reg_wr_i  (mem_reg_wr),
      .mem_rd_addr_i (mem_rd_addr),
      .wb_reg_wr_i   (wb_reg_wr),
      .wb_rd_addr_i  (wb_rd_addr),
      .forward_rs1_o (forward_rs1),
      .forward_rs2_o (forward_rs2)
  );
  Hazard i_hazard (
      .id_rs1_addr_i    (id_rs1_addr),
      .id_rs2_addr_i    (id_rs2_addr),
      .exe_branch_ctrl_i(exe_branch_ctrl),
      .exe_zero_flag_i  (exe_zero_flag),
      .exe_dm_rd_i      (exe_dm_rd),
      .exe_rd_addr_i    (exe_rd_addr),
      .stall_o          (stall),
      .flush_o          (flush)
  );
  IF_S i_if (
      .clk              (clk),
      .rst              (rst),
      .if2id_o          (inf_IF_ID),
      .stall_i          (stall),
      .flush_i          (flush),
      .inst_i           (inst_i),
      .inst_pc_o        (inst_pc_o),
      .exe_branch_ctrl_i(exe_branch_ctrl),
      .exe_pc_imm_i     (exe_pc_imm),
      .exe_pc_aluout_i  (exe_pc_aluout),
      .exe_zero_flag_i  (exe_zero_flag)
  );
  ID_S i_id (
      .clk       (clk),
      .rst       (rst),
      .id2if_i   (inf_IF_ID),
      .id2ex_o   (inf_ID_EX),
      .stall_i   (stall),
      .flush_i   (flush),
      .rs1_data_i(id_rs1_data),
      .rs2_data_i(id_rs2_data),
      .rs1_addr_o(id_rs1_addr),
      .rs2_addr_o(id_rs2_addr)
  );
  EXE_S i_exe (
      .clk          (clk),
      .rst          (rst),
      .ex2id_i      (inf_ID_EX),
      .ex2mem_o     (inf_EX_MEM),
      .forward_rs1_i(forward_rs1),
      .forward_rs2_i(forward_rs2),
      .mem_rd_data_i(mem_rd_data),
      .wb_rd_data_i (wb_rd_data),
      .rs1_addr_o   (exe_rs1_addr),
      .rs2_addr_o   (exe_rs2_addr),
      .branch_ctrl_o(exe_branch_ctrl),
      .zero_flag_o  (exe_zero_flag),
      .pc_imm_o     (exe_pc_imm),
      .pc_aluout_o  (exe_pc_aluout),
      .rd_addr_o    (exe_rd_addr),
      .dm_rd_o      (exe_dm_rd)
  );
  MEM_S i_mem (
      .clk      (clk),
      .rst      (rst),
      .mem2ex_i (inf_EX_MEM),
      .mem2wb_o (inf_MEM_WB),
      // Forward
      .rd_data_o(mem_rd_data),
      .rd_addr_o(mem_rd_addr),
      .reg_wr_o (mem_reg_wr),
      // lw, sw
      .data_i   (dm_data_i),
      .dm_addr_o(dm_addr_o),
      .dm_sw_o  (dm_data_o),
      .dm_web_o (web_o)
  );
  WB_S i_wb (
      .wb2mem_i(inf_MEM_WB),
      .reg_wr_o(wb_reg_wr),
      .addr_o  (wb_rd_addr),
      .data_o  (wb_rd_data)
  );

endmodule
