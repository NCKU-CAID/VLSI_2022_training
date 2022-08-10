`include "../include/AXI_define.svh"

module SRAM_wrapper (
	input   clk,
	input   rst,

	input           [`AXI_IDS_BITS-1:0 ]    ARID,
	input           [`AXI_ADDR_BITS-1:0]    ARADDR,
	input           [`AXI_LEN_BITS-1:0 ]    ARLEN,
	input           [`AXI_SIZE_BITS-1:0]    ARSIZE,
	input           [1:0               ]    ARBURST,
	input                                   ARVALID,
	output  logic                           ARREADY,

	output  logic   [`AXI_IDS_BITS-1:0 ]    RID,
	output  logic   [`AXI_DATA_BITS-1:0]    RDATA,
	output  logic   [1:0               ]    RRESP,
	output  logic                           RLAST,
	output  logic                           RVALID,
	input                                   RREADY,
		
	input           [`AXI_IDS_BITS-1:0 ]    AWID,
	input           [`AXI_ADDR_BITS-1:0]    AWADDR,
	input           [`AXI_LEN_BITS-1:0 ]    AWLEN,
	input           [`AXI_SIZE_BITS-1:0]    AWSIZE,
	input           [1:0               ]    AWBURST,
	input                                   AWVALID,
	output  logic                           AWREADY,

	input           [`AXI_DATA_BITS-1:0]    WDATA,
	input           [`AXI_STRB_BITS-1:0]    WSTRB,
	input                                   WLAST,
	input                                   WVALID,
	output  logic                           WREADY,

	output  logic   [`AXI_IDS_BITS-1:0 ]    BID,
	output  logic   [1:0               ]    BRESP,
	output  logic                           BVALID,
	input                                   BREADY
);

	logic [13:0] A;
	logic [13:0] A_pre;
	logic [13:0] A_plus;
	logic [ 1:0] A_offset;
	logic [`AXI_DATA_BITS-1:0] DI;
	logic [`AXI_DATA_BITS-1:0] DO;
	logic [`AXI_DATA_BITS-1:0] DO_temp;
	logic [`AXI_STRB_BITS-1:0] WEB;
	logic CS;
	logic OE;

	logic	[1:0]	CurrentState;
	logic	[1:0]	NextState;

	logic   IDLE_state;
	logic	ReadData_state;
	logic	WriteData_state;

	logic	[`AXI_IDS_BITS-1:0 ]	ID;
	logic	[`AXI_LEN_BITS-1:0 ]	LEN;

	logic 	[`AXI_LEN_BITS-1:0 ]	counter;

	logic RVALID_reg;
	
	logic [`AXI_IDS_BITS-1:0 ] ARID_reg;
	logic [`AXI_LEN_BITS-1:0 ] ARLEN_reg;
	logic [`AXI_IDS_BITS-1:0 ] AWID_reg;
	logic [`AXI_LEN_BITS-1:0 ] AWLEN_reg;

	parameter	IDLE = 2'b0,
				ReadData = 2'b1,
				WriteData = 2'b10,
            	WriteResponse = 2'b11;
	
	// assign RID = ID;
	assign RID = ARID_reg;
	assign RDATA = /*(RVALID & RVALID_reg) ? DO_temp : */DO;
	assign RRESP = `AXI_RESP_OKAY;
	assign RLAST = (ReadData_state & (counter == LEN));
	// assign BID = ID;
	assign BID = AWID_reg;
	assign BRESP = `AXI_RESP_OKAY;
	assign DI = WDATA;

	always_ff @(posedge clk or negedge rst) begin
		if(~rst)
			RVALID_reg <= 1'b0;
		else
			RVALID_reg <= RVALID;
	end

	always_ff @(posedge clk or negedge rst) begin
		if(~rst)
			DO_temp <= `AXI_DATA_BITS'b0;
		else
			DO_temp <= (RVALID & ~RVALID_reg) ? DO : DO_temp;
	end

	always_ff @(posedge clk or negedge rst) begin
		if(~rst)begin
			A_pre <= 14'b0;
			A_plus <= 14'b0;
			A_offset <= 2'b0;
			counter <= `AXI_LEN_BITS'b0;
		end
		else if(IDLE_state)begin
			if(ARREADY & ARVALID)begin
				A_pre <= ARADDR[15:2];
				A_plus <= ARADDR[15:2] + 14'b1;
			end
			else if(AWREADY & AWVALID)begin
				A_pre <= AWADDR[15:2];
				A_offset <= AWADDR[1:0];
			end
		end
		else if(ReadData_state)begin
			if(RREADY & RVALID)begin
				A_pre <= A_pre + 14'b1;
				A_plus <= A_plus + 14'b1;
				if(counter == LEN)
					counter <= `AXI_LEN_BITS'b0;
				else
					counter <= counter + `AXI_LEN_BITS'b1;
			end
		end
		else if(WriteData_state)begin
			if(WREADY & WVALID)
				A_pre <= A_pre + 14'h1;
		end
	end

	always_ff @(posedge clk or negedge rst) begin
		if(~rst)begin
			ID <= `AXI_IDS_BITS'b0;
			LEN <= `AXI_LEN_BITS'b0;
		end
		else if(IDLE_state)begin
			if(ARREADY & ARVALID)begin
				ID <= ARID;
				LEN <= ARLEN;
			end
			else if(AWREADY & AWVALID)begin
				ID <= AWID;
				LEN <= AWLEN;
			end
		end
	end

	always_ff @(posedge clk or negedge rst) begin
		if(~rst)begin
			ARID_reg <= `AXI_IDS_BITS'b0;
			ARLEN_reg <= `AXI_LEN_BITS'b0;
			AWID_reg <= `AXI_IDS_BITS'b0;
			AWLEN_reg <= `AXI_LEN_BITS'b0;
		end
		else if(IDLE_state)begin
			ARID_reg <= (ARREADY & ARVALID) ? ARID : ARID_reg;
			ARLEN_reg <= (ARREADY & ARVALID) ? ARLEN : ARLEN_reg;
			AWID_reg <= (AWREADY & AWVALID) ? AWID : AWID_reg;
			AWLEN_reg <= (AWREADY & AWVALID) ? AWLEN : AWLEN_reg;
		end
	end

	always_ff @(posedge clk or negedge rst) begin
		if(~rst)
			CurrentState <= IDLE;
		else 
			CurrentState <= NextState;
	end

	always_comb begin
		case(CurrentState)
			IDLE:
        		NextState = (AWREADY & AWVALID) ? WriteData : (ARREADY & ARVALID) ? ReadData : IDLE;
			ReadData:
        		NextState = (RREADY & RVALID & RLAST) ? IDLE : ReadData;
			WriteData:
        		NextState = (WREADY & WVALID & WLAST) ? WriteResponse : WriteData;
			WriteResponse:
        		NextState = (BREADY & BVALID) ? IDLE : WriteResponse;
		endcase
	end

	always_comb begin
    	case(CurrentState)
    	  IDLE:begin
    	    ARREADY = ~AWVALID;
			RVALID = 1'b0;
    	    AWREADY = 1'b1;
    	    WREADY = 1'b0;
			BVALID = 1'b0;
			IDLE_state = 1'b1;
    	    ReadData_state = 1'b0;
    	    WriteData_state = 1'b0;
			A = (AWVALID) ? AWADDR[15:2] : ARADDR[15:2];
			CS = (ARVALID | AWVALID);
			OE = 1'b0;
    	  end
    	  ReadData:begin
    	    ARREADY = 1'b0;
			RVALID = 1'b1;
    	    AWREADY = 1'b0;
    	    WREADY = 1'b0;
			BVALID = 1'b0;
			IDLE_state = 1'b0;
    	    ReadData_state = 1'b1;
    	    WriteData_state = 1'b0;
			A = (RREADY & RVALID & RLAST) ? A_pre : (RREADY & RVALID) ? A_plus : A_pre;
			CS = 1'b1;
			OE = (RREADY & RVALID);
    	  end
    	  WriteData:begin
    	    ARREADY = 1'b0;
			RVALID = 1'b0;
    	    AWREADY = 1'b0;
    	    WREADY = 1'b1;
			BVALID = 1'b0;
			IDLE_state = 1'b0;
    	    ReadData_state = 1'b0;
    	    WriteData_state = 1'b1;
			A = A_pre;
			CS = 1'b1;
			OE = 1'b0;
    	  end
    	  WriteResponse:begin
    	    ARREADY = 1'b0;
			RVALID = 1'b0;
    	    AWREADY = 1'b0;
    	    WREADY = 1'b0;
			BVALID = 1'b1;
			IDLE_state = 1'b0;
    	    ReadData_state = 1'b0;
    	    WriteData_state = 1'b0;
			A = 14'b0;
			CS = 1'b0;
			OE = 1'b0;
    	  end
    	endcase
	end
	
	always_comb begin
		WEB = 4'hf;
		if(WREADY & WVALID)
			WEB = WSTRB;
	end

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

endmodule
