module Master_wrapper(clk, rst, ADDR_CPU, DATA_in_CPU, DATA_out_CPU, READ_CPU, WRITE_CPU, HADDR, HREAD, HWRITE, HWDATA, HRDATA, stall);

input                   clk;
input                   rst;
input           [31:0]  ADDR_CPU;
input           [31:0]  DATA_in_CPU;
output          [31:0]  DATA_out_CPU;
input                   READ_CPU;
input           [ 3:0]  WRITE_CPU;
output          [31:0]  HADDR;
output  logic           HREAD;
output          [ 3:0]  HWRITE;
output          [31:0]  HWDATA;
input           [31:0]  HRDATA;
output  logic           stall;

logic CurrentState;
logic NextState;
logic address_phase;
logic data_phase;

assign HADDR = ADDR_CPU;
assign HWDATA = DATA_in_CPU;
assign HWRITE = WRITE_CPU;
assign DATA_out_CPU = (data_phase) ? HRDATA : 32'h0;

always_ff @(posedge clk or posedge rst) begin
    if(rst)
        HREAD <= 1'h0;
    else begin
        if(address_phase)
            HREAD <= READ_CPU;
        else
            HREAD <= 1'h0;
    end
end

always_ff @(posedge clk or posedge rst) begin
    if(rst)
        CurrentState <= 1'h0;
    else
        CurrentState <= NextState;
end

always_comb begin
    case(CurrentState)
    1'h0:begin
        if(READ_CPU || WRITE_CPU != 4'hf)
            NextState = 1'h1;
        else
            NextState = 1'h0;
    end
    default:begin
        NextState = 1'h0;
    end
    endcase
end

always_comb begin
    case(CurrentState)
    1'h0:begin
        stall = (READ_CPU || (WRITE_CPU != 4'hf));
        address_phase = 1'h1;
        data_phase = 1'h0;
    end
    default:begin
        stall = 1'h0;
        address_phase = 1'h0;
        data_phase = 1'h1;
    end
    endcase
end

endmodule