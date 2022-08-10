module ID_EXE_reg(clk, rst, ID_PC, ID_rs1_data, ID_rs2_data, ID_Imm, ID_funct3, ID_funct7, ID_rd_addr, ID_rs1_addr, ID_rs2_addr, 
ID_ALUOP, ID_ALUSrc, ID_PCtoRegSrc, ID_RDSrc, ID_MemRead, ID_MemWrite, ID_MemtoReg, ID_RegWrite, ID_EXE_RegWrite, ID_CSRSrc, IM_STALL, DM_STALL, CSR_STALL, 
EXE_PC, EXE_Imm, EXE_rs1_data, EXE_rs2_data, EXE_funct3, EXE_funct7, EXE_rd_addr, EXE_rs1_addr, EXE_rs2_addr, 
EXE_ALUOP, EXE_ALUSrc, EXE_PCtoRegSrc, EXE_RDSrc, EXE_MemRead, EXE_MemWrite, EXE_MemtoReg, EXE_RegWrite, EXE_CSRSrc);

input       	        clk;
input       	        rst;
input       	[31:0]  ID_PC;
input       	[31:0]  ID_rs1_data;
input       	[31:0]  ID_rs2_data;
input       	[31:0]  ID_Imm;
input       	[ 2:0]  ID_funct3;
input       	[ 6:0]  ID_funct7;
input       	[ 4:0]  ID_rd_addr;
input       	[ 4:0]  ID_rs1_addr;
input       	[ 4:0]  ID_rs2_addr;
input       	[ 2:0]  ID_ALUOP;
input       	        ID_ALUSrc;
input       	        ID_PCtoRegSrc;
input       	        ID_RDSrc;
input       	        ID_MemRead;
input       	[ 3:0]  ID_MemWrite;
input       	        ID_MemtoReg;
input       	[ 2:0]  ID_RegWrite;
input       	        ID_EXE_RegWrite;
input                   ID_CSRSrc;
input                   IM_STALL;
input                   DM_STALL;
input                   CSR_STALL;
output  logic	[31:0]  EXE_PC;
output  logic	[31:0]  EXE_rs1_data;
output  logic 	[31:0]  EXE_rs2_data;
output  logic 	[31:0]  EXE_Imm;
output  logic 	[ 2:0]  EXE_funct3;
output  logic 	[ 6:0]  EXE_funct7;
output  logic 	[ 4:0]  EXE_rd_addr;
output  logic 	[ 4:0]  EXE_rs1_addr;
output  logic 	[ 4:0]  EXE_rs2_addr;
output  logic 	[ 2:0]  EXE_ALUOP;
output  logic 	        EXE_ALUSrc;
output  logic 	        EXE_PCtoRegSrc;
output  logic 	        EXE_RDSrc;
output  logic 	        EXE_MemRead;
output  logic 	[ 3:0]  EXE_MemWrite;
output  logic 	        EXE_MemtoReg;
output  logic 	[ 2:0]  EXE_RegWrite;
output  logic           EXE_CSRSrc;

always@(posedge clk or posedge rst)begin
    if(rst)begin
        EXE_PC <= 32'h0;
        EXE_Imm <= 32'h0;
		EXE_rs1_data <= 32'h0;
		EXE_rs2_data <= 32'h0;
        EXE_funct3 <= 3'h0;
        EXE_funct7 <= 7'h0;
        EXE_rd_addr <= 5'h0;
        EXE_rs1_addr <= 5'h0;
        EXE_rs2_addr <= 5'h0;
        EXE_ALUOP <= 3'h0;
        EXE_ALUSrc <= 1'h0;
        EXE_PCtoRegSrc <= 1'h0;
        EXE_RDSrc <= 1'h0;
        EXE_MemRead <= 1'h0;
        EXE_MemWrite <= 4'hf;
        EXE_MemtoReg <= 1'h0;
        EXE_RegWrite <= 3'h0;
        EXE_CSRSrc <= 1'h0;
    end
    else begin
        if(IM_STALL | DM_STALL | CSR_STALL)begin
            EXE_PC <= EXE_PC;
            EXE_Imm <= EXE_Imm;
			EXE_rs1_data <= EXE_rs1_data;
			EXE_rs2_data <= EXE_rs2_data;
            EXE_funct3 <= EXE_funct3;
            EXE_funct7 <= EXE_funct7;
            EXE_rd_addr <= EXE_rd_addr;
            EXE_rs1_addr <= EXE_rs1_addr;
            EXE_rs2_addr <= EXE_rs2_addr;
            EXE_ALUOP <= EXE_ALUOP;
            EXE_ALUSrc <= EXE_ALUSrc;
            EXE_PCtoRegSrc <= EXE_PCtoRegSrc;
            EXE_RDSrc <= EXE_RDSrc;
            EXE_MemRead <= EXE_MemRead;
            EXE_MemWrite <= EXE_MemWrite;
            EXE_MemtoReg <= EXE_MemtoReg;
            EXE_RegWrite <= EXE_RegWrite;
            EXE_CSRSrc <= EXE_CSRSrc;
        end
        else if(ID_EXE_RegWrite == 1'b0)begin
            EXE_PC <= 32'h0;
            EXE_Imm <= 32'h0;
			EXE_rs1_data <= 32'h0;
			EXE_rs2_data <= 32'h0;
            EXE_funct3 <= 3'h0;
            EXE_funct7 <= 7'h0;
            EXE_rd_addr <= 5'h0;
            EXE_rs1_addr <= 5'h0;
            EXE_rs2_addr <= 5'h0;
            EXE_ALUOP <= 3'h0;
            EXE_ALUSrc <= 1'h0;
            EXE_PCtoRegSrc <= 1'h0;
            EXE_RDSrc <= 1'h0;
            EXE_MemRead <= 1'h0;
            EXE_MemWrite <= 4'hf;
            EXE_MemtoReg <= 1'h0;
            EXE_RegWrite <= 3'h0;
            EXE_CSRSrc <= 1'h0;
        end
        else if(ID_EXE_RegWrite)begin
            EXE_PC <= ID_PC;
            EXE_Imm <= ID_Imm;
			EXE_rs1_data <= ID_rs1_data;
			EXE_rs2_data <= ID_rs2_data;
            EXE_funct3 <= ID_funct3;
            EXE_funct7 <= ID_funct7;
            EXE_rd_addr <= ID_rd_addr;
            EXE_rs1_addr <= ID_rs1_addr;
            EXE_rs2_addr <= ID_rs2_addr;
            EXE_ALUOP <= ID_ALUOP;
            EXE_ALUSrc <= ID_ALUSrc;
            EXE_PCtoRegSrc <= ID_PCtoRegSrc;
            EXE_RDSrc <= ID_RDSrc;
            EXE_MemRead <= ID_MemRead;
            EXE_MemWrite <= ID_MemWrite;
            EXE_MemtoReg <= ID_MemtoReg;
            EXE_RegWrite <= ID_RegWrite;
            EXE_CSRSrc <= ID_CSRSrc;
        end
    end
end
endmodule
