`include "../../include/AXI_define.svh"

module ReadAddress(

	input clk,
	input rst,

    //M0
	input [`AXI_ID_BITS-1:0] ARID_M0,
	input [`AXI_ADDR_BITS-1:0] ARADDR_M0,
	input [`AXI_LEN_BITS-1:0] ARLEN_M0,
	input [`AXI_SIZE_BITS-1:0] ARSIZE_M0,
	input [1:0] ARBURST_M0,
	input ARVALID_M0,
	output ARREADY_M0,

    //M1
	input [`AXI_ID_BITS-1:0] ARID_M1,
	input [`AXI_ADDR_BITS-1:0] ARADDR_M1,
	input [`AXI_LEN_BITS-1:0] ARLEN_M1,
	input [`AXI_SIZE_BITS-1:0] ARSIZE_M1,
	input [1:0] ARBURST_M1,
	input ARVALID_M1,
	output ARREADY_M1,

    //S0
	output [`AXI_IDS_BITS-1:0] ARID_S0,
	output [`AXI_ADDR_BITS-1:0] ARADDR_S0,
	output [`AXI_LEN_BITS-1:0] ARLEN_S0,
	output [`AXI_SIZE_BITS-1:0] ARSIZE_S0,
	output [1:0] ARBURST_S0,
	output ARVALID_S0,
	input ARREADY_S0,

    //S1
	output [`AXI_IDS_BITS-1:0] ARID_S1,
	output [`AXI_ADDR_BITS-1:0] ARADDR_S1,
	output [`AXI_LEN_BITS-1:0] ARLEN_S1,
	output [`AXI_SIZE_BITS-1:0] ARSIZE_S1,
	output [1:0] ARBURST_S1,
	output ARVALID_S1,
	input ARREADY_S1,

    //S2
	output [`AXI_IDS_BITS-1:0] ARID_S2,
	output [`AXI_ADDR_BITS-1:0] ARADDR_S2,
	output [`AXI_LEN_BITS-1:0] ARLEN_S2,
	output [`AXI_SIZE_BITS-1:0] ARSIZE_S2,
	output [1:0] ARBURST_S2,
	output ARVALID_S2,
	input ARREADY_S2
);

	logic [`AXI_IDS_BITS-1:0] ARID;
	logic [`AXI_ADDR_BITS-1:0] ARADDR;
	logic [`AXI_LEN_BITS-1:0] ARLEN;
	logic [`AXI_SIZE_BITS-1:0] ARSIZE;
	logic [1:0] ARBURST;
	logic ARVALID;
	logic ARREADY;

	logic ARVALID_S0_t;
	logic ARVALID_S1_t;
	logic ARVALID_S2_t;
	logic busy_S0;
	logic busy_S1;
	logic busy_S2;
	logic READY_S0_REG;
	logic READY_S1_REG;
	logic READY_S2_REG;
	
	assign busy_S0 = READY_S0_REG & ~ARREADY_S0;
	assign busy_S1 = READY_S1_REG & ~ARREADY_S1;
	assign busy_S2 = READY_S2_REG & ~ARREADY_S2;
	
	assign ARVALID_S0 = busy_S0?1'b0:ARVALID_S0_t;
	assign ARVALID_S1 = busy_S1?1'b0:ARVALID_S1_t;
	assign ARVALID_S2 = busy_S2?1'b0:ARVALID_S2_t;

	
	assign	ARID_S0 = ARID;
	assign  ARADDR_S0 = ARADDR;
	assign  ARLEN_S0 = ARLEN;
	assign  ARSIZE_S0 = ARSIZE;
	assign  ARBURST_S0 = ARBURST;

	assign  ARID_S1 = ARID;
    assign  ARADDR_S1 = ARADDR;
    assign  ARLEN_S1 = ARLEN;
    assign  ARSIZE_S1 = ARSIZE;
    assign  ARBURST_S1 = ARBURST;

	assign  ARID_S2 = ARID;
    assign  ARADDR_S2 = ARADDR;
    assign  ARLEN_S2 = ARLEN;
    assign  ARSIZE_S2 = ARSIZE;
    assign  ARBURST_S2 = ARBURST;

	always_ff@(posedge clk or negedge rst) begin
	    if(~rst) begin
	        READY_S0_REG <= 1'b0;
	        READY_S1_REG <= 1'b0;
	        READY_S2_REG <= 1'b0;
	    end
	    else begin
	        READY_S0_REG <= ARREADY_S0 ? 1'b1 : READY_S0_REG;
	        READY_S1_REG <= ARREADY_S1 ? 1'b1 : READY_S1_REG;
	        READY_S2_REG <= ARREADY_S2 ? 1'b1 : READY_S2_REG;
	    end
	end

    Arbiter ARArbiter (
    	.clk			(clk		),
		.rst			(rst		),

		.ID_M0			(ARID_M0	),
		.ADDR_M0		(ARADDR_M0	),
		.LEN_M0			(ARLEN_M0	),
		.SIZE_M0		(ARSIZE_M0	),
		.BURST_M0		(ARBURST_M0	),
		.VALID_M0		(ARVALID_M0	),
		.READY_M0		(ARREADY_M0	),

		.ID_M1			(ARID_M1	),
		.ADDR_M1		(ARADDR_M1	),
		.LEN_M1			(ARLEN_M1	),
		.SIZE_M1		(ARSIZE_M1	),
		.BURST_M1		(ARBURST_M1	),
		.VALID_M1		(ARVALID_M1	),
		.READY_M1		(ARREADY_M1	),

    	.ID		    	(ARID	    ),
		.ADDR	    	(ARADDR	    ),
		.LEN	    	(ARLEN	    ),
		.SIZE	    	(ARSIZE	    ),
		.BURST			(ARBURST	),
		.VALID			(ARVALID	),
    	.READY			(ARREADY	)
	);

    Decoder ARDecoder(
		.ADDR			(ARADDR		),
		.VALID          (ARVALID    ),
		.VALID_S0		(ARVALID_S0_t),
		.VALID_S1       (ARVALID_S1_t),
		.VALID_S2       (ARVALID_S2_t),
		.READY		    (ARREADY	),
		.READY_S0		(ARREADY_S0	),
		.READY_S1       (ARREADY_S1 ),
		.READY_S2       (ARREADY_S2 )
	);

endmodule
