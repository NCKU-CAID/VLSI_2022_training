`include "../include/AXI_define.svh"

module Master(
    input clk, rst,
	// AW
	output logic [`AXI_ID_BITS   -1:0] awid_o,
	output logic [`AXI_ADDR_BITS -1:0] awaddr_o,
	output logic [`AXI_LEN_BITS  -1:0] awlen_o,
	output logic [`AXI_SIZE_BITS -1:0] awsize_o,
	output logic [`AXI_BURST_BITS-1:0] awburst_o,
	output logic                       awvalid_o,
	input                              awready_i,
	// W
	output logic [`AXI_DATA_BITS-1:0] wdata_o,
	output logic [`AXI_STRB_BITS-1:0] wstrb_o,
	output logic                      wlast_o,
	output logic                      wvalid_o,
	input                             wready_i,
	// B
	input [`AXI_ID_BITS   -1:0] bid_i,
	input [`AXI_BURST_BITS-1:0] bresp_i,
	input                       bvalid_i,
	output logic                bready_o,

	// AR
	output logic [`AXI_ID_BITS   -1:0] arid_o,
	output logic [`AXI_ADDR_BITS -1:0] araddr_o,
	output logic [`AXI_LEN_BITS  -1:0] arlen_o,
	output logic [`AXI_SIZE_BITS -1:0] arsize_o,
	output logic [`AXI_BURST_BITS-1:0] arburst_o,
	output logic                       arvalid_o,
	input                              arready_i,
	// R
	input        [`AXI_ID_BITS  -1:0] rid_i,
	input        [`AXI_DATA_BITS-1:0] rdata_i,
	input        [`AXI_RESP_BITS-1:0] rresp_i,
	input                             rlast_i,
	input                             rvalid_i,
	output logic                      rready_o,

    //interface for cpu
    input read_i,
    input write_i,
    input [`AXI_STRB_BITS-1:0] wtype_i,
    input [`AXI_DATA_BITS-1:0] datain_i,
    input [`AXI_ADDR_BITS-1:0] addr_i,
    output logic [`AXI_DATA_BITS-1:0] dataout_o,
    output logic wait_o
);

	logic awhns, arhns, rhns, whns, bhns;
	assign awhns = awready_i & awvalid_o;
	assign whns  = wready_i  & wvalid_o;
	assign bhns  = bready_o  & bvalid_i;
	assign arhns = arready_i & arvalid_o;
	assign rhns  = rready_o  & rvalid_i;


	logic [`AXI_ID_BITS-1:0] ID;
	logic [`AXI_DATA_BITS-1:0] rdata;
	assign ID        = `AXI_ID_BITS'h0;
	assign arid_o    = ID;
	assign arlen_o   = `AXI_LEN_BITS'h0;
	assign arsize_o  = `AXI_SIZE_BITS'b10;
	assign arburst_o = `AXI_BURST_INC;
	assign araddr_o  = addr_i;

	assign awid_o    = `AXI_ID_BITS'h0;
	assign awlen_o   = `AXI_LEN_BITS'h0;
	assign awsize_o  = `AXI_SIZE_BITS'b10;
	assign awburst_o = `AXI_BURST_INC;
	assign awaddr_o  = addr_i;
	assign wstrb_o   = wtype_i;
	assign wlast_o   = 1'b1;
	assign wdata_o   = datain_i;


	assign dataout_o = rhns ? rdata_i : rdata;
	always_ff@(posedge clk or negedge rst) begin
		if (~rst) rdata <= `AXI_DATA_BITS'b0;
		else      rdata <= (rhns) ? rdata_i : rdata;
	end

	logic [2:0] STATE, NEXT;
	parameter IDLE  = 3'h0,
			  AR_CH = 3'h1,
			  R_CH  = 3'h2,
			  AW_CH = 3'h3,
			  W_CH  = 3'h4,
			  B_CH  = 3'h5;
	logic [2:0] readyin;
	assign readyin = {arready_i, awready_i, wready_i};

	always_ff @(posedge clk or negedge rst) begin
		STATE <= ~rst ? IDLE : NEXT;
	end

	always_comb begin
		case (STATE)
			IDLE    : begin
				case ({arvalid_o, awvalid_o, arhns, awhns})
					4'b1000 : NEXT = AR_CH;
					4'b0100 : NEXT = AW_CH;
					4'b1010 : NEXT = R_CH;
					4'b0101 : NEXT = W_CH;
					default : NEXT = IDLE;
				endcase
			end
			AR_CH   : NEXT = arhns ? R_CH : AR_CH;
			R_CH    : NEXT = rhns  ? IDLE : R_CH;
			AW_CH   : NEXT = awhns ? W_CH : AW_CH;
			W_CH    : NEXT = whns  ? B_CH : W_CH;
			B_CH    : begin
				casez ({bhns, arvalid_o, awvalid_o})
					3'b110  : NEXT = AR_CH;
					3'b101  : NEXT = AW_CH;
					3'b0??  : NEXT = B_CH;
					default : NEXT = IDLE;
				endcase
			end
			default : NEXT = IDLE;
		endcase
	end
	
	logic [2:0] validout;
	logic [1:0] readyout;
	
	// 2021.11.9 (SOC lab)
	logic start;
	always_ff @(posedge clk or negedge rst) begin
		if (~rst) start <= 1'b0;
		else      start <= 1'b1;
	end
	logic req_rd, req_wr;
	assign req_rd = start & read_i;
	assign req_wr = start & write_i;

	assign {arvalid_o, awvalid_o, wvalid_o} = validout;
	assign {rready_o, bready_o} = readyout;
	always_comb begin
		case (STATE)
			IDLE    : validout = {req_rd, req_wr, 1'b0};
			AR_CH   : validout = 3'b100;
			R_CH    : validout = 3'b0;
			AW_CH   : validout = {1'b0, 1'b1, 1'b0};
			W_CH    : validout = 3'b1;
			B_CH    : validout = 3'b0;
			default : validout = 3'b0;
		endcase
	end
	
	always_comb begin
		case (STATE)
			IDLE    : readyout = 2'b0;
			AR_CH   : readyout = 2'b0;
			R_CH    : readyout = 2'b10;
			AW_CH   : readyout = 2'b0;
			W_CH    : readyout = {1'b0, whns};
			B_CH    : readyout = 2'b1;
			default : readyout = 2'b0;
		endcase
	end
	always_comb begin
		case (STATE)
			IDLE    : wait_o = req_wr | req_rd;
			AR_CH   : wait_o = 1'b1;
			R_CH    : wait_o = ~rhns;
			AW_CH   : wait_o = 1'b1;
			W_CH    : wait_o = ~whns;
			B_CH    : wait_o = req_wr | req_rd;
			default : wait_o = 1'b0;
		endcase
	end

endmodule
