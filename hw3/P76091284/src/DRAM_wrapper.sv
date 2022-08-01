module DRAM_wrapper (
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
    input RREADY,

    output logic DRAM_CSn,
    output logic [`AXI_STRB_BITS-1:0] DRAM_WEn,
    output logic DRAM_RASn,
    output logic DRAM_CASn,
    output logic [10:0] DRAM_A,
    output logic [`AXI_DATA_BITS-1:0] DRAM_D,
    input [`AXI_DATA_BITS-1:0] DRAM_Q,
    input DRAM_valid
);
    logic AR_done, R_done, AW_done, W_done, B_done;
    assign AR_done = ARVALID & ARREADY;
    assign R_done  = RVALID  & RREADY;
    assign AW_done = AWVALID & AWREADY;
    assign W_done  = WVALID  & WREADY;
    assign B_done  = BVALID  & BREADY;

    logic R_done_last, W_done_last;
    assign R_done_last = RLAST & R_done;
    assign W_done_last = WLAST & W_done;

    parameter S_init  = 3'b000,
              S_act   = 3'b001,
              S_read  = 3'b010,
              S_write = 3'b011,
              S_pre   = 3'b100;

    logic [2:0] delay_cnt;  // wait 5 cycle
    logic [2:0] dram_state, next_state;
    logic delay_done;
    assign delay_done = (dram_state == S_read) ? delay_cnt == 3'h5 : delay_cnt[2];

    logic write;
    always_ff @(posedge clk or negedge rst) begin
        if(~rst) begin
            write <= 1'b0;
        end else begin
            case (dram_state)
                S_init: begin
                    if(AW_done)
                        write <= 1'b1;
                end
                S_act:
                    write <= write;
                default : /* default */
                    write <= 1'b0;
            endcase
        end
    end

    always_ff @(posedge clk or negedge rst) begin
        if(~rst)
            dram_state <= S_init;
        else
            dram_state <= next_state;
    end
    always_comb begin
        case (dram_state)
            S_init: begin
                if(AR_done | AW_done)
                    next_state = S_act;
                else
                    next_state = S_init;
            end
            S_act: begin
                if(delay_done) begin
                    if(write)
                        next_state = S_write;
                    else
                        next_state = S_read;
                end
                else
                    next_state = S_act;
            end
            S_read: begin
                if(delay_done & R_done_last)
                    next_state = S_pre;
                else
                    next_state = S_read;
            end
            S_write: begin
                if(delay_done)
                    next_state = S_pre;
                else
                    next_state = S_write;
            end
            default: begin /*S_pre*/
                if(delay_done)
                    next_state = S_init;
                else
                    next_state = S_pre;
            end
        endcase
    end

    logic [`AXI_ADDR_BITS-1:0] reg_ADDR;
    logic [`AXI_IDS_BITS-1:0] reg_ID;
    logic [1:0] reg_BURST;
    logic [`AXI_LEN_BITS  -1:0] reg_LEN;
    logic [`AXI_SIZE_BITS -1:0] reg_SIZE;
    // logic [`AXI_DATA_BITS -1:0] reg_WDATA;




    always_ff @(posedge clk or negedge rst) begin
        if (~rst) begin
            reg_ADDR    <= `AXI_ADDR_BITS'b0;
            reg_ID      <= `AXI_IDS_BITS'b0;
            reg_BURST   <= 2'b0;
            reg_LEN     <= `AXI_LEN_BITS'b0;
            reg_SIZE    <= `AXI_SIZE_BITS'b0;
        end
        else begin
            if(AR_done) begin
                reg_ID      <= ARID;
                reg_ADDR    <= ARADDR;
                reg_LEN     <= ARLEN;
                reg_SIZE    <= ARSIZE;
                reg_BURST   <= ARBURST;
            end
            else if(AW_done) begin
                reg_ID      <= AWID;
                reg_ADDR    <= AWADDR;
                reg_LEN     <= AWLEN;
                reg_SIZE    <= AWSIZE;
                reg_BURST   <= AWBURST;
            end
        end
    end
    always_ff @(posedge clk or negedge rst) begin
        if(~rst) begin
            delay_cnt <= 3'b0;
        end else begin
            case (dram_state)
                S_init:
                    delay_cnt <= 3'b0;
                default : /* default */
                    delay_cnt <= (delay_done)? 3'b0:delay_cnt + 3'b1;
            endcase
        end
    end

    logic [`AXI_LEN_BITS-1:0] read_cnt;
    always_ff @(posedge clk or negedge rst) begin
        if (~rst) begin
            read_cnt <= `AXI_LEN_BITS'b0;
        end
        else begin
            case (dram_state)
                S_read:
                    read_cnt  <= R_done? read_cnt + `AXI_LEN_BITS'b1:read_cnt;
                default: /* default */
                    read_cnt  <= `AXI_LEN_BITS'b0;
            endcase
        end
    end

    logic [`DATA_BITS -1:0] reg_WDATA;

    always_ff @(posedge clk or negedge rst) begin
        if(~rst) begin
            reg_WDATA   <= `DATA_BITS'b0;
        end else begin
            reg_WDATA <= (dram_state == S_act)? WDATA:reg_WDATA;
        end
    end

    // DRAM simulator
    // only first cycle can activate DRAM, and every state need wait 5 cycle at least
    always_comb begin
        case (dram_state)
            S_init: begin
                DRAM_RASn = 1'b1;
                DRAM_CASn = 1'b1;
                DRAM_WEn  = 4'b1111;
            end
            S_act: begin
                DRAM_RASn = (delay_cnt == 3'b0)? 1'b0:1'b1;
                DRAM_CASn = 1'b1;
                DRAM_WEn  = 4'b1111;
            end
            S_read: begin
                DRAM_RASn = 1'b1;
                DRAM_CASn = (delay_cnt == 3'b0)? 1'b0:1'b1;
                DRAM_WEn  = 4'b1111;
            end
            S_write: begin
                DRAM_RASn = 1'b1;
                DRAM_CASn = (delay_cnt == 3'b0)? 1'b0:1'b1;
                DRAM_WEn  = (delay_cnt == 3'b0)? WSTRB:4'b1111;
            end
            default: begin /* S_pre */
                DRAM_RASn = (delay_cnt == 3'b0)? 1'b0:1'b1;
                DRAM_CASn = 1'b1;
                DRAM_WEn  = (delay_cnt == 3'b0)? 4'b0:4'b1111;
            end
        endcase
    end

    always_comb begin
        case (dram_state)
            S_init: begin
                DRAM_A      = reg_ADDR[22:12];
                DRAM_D      = `DATA_BITS'h0;
                DRAM_CSn    = 1'b1;
            end
            S_act: begin
                DRAM_A      = reg_ADDR[22:12];
                DRAM_D      = WDATA;
                DRAM_CSn    = 1'b0;
            end
            S_read: begin
                DRAM_A      = reg_ADDR[11:2] + read_cnt[1:0];
                DRAM_D      = WDATA;
                DRAM_CSn    = 1'b0;
            end
            S_write: begin
                DRAM_A      = reg_ADDR[11:2];
                DRAM_D      = reg_WDATA;
                DRAM_CSn    = 1'b0;
            end
            default: begin /* S_pre */
                DRAM_A      = reg_ADDR[22:12];
                DRAM_D      = `DATA_BITS'h0;
                DRAM_CSn    = 1'b0;
            end
        endcase
    end

    always_comb begin
        case (dram_state)
            S_init: begin
                ARREADY = ~AWVALID;
                AWREADY = 1'b1;
            end
            default: begin
                ARREADY = 1'b0;
                AWREADY = 1'b0;
            end
        endcase
    end

    always_comb begin
        case (dram_state)
            S_write:
                WREADY = 1'b1;
            default:
                WREADY = 1'b0;
        endcase
    end

    always_comb begin
        case (dram_state)
            S_read: begin
                RVALID = DRAM_valid;
                BVALID = 1'b0;
            end
            S_pre: begin
                RVALID = 1'b0;
                BVALID = (delay_cnt == 3'b0)? 1'b1: 1'b0;
            end
            default : begin /* default */
                RVALID = 1'b0;
                BVALID = 1'b0;
            end
        endcase
    end

    logic [`DATA_BITS -1:0] reg_RDATA;
    always_ff @(posedge clk or negedge rst) begin
        if(~rst) begin
            reg_RDATA <= `DATA_BITS'b0;
        end else begin
            reg_RDATA <= DRAM_valid? DRAM_Q:reg_RDATA;
        end
    end

    assign RID   = reg_ID;
    assign RDATA = DRAM_valid? DRAM_Q : reg_RDATA;
    assign RRESP = `AXI_RESP_OKAY;

    assign RLAST = (read_cnt == reg_LEN);
    assign BID   = reg_ID;
    assign BRESP = `AXI_RESP_OKAY;

endmodule