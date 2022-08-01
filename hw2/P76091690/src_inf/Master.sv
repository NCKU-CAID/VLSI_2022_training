`include "../include/AXI_define.svh"

module Master(
    input clk, rst,
	inf_Master.M2AXIin  m2axi_i,
	inf_Master.M2AXIout m2axi_o,
    // CPU
    input read_i,
    input write_i,
    input [`AXI_STRB_BITS-1:0] wtype_i,
    input [`AXI_DATA_BITS-1:0] datain_i,
    input [`AXI_ADDR_BITS-1:0] addr_i,
    output logic [`AXI_DATA_BITS-1:0] dataout_o,
    output logic wait_o
);
	// Handshake
	logic awhns, arhns, rhns, whns, bhns;
	// Finish
	logic rdfin, wrfin;
	assign rdfin = rhns & m2axi_i.rlast;
	assign wrfin = whns & m2axi_o.wlast;

	assign awhns = m2axi_i.awready & m2axi_o.awvalid;
	assign whns  = m2axi_i.wready  & m2axi_o.wvalid;
	assign bhns  = m2axi_o.bready  & m2axi_i.bvalid;
	assign arhns = m2axi_i.arready & m2axi_o.arvalid;
	assign rhns  = m2axi_o.rready  & m2axi_i.rvalid;

	logic [`AXI_DATA_BITS-1:0] rdata;
	assign m2axi_o.arid    = `AXI_ID_BITS'h0;
	assign m2axi_o.arlen   = `AXI_LEN_BITS'h0;
	assign m2axi_o.arsize  = `AXI_SIZE_BITS'b10;
	assign m2axi_o.arburst = `AXI_BURST_INC;
	assign m2axi_o.araddr  = addr_i;

	assign m2axi_o.awid    = `AXI_ID_BITS'h0;
	assign m2axi_o.awlen   = `AXI_LEN_BITS'h0;
	assign m2axi_o.awsize  = `AXI_SIZE_BITS'b10;
	assign m2axi_o.awburst = `AXI_BURST_INC;
	assign m2axi_o.awaddr  = addr_i;
	assign m2axi_o.wstrb   = wtype_i;
	assign m2axi_o.wlast   = 1'b1;
	assign m2axi_o.wdata   = datain_i;


	assign dataout_o = rhns ? m2axi_i.rdata : rdata;
	always_ff@(posedge clk or negedge rst) begin
		if (~rst) rdata <= `AXI_DATA_BITS'b0;
		else      rdata <= (rhns) ? m2axi_i.rdata : rdata;
	end

	logic [2:0] STATE, NEXT;
	parameter IDLE  = 3'h0,
			  AR_CH = 3'h1,
			  R_CH  = 3'h2,
			  AW_CH = 3'h3,
			  W_CH  = 3'h4,
			  B_CH  = 3'h5;

	logic [2:0] readyin;
	assign readyin = {m2axi_i.arready, m2axi_i.awready, m2axi_i.wready};

	always_ff @(posedge clk or negedge rst) begin
		STATE <= ~rst ? IDLE : NEXT;
	end
	
	always_comb begin
		case (STATE)
			IDLE    : begin
				case ({m2axi_o.arvalid, m2axi_o.awvalid, arhns, awhns})
					4'b1000 : NEXT = AR_CH;
					4'b0100 : NEXT = AW_CH;
					4'b1010 : NEXT = R_CH;
					4'b0101 : NEXT = W_CH;
					default : NEXT = IDLE;
				endcase
			end
			AR_CH   : NEXT = arhns ? R_CH : AR_CH;
			R_CH    : NEXT = rdfin ? IDLE : R_CH;
			AW_CH   : NEXT = awhns ? W_CH : AW_CH;
			W_CH    : NEXT = wrfin ? B_CH : W_CH;
			B_CH    : begin
				casez ({bhns, m2axi_o.arvalid, m2axi_o.awvalid})
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
		start <= ~rst ? 1'b0 : 1'b1;
	end

	logic req_rd, req_wr;
	assign req_rd = start & read_i;
	assign req_wr = start & write_i;


	assign {m2axi_o.arvalid, m2axi_o.awvalid, m2axi_o.wvalid} = validout;
	assign {m2axi_o.rready, m2axi_o.bready} = readyout;
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
			W_CH    : readyout = {1'b0, 1'b0};//whns};
			B_CH    : readyout = 2'b1;
			default : readyout = 2'b0;
		endcase
	end
	always_comb begin
		case (STATE)
			IDLE    : wait_o = req_wr | req_rd;
			AR_CH   : wait_o = 1'b1;
			R_CH    : wait_o = ~rdfin;
			AW_CH   : wait_o = 1'b1;
			W_CH    : wait_o = ~wrfin;
			B_CH    : wait_o = req_wr | req_rd;
			default : wait_o = 1'b0;
		endcase
	end

endmodule
