module ID_EXE_reg(clk, rst, ID_PC, ID_rs1_data, ID_rs2_data, ID_Imm, ID_funct3, ID_funct7, ID_rd_addr, ID_rs1_addr, ID_rs2_addr,
ID_ALUOP, ID_ALUSrc, ID_PCtoRegSrc, ID_RDSrc, ID_MemRead, ID_MemWrite, ID_MemtoReg, ID_RegWrite, IM_stall, DM_stall, ID_EXE_RegWrite, 
EXE_PC, EXE_Imm, EXE_rs1_data, EXE_rs2_data, EXE_funct3, EXE_funct7, EXE_rd_addr, EXE_rs1_addr, EXE_rs2_addr, 
EXE_ALUOP, EXE_ALUSrc, EXE_PCtoRegSrc, EXE_RDSrc, EXE_MemRead, EXE_MemWrite, EXE_MemtoReg, EXE_RegWrite);

input               clk;
input               rst;
input       [31:0]  ID_PC;
input       [31:0]  ID_rs1_data;
input       [31:0]  ID_rs2_data;
input       [31:0]  ID_Imm;
input       [ 2:0]  ID_funct3;
input       [ 6:0]  ID_funct7;
input       [ 4:0]  ID_rd_addr;
input       [ 4:0]  ID_rs1_addr;
input       [ 4:0]  ID_rs2_addr;
input       [ 2:0]  ID_ALUOP;
input               ID_ALUSrc;
input               ID_PCtoRegSrc;
input               ID_RDSrc;
input               ID_MemRead;
input       [ 3:0]  ID_MemWrite;
input               ID_MemtoReg;
input       [ 2:0]  ID_RegWrite;
input               IM_stall;
input               DM_stall;
input               ID_EXE_RegWrite;
output  reg [31:0]  EXE_PC;
output  reg [31:0]  EXE_rs1_data;
output  reg [31:0]  EXE_rs2_data;
output  reg [31:0]  EXE_Imm;
output  reg [ 2:0]  EXE_funct3;
output  reg [ 6:0]  EXE_funct7;
output  reg [ 4:0]  EXE_rd_addr;
output  reg [ 4:0]  EXE_rs1_addr;
output  reg [ 4:0]  EXE_rs2_addr;
output  reg [ 2:0]  EXE_ALUOP;
output  reg         EXE_ALUSrc;
output  reg         EXE_PCtoRegSrc;
output  reg         EXE_RDSrc;
output  reg         EXE_MemRead;
output  reg [ 3:0]  EXE_MemWrite;
output  reg         EXE_MemtoReg;
output  reg [ 2:0]  EXE_RegWrite;

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
    end
    else begin
        if(IM_stall || DM_stall)begin
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
        end
        else begin
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
        end
    end
end
endmodule
