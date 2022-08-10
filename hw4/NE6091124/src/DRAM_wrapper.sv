`include "../include/AXI_define.svh"

module DRAM_wrapper (
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

    output	logic   						DRAM_CSn,
    output	logic   [`AXI_STRB_BITS-1:0]	DRAM_WEn,
    output	logic   						DRAM_RASn,
    output	logic   						DRAM_CASn,
    output	logic   [10:0]					DRAM_A,
    output	logic   [`AXI_DATA_BITS-1:0]	DRAM_D,
	input 	        [`AXI_DATA_BITS-1:0]	DRAM_Q,
	input 	        						DRAM_valid
);

    logic [2:0] CurrentState;
    logic [2:0] NextState;
    logic [2:0] delay_counter;
    logic [`AXI_LEN_BITS-1:0 ] LEN_counter;

    logic [`AXI_IDS_BITS-1:0 ] ARID_reg;
	logic [`AXI_LEN_BITS-1:0 ] ARLEN_reg;
	logic [`AXI_IDS_BITS-1:0 ] AWID_reg;
	logic [`AXI_LEN_BITS-1:0 ] AWLEN_reg;
    logic RVALID_reg;

    logic [`AXI_ADDR_BITS-1:0] A_pre;
    logic [`AXI_DATA_BITS-1:0] DRAM_D_reg;
    logic [`AXI_DATA_BITS-1:0] DRAM_Q_temp;

    parameter   IDLE = 3'h0,
                RowSelect = 3'h1,
                ReadColumnSelect = 3'h2,
                WriteColumnSelect = 3'h3,
                WriteResponse = 3'h4,
                Precharge = 3'h5;
    
    logic IDLE_state;
    logic RowSelect_state;
    logic ReadColumnSelect_state;
    logic WriteColumnSelect_state;
    logic Precharge_state;

    // assign RID = ID;
	assign RID = ARID_reg;
	assign RDATA = (RVALID & RVALID_reg) ? DRAM_Q_temp : DRAM_Q;
	assign RRESP = `AXI_RESP_OKAY;
	assign RLAST = (RREADY & RVALID & (LEN_counter == ARLEN_reg));
	// assign BID = ID;
	assign BID = AWID_reg;
	assign BRESP = `AXI_RESP_OKAY;

    always_ff @(posedge clk or negedge rst) begin
		if(~rst)
			RVALID_reg <= 1'b0;
		else
			RVALID_reg <= RVALID;
	end

    always_ff @(posedge clk or negedge rst) begin
		if(~rst)
			DRAM_Q_temp <= `AXI_DATA_BITS'b0;
		else
			DRAM_Q_temp <= (RVALID & ~RVALID_reg) ? DRAM_Q : DRAM_Q_temp;
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
			DRAM_D_reg <= `AXI_DATA_BITS'b0;
		else
			DRAM_D_reg <= (WREADY & WVALID) ? WDATA : DRAM_D_reg;
	end

    always_ff @(posedge clk or negedge rst) begin
        if(~rst)
            LEN_counter <= `AXI_LEN_BITS'h0;
        else begin
            if(RREADY & RVALID)begin
                if(LEN_counter == ARLEN_reg)
                    LEN_counter <= `AXI_LEN_BITS'h0;
                else 
                    LEN_counter <= LEN_counter + `AXI_LEN_BITS'h1;
            end
        end
    end

    always_ff @(posedge clk or negedge rst) begin
        if(~rst)
            delay_counter <= 3'h0;
        else begin
            if(RowSelect_state & delay_counter == 3'h4)
                delay_counter <= 3'h0;
            else if(RowSelect_state)
                delay_counter <= delay_counter + 3'b1;
            else if(ReadColumnSelect_state & DRAM_valid)
                delay_counter <= 3'h0;
            else if(ReadColumnSelect_state)
                delay_counter <= delay_counter + 3'b1;
            else if(WriteColumnSelect_state & (delay_counter == 3'h4))
                delay_counter <= 3'h0;
            else if(WriteColumnSelect_state)
                delay_counter <= delay_counter + 3'b1;
            else if(Precharge_state & (delay_counter == 3'h4))
                delay_counter <= 3'h0;
            else if(Precharge_state)
                delay_counter <= delay_counter + 3'b1;
        end
    end

    always_ff @(posedge clk or negedge rst) begin
        if(~rst)
            A_pre <= `AXI_ADDR_BITS'b0;
        else begin
            if(AWREADY & AWVALID)
                A_pre <= AWADDR;
            else if(ARREADY & ARVALID)
                A_pre <= ARADDR;
            else if(ReadColumnSelect_state & DRAM_valid & ~RLAST)
                A_pre <= A_pre + 32'h4;
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
                NextState = ((AWREADY & AWVALID) | (ARREADY & ARVALID)) ? RowSelect : IDLE;
            RowSelect:
                NextState = (delay_counter == 3'h4) ? ((WVALID) ? WriteColumnSelect : ReadColumnSelect) : RowSelect;
            ReadColumnSelect:
                NextState = (RREADY & RVALID & RLAST) ? Precharge : ReadColumnSelect;
            WriteColumnSelect:
                NextState = (WREADY & WVALID & WLAST) ? WriteResponse : WriteColumnSelect;
            WriteResponse:
                NextState = (BREADY & BVALID) ? Precharge : WriteResponse;
            Precharge:
                NextState = (delay_counter == 3'h4) ? IDLE : Precharge;
            default:
                NextState = IDLE;
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
                RowSelect_state = 1'b0;
                ReadColumnSelect_state = 1'b0;
                WriteColumnSelect_state = 1'b0;
                Precharge_state = 1'b0;
                DRAM_CSn = ~((AWREADY & AWVALID) | (ARREADY & ARVALID));
                DRAM_RASn = ~((AWREADY & AWVALID) | (ARREADY & ARVALID));
                DRAM_CASn = 1'b1;
                DRAM_A = (AWVALID) ? AWADDR[22:12] : ARADDR[22:12];
                DRAM_D = `AXI_DATA_BITS'b0;
            end
            RowSelect:begin
                ARREADY = 1'b0;
                RVALID = 1'b0;
                AWREADY = 1'b0;
                WREADY = 1'b0;
                BVALID = 1'b0;
                IDLE_state = 1'b0;
                RowSelect_state = 1'b1;
                ReadColumnSelect_state = 1'b0;
                WriteColumnSelect_state = 1'b0;
                Precharge_state = 1'b0;
                DRAM_CSn = 1'b0;
                DRAM_RASn = 1'h1;
                DRAM_CASn = 1'b1;
                DRAM_A = A_pre[22:12];
                DRAM_D = DRAM_D_reg;
            end
            ReadColumnSelect:begin
                ARREADY = 1'b0;
                RVALID = DRAM_valid;
                AWREADY = 1'b0;
                WREADY = 1'b0;
                BVALID = 1'b0;
                IDLE_state = 1'b0;
                RowSelect_state = 1'b0;
                ReadColumnSelect_state = 1'b1;
                WriteColumnSelect_state = 1'b0;
                Precharge_state = 1'b0;
                DRAM_CSn = 1'b0;
                DRAM_RASn = 1'h1;
                DRAM_CASn = (delay_counter == 3'b0) ? 1'b0 : 1'b1;
                DRAM_A = {1'b0,A_pre[11:2]};
                DRAM_D = `AXI_DATA_BITS'b0;
            end
            WriteColumnSelect:begin
                ARREADY = 1'b0;
                RVALID = 1'b0;
                AWREADY = 1'b0;
                WREADY = (delay_counter == 3'h4) ? 1'b1 : 1'b0;
                BVALID = 1'b0;
                IDLE_state = 1'b0;
                RowSelect_state = 1'b0;
                ReadColumnSelect_state = 1'b0;
                WriteColumnSelect_state = 1'b1;
                Precharge_state = 1'b0;
                DRAM_CSn = 1'b0;
                DRAM_RASn = 1'h1;
                DRAM_CASn = (delay_counter == 3'b0) ? 1'b0 : 1'b1;
                DRAM_A = {1'b0,A_pre[11:2]};
                DRAM_D = WDATA;
            end
            WriteResponse:begin
                ARREADY = 1'b0;
                RVALID = 1'b0;
                AWREADY = 1'b0;
                WREADY = 1'b0;
                BVALID = 1'b1;
                IDLE_state = 1'b0;
                RowSelect_state = 1'b0;
                ReadColumnSelect_state = 1'b0;
                WriteColumnSelect_state = 1'b0;
                Precharge_state = 1'b0;
                DRAM_CSn = 1'b0;
                DRAM_RASn = 1'h1;
                DRAM_CASn = 1'b1;
                DRAM_A = {1'b0,A_pre[11:2]};
                DRAM_D = DRAM_D_reg;
            end
            Precharge:begin
                ARREADY = 1'b0;
                RVALID = 1'b0;
                AWREADY = 1'b0;
                WREADY = 1'b0;
                BVALID = 1'b0;
                IDLE_state = 1'b0;
                RowSelect_state = 1'b0;
                ReadColumnSelect_state = 1'b0;
                WriteColumnSelect_state = 1'b0;
                Precharge_state = 1'b1;
                DRAM_CSn = 1'b0;
                DRAM_RASn = (delay_counter == 3'b0) ? 1'b0 : 1'b1;
                DRAM_CASn = 1'b1;
                DRAM_A = A_pre[22:12];
                DRAM_D = DRAM_D_reg;
            end
            default:begin
                ARREADY = 1'b0;
                RVALID = 1'b0;
                AWREADY = 1'b0;
                WREADY = 1'b0;
                BVALID = 1'b0;
                IDLE_state = 1'b0;
                RowSelect_state = 1'b0;
                ReadColumnSelect_state = 1'b0;
                WriteColumnSelect_state = 1'b0;
                Precharge_state = 1'b0;
                DRAM_CSn = 1'b1;
                DRAM_RASn = 1'h1;
                DRAM_CASn = 1'b1;
                DRAM_A = 11'b0;
                DRAM_D = `AXI_DATA_BITS'b0;
            end
        endcase
    end

    always_comb begin
		DRAM_WEn = 4'hf;
		if(WriteColumnSelect_state & (delay_counter == 3'b0))
			DRAM_WEn = WSTRB;
        else if(Precharge_state & (delay_counter == 3'b0))
            DRAM_WEn = 4'h0;
	end

endmodule