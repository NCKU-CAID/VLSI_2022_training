module Forward_Unit(rs1_addr, rs2_addr, MEM_rd_addr, MEM_RegWrite, WB_rd_addr, WB_RegWrite, ForwardRS1Src, ForwardRS2Src);

input       	[4:0]   rs1_addr;
input       	[4:0]   rs2_addr;
input       	[4:0]   MEM_rd_addr;
input       	[2:0]   MEM_RegWrite;
input       	[4:0]   WB_rd_addr;
input       	[2:0]   WB_RegWrite;
output  logic	[1:0]   ForwardRS1Src;
output  logic	[1:0]   ForwardRS2Src;

always@(*)begin
    if((MEM_RegWrite != 3'h0) && (MEM_rd_addr != 5'h0) && (MEM_rd_addr == rs1_addr))
        ForwardRS1Src = 2'h1;
    else if((WB_RegWrite != 3'h0) && (WB_rd_addr != 5'h0) && (WB_rd_addr == rs1_addr))
        ForwardRS1Src = 2'h2;
    else
        ForwardRS1Src = 2'h0;
end

always@(*)begin
    if((MEM_RegWrite != 3'h0) && (MEM_rd_addr != 5'h0) && (MEM_rd_addr == rs2_addr))
        ForwardRS2Src = 2'h1;
    else if((WB_RegWrite != 3'h0) && (WB_rd_addr != 5'h0) && (WB_rd_addr == rs2_addr))
        ForwardRS2Src = 2'h2;
    else
        ForwardRS2Src = 2'h0;
end

endmodule
