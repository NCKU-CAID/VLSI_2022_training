`include "../../include/AXI_define.svh"

module DefaultSlave(
	input   clk,
	input   rst,

	input           [`AXI_IDS_BITS-1:0 ]    ARID_DEFAULT,
	input           [`AXI_ADDR_BITS-1:0]    ARADDR_DEFAULT,
	input           [`AXI_LEN_BITS-1:0 ]    ARLEN_DEFAULT,
	input           [`AXI_SIZE_BITS-1:0]    ARSIZE_DEFAULT,
	input           [1:0               ]    ARBURST_DEFAULT,
	input                                   ARVALID_DEFAULT,
	output  logic                           ARREADY_DEFAULT,

	output  logic   [`AXI_IDS_BITS-1:0 ]    RID_DEFAULT,
	output  logic   [`AXI_DATA_BITS-1:0]    RDATA_DEFAULT,
	output  logic   [1:0               ]    RRESP_DEFAULT,
	output  logic                           RLAST_DEFAULT,
	output  logic                           RVALID_DEFAULT,
	input                                   RREADY_DEFAULT,
		
    input           [`AXI_IDS_BITS-1:0 ]    AWID_DEFAULT,
	input           [`AXI_ADDR_BITS-1:0]    AWADDR_DEFAULT,
	input           [`AXI_LEN_BITS-1:0 ]    AWLEN_DEFAULT,
	input           [`AXI_SIZE_BITS-1:0]    AWSIZE_DEFAULT,
	input           [1:0               ]    AWBURST_DEFAULT,
	input                                   AWVALID_DEFAULT,
	output  logic                           AWREADY_DEFAULT,

	input           [`AXI_DATA_BITS-1:0]    WDATA_DEFAULT,
	input           [`AXI_STRB_BITS-1:0]    WSTRB_DEFAULT,
	input                                   WLAST_DEFAULT,
	input                                   WVALID_DEFAULT,
	output  logic                           WREADY_DEFAULT,

	output  logic   [`AXI_IDS_BITS-1:0 ]    BID_DEFAULT,
	output  logic   [1:0               ]    BRESP_DEFAULT,
	output  logic                           BVALID_DEFAULT,
	input                                   BREADY_DEFAULT
);

	logic	[1:0]	CurrentState;
	logic	[1:0]	NextState;

	parameter	IDLE = 2'b0,
				ReadData = 2'b1,
				WriteData = 2'b10,
				WriteResponse = 2'b11;


	always_ff @(posedge clk or negedge rst) begin
		if(~rst)
			CurrentState <= IDLE;
		else 
			CurrentState <= NextState;
	end

	always_comb begin
		case(CurrentState)
			IDLE:begin
				if(ARREADY_DEFAULT & ARVALID_DEFAULT)
					NextState = ReadData;
				else if(AWREADY_DEFAULT & AWVALID_DEFAULT)
					NextState = WriteData;
				else 
					NextState = IDLE;
			end
			ReadData:begin
				if(RREADY_DEFAULT & RVALID_DEFAULT & RLAST_DEFAULT)
					NextState = IDLE;
				else 
					NextState = ReadData;
			end
			WriteData:begin
				if(WREADY_DEFAULT & WVALID_DEFAULT & WLAST_DEFAULT)
					NextState = WriteResponse;
				else 
					NextState = WriteData;
			end
			WriteResponse:begin
				if(BREADY_DEFAULT & BVALID_DEFAULT)
					NextState = IDLE;
				else 
					NextState = WriteResponse;
			end
		endcase
	end

	// ReadAddress
    assign ARREADY_DEFAULT = (CurrentState == IDLE);

	// ReadData
	assign RDATA_DEFAULT = `AXI_DATA_BITS'b0;
    assign RRESP_DEFAULT = `AXI_RESP_DECERR;
    assign RVALID_DEFAULT = (CurrentState == ReadData);

    always_ff @(posedge clk or negedge rst) begin
        if(~rst)begin
            RID_DEFAULT <= 8'b0;
			RLAST_DEFAULT <= 1'b1;
		end
		else begin
            RID_DEFAULT <= (ARREADY_DEFAULT & ARVALID_DEFAULT) ? ARID_DEFAULT : RID_DEFAULT;
			if(ARREADY_DEFAULT & ARVALID_DEFAULT & (ARLEN_DEFAULT == 4'h1))
				RLAST_DEFAULT <= 1'b0;
			else if(RREADY_DEFAULT & RVALID_DEFAULT)
				RLAST_DEFAULT <= 1'b1;
		end
    end

    // WriteAddress
    assign AWREADY_DEFAULT = (AWVALID_DEFAULT & (CurrentState == IDLE));

	// WriteData
	assign WREADY_DEFAULT = (WVALID_DEFAULT & (CurrentState == WriteData));

	// WriteResponse
	assign BRESP_DEFAULT = `AXI_RESP_DECERR;
    assign BVALID_DEFAULT = (CurrentState == WriteResponse);

    always_ff @(posedge clk or negedge rst) begin
        if(~rst)
            BID_DEFAULT <= 8'b0;
		else
            BID_DEFAULT <= (AWREADY_DEFAULT & AWVALID_DEFAULT) ? AWID_DEFAULT : BID_DEFAULT;
    end

endmodule
