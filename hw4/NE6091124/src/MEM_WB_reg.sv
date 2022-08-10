module MEM_WB_reg(clk, rst, MEM_rd_data, MEM_data_out, MEM_rd_addr, MEM_MemtoReg, MEM_RegWrite, IM_STALL, DM_STALL, CSR_STALL, WB_rd_data, WB_data_out, WB_rd_addr, WB_MemtoReg, WB_RegWrite);

input   	            clk;
input   	            rst;
input   	    [31:0]  MEM_rd_data;
input   	    [31:0]  MEM_data_out;
input   	    [ 4:0]  MEM_rd_addr;
input   	            MEM_MemtoReg;
input   	    [ 2:0]  MEM_RegWrite;
input                   IM_STALL;
input                   DM_STALL;
input                   CSR_STALL;
output  logic	[31:0]  WB_rd_data;
output  logic	[31:0]  WB_data_out;
output  logic	[ 4:0]  WB_rd_addr;
output  logic	        WB_MemtoReg;
output  logic	[ 2:0]  WB_RegWrite;

always@(posedge clk or posedge rst)begin
    if(rst)begin
        WB_rd_data <= 32'h0;
        WB_data_out <= 32'h0;
        WB_rd_addr <= 5'h0;
        WB_MemtoReg <= 1'h0;
        WB_RegWrite <= 3'h0;
    end
    else begin
        if(IM_STALL | DM_STALL | CSR_STALL)begin
            WB_rd_data <= WB_rd_data;
            WB_data_out <= WB_data_out;
            WB_rd_addr <= WB_rd_addr;
            WB_MemtoReg <= WB_MemtoReg;
            WB_RegWrite <= WB_RegWrite;
        end
        else begin
            WB_rd_data <= MEM_rd_data;
            WB_data_out <= MEM_data_out;
            WB_rd_addr <= MEM_rd_addr;
            WB_MemtoReg <= MEM_MemtoReg;
            WB_RegWrite <= MEM_RegWrite;
        end
    end
end

endmodule
