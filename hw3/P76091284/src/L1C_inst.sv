//================================================
// Auther:      Chen Yun-Ru (May)
// Filename:    L1C_inst.sv
// Description: L1 Cache for instruction
// Version:     0.1
//================================================
`include "def.svh"
`include "data_array_wrapper.sv"
`include "tag_array_wrapper.sv"
module L1C_inst(
  input clk,
  input rst,
  // Core to CPU wrapper
  input [`DATA_BITS-1:0] core_addr,
  input core_req,
  input core_write,
  input [`DATA_BITS-1:0] core_in,
  input [`CACHE_TYPE_BITS-1:0] core_type,
  // Mem to CPU wrapper
  input [`DATA_BITS-1:0] I_out,
  input I_wait,
  // CPU wrapper to core
  output logic [`DATA_BITS-1:0] core_out,
  output logic core_wait,
  // CPU wrapper to Mem
  output logic I_req,
  output logic [`DATA_BITS-1:0] I_addr,
  output logic I_write,
  output logic [`DATA_BITS-1:0] I_in,
  output logic [`CACHE_TYPE_BITS-1:0] I_type
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
    integer i;
    logic [2:0] cache_state, next_state;

    logic hit;
    logic [3:0] DA_write_control;
    logic [2:0] cnt;
    logic rst_cnt;

    parameter   STATE_IDLE  = 3'b00,
                STATE_CHECK = 3'b01,
                STATE_READ  = 3'b10,
                STATE_WRITE = 3'b11;

    always_ff @(posedge clk or posedge rst) begin
        if(rst) begin
            cache_state <= STATE_IDLE;
        end else begin
            cache_state <= next_state;
        end
    end

    always_comb begin
        case(cache_state)
            STATE_IDLE: begin
                if(core_req) begin
                    if(core_write)
                        next_state = STATE_WRITE;
                    else begin
                        if(valid[index]) // if is not empty, need to check tag
                            next_state = STATE_CHECK;
                        else
                            next_state = STATE_READ;
                    end
                end
                else
                    next_state = STATE_IDLE;
            end
            STATE_CHECK: begin
                if(hit)
                    next_state = STATE_IDLE;
                else
                    next_state = STATE_READ;
            end
            STATE_READ: begin
                // if(&cnt & ~I_wait)
                if((cnt == 3'b100) & ~I_wait)
                    next_state = STATE_IDLE;
                else
                    next_state = STATE_READ;
            end
            default: begin /*STATE_WRITE*/
                if(I_wait)
                    next_state = STATE_WRITE;
                else
                    next_state = STATE_IDLE;
            end
        endcase // cache_state
    end

    // |TAG|Index|Block|Byte|
    // |.22|  6  |  2  |  2 |
    assign index = core_addr[9:4];
    // assign TA_in = core_addr[31:10];
    assign hit = (TA_in == TA_out)? 1'b1:1'b0;

    always_comb begin
        case (cache_state)
            STATE_IDLE: begin
                // core_out    = `DATA_BITS'b0;
                core_out    = DA_out[{core_addr[3:2], 5'b0}+:32];
                core_wait   = (core_req)? 1'b1:1'b0; // core_write | ~hit | I_wait:1'b0;

                I_req       = 1'b0;
                I_addr      = `DATA_BITS'b0;
                I_write     = 1'b0;
                I_in        = `DATA_BITS'b0;
                I_type      = `CACHE_TYPE_BITS'b0;
            end
            STATE_CHECK: begin
                core_out    = (hit)? DA_out[{core_addr[3:2], 5'b0}+:32]:`DATA_BITS'b0;
                core_wait   = (hit)? 1'b0:1'b1;

                I_req       = 1'b0;
                I_addr      = `DATA_BITS'b0;
                I_write     = 1'b0;
                I_in        = `DATA_BITS'b0;
                I_type      = core_type;
            end
            STATE_READ: begin
                if(cnt == 3'b100) begin
                    core_out    = DA_out[{core_addr[3:2], 5'b0}+:32];
                    core_wait   = 1'b0; // need to check

                    I_req       = 1'b0;
                    I_addr      = core_addr; // `DATA_BITS'b0;
                    I_write     = 1'b0;
                    I_in        = core_in; // `DATA_BITS'b0;
                    I_type      = core_type;
                end
                else begin
                    core_out    = DA_out[{core_addr[3:2], 5'b0}+:32];
                    core_wait   = 1'b1; // need to check

                    I_req       = 1'b1;
                    I_addr      = {core_addr[`DATA_BITS-1:4], 4'b0};
                    I_write     = 1'b0;
                    I_in        = core_in; // `DATA_BITS'b0;
                    I_type      = core_type;
                end
            end
            default : begin/* STATE_WRITE */
                core_out    = `DATA_BITS'b0;
                core_wait   = I_wait;

                I_req       = 1'b1;
                I_addr      = core_addr;
                I_write     = 1'b1;
                I_in        = core_in;
                I_type      = core_type;
            end
        endcase
    end

    always_comb begin
        TA_in = core_addr[31:10];
        TA_read = 1'b1;

        DA_in = `CACHE_DATA_BITS'b0;
        DA_write = `CACHE_WRITE_BITS'hffff;
        case (cache_state)
            STATE_IDLE: begin
                DA_read     = 1'b0; // active high

                TA_write    = 1'b1; // active low

            end
            STATE_CHECK: begin
                DA_read     = 1'b1;

                TA_write    = 1'b1; // activa low
            end
            STATE_READ: begin
                if(cnt == 3'b100) begin
                    DA_in[{cnt[1:0], 5'b0}+:32]   = I_out;
                    DA_write[{cnt[1:0], 2'b0}+:4] = 4'b1111;
                    DA_read     = 1'b1; // active high

                    TA_write    = 1'b1;
                end
                else begin
                    DA_in[{cnt[1:0], 5'b0}+:32]   = I_out;
                    DA_write[{cnt[1:0], 2'b0}+:4] = (~I_wait)? DA_write_control:4'b1111;
                    DA_read     = 1'b0; // active high

                    TA_write    = ~(&cnt[1:0] & ~I_wait);
                end
            end
            default : begin/* STATE_WRITE */
                DA_in[{core_addr[3:2], 5'b0}+:32] = core_in;
                DA_write[{core_addr[3:2], 2'b0}+:4] = (hit & valid[index])? DA_write_control: 4'b1111;
                DA_read     = 1'b0; // active high

                TA_write    = 1'b1; // active low
            end
        endcase
    end

    always_comb begin
        DA_write_control = 4'b1111;
        if(core_write)
            case(core_type)
                `CACHE_WORD:
                    DA_write_control = 4'b0;
                `CACHE_BYTE, `CACHE_BYTE_U:
                    DA_write_control[core_addr[1:0]] = 1'b0;
                `CACHE_HWORD, `CACHE_HWORD_U:
                    DA_write_control[{core_addr[1], 1'b0}+:2] = 2'b00;
                default:
                    DA_write_control = 4'b1111;
            endcase
        else
            DA_write_control = I_wait? 4'b1111:4'b0;
    end

    always_ff @(posedge clk or posedge rst) begin
        if(rst) begin
            for(i = 0; i < `CACHE_LINES; i = i + 1)
                valid[i] <= 1'b0;
        end else begin
            valid[index] <= (~TA_write)? 1'b1:valid[index]; // need to fix
        end
    end

    always_comb begin
        case (cache_state)
            STATE_READ:     rst_cnt = 1'b0;
            default :       rst_cnt = 1'b1;
        endcase
    end

    always_ff @(posedge clk or posedge rst) begin
        if(rst)
            cnt <= 3'b0;
        else begin
            if(rst_cnt)
                cnt <= 3'b0;
            else if(cnt == 3'b100)
                cnt <= 3'b0;
            else
                cnt <= (I_wait)? cnt: cnt + 3'b1;
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
    .DI(TA_in),
    .CK(clk),
    .WEB(TA_write),
    .OE(TA_read),
    .CS(1'b1)
  );

endmodule

