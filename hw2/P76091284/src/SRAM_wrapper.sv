`include "AXI_define.svh"
// `include "../include/AXI_define.svh"
module SRAM_wrapper (
    input clk,
    input rst,

    // WRITE ADDRESS
    input [`AXI_IDS_BITS-1:0] AWID,
    input [`AXI_ADDR_BITS-1:0] AWADDR,
    input [`AXI_LEN_BITS-1:0] AWLEN,
    input [`AXI_SIZE_BITS-1:0] AWSIZE,
    input [1:0] AWBURST,
    input AWVALID,
    output logic AWREADY,
    // WRITE DATA
    input [`AXI_DATA_BITS-1:0] WDATA,
    input [`AXI_STRB_BITS-1:0] WSTRB,
    input WLAST,
    input WVALID,
    output logic WREADY,
    // WRITE RESPONSE
    output logic [`AXI_IDS_BITS-1:0] BID,
    output logic [1:0] BRESP,
    output logic BVALID,
    input BREADY,

    // READ ADDRESS
    input [`AXI_IDS_BITS-1:0] ARID,
    input [`AXI_ADDR_BITS-1:0] ARADDR,
    input [`AXI_LEN_BITS-1:0] ARLEN,
    input [`AXI_SIZE_BITS-1:0] ARSIZE,
    input [1:0] ARBURST,
    input ARVALID,
    output logic ARREADY,
    // READ DATA
    output logic [`AXI_IDS_BITS-1:0] RID,
    output logic [`AXI_DATA_BITS-1:0] RDATA,
    output logic [1:0] RRESP,
    output logic RLAST,
    output logic RVALID,
    input RREADY

);
    logic [13:0] A;
    logic [`AXI_DATA_BITS-1:0] DI;
    logic [`AXI_DATA_BITS-1:0] DO;
    logic [`AXI_STRB_BITS-1:0] WEB;
    logic CS;
    logic OE;

    logic AR_done, R_done, AW_done, W_done, B_done;
    assign AR_done = ARVALID & ARREADY;
    assign R_done  = RVALID & RREADY;
    assign AW_done = AWVALID & AWREADY;
    assign W_done  = WVALID & WREADY;
    assign B_done  = BVALID & BREADY;

    logic R_done_last, W_done_last;
    assign R_done_last = RLAST & R_done;
    assign W_done_last = WLAST & W_done;

    logic [1:0] slave_status, next_status;
    parameter [1:0] S_address    = 2'b00,
                    S_read_data  = 2'b01,
                    S_write_data = 2'b10,
                    S_response   = 2'b11;

    always_ff @(posedge clk or negedge rst) begin
        if(~rst) begin
            slave_status <= S_address;
        end else begin
             slave_status <= next_status;
        end
    end

    always_comb begin
        case(slave_status)
            S_address: begin
                if(AW_done & W_done)
                    next_status = S_response;
                else if(AW_done)
                    next_status = S_write_data;
                else if(AR_done)
                    next_status = S_read_data;
                else
                    next_status = S_address;
            end
            S_read_data: begin
                if(R_done_last & AW_done)
                    next_status = S_write_data;
                else if(R_done_last & AR_done)
                    next_status = S_read_data;
                else if(R_done_last)
                    next_status = S_address;
                else
                    next_status = S_read_data;
            end
            S_write_data: begin
                if(W_done_last)
                    next_status = S_response;
                else
                    next_status = S_write_data;
            end
            default/*S_response*/: begin
                if(B_done & AW_done)
                    next_status = S_write_data;
                else if(B_done & AR_done)
                    next_status = S_read_data;
                else if(B_done)
                    next_status = S_address;
                else
                    next_status = S_response;
            end
        endcase // slave_status
    end

    // assign AWREADY = (slave_status == S_address)? 1'b1:1'b0;
    // assign ARREADY = ((slave_status == S_address) & ~AWVALID)? 1'b1:1'b0;
    always_comb begin
        case (slave_status)
            S_address:
                AWREADY = 1'b1;
            S_response:
                AWREADY = B_done;
            S_read_data:
                AWREADY = R_done;
            default : /* default */
                AWREADY = 1'b0;
        endcase
    end

    always_comb begin
        case (slave_status)
            S_address:
                ARREADY = ~AWVALID;
            S_response:
                ARREADY = 1'b0;
            S_read_data:
                ARREADY = 1'b0;
            default:/* default */
                ARREADY = 1'b0;
        endcase
    end
    assign WREADY = (slave_status == S_write_data)? 1'b1:1'b0;
    assign BVALID = (slave_status == S_response)? 1'b1:1'b0;
    assign RVALID = (slave_status == S_read_data)? 1'b1:1'b0;

    assign RRESP = `AXI_RESP_OKAY;
    assign BRESP = `AXI_RESP_OKAY;

    logic [`AXI_IDS_BITS-1:0] reg_ARID, reg_AWID;
    always_ff @(posedge clk or negedge rst) begin
        if(~rst) begin
            reg_ARID <= `AXI_IDS_BITS'b0;
            reg_AWID <= `AXI_IDS_BITS'b0;
        end else begin
            reg_ARID <= (AR_done)? ARID:reg_ARID;
            reg_AWID <= (AW_done)? AWID:reg_AWID;
        end
    end

    assign RID = reg_ARID;
    assign BID = reg_AWID;

    logic [`AXI_LEN_BITS-1:0] reg_ARLEN, reg_AWLEN;
    always_ff @(posedge clk or negedge rst) begin
        if(~rst) begin
            reg_ARLEN <= `AXI_LEN_BITS'b0;
            reg_AWLEN <= `AXI_LEN_BITS'b0;
        end else begin
            reg_ARLEN <= (AR_done)? ARLEN:reg_ARLEN;
            reg_AWLEN <= (AW_done)? AWLEN:reg_AWLEN;
        end
    end

    logic [`AXI_LEN_BITS-1:0] cnt;

    always_ff @(posedge clk or negedge rst) begin
        if (~rst) begin
            cnt <= `AXI_LEN_BITS'h0;
        end
        else begin
            case (slave_status)
                S_read_data: cnt <= (R_done_last)? `AXI_LEN_BITS'b0:((R_done)? cnt+`AXI_LEN_BITS'b1:cnt);
                S_write_data:cnt <= (W_done_last)? `AXI_LEN_BITS'b0:((W_done)? cnt+`AXI_LEN_BITS'b1:cnt);
            endcase
        end
    end
    assign RLAST = (reg_ARLEN == cnt);

    logic reg_RVALID;
    always_ff @(posedge clk or negedge rst) begin
        if(~rst) begin
            reg_RVALID <= 1'b0;
        end else begin
            reg_RVALID <= RVALID;
        end
    end

    logic [`AXI_DATA_BITS-1:0] reg_RDATA;
    always_ff @(posedge clk or negedge rst) begin
        if (~rst)begin
            reg_RDATA <= `AXI_DATA_BITS'b0;
        end
        else begin
            reg_RDATA <= (RVALID & ~reg_RVALID) ? DO : reg_RDATA;
        end
    end

    assign RDATA = (RVALID & reg_RVALID)? reg_RDATA:DO;

    assign WEB = WSTRB;
    assign DI = WDATA;
    // assign OE = (slave_status == S_read_data)? 1'b1:1'b0; // f
    always_comb begin
        case (slave_status)
            S_address:
                OE = ~AWVALID & AR_done;
            S_read_data:
                OE = 1'b1;
            default : /* default */
                OE = 1'b0;
        endcase
    end

    always_comb begin
        case (slave_status)
            S_address:
                CS = AWVALID | ARVALID;
            default : /* default */
                CS = 1'b1;
        endcase
    end

    // assign CS = ((slave_status == S_address) & ~(AWVALID | ARVALID))? 1'b0: 1'b1;
    // assign A = (AW_done)? AWADDR[15:2]:ARADDR[15:2];

    logic [13:0] reg_RADDR, reg_WADDR;

    always_ff @(posedge clk or negedge rst) begin
        if (~rst) begin
            reg_RADDR  <= 14'b0;
            reg_WADDR  <= 14'b0;
        end
        else begin
            reg_RADDR  <= AR_done? ARADDR[15:2] : reg_RADDR;
            reg_WADDR  <= AW_done? AWADDR[15:2] : reg_WADDR;
        end
    end

    always_comb begin
        case(slave_status)
            S_address   :
                A = (AW_done)? AWADDR[15:2]:ARADDR[15:2];
            S_read_data :
                A = reg_RADDR;
            S_write_data:
                A = reg_WADDR;
            default:
                /*S_response*/
                A = ~B_done? reg_WADDR:(AW_done ? AWADDR[15:2]:ARADDR[15:2]);
        endcase
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
