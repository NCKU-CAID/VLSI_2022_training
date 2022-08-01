`include "../../include/AXI_define.svh"

module WriteData(

	input clk,
	input rst,
    
    //M1
	input [`AXI_DATA_BITS-1:0] WDATA_M1,
	input [`AXI_STRB_BITS-1:0] WSTRB_M1,
	input WLAST_M1,
	input WVALID_M1,
	output logic WREADY_M1,

    //S0
	input AWVALID_S0,
	output [`AXI_DATA_BITS-1:0] WDATA_S0,
	output [`AXI_STRB_BITS-1:0] WSTRB_S0,
	output WLAST_S0,
	output logic WVALID_S0,
	input WREADY_S0,

    //S1
	input AWVALID_S1,
	output [`AXI_DATA_BITS-1:0] WDATA_S1,
	output [`AXI_STRB_BITS-1:0] WSTRB_S1,
	output WLAST_S1,
	output logic WVALID_S1,
	input WREADY_S1,

	//S2
	input AWVALID_S2,
	output [`AXI_DATA_BITS-1:0] WDATA_S2,
	output [`AXI_STRB_BITS-1:0] WSTRB_S2,
	output WLAST_S2,
	output logic WVALID_S2,
	input WREADY_S2,

	//S3
	input AWVALID_S3,
	output [`AXI_DATA_BITS-1:0] WDATA_S3,
	output [`AXI_STRB_BITS-1:0] WSTRB_S3,
	output WLAST_S3,
	output logic WVALID_S3,
	input WREADY_S3,

	//S4
	input AWVALID_S4,
	output [`AXI_DATA_BITS-1:0] WDATA_S4,
	output [`AXI_STRB_BITS-1:0] WSTRB_S4,
	output WLAST_S4,
	output logic WVALID_S4,
	input WREADY_S4
);

	logic WVALID_S0_REG;
	logic WVALID_S1_REG;
	logic WVALID_S2_REG;
	logic WVALID_S3_REG;
	logic WVALID_S4_REG;

	logic [4:0]	SLAVE;

	assign WDATA_S0 = WDATA_M1;
	assign WSTRB_S0 = (WVALID_S0) ? WSTRB_M1 : `AXI_STRB_BITS'hf;
	assign WLAST_S0 = WLAST_M1;

	assign WDATA_S1 = WDATA_M1;
	assign WSTRB_S1 = (WVALID_S1) ? WSTRB_M1 : `AXI_STRB_BITS'hf;
	assign WLAST_S1 = WLAST_M1;

	assign WDATA_S2 = WDATA_M1;
	assign WSTRB_S2 = (WVALID_S2) ? WSTRB_M1 : `AXI_STRB_BITS'hf;
	assign WLAST_S2 = WLAST_M1;

	assign WDATA_S3 = WDATA_M1;
	assign WSTRB_S3 = (WVALID_S3) ? WSTRB_M1 : `AXI_STRB_BITS'hf;
	assign WLAST_S3 = WLAST_M1;

	assign WDATA_S4 = WDATA_M1;
	assign WSTRB_S4 = (WVALID_S4) ? WSTRB_M1 : `AXI_STRB_BITS'hf;
	assign WLAST_S4 = WLAST_M1;


	assign SLAVE = {(WVALID_S4_REG | AWVALID_S4),(WVALID_S3_REG | AWVALID_S3),(WVALID_S2_REG | AWVALID_S2),(WVALID_S1_REG | AWVALID_S1),(WVALID_S0_REG | AWVALID_S0)};

	always_ff@(posedge clk or negedge rst) begin
		if(~rst)begin
			WVALID_S0_REG <= 1'b0;
			WVALID_S1_REG <= 1'b0;
			WVALID_S2_REG <= 1'b0;
			WVALID_S3_REG <= 1'b0;
			WVALID_S4_REG <= 1'b0;
		end
		else begin
			WVALID_S0_REG <= (AWVALID_S0 & ~WREADY_M1) ? AWVALID_S0 : (WVALID_M1 & WREADY_M1 & WLAST_M1) ? 1'b0 : WVALID_S0_REG;
			WVALID_S1_REG <= (AWVALID_S1 & ~WREADY_M1) ? AWVALID_S1 : (WVALID_M1 & WREADY_M1 & WLAST_M1) ? 1'b0 : WVALID_S1_REG;
			WVALID_S2_REG <= (AWVALID_S2 & ~WREADY_M1) ? AWVALID_S2 : (WVALID_M1 & WREADY_M1 & WLAST_M1) ? 1'b0 : WVALID_S2_REG;
			WVALID_S3_REG <= (AWVALID_S3 & ~WREADY_M1) ? AWVALID_S3 : (WVALID_M1 & WREADY_M1 & WLAST_M1) ? 1'b0 : WVALID_S3_REG;
			WVALID_S4_REG <= (AWVALID_S4 & ~WREADY_M1) ? AWVALID_S4 : (WVALID_M1 & WREADY_M1 & WLAST_M1) ? 1'b0 : WVALID_S4_REG;
		end
	end

	always_comb begin
		case(SLAVE)
			default:begin
				WVALID_S0 = 1'b0;
				WVALID_S1 = 1'b0;
				WVALID_S2 = 1'b0;
				WVALID_S3 = 1'b0;
				WVALID_S4 = 1'b0;
				WREADY_M1 = 1'b0;
			end
			5'b00001:begin
				WVALID_S0 = WVALID_M1;
				WVALID_S1 = 1'b0;
				WVALID_S2 = 1'b0;
				WVALID_S3 = 1'b0;
				WVALID_S4 = 1'b0;
				WREADY_M1 = WREADY_S0;
			end
			5'b00010:begin
				WVALID_S0 = 1'b0;
				WVALID_S1 = WVALID_M1;
				WVALID_S2 = 1'b0;
				WVALID_S3 = 1'b0;
				WVALID_S4 = 1'b0;
				WREADY_M1 = WREADY_S1;
			end
			5'b00100:begin
				WVALID_S0 = 1'b0;
				WVALID_S1 = 1'b0;
				WVALID_S2 = WVALID_M1;
				WVALID_S3 = 1'b0;
				WVALID_S4 = 1'b0;
				WREADY_M1 = WREADY_S2;
			end
			5'b01000:begin
				WVALID_S0 = 1'b0;
				WVALID_S1 = 1'b0;
				WVALID_S2 = 1'b0;
				WVALID_S3 = WVALID_M1;
				WVALID_S4 = 1'b0;
				WREADY_M1 = WREADY_S3;
			end
			5'b10000:begin
				WVALID_S0 = 1'b0;
				WVALID_S1 = 1'b0;
				WVALID_S2 = 1'b0;
				WVALID_S3 = 1'b0;
				WVALID_S4 = WVALID_M1;
				WREADY_M1 = WREADY_S4;
			end
		endcase
	end

endmodule
