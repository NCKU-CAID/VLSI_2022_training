`include "../../include/AXI_define.svh"
`include "./Arbiter.sv"
`include "./Decoder.sv"

module WriteAddress(

	input clk,
	input rst,
    
    //M1
	input [`AXI_ID_BITS-1:0] AWID_M1,
	input [`AXI_ADDR_BITS-1:0] AWADDR_M1,
	input [`AXI_LEN_BITS-1:0] AWLEN_M1,
	input [`AXI_SIZE_BITS-1:0] AWSIZE_M1,
	input [1:0] AWBURST_M1,
	input AWVALID_M1,
	output AWREADY_M1,

    //S0
	output [`AXI_IDS_BITS-1:0] AWID_S0,
	output [`AXI_ADDR_BITS-1:0] AWADDR_S0,
	output [`AXI_LEN_BITS-1:0] AWLEN_S0,
	output [`AXI_SIZE_BITS-1:0] AWSIZE_S0,
	output [1:0] AWBURST_S0,
	output AWVALID_S0,
	input AWREADY_S0,

    //S1
	output [`AXI_IDS_BITS-1:0] AWID_S1,
	output [`AXI_ADDR_BITS-1:0] AWADDR_S1,
	output [`AXI_LEN_BITS-1:0] AWLEN_S1,
	output [`AXI_SIZE_BITS-1:0] AWSIZE_S1,
	output [1:0] AWBURST_S1,
	output AWVALID_S1,
	input AWREADY_S1,

	//S2
	output [`AXI_IDS_BITS-1:0] AWID_S2,
	output [`AXI_ADDR_BITS-1:0] AWADDR_S2,
	output [`AXI_LEN_BITS-1:0] AWLEN_S2,
	output [`AXI_SIZE_BITS-1:0] AWSIZE_S2,
	output [1:0] AWBURST_S2,
	output AWVALID_S2,
	input AWREADY_S2,

	//S3
	output [`AXI_IDS_BITS-1:0] AWID_S3,
	output [`AXI_ADDR_BITS-1:0] AWADDR_S3,
	output [`AXI_LEN_BITS-1:0] AWLEN_S3,
	output [`AXI_SIZE_BITS-1:0] AWSIZE_S3,
	output [1:0] AWBURST_S3,
	output AWVALID_S3,
	input AWREADY_S3,

	//S4
	output [`AXI_IDS_BITS-1:0] AWID_S4,
	output [`AXI_ADDR_BITS-1:0] AWADDR_S4,
	output [`AXI_LEN_BITS-1:0] AWLEN_S4,
	output [`AXI_SIZE_BITS-1:0] AWSIZE_S4,
	output [1:0] AWBURST_S4,
	output AWVALID_S4,
	input AWREADY_S4,

	//S5
	output [`AXI_IDS_BITS-1:0] AWID_S5,
	output [`AXI_ADDR_BITS-1:0] AWADDR_S5,
	output [`AXI_LEN_BITS-1:0] AWLEN_S5,
	output [`AXI_SIZE_BITS-1:0] AWSIZE_S5,
	output [1:0] AWBURST_S5,
	output AWVALID_S5,
	input AWREADY_S5
);

	logic [`AXI_IDS_BITS-1:0] AWID;
	logic [`AXI_ADDR_BITS-1:0] AWADDR;
	logic [`AXI_LEN_BITS-1:0] AWLEN;
	logic [`AXI_SIZE_BITS-1:0] AWSIZE;
	logic [1:0] AWBURST;
	logic AWVALID;
	logic AWREADY;

	logic [`AXI_ID_BITS-1:0] AWID_M0;
	logic [`AXI_ADDR_BITS-1:0] AWADDR_M0;
	logic [`AXI_LEN_BITS-1:0] AWLEN_M0;
	logic [`AXI_SIZE_BITS-1:0] AWSIZE_M0;
	logic [1:0] AWBURST_M0;
	logic AWVALID_M0;
	logic AWREADY_M0;

	assign	AWID_M0 = `AXI_ID_BITS'b0;
	assign	AWADDR_M0 = `AXI_ADDR_BITS'b0;
	assign	AWLEN_M0 = `AXI_LEN_BITS'b0;
	assign	AWSIZE_M0 = `AXI_SIZE_BITS'b0;
	assign	AWBURST_M0 = 2'b0;
	assign	AWVALID_M0 = 1'b0;
	
	assign	AWID_S0 = AWID;
	assign  AWADDR_S0 = AWADDR;
	assign  AWLEN_S0 = AWLEN;
	assign  AWSIZE_S0 = AWSIZE;
	assign  AWBURST_S0 = AWBURST;

	assign  AWID_S1 = AWID;
    assign  AWADDR_S1 = AWADDR;
    assign  AWLEN_S1 = AWLEN;
    assign  AWSIZE_S1 = AWSIZE;
    assign  AWBURST_S1 = AWBURST;

	assign  AWID_S2 = AWID;
    assign  AWADDR_S2 = AWADDR;
    assign  AWLEN_S2 = AWLEN;
    assign  AWSIZE_S2 = AWSIZE;
    assign  AWBURST_S2 = AWBURST;

	assign  AWID_S3 = AWID;
    assign  AWADDR_S3 = AWADDR;
    assign  AWLEN_S3 = AWLEN;
    assign  AWSIZE_S3 = AWSIZE;
    assign  AWBURST_S3 = AWBURST;

	assign  AWID_S4 = AWID;
    assign  AWADDR_S4 = AWADDR;
    assign  AWLEN_S4 = AWLEN;
    assign  AWSIZE_S4 = AWSIZE;
    assign  AWBURST_S4 = AWBURST;

	assign  AWID_S5 = AWID;
    assign  AWADDR_S5 = AWADDR;
    assign  AWLEN_S5 = AWLEN;
    assign  AWSIZE_S5 = AWSIZE;
    assign  AWBURST_S5 = AWBURST;

	Arbiter AWArbiter (
    	.clk			(clk		),
		.rst			(rst		),

		.ID_M0			(AWID_M0	),
		.ADDR_M0		(AWADDR_M0	),
		.LEN_M0			(AWLEN_M0	),
		.SIZE_M0		(AWSIZE_M0	),
		.BURST_M0		(AWBURST_M0	),
		.VALID_M0		(AWVALID_M0	),
		.READY_M0		(AWREADY_M0	),

		.ID_M1			(AWID_M1	),
		.ADDR_M1		(AWADDR_M1	),
		.LEN_M1			(AWLEN_M1	),
		.SIZE_M1		(AWSIZE_M1	),
		.BURST_M1		(AWBURST_M1	),
		.VALID_M1		(AWVALID_M1	),
		.READY_M1		(AWREADY_M1	),

    	.ID		    	(AWID	    ),
		.ADDR	    	(AWADDR	    ),
		.LEN	    	(AWLEN	    ),
		.SIZE	    	(AWSIZE	    ),
		.BURST			(AWBURST	),
		.VALID			(AWVALID	),
    	.READY			(AWREADY	)
	);

    Decoder AWDecoder(
		.ADDR			(AWADDR		),
		.VALID          (AWVALID    ),
		.VALID_S0		(AWVALID_S0	),
		.VALID_S1       (AWVALID_S1 ),
		.VALID_S2       (AWVALID_S2 ),
		.VALID_S3       (AWVALID_S3 ),
		.VALID_S4       (AWVALID_S4 ),
		.VALID_S5       (AWVALID_S5 ),
		
		.READY		    (AWREADY	),
		.READY_S0		(AWREADY_S0	),
		.READY_S1       (AWREADY_S1 ),
		.READY_S2		(AWREADY_S2	),
		.READY_S3       (AWREADY_S3 ),
		.READY_S4       (AWREADY_S4 ),
		.READY_S5       (AWREADY_S5 )
	);

endmodule
