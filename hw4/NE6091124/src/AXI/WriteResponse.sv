`include "../../include/AXI_define.svh"

module WriteResponse(

	input clk,
	input rst,
    
    //M1
	output [`AXI_ID_BITS-1:0] BID_M1,
	output [1:0] BRESP_M1,
	output logic BVALID_M1,
	input BREADY_M1,

    //S0
	input [`AXI_IDS_BITS-1:0] BID_S0,
	input [1:0] BRESP_S0,
	input BVALID_S0,
	output logic BREADY_S0,

    //S1
	input [`AXI_IDS_BITS-1:0] BID_S1,
	input [1:0] BRESP_S1,
	input BVALID_S1,
	output logic BREADY_S1,

	//S2
	input [`AXI_IDS_BITS-1:0] BID_S2,
	input [1:0] BRESP_S2,
	input BVALID_S2,
	output logic BREADY_S2,

	//S3
	input [`AXI_IDS_BITS-1:0] BID_S3,
	input [1:0] BRESP_S3,
	input BVALID_S3,
	output logic BREADY_S3,

	//S4
	input [`AXI_IDS_BITS-1:0] BID_S4,
	input [1:0] BRESP_S4,
	input BVALID_S4,
	output logic BREADY_S4,

	//S5
	input [`AXI_IDS_BITS-1:0] BID_S5,
	input [1:0] BRESP_S5,
	input BVALID_S5,
	output logic BREADY_S5
);

	logic	[`AXI_ID_BITS-1:0] BID;
	logic	[1:0] BRESP;
	logic	BVALID;
	logic 	BREADY;
	
	logic	LOCK_S0;
	logic	LOCK_S1;
	logic	LOCK_S2;
	logic	LOCK_S3;
	logic	LOCK_S4;
	logic	LOCK_S5;
	logic 	[3:0]	MASTER;
	logic	[5:0]	SLAVE;

	assign BID_M1 = BID;
	assign BRESP_M1 = BRESP;

	always_comb begin
		case(MASTER)
			4'b0010:begin
				BREADY = BREADY_M1;
				BVALID_M1 = BVALID;
			end
			default:begin
				BREADY = 1'b1;
				BVALID_M1 = 1'b0;
			end
		endcase
	end

	always_ff@(posedge clk or negedge rst) begin
		if(~rst) begin
			LOCK_S0 <= 1'b0;
			LOCK_S1 <= 1'b0;
			LOCK_S2 <= 1'b0;
			LOCK_S3 <= 1'b0;
			LOCK_S4 <= 1'b0;
			LOCK_S5 <= 1'b0;
		end
		else begin
			LOCK_S0 <= (LOCK_S0 & BREADY)? 1'b0 : (BVALID_S0 & ~BVALID_S1 & ~BVALID_S2 & ~BVALID_S3 & ~BVALID_S4 & ~BVALID_S5 & ~BREADY) ? 1'b1 : LOCK_S0;
			LOCK_S1 <= (LOCK_S1 & BREADY)? 1'b0 : (~LOCK_S0  & BVALID_S1  & ~BVALID_S2 & ~BVALID_S3 & ~BVALID_S4 & ~BVALID_S5 & ~BREADY) ? 1'b1 : LOCK_S1;
			LOCK_S2 <= (LOCK_S2 & BREADY)? 1'b0 : (~LOCK_S0  & ~LOCK_S1   & BVALID_S2  & ~BVALID_S3 & ~BVALID_S4 & ~BVALID_S5 & ~BREADY) ? 1'b1 : LOCK_S2;
			LOCK_S3 <= (LOCK_S3 & BREADY)? 1'b0 : (~LOCK_S0  & ~LOCK_S1   & ~LOCK_S2   & BVALID_S3  & ~BVALID_S4 & ~BVALID_S5 & ~BREADY) ? 1'b1 : LOCK_S3;
			LOCK_S4 <= (LOCK_S4 & BREADY)? 1'b0 : (~LOCK_S0  & ~LOCK_S1   & ~LOCK_S2   & ~LOCK_S3   & BVALID_S4  & ~BVALID_S5 & ~BREADY) ? 1'b1 : LOCK_S4;
			LOCK_S5 <= (LOCK_S5 & BREADY)? 1'b0 : (~LOCK_S0  & ~LOCK_S1   & ~LOCK_S2   & ~LOCK_S3   & ~LOCK_S4   & BVALID_S5  & ~BREADY) ? 1'b1 : LOCK_S5;
		end
	end
	
	always_comb begin
		if((BVALID_S5 & ~LOCK_S4 & ~LOCK_S3 & ~LOCK_S2 & ~LOCK_S1 & ~LOCK_S0) | LOCK_S5)
			SLAVE = 6'b100000;
		else if((BVALID_S4 & ~LOCK_S3 & ~LOCK_S2 & ~LOCK_S1 & ~LOCK_S0) | LOCK_S4)
			SLAVE = 6'b010000;
		else if((BVALID_S3 & ~LOCK_S2 & ~LOCK_S1 & ~LOCK_S0) | LOCK_S3)
			SLAVE = 6'b001000;
		else if((BVALID_S2 & ~LOCK_S1 & ~LOCK_S0) | LOCK_S2)
			SLAVE = 6'b000100;
		else if ((BVALID_S1 & ~LOCK_S0) | LOCK_S1)
			SLAVE = 6'b000010;
		else if (BVALID_S0 | LOCK_S0)
			SLAVE = 6'b000001;
		else
			SLAVE = 6'b0;
	end

	always_comb begin
		case(SLAVE)
			default:begin
				MASTER = 4'b0;
				BID = `AXI_ID_BITS'b0;
				BRESP = 2'b0;
				BVALID = 1'b0;
				BREADY_S0 = 1'b0;
				BREADY_S1 = 1'b0;
				BREADY_S2 = 1'b0;
				BREADY_S3 = 1'b0;
				BREADY_S4 = 1'b0;
				BREADY_S5 = 1'b0;
			end
			6'b000001:begin
				MASTER = BID_S0[`AXI_IDS_BITS-1:`AXI_ID_BITS];
				BID = BID_S0[`AXI_ID_BITS-1:0];
				BRESP = BRESP_S0;
				BVALID = BVALID_S0;
				BREADY_S0 = BVALID_S0 & BREADY;
				BREADY_S1 = 1'b0;
				BREADY_S2 = 1'b0;
				BREADY_S3 = 1'b0;
				BREADY_S4 = 1'b0;
				BREADY_S5 = 1'b0;
			end
			6'b000010:begin
				MASTER = BID_S1[`AXI_IDS_BITS-1:`AXI_ID_BITS];
				BID = BID_S1[`AXI_ID_BITS-1:0];
				BRESP = BRESP_S1;
				BVALID = BVALID_S1;
				BREADY_S0 = 1'b0;
				BREADY_S1 = BVALID_S1 & BREADY;
				BREADY_S2 = 1'b0;
				BREADY_S3 = 1'b0;
				BREADY_S4 = 1'b0;
				BREADY_S5 = 1'b0;
			end
			6'b000100:begin
				MASTER = BID_S2[`AXI_IDS_BITS-1:`AXI_ID_BITS];
				BID = BID_S2[`AXI_ID_BITS-1:0];
				BRESP = BRESP_S2;
				BVALID = BVALID_S2;
				BREADY_S0 = 1'b0;
				BREADY_S1 = 1'b0;
				BREADY_S2 = BVALID_S2 & BREADY;
				BREADY_S3 = 1'b0;
				BREADY_S4 = 1'b0;
				BREADY_S5 = 1'b0;
			end
			6'b001000:begin
				MASTER = BID_S3[`AXI_IDS_BITS-1:`AXI_ID_BITS];
				BID = BID_S3[`AXI_ID_BITS-1:0];
				BRESP = BRESP_S3;
				BVALID = BVALID_S3;
				BREADY_S0 = 1'b0;
				BREADY_S1 = 1'b0;
				BREADY_S2 = 1'b0;
				BREADY_S3 = BVALID_S3 & BREADY;
				BREADY_S4 = 1'b0;
				BREADY_S5 = 1'b0;
			end
			6'b010000:begin
				MASTER = BID_S4[`AXI_IDS_BITS-1:`AXI_ID_BITS];
				BID = BID_S4[`AXI_ID_BITS-1:0];
				BRESP = BRESP_S4;
				BVALID = BVALID_S4;
				BREADY_S0 = 1'b0;
				BREADY_S1 = 1'b0;
				BREADY_S2 = 1'b0;
				BREADY_S3 = 1'b0;
				BREADY_S4 = BVALID_S4 & BREADY;
				BREADY_S5 = 1'b0;
			end
			6'b100000:begin
				MASTER = BID_S5[`AXI_IDS_BITS-1:`AXI_ID_BITS];
				BID = BID_S5[`AXI_ID_BITS-1:0];
				BRESP = BRESP_S5;
				BVALID = BVALID_S5;
				BREADY_S0 = 1'b0;
				BREADY_S1 = 1'b0;
				BREADY_S2 = 1'b0;
				BREADY_S3 = 1'b0;
				BREADY_S4 = 1'b0;
				BREADY_S5 = BVALID_S5 & BREADY;
			end
		endcase
	end

endmodule
