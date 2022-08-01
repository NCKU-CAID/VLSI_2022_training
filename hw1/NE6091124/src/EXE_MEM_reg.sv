module EXE_MEM_reg(clk, rst, EXE_PC_to_Reg, EXE_ALU_out, EXE_Forward_rs2_data, EXE_rd_addr, EXE_RDSrc, EXE_MemRead, EXE_MemWrite, EXE_MemtoReg, EXE_RegWrite, IM_stall, DM_stall,
                   MEM_PC_to_Reg, MEM_ALU_out, MEM_Forward_rs2_data, MEM_rd_addr, MEM_RDSrc, MEM_MemRead, MEM_MemWrite, MEM_MemtoReg, MEM_RegWrite);

input               clk;
input               rst;
input       [31:0]  EXE_PC_to_Reg;
input       [31:0]  EXE_ALU_out;
input       [31:0]  EXE_Forward_rs2_data;
input       [ 4:0]  EXE_rd_addr;
input               EXE_RDSrc;
input               EXE_MemRead;
input       [ 3:0]  EXE_MemWrite;
input               EXE_MemtoReg;
input       [ 2:0]  EXE_RegWrite;
input               IM_stall;
input               DM_stall;
output  reg [31:0]  MEM_PC_to_Reg;
output  reg [31:0]  MEM_ALU_out;
output  reg [31:0]  MEM_Forward_rs2_data;
output  reg [ 4:0]  MEM_rd_addr;
output  reg         MEM_RDSrc;
output  reg         MEM_MemRead;
output  reg [ 3:0]  MEM_MemWrite;
output  reg         MEM_MemtoReg;
output  reg [ 2:0]  MEM_RegWrite;

logic               DM_stall_reg;

always @(posedge clk or posedge rst) begin
    if(rst)
        DM_stall_reg <= 1'h0;
    else
        DM_stall_reg <= DM_stall;
end

always@(posedge clk or posedge rst)begin
    if(rst)begin
        MEM_PC_to_Reg <= 32'h0;
        MEM_ALU_out <= 32'h0;
        MEM_Forward_rs2_data <= 32'h0;
        MEM_rd_addr <= 5'h0;
        MEM_RDSrc <= 1'h0;
        MEM_MemRead <= 1'h0;
        MEM_MemWrite <= 4'hf;
        MEM_MemtoReg <= 1'h0;
        MEM_RegWrite <= 3'h0;
    end
    else begin
        // if(~DM_stall && DM_stall_reg)begin
        //     MEM_MemRead <= 1'h0;
        //     MEM_MemWrite <= 4'hf;
        //     MEM_RegWrite <= 1'h0;
        // end
        if(IM_stall || DM_stall)begin
            MEM_PC_to_Reg <= MEM_PC_to_Reg;
            MEM_ALU_out <= MEM_ALU_out;
            MEM_Forward_rs2_data <= MEM_Forward_rs2_data;
            MEM_rd_addr <= MEM_rd_addr;
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
            MEM_RDSrc <= EXE_RDSrc;
            MEM_MemRead <= EXE_MemRead;
            MEM_MemWrite <= EXE_MemWrite;
            MEM_MemtoReg <= EXE_MemtoReg;
            MEM_RegWrite <= EXE_RegWrite;
        end
    end
end

endmodule
