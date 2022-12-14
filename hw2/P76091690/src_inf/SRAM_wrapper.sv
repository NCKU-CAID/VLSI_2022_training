`include "../include/AXI_define.svh"
`include "../include/CPU_def.svh"
`include "./Interface/inf_Slave.sv"

module SRAM_wrapper(
    input clk, rst,
	inf_Slave.S2AXIin  s2axi_i,
	inf_Slave.S2AXIout s2axi_o
);

	parameter IDLE  = 3'h0,
			  ARFIN = 3'h1,
			  W_CH  = 3'h2,
			  R_CH  = 3'h3,
			  B_CH  = 3'h4;
	// Handshake
	logic awhns, arhns, whns, rhns, bhns;
	assign awhns = s2axi_i.awvalid & s2axi_o.awready;
	assign arhns = s2axi_i.arvalid & s2axi_o.arready;
	assign whns  = s2axi_i.wvalid  & s2axi_o.wready;
	assign rhns  = s2axi_o.rvalid  & s2axi_i.rready;
	assign bhns  = s2axi_o.bvalid  & s2axi_i.bready;


	logic [13:0] A;
	logic [`DATA_BITS-1:0] DI;
	logic [`DATA_BITS-1:0] DO;
	logic [`WEB_BITS -1:0] WEB;
	logic CS;
	logic OE;

	logic [13:0] raddr, waddr;
	logic [`AXI_IDS_BITS -1:0] arids, awids;
	logic [`AXI_DATA_BITS-1:0] rdata;
	logic [`AXI_LEN_BITS -1:0] arlen, awlen;
	logic [2:0] STATE, NEXT;
	logic [2:0] readyout;
	logic [1:0] validout;
	logic rvalid;

	logic rdfin, wrfin;
	logic [`AXI_LEN_BITS-1:0] cnt;
	assign rdfin = s2axi_o.rlast & rhns;
	assign wrfin = s2axi_i.wlast & whns;
	always_ff @(posedge clk or negedge rst) begin
		if (~rst) begin
			cnt <= `AXI_LEN_BITS'h0;	
		end
		else begin
			case (STATE)
				R_CH : cnt <= rdfin ? `AXI_LEN_BITS'h0 : rhns ? cnt + `AXI_LEN_BITS'h1 : cnt;
				W_CH : cnt <= wrfin ? `AXI_LEN_BITS'h0 : whns ? cnt + `AXI_LEN_BITS'h1 : cnt;
			endcase
		end
	end

	assign s2axi_o.rlast = cnt == arlen;
	assign s2axi_o.rresp = `AXI_RESP_OKAY;
	assign s2axi_o.bresp = `AXI_RESP_OKAY;
	assign s2axi_o.rdata = (s2axi_o.rvalid & rvalid) ? rdata :DO; 
	assign s2axi_o.rid = arids;
	assign s2axi_o.bid = awids;
	assign WEB   = whns ? s2axi_i.wstrb : 4'hf;
	assign DI    = s2axi_i.wdata;

	// Sample
	always_ff @(posedge clk or negedge rst) begin
		if (~rst) begin
			raddr  <= 14'h0;
			waddr  <= 14'h0;
			arids  <= `AXI_IDS_BITS'h0;
			awids  <= `AXI_IDS_BITS'h0;
			arlen  <= `AXI_LEN_BITS'h0;
			awlen  <= `AXI_LEN_BITS'h0;
			rvalid <= 1'b0;
		end
		else begin
			raddr  <= arhns ? s2axi_i.araddr[15:2] : raddr;
			waddr  <= awhns ? s2axi_i.awaddr[15:2] : waddr;
			arids  <= arhns ? s2axi_i.arid : arids;
			awids  <= awhns ? s2axi_i.awid : awids;
			arlen  <= arhns ? s2axi_i.arlen : arlen;
			awlen  <= awhns ? s2axi_i.awlen : awlen;
			rvalid <= s2axi_o.rvalid;
		end
	end
// /*
	always_ff @(posedge clk or negedge rst) begin
		if (~rst) rdata <= `AXI_DATA_BITS'h0;
		else      rdata <= (s2axi_o.rvalid & ~rvalid) ? DO : rdata;
	end
// */
	always_ff@(posedge clk or negedge rst) begin
		STATE <= ~rst ? IDLE : NEXT;
	end
	always_comb begin
		case(STATE)
			IDLE    : begin
				case ({awhns, whns, arhns})
					3'b110  : NEXT = B_CH;
					3'b100  : NEXT = W_CH;
					3'b001  : NEXT = R_CH;
					default : NEXT = IDLE;
				endcase
			end
			R_CH    : begin
				case ({rdfin, awhns, arhns})
					3'b110  : NEXT = W_CH;
					3'b101  : NEXT = R_CH;
					3'b100  : NEXT = IDLE;
					default : NEXT = R_CH; 
				endcase
			end
			W_CH    : NEXT = wrfin ? B_CH : W_CH;
			B_CH    : begin
				case ({bhns, awhns, arhns})
					3'b110  : NEXT = W_CH;
					3'b101  : NEXT = R_CH;
					3'b100  : NEXT = IDLE;
					default : NEXT = B_CH;
				endcase
			end
			default : NEXT = STATE;
		endcase
	end

	assign {s2axi_o.awready, s2axi_o.arready, s2axi_o.wready} = readyout;
	assign {s2axi_o.rvalid, s2axi_o.bvalid} = validout;
	always_comb begin
		case (STATE)
			IDLE    : readyout = {1'b1, ~s2axi_i.awvalid, 1'b0};
			W_CH    : readyout = 3'b1;
			B_CH    : readyout = {bhns, 1'b0, 1'b0};
			R_CH    : readyout = {rhns, 1'b0, 1'b0};
			default : readyout = 3'b0;
		endcase
	end
	always_comb begin
		case (STATE)
			IDLE    : validout = 2'b0;
			W_CH    : validout = 2'b0;
			B_CH    : validout = 2'b1;
			R_CH    : validout = 2'b10;
			default : validout = 2'b0;
		endcase
	end

	always_comb begin
		case (STATE)
			IDLE    : {OE, CS} = {~s2axi_i.awvalid & arhns, s2axi_i.awvalid | s2axi_i.arvalid};
			R_CH    : {OE, CS} = 2'b11;
			W_CH    : {OE, CS} = 2'b1;
			B_CH    : {OE, CS} = 2'b1;
			default : {OE, CS} = 2'b0;
		endcase
	end
	always_comb begin
		case (STATE)
			IDLE    : A = awhns ? s2axi_i.awaddr[15:2] : s2axi_i.araddr[15:2];
			R_CH    : A = raddr;
			W_CH    : A = waddr;
			B_CH    : A = ~bhns ? waddr : (awhns ? s2axi_i.awaddr[15:2] : s2axi_i.araddr[15:2]);
			default : A = 14'h0;
		endcase
	end

// {{{ SRAM
    SRAM i_SRAM (
        .A0   (A[0]  ),
        .A1   (A[1]  ),
        .A2   (A[2]  ),
        .A3   (A[3]  ),
        .A4   (A[4]  ),
        .A5   (A[5]  ),
        .A6   (A[6]  ),
        .A7   (A[7]  ),
        .A8   (A[8]  ),
        .A9   (A[9]  ),
        .A10  (A[10] ),
        .A11  (A[11] ),
        .A12  (A[12] ),
        .A13  (A[13] ),
        .DO0  (DO[0] ),
        .DO1  (DO[1] ),
        .DO2  (DO[2] ),
        .DO3  (DO[3] ),
        .DO4  (DO[4] ),
        .DO5  (DO[5] ),
        .DO6  (DO[6] ),
        .DO7  (DO[7] ),
        .DO8  (DO[8] ),
        .DO9  (DO[9] ),
        .DO10 (DO[10]),
        .DO11 (DO[11]),
        .DO12 (DO[12]),
        .DO13 (DO[13]),
        .DO14 (DO[14]),
        .DO15 (DO[15]),
        .DO16 (DO[16]),
        .DO17 (DO[17]),
        .DO18 (DO[18]),
        .DO19 (DO[19]),
        .DO20 (DO[20]),
        .DO21 (DO[21]),
        .DO22 (DO[22]),
        .DO23 (DO[23]),
        .DO24 (DO[24]),
        .DO25 (DO[25]),
        .DO26 (DO[26]),
        .DO27 (DO[27]),
        .DO28 (DO[28]),
        .DO29 (DO[29]),
        .DO30 (DO[30]),
        .DO31 (DO[31]),
        .DI0  (DI[0] ),
        .DI1  (DI[1] ),
        .DI2  (DI[2] ),
        .DI3  (DI[3] ),
        .DI4  (DI[4] ),
        .DI5  (DI[5] ),
        .DI6  (DI[6] ),
        .DI7  (DI[7] ),
        .DI8  (DI[8] ),
        .DI9  (DI[9] ),
        .DI10 (DI[10]),
        .DI11 (DI[11]),
        .DI12 (DI[12]),
        .DI13 (DI[13]),
        .DI14 (DI[14]),
        .DI15 (DI[15]),
        .DI16 (DI[16]),
        .DI17 (DI[17]),
        .DI18 (DI[18]),
        .DI19 (DI[19]),
        .DI20 (DI[20]),
        .DI21 (DI[21]),
        .DI22 (DI[22]),
        .DI23 (DI[23]),
        .DI24 (DI[24]),
        .DI25 (DI[25]),
        .DI26 (DI[26]),
        .DI27 (DI[27]),
        .DI28 (DI[28]),
        .DI29 (DI[29]),
        .DI30 (DI[30]),
        .DI31 (DI[31]),
        .CK   (clk   ),
        .WEB0 (WEB[0]),
        .WEB1 (WEB[1]),
        .WEB2 (WEB[2]),
        .WEB3 (WEB[3]),
        .OE   (OE    ),
        .CS   (CS    )
    );
// }}}
endmodule
