`include "../include/AXI_define.svh"
`include "CPU.sv"
`include "Master.sv"
`include "L1C_inst.sv"
`include "L1C_data.sv"

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
	output RREADY_M1,

	input interrupt
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

	logic	[`AXI_DATA_BITS-1:0]	I_out;
	logic							I_valid;
	logic							I_wait;

	logic 							I_req;
	logic 	[`AXI_ADDR_BITS-1:0]	I_addr;
	logic 							I_write;
	logic 	[`AXI_DATA_BITS-1:0]	I_in;
	logic 	[`AXI_STRB_BITS-1:0]	I_type;

	logic							DM_Request;
	logic							DM_Read;
	logic							DM_Write;
	logic	[`AXI_STRB_BITS-1:0]	DM_Type;
	logic	[`AXI_ADDR_BITS-1:0]	DM_ADDR;
	logic	[`AXI_DATA_BITS-1:0]	DM_DATA_in;
	logic	[`AXI_DATA_BITS-1:0]	DM_DATA_out;
	logic							DM_STALL;

	logic	[`AXI_DATA_BITS-1:0]	D_out;
	logic							D_valid;
	logic							D_wait;

	logic 							D_req;
	logic 	[`AXI_ADDR_BITS-1:0]	D_addr;
	logic 							D_read;
	logic 							D_write;
	logic 	[`AXI_DATA_BITS-1:0]	D_in;
	logic 	[`AXI_STRB_BITS-1:0]	D_type;

	logic latch_rst;

	assign AWREADY_M0 = 1'b0;
	assign WREADY_M0 = 1'b0;
	assign BID_M0 = `AXI_ID_BITS'b0;
	assign BRESP_M0 = 2'b0;
	assign BVALID_M0 = 1'b0;

	assign D_read = (D_req & ~D_write) ? 1'b1 : 1'b0;
	assign DM_Request = (DM_Read | (DM_Type != 4'hf)) ? 1'b1 : 1'b0;
	assign DM_Write = (DM_Type != 4'hf) ? 1'b1 : 1'b0;

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

		.READ			(I_req				),
		.WRITE			(4'hf				),
		.ADDRESS		(I_addr				),
		.DATA_in		(`AXI_DATA_BITS'b0	),
		.DATA_out		(I_out				),
		.DATA_valid		(I_valid			),
		.STALL			(I_wait				)
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

		.READ			(D_read				),
		.WRITE			(D_type				),
		.ADDRESS		(D_addr				),
		.DATA_in		(D_in				),
		.DATA_out		(D_out				),
		.DATA_valid		(D_valid			),
		.STALL			(D_wait				)
	);

	CPU CPU(
		.clk			(clk				),
		.rst			(~latch_rst			),

		.Instr_read		(IM_Read			),
		.PC_out			(IM_ADDR			),
		.Instr_out		(IM_DATA_out		),
		.IM_STALL		(IM_STALL			),

		.MEM_MemRead	(DM_Read			),
		.MEM_MemWrite	(DM_Type			),
		.MEM_ALU_out	(DM_ADDR			),
		.data_in		(DM_DATA_in			),
		.data_out		(DM_DATA_out		),
		.DM_STALL		(DM_STALL			),
		.interrupt		(interrupt			)
	);

	L1C_inst L1CI(
		.clk			(clk				),
		.rst			(~latch_rst			),

		.core_addr		(IM_ADDR			),
		.core_req		(IM_Read			),
		.core_write		(1'b0				),
		.core_in		(`AXI_DATA_BITS'b0	),
		.core_type		(4'hf				),

		.I_out			(I_out				),
		.I_valid		(I_valid			),
		.I_wait			(I_wait				),

		.core_out		(IM_DATA_out		),
		.core_wait		(IM_STALL			),

		.I_req			(I_req				),
		.I_addr			(I_addr				),
		.I_write		(I_write			),
		.I_in			(I_in				),
		.I_type			(I_type				)
	);

	L1C_data L1CD(
		.clk			(clk				),
		.rst			(~latch_rst			),

		.core_addr		(DM_ADDR			),
		.core_req		(DM_Request			),
		.core_write		(DM_Write			),
		.core_in		(DM_DATA_in			),
		.core_type		(DM_Type			),

		.D_out			(D_out				),
		.D_valid		(D_valid			),
		.D_wait			(D_wait				),

		.core_out		(DM_DATA_out		),
		.core_wait		(DM_STALL			),

		.D_req			(D_req				),
		.D_addr			(D_addr				),
		.D_write		(D_write			),
		.D_in			(D_in				),
		.D_type			(D_type				)
	);

endmodule
