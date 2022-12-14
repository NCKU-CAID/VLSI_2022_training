module Hazard_Control(BranchCtrl, MemRead, EXE_rd_addr, rs1_addr, rs2_addr, IF_ID_RegWrite, ID_EXE_RegWrite, PCWrite);
input       [1:0]   BranchCtrl;
input               MemRead;
input       [4:0]   EXE_rd_addr;
input       [4:0]   rs1_addr;
input       [4:0]   rs2_addr;
output  reg [1:0]   IF_ID_RegWrite;
output  reg         ID_EXE_RegWrite;
output  reg         PCWrite;

always@(*)begin//others
    IF_ID_RegWrite = 2'h1;
    ID_EXE_RegWrite = 1'h1;
    PCWrite = 1'h1;
    if(BranchCtrl != 2'h0)begin//branch
        IF_ID_RegWrite = 2'h0;
        ID_EXE_RegWrite = 1'h0;
        PCWrite = 1'h1;
    end
    else if(MemRead && ((EXE_rd_addr == rs1_addr) || (EXE_rd_addr == rs2_addr)))begin//load-use
        IF_ID_RegWrite = 2'h2;
        ID_EXE_RegWrite = 1'h0;
        PCWrite = 1'h0;
    end
end

endmodule