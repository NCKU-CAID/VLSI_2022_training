`include "../include/AXI_define.svh"
`include "./Master.sv"
`include "./CPU.sv"

module CPU_wrapper (
    input  clk, rst,
	// AW
	output logic [`AXI_ID_BITS   -1:0] AWID_M0,
	output logic [`AXI_ADDR_BITS -1:0] AWADDR_M0,
	output logic [`AXI_LEN_BITS  -1:0] AWLEN_M0,
	output logic [`AXI_SIZE_BITS -1:0] AWSIZE_M0,
	output logic [`AXI_BURST_BITS-1:0] AWBURST_M0,
	output logic                       AWVALID_M0,
	input                              AWREADY_M0,
	output logic [`AXI_ID_BITS   -1:0] AWID_M1,
	output logic [`AXI_ADDR_BITS -1:0] AWADDR_M1,
	output logic [`AXI_LEN_BITS  -1:0] AWLEN_M1,
	output logic [`AXI_SIZE_BITS -1:0] AWSIZE_M1,
	output logic [`AXI_BURST_BITS-1:0] AWBURST_M1,
	output logic                       AWVALID_M1,
	input                              AWREADY_M1,
	// W
	output logic [`AXI_DATA_BITS-1:0] WDATA_M0,
	output logic [`AXI_STRB_BITS-1:0] WSTRB_M0,
	output logic                      WLAST_M0,
	output logic                      WVALID_M0,
	input                             WREADY_M0,
	output logic [`AXI_DATA_BITS-1:0] WDATA_M1,
	output logic [`AXI_STRB_BITS-1:0] WSTRB_M1,
	output logic                      WLAST_M1,
	output logic                      WVALID_M1,
	input                             WREADY_M1,
	// B
	input [`AXI_ID_BITS   -1:0] BID_M0,
	input [`AXI_BURST_BITS-1:0] BRESP_M0,
	input                       BVALID_M0,
	output logic                BREADY_M0,
	input [`AXI_ID_BITS   -1:0] BID_M1,
	input [`AXI_BURST_BITS-1:0] BRESP_M1,
	input                       BVALID_M1,
	output logic                BREADY_M1,
	// AR
	output logic [`AXI_ID_BITS   -1:0] ARID_M0,
	output logic [`AXI_ADDR_BITS -1:0] ARADDR_M0,
	output logic [`AXI_LEN_BITS  -1:0] ARLEN_M0,
	output logic [`AXI_SIZE_BITS -1:0] ARSIZE_M0,
	output logic [`AXI_BURST_BITS-1:0] ARBURST_M0,
	output logic                       ARVALID_M0,
	input                              ARREADY_M0,
	output logic [`AXI_ID_BITS   -1:0] ARID_M1,
	output logic [`AXI_ADDR_BITS -1:0] ARADDR_M1,
	output logic [`AXI_LEN_BITS  -1:0] ARLEN_M1,
	output logic [`AXI_SIZE_BITS -1:0] ARSIZE_M1,
	output logic [`AXI_BURST_BITS-1:0] ARBURST_M1,
	output logic                       ARVALID_M1,
	input                              ARREADY_M1,
	// R
	input        [`AXI_ID_BITS  -1:0] RID_M0,
	input        [`AXI_DATA_BITS-1:0] RDATA_M0,
	input        [`AXI_RESP_BITS-1:0] RRESP_M0,
	input                             RLAST_M0,
	input                             RVALID_M0,
	output logic                      RREADY_M0,	
	input        [`AXI_ID_BITS  -1:0] RID_M1,
	input        [`AXI_DATA_BITS-1:0] RDATA_M1,
	input        [`AXI_RESP_BITS-1:0] RRESP_M1,
	input                             RLAST_M1,
	input                             RVALID_M1,
	output logic                      RREADY_M1
);


	logic [`WEB_BITS -1:0] web_1, web_2;
	logic [`ADDR_BITS-1:0] addr_1, addr_2;
	logic [`DATA_BITS-1:0] rdata_1, rdata_2;
	logic [`DATA_BITS-1:0] wdata_1, wdata_2;
	logic await_1, await_2;
    logic req_1, req_2;
	logic read1, read2, write1, write2;
    logic req_read1, req_read2, req_write1, req_write2;
	assign web_1   = 4'hf;
	assign wdata_1 = `DATA_BITS'h0;
	logic latch_rst;
	always_ff @(posedge clk or negedge rst) begin
		latch_rst <= ~rst ? rst : rst;
	end
	CPU i_CPU (
        .clk       (clk     ),
        .rst       (~latch_rst),
        .inst_i    (rdata_1),
        .inst_pc_o (addr_1 ),
        .dm_data_i (rdata_2),
        .dm_addr_o (addr_2 ),
        .dm_data_o (wdata_2),
        .web_o     (web_2  ),
		// Master
		.wait1_i  (await_1 ),
        .req1_o   (req_1   ),
        .read1_o  (read1   ),
        .write1_o (write1  ),
		.wait2_i  (await_2 ),
        .req2_o   (req_2   ),
        .read2_o  (read2   ),
        .write2_o (write2  )		
    );
	assign req_read1  = req_1 & read1;
	assign req_write1 = req_1 & write1;
	assign req_read2  = req_2 & read2;
	assign req_write2 = req_2 & write2;

	Master M0 (
		.clk       (clk       ),
		.rst       (rst       ),
		.awid_o    (AWID_M0   ),
		.awaddr_o  (AWADDR_M0 ),
		.awlen_o   (AWLEN_M0  ),
		.awsize_o  (AWSIZE_M0 ),
		.awburst_o (AWBURST_M0),
		.awvalid_o (AWVALID_M0),
		.awready_i (AWREADY_M0),
		.wdata_o   (WDATA_M0  ),
		.wstrb_o   (WSTRB_M0  ),
		.wlast_o   (WLAST_M0  ),
		.wvalid_o  (WVALID_M0 ),
		.wready_i  (WREADY_M0 ),
		.bid_i     (BID_M0    ),
		.bresp_i   (BRESP_M0  ),
		.bvalid_i  (BVALID_M0 ),
		.bready_o  (BREADY_M0 ),
		.arid_o    (ARID_M0   ),
		.araddr_o  (ARADDR_M0 ),
		.arlen_o   (ARLEN_M0  ),
		.arsize_o  (ARSIZE_M0 ),
		.arburst_o (ARBURST_M0),
		.arvalid_o (ARVALID_M0),
		.arready_i (ARREADY_M0),
		.rid_i     (RID_M0    ),
		.rdata_i   (RDATA_M0  ),
		.rresp_i   (RRESP_M0  ),
		.rlast_i   (RLAST_M0  ),
		.rvalid_i  (RVALID_M0 ),
		.rready_o  (RREADY_M0 ),

		.read_i    (req_read1 ),
		.write_i   (req_write1),
		.wtype_i   (web_1    ),
		.datain_i  (wdata_1  ),
		.addr_i    (addr_1   ),
		.dataout_o (rdata_1  ),
		.wait_o    (await_1  )
	);

	Master M1 (
		.clk       (clk       ),
		.rst       (rst       ),
		.awid_o    (AWID_M1   ),
		.awaddr_o  (AWADDR_M1 ),
		.awlen_o   (AWLEN_M1  ),
		.awsize_o  (AWSIZE_M1 ),
		.awburst_o (AWBURST_M1),
		.awvalid_o (AWVALID_M1),
		.awready_i (AWREADY_M1),
		.wdata_o   (WDATA_M1  ),
		.wstrb_o   (WSTRB_M1  ),
		.wlast_o   (WLAST_M1  ),
		.wvalid_o  (WVALID_M1 ),
		.wready_i  (WREADY_M1 ),
		.bid_i     (BID_M1    ),
		.bresp_i   (BRESP_M1  ),
		.bvalid_i  (BVALID_M1 ),
		.bready_o  (BREADY_M1 ),
		.arid_o    (ARID_M1   ),
		.araddr_o  (ARADDR_M1 ),
		.arlen_o   (ARLEN_M1  ),
		.arsize_o  (ARSIZE_M1 ),
		.arburst_o (ARBURST_M1),
		.arvalid_o (ARVALID_M1),
		.arready_i (ARREADY_M1),
		.rid_i     (RID_M1    ),
		.rdata_i   (RDATA_M1  ),
		.rresp_i   (RRESP_M1  ),
		.rlast_i   (RLAST_M1  ),
		.rvalid_i  (RVALID_M1 ),
		.rready_o  (RREADY_M1 ),

		.read_i    (req_read2 ),
		.write_i   (req_write2),
		.wtype_i   (web_2    ),
		.datain_i  (wdata_2  ),
		.addr_i    (addr_2   ),
		.dataout_o (rdata_2  ),
		.wait_o    (await_2  )
	);

endmodule

