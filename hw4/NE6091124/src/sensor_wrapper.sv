`include "../include/AXI_define.svh"
`include "sensor_ctrl.sv"

module sensor_wrapper(
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

    input                                   sensor_ready,
    input           [`AXI_DATA_BITS-1:0]    sensor_out,
    output  logic                           sensor_en,
    output  logic                           sensor_interrupt
);

	logic							sctrl_en;
	logic							sctrl_clear;
	logic	[`AXI_ADDR_BITS-1:0]	sctrl_addr;
	logic	[`AXI_DATA_BITS-1:0]	sctrl_out;

	logic	[1:0]	CurrentState;
	logic	[1:0]	NextState;

	logic   IDLE_state;
	logic	ReadData_state;
	logic	WriteData_state;

	logic 	[`AXI_LEN_BITS-1:0 ]	counter;

	logic	RVALID_reg;
	
	logic	[`AXI_IDS_BITS-1:0 ]	ARID_reg;
	logic	[`AXI_LEN_BITS-1:0 ]	ARLEN_reg;
	logic	[`AXI_IDS_BITS-1:0 ]	AWID_reg;

	parameter	IDLE = 2'b0,
				ReadData = 2'b1,
				WriteData = 2'b10,
            	WriteResponse = 2'b11;
	
	assign RID = ARID_reg;
	assign RDATA = sctrl_out;
	assign RRESP = `AXI_RESP_OKAY;
	assign RLAST = (ReadData_state & (counter == ARLEN_reg));

	assign BID = AWID_reg;
	assign BRESP = `AXI_RESP_OKAY;

	always_ff @(posedge clk or negedge rst) begin
		if(~rst)begin
			sctrl_en <= 1'b0;
			sctrl_clear <= 1'b0;
		end
		else begin
			if(WriteData_state)begin
				if(sctrl_addr == 32'h10000100)
					sctrl_en <= WDATA[0];
				else if(sctrl_addr == 32'h10000200)
					sctrl_clear <= WDATA[0];
			end
		end
	end

	always_ff @(posedge clk or negedge rst) begin
		if(~rst)
			sctrl_addr <= `AXI_ADDR_BITS'b0;
		else begin
			if(ARREADY & ARVALID)
				sctrl_addr <= ARADDR;
			else if(AWREADY & AWVALID)
				sctrl_addr <= AWADDR;
		end
	end

	always_ff @(posedge clk or negedge rst) begin
		if(~rst)
			counter <= `AXI_LEN_BITS'b0;
		else begin
			if(ReadData_state & RREADY & RVALID)begin
				if(counter == ARLEN_reg)
					counter <= `AXI_LEN_BITS'b0;
				else
					counter <= counter + `AXI_LEN_BITS'b1;
			end
		end
	end

	always_ff @(posedge clk or negedge rst) begin
		if(~rst)begin
			ARID_reg <= `AXI_IDS_BITS'b0;
			ARLEN_reg <= `AXI_LEN_BITS'b0;
			AWID_reg <= `AXI_IDS_BITS'b0;
		end
		else if(IDLE_state)begin
			ARID_reg <= (ARREADY & ARVALID) ? ARID : ARID_reg;
			ARLEN_reg <= (ARREADY & ARVALID) ? ARLEN : ARLEN_reg;
			AWID_reg <= (AWREADY & AWVALID) ? AWID : AWID_reg;
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
    	  end
    	endcase
	end

	sensor_ctrl sensor_ctrl(
	    .clk			(clk                ),
	    .rst			(~rst               ),

	    .sctrl_en		(sctrl_en           ),
	    .sctrl_clear	(sctrl_clear        ),
	    .sctrl_addr		(sctrl_addr[7:2]    ),
		.sctrl_out		(sctrl_out          ),

	    .sensor_ready	(sensor_ready       ),
	    .sensor_out		(sensor_out         ),
	    .sensor_en		(sensor_en          ),

		.sctrl_interrupt(sensor_interrupt	)
	);

endmodule