// `include "AXI_define.svh"
`include "../include/AXI_define.svh"
`include "def.svh"
module Master(
    input clk,    // Clock
    input rst,  // Asynchronous reset active high
    // from CPU
    input read,
    input write,
    // input [`AXI_STRB_BITS-1:0] write_type,
    input [2:0] write_type,
    input [`AXI_DATA_BITS-1:0] data_in,
    input [`AXI_ADDR_BITS-1:0] addr_in,
    //to CPU
    output logic [`AXI_DATA_BITS-1:0] data_out,
    output logic stall, // to be fixed

    // AXI
    //WRITE ADDRESS
    output logic [`AXI_ID_BITS   -1:0] AWID,
    output logic [`AXI_ADDR_BITS -1:0] AWADDR,
    output logic [`AXI_LEN_BITS  -1:0] AWLEN,
    output logic [`AXI_SIZE_BITS -1:0] AWSIZE,
    output logic [1:0] AWBURST,
    output logic AWVALID,
    input AWREADY,
    //WRITE DATA
    output logic [`AXI_DATA_BITS-1:0] WDATA,
    output logic [`AXI_STRB_BITS-1:0] WSTRB,
    output logic WLAST,
    output logic WVALID,
    input WREADY,
    //WRITE RESPONSE
    input [`AXI_ID_BITS   -1:0] BID,
    input [1:0] BRESP,
    input BVALID,
    output logic BREADY,

    //READ ADDRESS
    output logic [`AXI_ID_BITS   -1:0] ARID,
    output logic [`AXI_ADDR_BITS -1:0] ARADDR,
    output logic [`AXI_LEN_BITS  -1:0] ARLEN,
    output logic [`AXI_SIZE_BITS -1:0] ARSIZE,
    output logic [1:0] ARBURST,
    output logic ARVALID,
    input ARREADY,
    //READ DATA
    input [`AXI_ID_BITS  -1:0] RID,
    input [`AXI_DATA_BITS-1:0] RDATA,
    input [1:0] RRESP,
    input RLAST,
    input RVALID,
    output logic RREADY
);
    logic [2:0] master_status, next_status;
    parameter S_init        = 3'b000,
              S_read_addr   = 3'b001,
              S_read_data   = 3'b010,
              S_write_addr  = 3'b011,
              S_write_data  = 3'b100,
              S_response    = 3'b101;

    logic AW_done, AR_done, R_done, W_done, B_done;
    assign AW_done = AWREADY & AWVALID;
    assign W_done  = WREADY  & WVALID;
    assign B_done  = BREADY  & BVALID;
    assign AR_done = ARREADY & ARVALID;
    assign R_done  = RREADY  & RVALID;

    always_ff @(posedge clk or negedge rst) begin
        master_status <= ~rst ? S_init : next_status;
    end

     always_comb begin
        case(master_status)
            S_init: begin
                if(ARVALID) begin
                    if(AR_done)
                        next_status = S_read_data;
                    else
                        next_status = S_read_addr;
                end
                else if(AWVALID) begin
                    if(AW_done)
                        next_status = S_write_data;
                    else
                        next_status = S_write_addr;
                end
                else
                    next_status = S_init;
            end
            S_read_addr: begin
                if(AR_done)
                    next_status = S_read_data;
                else
                    next_status = S_read_addr;
            end
            S_read_data: begin
                if(R_done & RLAST)
                    next_status = S_init;
                else
                    next_status = S_read_data;
            end
            S_write_addr: begin
                if(AW_done)
                    next_status = S_write_data;
                else
                    next_status = S_write_addr;
            end
            S_write_data: begin
                if(W_done)
                    next_status = S_response;
                else
                    next_status = S_write_data;
            end
            default: begin /*S_response*/
                if(B_done)
                    next_status = S_init;
                else
                    next_status = S_response;
            end
        endcase // master_status
    end



    logic r, w;

    always_ff @(posedge clk or negedge rst) begin
        if(~rst) begin
            r <= 1'b0;
            w <= 1'b0;
        end else begin
            r <= 1'b1;
            w <= 1'b1;
        end
    end

    // AR
    assign ARID    = `AXI_ID_BITS'b0;
    assign ARLEN   = `AXI_LEN_BITS'b11;
    assign ARSIZE  = `AXI_SIZE_BITS'b10;
    assign ARBURST = `AXI_BURST_INC;
    assign ARADDR  = addr_in;

    always_comb begin
        case (master_status)
            S_init:
                ARVALID = read & r;
            S_read_addr:
                ARVALID = 1'b1;
            default : /* default */
                ARVALID = 1'b0;
        endcase
    end

    // R
    logic [`AXI_DATA_BITS-1:0] reg_RDATA;
    assign data_out = R_done ? RDATA : reg_RDATA;
    always_ff@(posedge clk or negedge rst) begin
        if (~rst) begin
            reg_RDATA <= `AXI_DATA_BITS'b0;
        end else begin
            reg_RDATA <= (R_done) ? RDATA : reg_RDATA;
        end
    end

    assign RREADY = (master_status == S_read_data)? 1'b1:1'b0;

    // AW
    assign AWID    = `AXI_ID_BITS'b0;
    assign AWLEN   = `AXI_LEN_BITS'h0;
    assign AWSIZE  = `AXI_SIZE_BITS'b10;
    assign AWBURST = `AXI_BURST_INC;
    assign AWADDR  = addr_in;

    always_comb begin
        case (master_status)
            S_init:
                AWVALID = write & w;
            S_write_addr:
                AWVALID = 1'b1;
            default : /* default */
                AWVALID = 1'b0;
        endcase
    end

    // W
    // assign WSTRB   = write_type;
    always_comb begin
        WSTRB = 4'b1111;
        case(write_type)
            `CACHE_BYTE:    WSTRB[addr_in[1:0]] = 1'b0;
            `CACHE_HWORD:   WSTRB[{addr_in[1],1'b0}+:2] = 2'b0;
            `CACHE_WORD:    WSTRB = 4'b0000;
        endcase
    end

    assign WLAST   = 1'b1;
    assign WDATA   = data_in;

    assign WVALID = (master_status == S_write_data)? 1'b1:1'b0;

    // B
    assign BREADY = ((master_status == S_response) | W_done)? 1'b1:1'b0;

    assign stall = (read & ~R_done) | (write & ~W_done);
endmodule
