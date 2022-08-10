`include "../../include/AXI_define.svh"

module ReadData(

	input clk,
	input rst,
    
    //M0
	output [`AXI_ID_BITS-1:0] RID_M0,
	output [`AXI_DATA_BITS-1:0] RDATA_M0,
	output [1:0] RRESP_M0,
	output RLAST_M0,
	output logic RVALID_M0,
	input RREADY_M0,

    //M1
	output [`AXI_ID_BITS-1:0] RID_M1,
	output [`AXI_DATA_BITS-1:0] RDATA_M1,
	output [1:0] RRESP_M1,
	output RLAST_M1,
	output logic RVALID_M1,
	input RREADY_M1,

    //S0
	input [`AXI_IDS_BITS-1:0] RID_S0,
	input [`AXI_DATA_BITS-1:0] RDATA_S0,
	input [1:0] RRESP_S0,
	input RLAST_S0,
	input RVALID_S0,
	output logic RREADY_S0,

    //S1
	input [`AXI_IDS_BITS-1:0] RID_S1,
	input [`AXI_DATA_BITS-1:0] RDATA_S1,
	input [1:0] RRESP_S1,
	input RLAST_S1,
	input RVALID_S1,
	output logic RREADY_S1,

	//S2
	input [`AXI_IDS_BITS-1:0] RID_S2,
	input [`AXI_DATA_BITS-1:0] RDATA_S2,
	input [1:0] RRESP_S2,
	input RLAST_S2,
	input RVALID_S2,
	output logic RREADY_S2,

	//S3
	input [`AXI_IDS_BITS-1:0] RID_S3,
	input [`AXI_DATA_BITS-1:0] RDATA_S3,
	input [1:0] RRESP_S3,
	input RLAST_S3,
	input RVALID_S3,
	output logic RREADY_S3,

	//S4
	input [`AXI_IDS_BITS-1:0] RID_S4,
	input [`AXI_DATA_BITS-1:0] RDATA_S4,
	input [1:0] RRESP_S4,
	input RLAST_S4,
	input RVALID_S4,
	output logic RREADY_S4,

	//S5
	input [`AXI_IDS_BITS-1:0] RID_S5,
	input [`AXI_DATA_BITS-1:0] RDATA_S5,
	input [1:0] RRESP_S5,
	input RLAST_S5,
	input RVALID_S5,
	output logic RREADY_S5
);

	logic	[`AXI_ID_BITS-1:0] RID;
	logic	[`AXI_DATA_BITS-1:0] RDATA;
	logic	[1:0] RRESP;
	logic	RLAST;
	logic	RVALID;
	logic 	RREADY;

	logic 			LOCK_S0;
	logic 			LOCK_S1;
	logic 			LOCK_S2;
	logic 			LOCK_S3;
	logic 			LOCK_S4;
	logic 			LOCK_S5;
	logic 	[3:0]	MASTER;
	logic	[5:0]	SLAVE;

	assign RID_M0 = RID;
	assign RDATA_M0 = RDATA;
	assign RRESP_M0 = RRESP;
	assign RLAST_M0 = RLAST;

	assign RID_M1 = RID;
	assign RDATA_M1 = RDATA;
	assign RRESP_M1 = RRESP;
	assign RLAST_M1 = RLAST;

	always_comb begin
		case(MASTER)
			4'b0001:begin
				RREADY = RREADY_M0;
				RVALID_M0 = RVALID;
				RVALID_M1 = 1'b0;
			end
			4'b0010:begin
				RREADY = RREADY_M1;
				RVALID_M0 = 1'b0;
				RVALID_M1 = RVALID;
			end
			default:begin
				RREADY = 1'b1;
				RVALID_M0 = 1'b0;
				RVALID_M1 = 1'b0;
			end
		endcase
	end

	always_ff @(posedge clk or negedge rst) begin
		if(~rst)begin
			LOCK_S0 <= 1'b0;
			LOCK_S1 <= 1'b0;
			LOCK_S2 <= 1'b0;
			LOCK_S3 <= 1'b0;
			LOCK_S4 <= 1'b0;
			LOCK_S5 <= 1'b0;
		end
		else begin
			LOCK_S0 <= (LOCK_S0 & RREADY & RLAST_S0)? 1'b0 : (RVALID_S0 & ~RVALID_S1 & ~RVALID_S2 & ~RVALID_S3 & ~RVALID_S4 & ~RVALID_S5 & ~RREADY) ? 1'b1 : LOCK_S0;
			LOCK_S1 <= (LOCK_S1 & RREADY & RLAST_S1)? 1'b0 : (~LOCK_S0  & RVALID_S1  & ~RVALID_S2 & ~RVALID_S3 & ~RVALID_S4 & ~RVALID_S5 & ~RREADY) ? 1'b1 : LOCK_S1;
			LOCK_S2 <= (LOCK_S2 & RREADY & RLAST_S2)? 1'b0 : (~LOCK_S0  & ~LOCK_S1   & RVALID_S2  & ~RVALID_S3 & ~RVALID_S4 & ~RVALID_S5 & ~RREADY) ? 1'b1 : LOCK_S2;
			LOCK_S3 <= (LOCK_S3 & RREADY & RLAST_S3)? 1'b0 : (~LOCK_S0  & ~LOCK_S1   & ~LOCK_S2   & RVALID_S3  & ~RVALID_S4 & ~RVALID_S5 & ~RREADY) ? 1'b1 : LOCK_S3;
			LOCK_S4 <= (LOCK_S4 & RREADY & RLAST_S4)? 1'b0 : (~LOCK_S0  & ~LOCK_S1   & ~LOCK_S2   & ~LOCK_S3   & RVALID_S4  & ~RVALID_S5 & ~RREADY) ? 1'b1 : LOCK_S4;
			LOCK_S5 <= (LOCK_S5 & RREADY & RLAST_S5)? 1'b0 : (~LOCK_S0  & ~LOCK_S1   & ~LOCK_S2   & ~LOCK_S3   & ~LOCK_S4   & RVALID_S5  & ~RREADY) ? 1'b1 : LOCK_S5;
		end
	end

	always_comb begin
		if((RVALID_S5 & ~LOCK_S0 & ~LOCK_S1 & ~LOCK_S2 & ~LOCK_S3 & ~LOCK_S4) | LOCK_S5)
			SLAVE = 6'b100000;
		else if((RVALID_S4 & ~LOCK_S0 & ~LOCK_S1 & ~LOCK_S2 & ~LOCK_S3) | LOCK_S4)
			SLAVE = 6'b010000;
		else if((RVALID_S3 & ~LOCK_S0 & ~LOCK_S1 & ~LOCK_S2) | LOCK_S3)
			SLAVE = 6'b001000;
   		else if((RVALID_S2 & ~LOCK_S0 & ~LOCK_S1) | LOCK_S2)
			SLAVE = 6'b000100;
   		else if ((RVALID_S1 & ~LOCK_S0) | LOCK_S1)
			SLAVE = 6'b000010;
   		else if (RVALID_S0 | LOCK_S0)
			SLAVE = 6'b000001;
   		else 
			SLAVE = 6'b0;
	end

	always_comb begin
		case(SLAVE)
			default:begin
				MASTER = 4'b0;
				RID = `AXI_ID_BITS'b0;
				RDATA = `AXI_DATA_BITS'b0;
				RRESP = 2'b0;
				RLAST = 1'b0;
				RVALID = 1'b0;
				RREADY_S0 = 1'b0;
				RREADY_S1 = 1'b0;
				RREADY_S2 = 1'b0;
				RREADY_S3 = 1'b0;
				RREADY_S4 = 1'b0;
				RREADY_S5 = 1'b0;
			end
			6'b000001:begin
				MASTER = RID_S0[`AXI_IDS_BITS-1:`AXI_ID_BITS];
				RID = RID_S0[`AXI_ID_BITS-1:0];
				RDATA = RDATA_S0;
				RRESP = RRESP_S0;
				RLAST = RLAST_S0;
				RVALID = RVALID_S0;
				RREADY_S0 = RVALID_S0 & RREADY;
				RREADY_S1 = 1'b0;
				RREADY_S2 = 1'b0;
				RREADY_S3 = 1'b0;
				RREADY_S4 = 1'b0;
				RREADY_S5 = 1'b0;
			end
			6'b000010:begin
				MASTER = RID_S1[`AXI_IDS_BITS-1:`AXI_ID_BITS];
				RID = RID_S1[`AXI_ID_BITS-1:0];
				RDATA = RDATA_S1;
				RRESP = RRESP_S1;
				RLAST = RLAST_S1;
				RVALID = RVALID_S1;
				RREADY_S0 = 1'b0;
				RREADY_S1 = RVALID_S1 & RREADY;
				RREADY_S2 = 1'b0;
				RREADY_S3 = 1'b0;
				RREADY_S4 = 1'b0;
				RREADY_S5 = 1'b0;
			end
			6'b000100:begin
				MASTER = RID_S2[`AXI_IDS_BITS-1:`AXI_ID_BITS];
				RID = RID_S2[`AXI_ID_BITS-1:0];
				RDATA = RDATA_S2;
				RRESP = RRESP_S2;
				RLAST = RLAST_S2;
				RVALID = RVALID_S2;
				RREADY_S0 = 1'b0;
				RREADY_S1 = 1'b0;
				RREADY_S2 = RVALID_S2 & RREADY;
				RREADY_S3 = 1'b0;
				RREADY_S4 = 1'b0;
				RREADY_S5 = 1'b0;
			end
			6'b001000:begin
				MASTER = RID_S3[`AXI_IDS_BITS-1:`AXI_ID_BITS];
				RID = RID_S3[`AXI_ID_BITS-1:0];
				RDATA = RDATA_S3;
				RRESP = RRESP_S3;
				RLAST = RLAST_S3;
				RVALID = RVALID_S3;
				RREADY_S0 = 1'b0;
				RREADY_S1 = 1'b0;
				RREADY_S2 = 1'b0;
				RREADY_S3 = RVALID_S3 & RREADY;
				RREADY_S4 = 1'b0;
				RREADY_S5 = 1'b0;
			end
			6'b010000:begin
				MASTER = RID_S4[`AXI_IDS_BITS-1:`AXI_ID_BITS];
				RID = RID_S4[`AXI_ID_BITS-1:0];
				RDATA = RDATA_S4;
				RRESP = RRESP_S4;
				RLAST = RLAST_S4;
				RVALID = RVALID_S4;
				RREADY_S0 = 1'b0;
				RREADY_S1 = 1'b0;
				RREADY_S2 = 1'b0;
				RREADY_S3 = 1'b0;
				RREADY_S4 = RVALID_S4 & RREADY;
				RREADY_S5 = 1'b0;
			end
			6'b100000:begin
				MASTER = RID_S5[`AXI_IDS_BITS-1:`AXI_ID_BITS];
				RID = RID_S5[`AXI_ID_BITS-1:0];
				RDATA = RDATA_S5;
				RRESP = RRESP_S5;
				RLAST = RLAST_S5;
				RVALID = RVALID_S5;
				RREADY_S0 = 1'b0;
				RREADY_S1 = 1'b0;
				RREADY_S2 = 1'b0;
				RREADY_S3 = 1'b0;
				RREADY_S4 = 1'b0;
				RREADY_S5 = RVALID_S5 & RREADY;
			end
		endcase
	end

endmodule
