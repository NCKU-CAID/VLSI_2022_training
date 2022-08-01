`include "../include/AXI_define.svh"

module ROM_wrapper (
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
	input                                   BREADY,

    output	logic                           ROM_enable,
    output	logic                           ROM_read,
    output	logic   [`AXI_ADDR_BITS-1:0]    ROM_address,
    input	        [`AXI_DATA_BITS-1:0]    ROM_out
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
	
    //assign ROM inoutput
    assign ROM_enable = CS;
    assign ROM_read = OE;
    assign ROM_address = {18'b0,A};
    assign DO = ROM_out;

	// assign RID = ID;
	assign RID = ARID_reg;
	assign RDATA = (RVALID & RVALID_reg) ? DO_temp : DO;
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
			DO_temp <= (RVALID & ~RVALID_reg /*& RREADY*/) ? DO : DO_temp;
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

endmodule
