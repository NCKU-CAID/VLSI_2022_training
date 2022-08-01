`include "Def.sv"
`include "CPU.sv"
`include "SRAM_wrapper.sv"

module top (
    input clk,
    input rst
);
  logic [`DATA_BITS-1:0] inst;
  logic [`ADDR_BITS-1:0] inst_pc;
  logic [`ADDR_BITS-1:0] dm_addr;
  logic [`DATA_BITS-1:0] dm_data_in, dm_data_out;
  logic [`WEB_BITS -1:0] web;

  CPU i_CPU (
      .clk      (clk),
      .rst      (rst),
      .inst_i   (inst),
      .inst_pc_o(inst_pc),
      .dm_data_i(dm_data_in),
      .dm_addr_o(dm_addr),
      .dm_data_o(dm_data_out),
      .web_o    (web)
  );
  SRAM_wrapper IM1 (
      .CK (~clk),
      .CS (1'b1),
      .OE (1'b1),
      .WEB(4'hf),
      .A  (inst_pc[15:2]),
      .DI (`DATA_BITS'h0),
      .DO (inst)
  );
  SRAM_wrapper DM1 (
      .CK (~clk),
      .CS (1'b1),
      .OE (1'b1),
      .WEB(web),
      .A  (dm_addr[15:2]),
      .DI (dm_data_out),
      .DO (dm_data_in)
  );

endmodule
