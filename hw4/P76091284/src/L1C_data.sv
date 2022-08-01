//================================================
// Auther:      CHIEH-SHIH WANG
// Filename:    L1C_inst.sv
// Description: L1 Cache for instruction
// Version:     1.0
//================================================
`include "../include/def.svh"
// `include "./tag_array_wrapper.sv"
// `include "./data_array_wrapper.sv"

module L1C_data(
    input clk,
    input rst,
    // Core to CPU wrapper
    input [`DATA_BITS-1:0] core_addr,
    input core_req,
    input core_write,
    input [`DATA_BITS-1:0] core_in,
    input [`CACHE_TYPE_BITS-1:0] core_type,
    // Mem to CPU wrapper
    input [`DATA_BITS-1:0] D_out,
    input D_wait,
    // CPU wrapper to core
    output logic [`DATA_BITS-1:0] core_out,
    output logic core_wait,
    // CPU wrapper to Mem
    output logic D_req,
    output logic [`DATA_BITS-1:0] D_addr,
    output logic D_write,
    output logic [`DATA_BITS-1:0] D_in,
    output logic [`CACHE_TYPE_BITS-1:0] D_type,

    output logic cacheable
);
    logic [`CACHE_INDEX_BITS-1:0] index;
    logic [`CACHE_DATA_BITS-1:0] DA_out;
    logic [`CACHE_DATA_BITS-1:0] DA_in;
    logic [`CACHE_WRITE_BITS-1:0] DA_write;
    logic DA_read;
    logic [`CACHE_TAG_BITS-1:0] TA_out;
    logic [`CACHE_TAG_BITS-1:0] TA_in;
    logic TA_write;
    logic TA_read;
    logic [`CACHE_LINES-1:0] valid;

//--------------- complete this part by yourself -----------------//
    logic [2:0] cache_state, next_state;
    logic hit;
    assign hit = (TA_out == core_addr[31:10]);/* TA_in*/

    logic [`DATA_BITS-1:0] reg_core_addr;
    logic reg_core_req;
    logic reg_core_write;
    logic [`DATA_BITS-1:0] reg_core_in;
    logic [`CACHE_TYPE_BITS-1:0] reg_core_type;

    assign cacheable = (core_addr[31:16] != 16'h1000);

    // for pipeline
    always_ff @(posedge clk or posedge rst) begin
        if(rst) begin
            reg_core_addr   <= `DATA_BITS'b0;
            reg_core_write  <= 1'b0;
            reg_core_in     <= `DATA_BITS'b0;
            reg_core_type   <= `CACHE_TYPE_BITS'b0;
        end else begin
            reg_core_addr   <= core_addr;
            reg_core_write  <= core_write;
            reg_core_in     <= core_in;
            reg_core_type   <= core_type;
        end
    end

    parameter STATE_IDLE        = 3'b000,
              STATE_CHECK       = 3'b001,
              STATE_WRITE_HIT   = 3'b010,
              STATE_WRITE_MISS  = 3'b011,
              STATE_READ_HIT    = 3'b100,
              STATE_READ_MISS   = 3'b101,
              STATE_UNCACHE     = 3'b110,
              STATE_FINISH      = 3'b111;

    logic done;

    always_ff @(posedge clk or posedge rst) begin
        if(rst)
            cache_state <= STATE_IDLE;
        else
            cache_state <= next_state;
    end
    always_comb begin
        case (cache_state)
            STATE_IDLE: begin
                if(~core_req)
                    next_state = STATE_IDLE;
                else begin
                    if(valid[core_addr[9:4]]/*valid[index]*/)
                        next_state = STATE_CHECK;
                    else begin
                        if(core_write)
                            next_state = STATE_WRITE_MISS;
                        else
                            next_state = STATE_READ_MISS;
                    end
                end
            end
            STATE_CHECK: begin
                // if(core_write) begin
                if(reg_core_write) begin
                    if(hit)
                        next_state = STATE_WRITE_HIT;
                    else
                        next_state = STATE_WRITE_MISS;
                end
                else if(~cacheable)
                    next_state = STATE_UNCACHE;
                else begin
                    if(hit)
                        // next_state = STATE_READ_HIT;
                        next_state = STATE_FINISH;
                    else
                        next_state = STATE_READ_MISS;
                end
            end
            STATE_WRITE_HIT: begin
                if(done)
                    next_state = STATE_FINISH;
                else
                    next_state = STATE_WRITE_HIT;
            end
            STATE_WRITE_MISS: begin
                if(done)
                    next_state = STATE_FINISH;
                else
                    next_state = STATE_WRITE_MISS;
            end
            STATE_READ_HIT:
                next_state = STATE_FINISH;
            STATE_READ_MISS: begin
                if(done)
                    next_state = STATE_FINISH;
                else
                    next_state = STATE_READ_MISS;
            end
            STATE_UNCACHE: next_state = D_wait? STATE_UNCACHE:STATE_FINISH;
            STATE_FINISH:  next_state = STATE_IDLE;
            default : next_state = STATE_IDLE;
        endcase
    end

    logic [2:0] cnt;
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            cnt <= 3'b0;
        else begin
            case (cache_state)
                STATE_IDLE, STATE_CHECK, STATE_READ_HIT, STATE_FINISH:
                    cnt <= 3'b0;
                default: begin
                    if(done)
                        cnt <= 3'b0;
                    else if (~D_wait)
                        cnt <= cnt + 3'b1;
                end
            endcase
        end
    end

    always_comb begin
        case (cache_state)
            STATE_WRITE_MISS, STATE_WRITE_HIT:
                done = (cnt == 3'b1);
            STATE_READ_MISS:
                done = (cnt == 3'b100);
            default:
                done = 1'b0;
        endcase
    end

    assign index = core_addr[9:4];
    integer i;
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            for(i = 0; i < `CACHE_LINES; i = i + 1)
                valid[i] <= 1'b0;
        else if (cache_state == STATE_READ_MISS)
            valid[index] <= 1'b1;
    end

    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            core_out <= `DATA_BITS'h0;
        else begin
            case (cache_state)
                STATE_WRITE_HIT, STATE_WRITE_MISS:
                    core_out <= `DATA_BITS'b0;
                STATE_READ_HIT:
                    // core_out <= DA_out[{core_addr[3:2], 5'b0}+:32];
                    core_out <= DA_out[{reg_core_addr[3:2], 5'b0}+:32];
                STATE_CHECK:
                    core_out <= DA_out[{reg_core_addr[3:2], 5'b0}+:32];
                STATE_READ_MISS: begin
                    if(done) begin
                        if(cnt == 3'b100)
                            // core_out <= DA_in[{core_addr[3:2], 5'b0}+:32];
                            core_out <= DA_in[{reg_core_addr[3:2], 5'b0}+:32];
                        else
                            // core_out <= DA_out[{core_addr[3:2], 5'b0}+:32];
                            core_out <= DA_out[{reg_core_addr[3:2], 5'b0}+:32];
                    end
                end
                STATE_UNCACHE:
                    core_out <= D_out;
            endcase
        end
    end

    always_comb begin
        case (cache_state)
            STATE_IDLE:
                core_wait = core_req;
            STATE_FINISH:
                core_wait = 1'b0;
            default : /* default */
                core_wait = 1'b1;
        endcase
    end

    always_comb begin
        case (cache_state)
            STATE_CHECK: begin
                D_req   = (~cacheable & ~reg_core_write)? 1'b1:1'b0;
                D_write = 1'b0;
                D_addr  = reg_core_addr;
                D_in    = reg_core_in;
                D_type  = reg_core_type;
            end
            STATE_WRITE_MISS   : begin
                D_req   = (cnt == 3'b0)? 1'b1:1'b0;
                D_write = 1'b1;
                // D_addr  = core_addr;
                // D_in    = core_in;
                // D_type  = core_type;
                D_addr  = reg_core_addr;
                D_in    = reg_core_in;
                D_type  = reg_core_type;
            end
            STATE_WRITE_HIT    : begin
                D_req   = (cnt == 3'b0)? 1'b1:1'b0;
                D_write = 1'b1;
                // D_addr  = core_addr;
                // D_in    = core_in;
                // D_type  = core_type;
                D_addr  = reg_core_addr;
                D_in    = reg_core_in;
                D_type  = reg_core_type;
            end
            STATE_READ_MISS   : begin
                D_req   = ~done;
                D_write = 1'b0;
                // D_addr  = {core_addr[31:4], 4'h0};
                D_addr  = {reg_core_addr[31:4], 4'h0};
                D_in    = `DATA_BITS'h0;
                D_type  = `CACHE_WORD;
            end
            default : begin
                D_req   = 1'b0;
                D_write = 1'b0;
                D_addr  = `DATA_BITS'h0;
                D_in    = `DATA_BITS'h0;
                // D_type  = core_type;
                D_type  = reg_core_type;
            end
        endcase
    end

    logic [3:0] DA_write_control;
    logic [`CACHE_WRITE_BITS-1:0] DA_write_control_full;
    always_comb begin
        DA_write_control = 4'b1111;
        DA_write_control_full = `CACHE_WRITE_BITS'hffff;
        // if(core_write) begin
        if(reg_core_write) begin
            // case(core_type)
            case(reg_core_type)
                `CACHE_WORD: begin
                    DA_write_control = 4'b0;
                    // DA_write_control_full[{core_addr[3:2], 2'b0}+:4] = DA_write_control;
                    DA_write_control_full[{reg_core_addr[3:2], 2'b0}+:4] = DA_write_control;
                end
                `CACHE_BYTE, `CACHE_BYTE_U: begin
                    DA_write_control[core_addr[1:0]] = 1'b0;
                    // DA_write_control_full[{core_addr[3:2], 2'b0}+:4] = DA_write_control;
                    DA_write_control_full[{reg_core_addr[3:2], 2'b0}+:4] = DA_write_control;
                end
                `CACHE_HWORD, `CACHE_HWORD_U: begin
                    DA_write_control[{core_addr[1], 1'b0}+:2] = 2'b00;
                    // DA_write_control_full[{core_addr[3:2], 2'b0}+:4] = DA_write_control;
                    DA_write_control_full[{reg_core_addr[3:2], 2'b0}+:4] = DA_write_control;
                end
                default:
                    DA_write_control = 4'b1111;
            endcase
        end
        else
            DA_write_control = D_wait? 4'b1111:4'b0;
    end

    logic [`CACHE_DATA_BITS-1:0] core_in_full;
    always_comb begin
        core_in_full = `CACHE_DATA_BITS'b0;
        // if(core_write)
        if(reg_core_write)
            // core_in_full[{core_addr[3:2], 5'b0}+:32] = core_in;
            core_in_full[{reg_core_addr[3:2], 5'b0}+:32] = reg_core_in;
    end

    logic [`CACHE_TAG_BITS-1:0] reg_TA_in;
    always_ff @(posedge clk or posedge rst) begin
        if(rst) begin
            reg_TA_in <= `CACHE_TAG_BITS'b0;
        end else begin
            reg_TA_in <= core_addr[31:10];
        end
    end

    always_comb begin
        // TA_in = core_addr[31:10];
        case (cache_state)
            STATE_IDLE: begin
                TA_write = 1'b1;
                TA_read = 1'b1;
            end
            STATE_CHECK:begin
                TA_write = 1'b1;
                TA_read = 1'b1;
            end
            STATE_WRITE_HIT: begin
                TA_write = 1'b1;
                TA_read = 1'b0;
            end
            STATE_WRITE_MISS: begin
                TA_write = 1'b1;
                TA_read = 1'b0;
            end
            STATE_READ_HIT: begin
                TA_write = 1'b1;
                TA_read = 1'b0;
            end
            STATE_READ_MISS: begin
                TA_write = (cnt == 3'b0)? 1'b0:1'b1;
                TA_read = 1'b0;
            end
            STATE_UNCACHE: begin
                TA_write = 1'b1;
                TA_read = 1'b0;
            end
            default: begin /* STATE_FINISH */
                TA_write = 1'b1;
                TA_read = 1'b0;
            end
        endcase
    end

    always_comb begin
        case (cache_state)
            // STATE_CHECK:    DA_read = hit & ~core_write;
            STATE_CHECK:    DA_read = hit & ~reg_core_write;
            STATE_READ_HIT: DA_read = 1'b1;
            default:        DA_read = 1'b0;
        endcase
    end

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            DA_write <= `CACHE_WRITE_BITS'hffff;
            DA_in    <= `CACHE_DATA_BITS'b0;
        end
        else begin
            case (cache_state)
                STATE_WRITE_HIT    : begin
                    DA_write <= done? DA_write_control_full:`CACHE_WRITE_BITS'hffff;
                    DA_in    <= (cnt == 3'b0)? core_in_full:DA_in;
                end
                STATE_READ_MISS   : begin
                    DA_in[{cnt[1:0], 5'b0}+:32] <= D_out;
                    if(cnt == 3'b011)
                        DA_write <= `CACHE_WRITE_BITS'b0;
                    else
                        DA_write <= `CACHE_WRITE_BITS'hffff;
                end
                default : begin
                    DA_write <= `CACHE_WRITE_BITS'hffff;
                    DA_in    <= `CACHE_DATA_BITS'b0;
                end
            endcase
        end
    end

    data_array_wrapper DA(
        .A(index),
        .DO(DA_out),
        .DI(DA_in),
        .CK(clk),
        .WEB(DA_write),
        .OE(DA_read),
        .CS(1'b1)
    );

    tag_array_wrapper  TA(
        .A(index),
        .DO(TA_out),
        .DI(reg_TA_in),
        .CK(clk),
        .WEB(TA_write),
        .OE(TA_read),
        .CS(1'b1)
    );

    logic [31:0] hit_count;
    logic [31:0] miss_count;

    always_ff @(posedge clk or posedge rst) begin
        if(rst) begin
            hit_count <= 32'b0;
            miss_count <= 32'b0;
        end else begin
            case (cache_state)
                STATE_WRITE_HIT: begin
                    if(cnt == 3'b1)
                        hit_count <= hit_count + 3'b1;
                end
                STATE_READ_HIT: begin
                    if(cnt == 3'b0)
                        hit_count <= hit_count + 3'b1;
                end
                STATE_WRITE_MISS: begin
                    if(cnt == 3'b1)
                        miss_count <= miss_count + 3'b1;
                end
                STATE_READ_MISS: begin
                    if(cnt == 3'b100)
                        miss_count <= miss_count + 3'b1;
                end
            endcase
        end
    end

endmodule
