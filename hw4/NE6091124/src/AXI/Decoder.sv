`include "../../include/AXI_define.svh"

module Decoder (
	input	[`AXI_ADDR_BITS-1:0]	ADDR,
	input	VALID,
	input	READY_S0,
	input	READY_S1,
	input	READY_S2,
	input	READY_S3,
	input	READY_S4,
	input	READY_S5,

	output  logic	VALID_S0,
    output  logic	VALID_S1,
	output  logic	VALID_S2,
	output  logic	VALID_S3,
	output  logic	VALID_S4,
	output  logic	VALID_S5,
    output  logic	READY
);

always_comb begin
	if(ADDR >= `AXI_ADDR_BITS'h0 && ADDR < `AXI_ADDR_BITS'h2000)begin
		VALID_S0 = VALID;
		VALID_S1 = 1'b0;
		VALID_S2 = 1'b0;
		VALID_S3 = 1'b0;
		VALID_S4 = 1'b0;
		VALID_S5 = 1'b0;
		READY = (VALID) ? READY_S0 : 1'b0;
	end
	else if(ADDR >= `AXI_ADDR_BITS'h10000 && ADDR < `AXI_ADDR_BITS'h20000)begin
		VALID_S0 = 1'b0;
        VALID_S1 = VALID;
		VALID_S2 = 1'b0;
		VALID_S3 = 1'b0;
		VALID_S4 = 1'b0;
		VALID_S5 = 1'b0;
		READY = (VALID) ? READY_S1 : 1'b0;
	end
	else if(ADDR >= `AXI_ADDR_BITS'h20000 && ADDR < `AXI_ADDR_BITS'h30000)begin
		VALID_S0 = 1'b0;
        VALID_S1 = 1'b0;
		VALID_S2 = VALID;
		VALID_S3 = 1'b0;
		VALID_S4 = 1'b0;
		VALID_S5 = 1'b0;
		READY = (VALID) ? READY_S2 : 1'b0;
	end
	else if(ADDR >= `AXI_ADDR_BITS'h10000000 && ADDR < `AXI_ADDR_BITS'h10000400)begin
		VALID_S0 = 1'b0;
        VALID_S1 = 1'b0;
		VALID_S2 = 1'b0;
		VALID_S3 = VALID;
		VALID_S4 = 1'b0;
		VALID_S5 = 1'b0;
		READY = (VALID) ? READY_S3 : 1'b0;
	end
	else if(ADDR >= `AXI_ADDR_BITS'h20000000 && ADDR < `AXI_ADDR_BITS'h20200000)begin
		VALID_S0 = 1'b0;
        VALID_S1 = 1'b0;
		VALID_S2 = 1'b0;
		VALID_S3 = 1'b0;
		VALID_S4 = VALID;
		VALID_S5 = 1'b0;
		READY = (VALID) ? READY_S4 : 1'b0;
	end
	else begin
		VALID_S0 = 1'b0;
        VALID_S1 = 1'b0;
		VALID_S2 = 1'b0;
		VALID_S3 = 1'b0;
		VALID_S4 = 1'b0;
		VALID_S5 = VALID;
		READY = (VALID) ? READY_S5 : 1'b0;
	end
end

endmodule
