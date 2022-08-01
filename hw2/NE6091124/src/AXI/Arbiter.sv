`include "../../include/AXI_define.svh"

module Arbiter (
	input clk,
    input rst,

	//M0
	input  [`AXI_ID_BITS-1:0] ID_M0,
    input  [`AXI_ADDR_BITS-1:0] ADDR_M0,
    input  [`AXI_LEN_BITS-1:0] LEN_M0,
    input  [`AXI_SIZE_BITS-1:0] SIZE_M0,
    input  [1:0] BURST_M0,
    input  VALID_M0,

	//M1
	input  [`AXI_ID_BITS-1:0] ID_M1,
    input  [`AXI_ADDR_BITS-1:0] ADDR_M1,
    input  [`AXI_LEN_BITS-1:0] LEN_M1,
    input  [`AXI_SIZE_BITS-1:0] SIZE_M1,
    input  [1:0] BURST_M1,
    input  VALID_M1,
	
	//S
    output  logic   [`AXI_IDS_BITS-1:0] ID,
    output  logic   [`AXI_ADDR_BITS-1:0] ADDR,
    output  logic   [`AXI_LEN_BITS-1:0] LEN,
    output  logic   [`AXI_SIZE_BITS-1:0] SIZE,
    output  logic   [1:0] BURST,
    output  logic   VALID,

	//S
	input  READY,

	//M0
	output	logic	READY_M0,

	//M1
    output	logic	READY_M1
);

	logic LOCK_M0;
	logic LOCK_M1;
	logic [1:0] MASTER;

	always_ff@(posedge clk or negedge rst) begin
		if(~rst)begin
			LOCK_M0 <= 1'b0;
			LOCK_M1 <= 1'b0;
		end
		else begin
			LOCK_M0 <= (LOCK_M0 & READY) ? 1'b0 : (VALID_M0 & ~VALID_M1 & ~READY) ? 1'b1 : LOCK_M0;	
			LOCK_M1 <= (LOCK_M1 & READY) ? 1'b0 : (~LOCK_M0 & VALID_M1  & ~READY) ? 1'b1 : LOCK_M1;	
		end
	end

	always_comb begin
		if((VALID_M1 & ~LOCK_M0) | LOCK_M1)
			MASTER = 2'b10;
		else if (VALID_M0 | LOCK_M0)
			MASTER = 2'b01;
		else 
			MASTER = 2'b0;
	end

	always_comb begin
		case(MASTER)
			default:begin
				ID = `AXI_IDS_BITS'b0;
                ADDR = `AXI_ADDR_BITS'b0;
                LEN = `AXI_LEN_BITS'b0;
                SIZE = `AXI_SIZE_BITS'b0;
                BURST = 2'b0;
                VALID = 1'b0;
                READY_M0 = 1'b0;
                READY_M1 = 1'b0;
			end
			2'b01:begin
				ID = {4'b0001,ID_M0};
                ADDR = ADDR_M0;
                LEN = LEN_M0;
                SIZE = SIZE_M0;
                BURST = BURST_M0;
                VALID = VALID_M0;
                READY_M0 = READY & VALID_M0;
				READY_M1 = 1'b0;
            end
			2'b10:begin
				ID = {4'b0010,ID_M1};
                ADDR = ADDR_M1;
                LEN = LEN_M1;
                SIZE = SIZE_M1;
                BURST = BURST_M1;
                VALID = VALID_M1;
				READY_M0 = 1'b0;
                READY_M1 = READY & VALID_M1;
            end
		endcase
	end
endmodule
