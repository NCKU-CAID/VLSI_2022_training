`ifndef _AXIDEC
`define _AXIDEC

`include "../../include/AXI_define.svh"

module Decoder (
	input        [`AXI_ADDR_BITS-1:0] addr_i,
    input                             validm_i, 
    input                             ready_s0_i,
    input                             ready_s1_i,
	input                             ready_s2_i,
	input                             ready_s4_i,
    input                             ready_sd_i,
    output logic                      valid_s0_o,
    output logic                      valid_s1_o,
	output logic                      valid_s2_o,
	output logic                      valid_s4_o,
    output logic                      valid_sd_o,
    output logic                      readys_o
);

	always_comb begin
		if (addr_i >= `AXI_ADDR_BITS'h0 && addr_i < `AXI_ADDR_BITS'h2000) begin
				readys_o   = validm_i ? ready_s0_i : 1'b0;
				valid_s0_o = validm_i;
				valid_s1_o = 1'b0;
				valid_s2_o = 1'b0;
				valid_s4_o = 1'b0;
				valid_sd_o = 1'b0;
		end
		else if (addr_i > `AXI_ADDR_BITS'h0ffff && addr_i < `AXI_ADDR_BITS'h20000) begin
				readys_o   = validm_i ? ready_s1_i : 1'b0;
				valid_s0_o = 1'b0;
				valid_s1_o = validm_i;
				valid_s2_o = 1'b0;
				valid_s4_o = 1'b0;
				valid_sd_o = 1'b0;
		end
		else if (addr_i > `AXI_ADDR_BITS'h1ffff && addr_i < `AXI_ADDR_BITS'h30000) begin
				readys_o   = validm_i ? ready_s2_i : 1'b0;
				valid_s0_o = 1'b0;
				valid_s1_o = 1'b0;
				valid_s2_o = validm_i;
				valid_s4_o = 1'b0;
				valid_sd_o = 1'b0;
		end
		else if (addr_i > `AXI_ADDR_BITS'h1fffffff && addr_i < `AXI_ADDR_BITS'h20200000) begin
				readys_o   = validm_i ? ready_s4_i : 1'b0;
				valid_s0_o = 1'b0;
				valid_s1_o = 1'b0;
				valid_s2_o = 1'b0;
				valid_s4_o = validm_i;
				valid_sd_o = 1'b0;
		end
		else begin
				readys_o   = validm_i ? ready_sd_i : 1'b0;
				valid_s0_o = 1'b0;
				valid_s1_o = 1'b0;
				valid_s2_o = 1'b0;
				valid_s4_o = 1'b0;
				valid_sd_o = validm_i;
		end
	end

endmodule

`endif
