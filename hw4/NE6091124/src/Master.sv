`include "../include/AXI_define.svh"

module Master (
	input   clk,
	input   rst,

	output  logic [`AXI_ID_BITS-1:0] AWID,
	output  logic [`AXI_ADDR_BITS-1:0] AWADDR,
	output  logic [`AXI_LEN_BITS-1:0] AWLEN,
	output  logic [`AXI_SIZE_BITS-1:0] AWSIZE,
	output  logic [1:0] AWBURST,
	output  logic AWVALID,
	input   AWREADY,

	output  logic [`AXI_DATA_BITS-1:0] WDATA,
	output  logic [`AXI_STRB_BITS-1:0] WSTRB,
	output  logic WLAST,
	output  logic WVALID,
	input   WREADY,

	input   [`AXI_ID_BITS-1:0] BID,
	input   [1:0] BRESP,
	input   BVALID,
	output  logic BREADY,

	output  logic [`AXI_ID_BITS-1:0] ARID,
	output  logic [`AXI_ADDR_BITS-1:0] ARADDR,
	output  logic [`AXI_LEN_BITS-1:0] ARLEN,
	output  logic [`AXI_SIZE_BITS-1:0] ARSIZE,
	output  logic [1:0] ARBURST,
	output  logic ARVALID,
	input   ARREADY,

	input   [`AXI_ID_BITS-1:0] RID,
	input   [`AXI_DATA_BITS-1:0] RDATA,
	input   [1:0] RRESP,
	input   RLAST,
	input   RVALID,
	output  logic RREADY,

	input   READ,
	input   [`AXI_STRB_BITS-1:0] WRITE,
	input   [`AXI_ADDR_BITS-1:0] ADDRESS,
	input   [`AXI_DATA_BITS-1:0] DATA_in,
	output  logic [`AXI_DATA_BITS-1:0] DATA_out,
    output  logic DATA_valid,
	output  logic STALL
	);

    logic	[2:0]	CurrentState;
	logic	[2:0]	NextState;

    logic   [`AXI_DATA_BITS-1:0] RDATA_reg;

    parameter	IDLE = 3'h0,
                ReadAddress = 3'h1,
				ReadData = 3'h2,
                WriteAddress = 3'h3,
				WriteData = 3'h4,
            	WriteResponse = 3'h5;
    
    assign AWID = `AXI_ID_BITS'b0;
    assign AWADDR = ADDRESS;
    assign AWLEN = `AXI_LEN_BITS'b0;
    assign AWSIZE = `AXI_SIZE_BITS'b10;
    assign AWBURST = `AXI_BURST_INC;

    assign ARID = `AXI_ID_BITS'b0;
    assign ARADDR = ADDRESS;
    assign ARLEN = (ADDRESS[31:16] == 16'h1000) ? `AXI_LEN_BITS'b0 : `AXI_LEN_BITS'b11;
    assign ARSIZE = `AXI_SIZE_BITS'b10;
    assign ARBURST = `AXI_BURST_INC;

    assign WDATA = DATA_in;
    assign WSTRB = WRITE;
    assign WLAST = 1'b1;

    assign DATA_out = (RVALID & RREADY) ? RDATA : RDATA_reg;
    assign DATA_valid = (RVALID & RREADY);

    always_ff @(posedge clk or negedge rst) begin
		if(~rst)
			RDATA_reg <= `AXI_DATA_BITS'b0;
		else 
			RDATA_reg <= (RVALID & RREADY) ? RDATA : RDATA_reg;
	end

	logic start;
    
	always_ff @(posedge clk or negedge rst) begin
        if (~rst)
			start <= 1'b0;
        else
			start <= 1'b1;
    end
    
	logic READ_reg;
	logic WRITE_reg;
    
	assign READ_reg = start & READ;
    assign WRITE_reg = start & (WRITE != 4'hf);

    
    always_ff @(posedge clk or negedge rst) begin
		if(~rst)
			CurrentState <= IDLE;
		else 
			CurrentState <= NextState;
	end

    always_comb begin
		case(CurrentState)
			IDLE:
                NextState = (ARVALID & ARREADY) ? ReadData : ((ARVALID) ? ReadAddress : ((AWVALID & AWREADY) ? WriteData : ((AWVALID) ? WriteAddress : IDLE)));
            ReadAddress:
                NextState = (ARVALID & ARREADY) ? ReadData : ReadAddress;
			ReadData:
        		NextState = (RREADY & RVALID & RLAST) ? IDLE : ReadData;
            WriteAddress:
                NextState = (AWVALID & AWREADY) ? WriteData : WriteAddress;
			WriteData:
        		NextState = (WREADY & WVALID & WLAST) ? WriteResponse : WriteData;
			WriteResponse:
        		NextState = (BREADY & BVALID) ? (ARVALID ? ReadAddress : AWVALID ? WriteAddress : IDLE) : WriteResponse;
            default:
                NextState = IDLE;
		endcase
	end

    always_comb begin
		case(CurrentState)
			IDLE:begin
				ARVALID = READ_reg ? 1'b1 : 1'b0;
                RREADY = 1'b0;
				AWVALID = WRITE_reg ? 1'b1 : 1'b0;
                WVALID = 1'b0;
                BREADY = 1'b0;
				STALL = READ_reg | WRITE_reg;
            end
            ReadAddress:begin
                ARVALID = 1'b1;
                RREADY = 1'b0;
                AWVALID = 1'b0;
                WVALID = 1'b0;
                BREADY = 1'b0;
                STALL = 1'b1;
            end
			ReadData:begin
                ARVALID = 1'b0;
                RREADY = 1'b1;
                AWVALID = 1'b0;
                WVALID = 1'b0;
                BREADY = 1'b0;
                STALL = ~(RREADY & RVALID & RLAST);
            end
            WriteAddress:begin
                ARVALID = 1'b0;
                RREADY = 1'b0;
                AWVALID = 1'b1;
                WVALID = 1'b0;
                BREADY = 1'b0;
                STALL = 1'b1;
            end
			WriteData:begin
                ARVALID = 1'b0;
                RREADY = 1'b0;
                AWVALID = 1'b0;
                WVALID = 1'b1;
                BREADY = 1'b0;
                STALL = ~(WREADY & WVALID);
            end
			WriteResponse:begin
                ARVALID = 1'b0;
                RREADY = 1'b0;
                AWVALID = 1'b0;
                WVALID = 1'b0;
                BREADY = 1'b1;
				STALL = READ_reg | WRITE_reg;
            end
            default:begin
                ARVALID = 1'b0;
                RREADY = 1'b0;
                AWVALID = 1'b0;
                WVALID = 1'b0;
                BREADY = 1'b0;
                STALL = 1'b0;
            end
		endcase
	end

endmodule
