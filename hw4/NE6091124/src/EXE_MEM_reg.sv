module EXE_MEM_reg(clk, rst, EXE_PC_to_Reg, EXE_ALU_out, EXE_Forward_rs2_data, EXE_rd_addr, EXE_funct3, EXE_RDSrc, EXE_MemRead, EXE_MemWrite, EXE_MemtoReg, EXE_RegWrite, IM_STALL, DM_STALL, CSR_STALL, 
                             MEM_PC_to_Reg, MEM_ALU_out, MEM_Forward_rs2_data, MEM_rd_addr, MEM_funct3, MEM_RDSrc, MEM_MemRead, MEM_MemWrite, MEM_MemtoReg, MEM_RegWrite);

input       	        clk;
input       	        rst;
input       	[31:0]  EXE_PC_to_Reg;
input       	[31:0]  EXE_ALU_out;
input       	[31:0]  EXE_Forward_rs2_data;
input       	[ 4:0]  EXE_rd_addr;
input       	[ 2:0]  EXE_funct3;
input       	        EXE_RDSrc;
input       	        EXE_MemRead;
input       	[ 3:0]  EXE_MemWrite;
input       	        EXE_MemtoReg;
input       	[ 2:0]  EXE_RegWrite;
input                   IM_STALL;
input                   DM_STALL;
input                   CSR_STALL;
output  logic	[31:0]  MEM_PC_to_Reg;
output  logic	[31:0]  MEM_ALU_out;
output  logic	[31:0]  MEM_Forward_rs2_data;
output  logic	[ 4:0]  MEM_rd_addr;
output  logic   [ 2:0]  MEM_funct3;
output  logic			MEM_RDSrc;
output  logic			MEM_MemRead;
output  logic	[ 3:0]  MEM_MemWrite;
output  logic			MEM_MemtoReg;
output  logic	[ 2:0]  MEM_RegWrite;

always@(posedge clk or posedge rst)begin
    if(rst)begin
        MEM_PC_to_Reg <= 32'h0;
        MEM_ALU_out <= 32'h0;
        MEM_Forward_rs2_data <= 32'h0;
        MEM_rd_addr <= 5'h0;
        MEM_funct3 <= 3'h0;
        MEM_RDSrc <= 1'h0;
        MEM_MemRead <= 1'h0;
        MEM_MemWrite <= 4'hf;
        MEM_MemtoReg <= 1'h0;
        MEM_RegWrite <= 3'h0;
    end
    else begin
        if(IM_STALL & ~DM_STALL)begin
            MEM_MemRead <= 1'h0;
            MEM_MemWrite <= 4'hf;
        end
        else if(IM_STALL | DM_STALL | CSR_STALL)begin
            MEM_PC_to_Reg <= MEM_PC_to_Reg;
            MEM_ALU_out <= MEM_ALU_out;
            MEM_Forward_rs2_data <= MEM_Forward_rs2_data;
            MEM_rd_addr <= MEM_rd_addr;
            MEM_funct3 <= MEM_funct3;
            MEM_RDSrc <= MEM_RDSrc;
            MEM_MemRead <= MEM_MemRead;
            MEM_MemWrite <= MEM_MemWrite;
            MEM_MemtoReg <= MEM_MemtoReg;
            MEM_RegWrite <= MEM_RegWrite;
        end
        else begin
            MEM_PC_to_Reg <= EXE_PC_to_Reg;
            MEM_ALU_out <= EXE_ALU_out;
            MEM_Forward_rs2_data <= EXE_Forward_rs2_data;
            MEM_rd_addr <= EXE_rd_addr;
            MEM_funct3 <= EXE_funct3;
            MEM_RDSrc <= EXE_RDSrc;
            MEM_MemRead <= EXE_MemRead;
            MEM_MemWrite <= EXE_MemWrite;
            MEM_MemtoReg <= EXE_MemtoReg;
            MEM_RegWrite <= EXE_RegWrite;
        end
    end
end

endmodule
