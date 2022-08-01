`ifndef __AXIDEC__
`define __AXIDEC__
`include "../../include/AXI_define.svh"

module Decoder (
	input [`AXI_ADDR_BITS-1:0] addr_i,
    input        valid_i, 
    input        ready_s0_i,
    input        ready_s1_i,
    input        ready_sd_i,
    output logic valid_s0_o,
    output logic valid_s1_o,
    output logic valid_sd_o,
    output logic readys_o
);
	always_comb begin
		case (addr_i[`AXI_ADDR_BITS-1:16])
			16'h0  : begin
				readys_o   = valid_i ? ready_s0_i : 1'b0;
				valid_s0_o = valid_i;
				valid_s1_o = 1'b0;
				valid_sd_o = 1'b0;
			end
			16'h1   : begin
				readys_o   = valid_i ? ready_s1_i : 1'b0;
				valid_s0_o = 1'b0;
				valid_s1_o = valid_i;
				valid_sd_o = 1'b0;
			end
			default : begin
				readys_o   = valid_i ? ready_sd_i : 1'b0;
				valid_s0_o = 1'b0;
				valid_s1_o = 1'b0;
				valid_sd_o = valid_i;
			end
		endcase
	end

endmodule

`endif