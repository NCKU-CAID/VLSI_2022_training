`include "../../include/AXI_define.svh"

module Decoder (
	input	[`AXI_ADDR_BITS-1:0]	ADDR,
	input	VALID,
	input	READY_S0,
	input	READY_S1,
	input	READY_S2,
	output  logic	VALID_S0,
    output  logic	VALID_S1,
	output  logic	VALID_S2,
    output  logic	READY
);

always_comb begin
	case(ADDR[(`AXI_ADDR_BITS-1):(`AXI_ADDR_BITS/2)])
		16'h0:begin
			VALID_S0 = VALID;
			VALID_S1 = 1'b0;
			VALID_S2 = 1'b0;
			READY = (VALID) ? READY_S0 : 1'b0;
		end
		16'h1:begin
			VALID_S0 = 1'b0;
            VALID_S1 = VALID;
			VALID_S2 = 1'b0;
			READY = (VALID) ? READY_S1 : 1'b0;
		end
		default:begin
			VALID_S0 = 1'b0;
            VALID_S1 = 1'b0;
			VALID_S2 = VALID;
			READY = (VALID) ? READY_S2 : 1'b0;
		end
	endcase
end

endmodule
