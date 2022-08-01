`include "../include/AXI_define.svh"
`include "CPU.sv"
`include "Master.sv"

module CPU_wrapper(
    input   clk,
    input   rst,

	output [`AXI_ID_BITS-1:0] AWID_M1,
	output [`AXI_ADDR_BITS-1:0] AWADDR_M1,
	output [`AXI_LEN_BITS-1:0] AWLEN_M1,
	output [`AXI_SIZE_BITS-1:0] AWSIZE_M1,
	output [1:0] AWBURST_M1,
	output AWVALID_M1,
	input AWREADY_M1,

	output [`AXI_DATA_BITS-1:0] WDATA_M1,
	output [`AXI_STRB_BITS-1:0] WSTRB_M1,
	output WLAST_M1,
	output WVALID_M1,
	input WREADY_M1,

	input [`AXI_ID_BITS-1:0] BID_M1,
	input [1:0] BRESP_M1,
	input BVALID_M1,
	output BREADY_M1,

	output [`AXI_ID_BITS-1:0] ARID_M0,
	output [`AXI_ADDR_BITS-1:0] ARADDR_M0,
	output [`AXI_LEN_BITS-1:0] ARLEN_M0,
	output [`AXI_SIZE_BITS-1:0] ARSIZE_M0,
	output [1:0] ARBURST_M0,
	output ARVALID_M0,
	input ARREADY_M0,

	input [`AXI_ID_BITS-1:0] RID_M0,
	input [`AXI_DATA_BITS-1:0] RDATA_M0,
	input [1:0] RRESP_M0,
	input RLAST_M0,
	input RVALID_M0,
	output RREADY_M0,

	output [`AXI_ID_BITS-1:0] ARID_M1,
	output [`AXI_ADDR_BITS-1:0] ARADDR_M1,
	output [`AXI_LEN_BITS-1:0] ARLEN_M1,
	output [`AXI_SIZE_BITS-1:0] ARSIZE_M1,
	output [1:0] ARBURST_M1,
	output ARVALID_M1,
	input ARREADY_M1,

	input [`AXI_ID_BITS-1:0] RID_M1,
	input [`AXI_DATA_BITS-1:0] RDATA_M1,
	input [1:0] RRESP_M1,
	input RLAST_M1,
	input RVALID_M1,
	output RREADY_M1
);

	logic [`AXI_ID_BITS-1:0] AWID_M0;
	logic [`AXI_ADDR_BITS-1:0] AWADDR_M0;
	logic [`AXI_LEN_BITS-1:0] AWLEN_M0;
	logic [`AXI_SIZE_BITS-1:0] AWSIZE_M0;
	logic [1:0] AWBURST_M0;
	logic AWVALID_M0;
	logic AWREADY_M0;

	logic [`AXI_DATA_BITS-1:0] WDATA_M0;
	logic [`AXI_STRB_BITS-1:0] WSTRB_M0;
	logic WLAST_M0;
	logic WVALID_M0;
	logic WREADY_M0;

	logic [`AXI_ID_BITS-1:0] BID_M0;
	logic [1:0] BRESP_M0;
	logic BVALID_M0;
	logic BREADY_M0;

	logic							IM_Read;
	logic	[`AXI_ADDR_BITS-1:0]	IM_ADDR;
	logic	[`AXI_DATA_BITS-1:0]	IM_DATA_out;
	logic							IM_STALL;
	logic							DM_Read;
	logic	[`AXI_STRB_BITS-1:0]	DM_Write;
	logic	[`AXI_ADDR_BITS-1:0]	DM_ADDR;
	logic	[`AXI_DATA_BITS-1:0]	DM_DATA_in;
	logic	[`AXI_DATA_BITS-1:0]	DM_DATA_out;
	logic							DM_STALL;

	logic latch_rst;

	assign AWREADY_M0 = 1'b0;
	assign WREADY_M0 = 1'b0;
	assign BID_M0 = `AXI_ID_BITS'b0;
	assign BRESP_M0 = 2'b0;
	assign BVALID_M0 = 1'b0;

	always_ff@(posedge clk or negedge rst) begin
	    if(~rst) 
			latch_rst <= rst;
	    else 
			latch_rst <= rst;
	end

	Master IM(
		.clk			(clk				),
		.rst			(rst				),

		.AWID			(AWID_M0			),
		.AWADDR			(AWADDR_M0			),
		.AWLEN			(AWLEN_M0			),
		.AWSIZE			(AWSIZE_M0			),
		.AWBURST		(AWBURST_M0			),
		.AWVALID		(AWVALID_M0			),
		.AWREADY		(AWREADY_M0			),

		.WDATA			(WDATA_M0			),
		.WSTRB			(WSTRB_M0			),
		.WLAST			(WLAST_M0			),
		.WVALID			(WVALID_M0			),
		.WREADY			(WREADY_M0			),

		.BID			(BID_M0				),
		.BRESP			(BRESP_M0			),
		.BVALID			(BVALID_M0			),
		.BREADY			(BREADY_M0			),

		.ARID			(ARID_M0			),
		.ARADDR			(ARADDR_M0			),
		.ARLEN			(ARLEN_M0			),
		.ARSIZE			(ARSIZE_M0			),
		.ARBURST		(ARBURST_M0			),
		.ARVALID		(ARVALID_M0			),
		.ARREADY		(ARREADY_M0			),

		.RID			(RID_M0				),
		.RDATA			(RDATA_M0			),
		.RRESP			(RRESP_M0			),
		.RLAST			(RLAST_M0			),
		.RVALID			(RVALID_M0			),
		.RREADY			(RREADY_M0			),

		.READ			(IM_Read			),
		.WRITE			(4'hf				),
		.ADDRESS		(IM_ADDR			),
		.DATA_in		(`AXI_DATA_BITS'b0	),
		.DATA_out		(IM_DATA_out		),
		.STALL			(IM_STALL			)
	);

	Master DM(
		.clk			(clk				),
		.rst			(rst				),

		.AWID			(AWID_M1			),
		.AWADDR			(AWADDR_M1			),
		.AWLEN			(AWLEN_M1			),
		.AWSIZE			(AWSIZE_M1			),
		.AWBURST		(AWBURST_M1			),
		.AWVALID		(AWVALID_M1			),
		.AWREADY		(AWREADY_M1			),

		.WDATA			(WDATA_M1			),
		.WSTRB			(WSTRB_M1			),
		.WLAST			(WLAST_M1			),
		.WVALID			(WVALID_M1			),
		.WREADY			(WREADY_M1			),

		.BID			(BID_M1				),
		.BRESP			(BRESP_M1			),
		.BVALID			(BVALID_M1			),
		.BREADY			(BREADY_M1			),

		.ARID			(ARID_M1			),
		.ARADDR			(ARADDR_M1			),
		.ARLEN			(ARLEN_M1			),
		.ARSIZE			(ARSIZE_M1			),
		.ARBURST		(ARBURST_M1			),
		.ARVALID		(ARVALID_M1			),
		.ARREADY		(ARREADY_M1			),

		.RID			(RID_M1				),
		.RDATA			(RDATA_M1			),
		.RRESP			(RRESP_M1			),
		.RLAST			(RLAST_M1			),
		.RVALID			(RVALID_M1			),
		.RREADY			(RREADY_M1			),

		.READ			(DM_Read			),
		.WRITE			(DM_Write			),
		.ADDRESS		(DM_ADDR			),
		.DATA_in		(DM_DATA_in			),
		.DATA_out		(DM_DATA_out		),
		.STALL			(DM_STALL			)
	);

	CPU CPU(
		.clk			(clk				),
		.rst			(~latch_rst			),
		.Instr_read		(IM_Read			),
		.PC_out			(IM_ADDR			),
		.Instr_out		(IM_DATA_out		),
		.IM_STALL		(IM_STALL			),
		.MEM_MemRead	(DM_Read			),
		.MEM_MemWrite	(DM_Write			),
		.MEM_ALU_out	(DM_ADDR			),
		.data_in		(DM_DATA_in			),
		.data_out		(DM_DATA_out		),
		.DM_STALL		(DM_STALL			)
	);

endmodule
