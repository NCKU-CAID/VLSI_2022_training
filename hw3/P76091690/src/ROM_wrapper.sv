`include "../include/AXI_define.svh"
`include "../include/CPU_def.svh"
`include "./Interface/inf_Slave.sv"

module ROM_wrapper (
    input clk, rst,
	inf_Slave.S2AXIin  s2axi_i,
	inf_Slave.S2AXIout s2axi_o,
	input        [`DATA_BITS-1:0] ROM_out_i,
	output logic                  ROM_read_o,
	output logic                  ROM_en_o,
	output logic [          11:0] ROM_addr_o
);

	parameter IDLE  = 2'h0, R_CH = 2'h1;
	logic [1:0] STATE, NEXT;
	// Handshake
	logic arhns, rhns;
	logic rdfin;

	// 
	logic [`AXI_IDS_BITS  -1:0] arids, awids;
	logic [`AXI_LEN_BITS  -1:0] arlen;
	logic [`AXI_BURST_BITS-1:0] arburst;
	logic [               11:0] raddr;
	logic [1:0] rom_off;

	logic [2:0] readyout;
	logic [1:0] validout;
	logic rvalid;
	logic [`AXI_LEN_BITS-1:0] cnt;



	// Handshake
	assign arhns = s2axi_i.arvalid & s2axi_o.arready;
	assign rhns  = s2axi_o.rvalid  & s2axi_i.rready;
	assign rdfin = s2axi_o.rlast   & rhns;

	always_ff @(posedge clk or negedge rst) begin
		if (~rst) 
			cnt <= `AXI_LEN_BITS'h0;	
		else if (STATE == R_CH)
			cnt <= rdfin ? `AXI_LEN_BITS'h0 : rhns ? cnt + `AXI_LEN_BITS'h1 : cnt;
	end

	assign s2axi_o.rlast = cnt == arlen;
	assign s2axi_o.rresp = `AXI_RESP_OKAY;
	assign s2axi_o.bresp = `AXI_RESP_SLVERR;
	assign s2axi_o.rdata = ROM_out_i; 
	assign s2axi_o.rid   = arids;
	assign s2axi_o.bid   = `AXI_IDS_BITS'h0;

	// Sample
	always_ff @(posedge clk or negedge rst) begin
		if (~rst) begin
			raddr  <= 12'h0;
			arids  <= `AXI_IDS_BITS'h0;
			arlen  <= `AXI_LEN_BITS'h0;
			rvalid <= 1'b0;
		end
		else begin
			raddr  <= arhns ? s2axi_i.araddr[13:2] : raddr;
			arids  <= arhns ? s2axi_i.arid : arids;
			arlen  <= arhns ? s2axi_i.arlen : arlen;
			rvalid <= s2axi_o.rvalid;
		end
	end

	always_ff @(posedge clk or negedge rst) begin
		STATE <= ~rst ? IDLE : NEXT;
	end
	always_comb begin
		case(STATE)
			IDLE    : NEXT = arhns ? R_CH : IDLE;
			R_CH    : NEXT = (rdfin & arhns) ? R_CH : (rdfin ? IDLE : R_CH);
			default : NEXT = STATE;
		endcase
	end

	assign {s2axi_o.awready, s2axi_o.arready, s2axi_o.wready} = readyout;
	assign {s2axi_o.rvalid, s2axi_o.bvalid} = validout;
	always_comb begin
		case (STATE)
			IDLE    : readyout = 3'b10;
			R_CH    : readyout = 3'b0;
			default : readyout = 3'b0;
		endcase
	end
	always_comb begin
		case (STATE)
			IDLE    : validout = 2'b0;
			R_CH    : validout = 2'b10;
			default : validout = 2'b0;
		endcase
	end

	always_comb begin
		case (STATE)
			IDLE    : {ROM_read_o, ROM_en_o} = {arhns, s2axi_i.arvalid};
			R_CH    : {ROM_read_o, ROM_en_o} = 2'b11;
			default : {ROM_read_o, ROM_en_o} = 2'b0;
		endcase
	end
	assign rom_off = ~|cnt[1:0] ? (rhns ? cnt[1:0] + 2'h1 : cnt[1:0]) : cnt[1:0] + 2'h1;
	always_comb begin
		case (STATE)
			IDLE    : ROM_addr_o = s2axi_i.araddr[13:2];
			R_CH    : ROM_addr_o = raddr + {10'h0, rom_off};
			default : ROM_addr_o = 12'h0;
		endcase
	end

endmodule
