`include "ALUCtrl.sv"
`include "ALU.sv"
`include "CSR.sv"
module EXE (
    input clk,    // Clock
    input rst,

    // ID/EX_Reg
    input [31:0] ID_pc_out,
    input [31:0] ID_rs1, 
    input [31:0] ID_rs2,
    input [31:0] ID_imm,
    input [2:0] ID_funct3,
    input [6:0] ID_funct7,
    input [4:0] ID_rd_addr,
    input [4:0] ID_rs1_addr,
    input [4:0] ID_rs2_addr,
    input [2:0] ID_ALUOP,
    input ID_PCtoRegSrc,
    input ID_ALUSrc,
    input ID_RDSrc,
    input ID_MemRead,
    input ID_MemWrite,
    input ID_MemtoReg,
    input ID_RegWrite,

    // CSR
    input ID_CSR_write,
    input [11:0] ID_CSR_addr,

    output logic [31:0] CSR_return_pc,
    output logic [31:0] CSR_ISR_pc,

    output logic CSR_stall,
    output logic CSR_control,
    output logic CSR_ret,

    input [31:0] wire_MEM_rd_data,
    input [31:0] WB_rd_data,

    input [1:0] ForwardRS1Src,
    input [1:0] ForwardRS2Src,

    output reg EXE_RDsrc,
    output reg EXE_MemRead,
    output reg EXE_MemWrite,
    output reg EXE_MemtoReg,
    output reg EXE_RegWrite,
    output reg [31:0] EXE_pc_to_reg,
    output reg [31:0] EXE_alu_out,
    output reg [31:0] EXE_rs2_data,
    output reg [4:0] EXE_rd_addr,
    output reg [2:0] EXE_funct3,

    output ZeroFlag,
    
    output [31:0] pc_imm,
    output [31:0] pc_immrs1,

    input EXEMEM_RegWrite,

    input interrupt
);

    wire [31:0] wire_pc_imm;
    wire [31:0] wire_pc_4;

    wire [31:0] wire_alu_out;

    assign wire_pc_imm = ID_pc_out + ID_imm; // for ALU
    assign wire_pc_4 = ID_pc_out + 4;

    assign pc_imm = ID_pc_out + ID_imm; // for IF
    assign pc_immrs1 = wire_alu_out;

    reg [31:0] ALU_rs1;
    reg [31:0] ALU_rs2_1;
    reg [31:0] ALU_rs2_2;

    logic [31:0] wire_CSR_rdata;

    always_comb begin
        case(ForwardRS1Src)
            2'b00:
                ALU_rs1 = ID_rs1;
            2'b01:
                ALU_rs1 = wire_MEM_rd_data;
            default:// 2'b10
                ALU_rs1 = WB_rd_data;
        endcase // ForwardRS1Src
    end
    always_comb begin
        case(ForwardRS2Src)
            2'b00:
                ALU_rs2_1 = ID_rs2;
            2'b01:
                ALU_rs2_1 = wire_MEM_rd_data;
            default:// 2'b10
                ALU_rs2_1 = WB_rd_data;
        endcase // ForwardRS1Src
    end
    always_comb begin
        if(ID_ALUSrc)
            ALU_rs2_2 = ALU_rs2_1;
        else
            ALU_rs2_2 = ID_imm;
    end


    wire [4:0] wire_ALUCtrl;
    ALUCtrl ALUCtrl(
        .ALUOP(ID_ALUOP),
        .funct3(ID_funct3),
        .funct7(ID_funct7),
        .ALUCtrl(wire_ALUCtrl)
    );

    ALU ALU(
        .rs1(ALU_rs1),
        .rs2(ALU_rs2_2),
        .ALUCtrl(wire_ALUCtrl),
        .alu_out(wire_alu_out),
        .ZeroFlag(ZeroFlag)
    );

    always_ff @(posedge clk or posedge rst) begin
        if(rst) begin
            EXE_RDsrc       <= 1'b0;
            EXE_MemRead     <= 1'b0;
            EXE_MemWrite    <= 1'b0;
            EXE_MemtoReg    <= 1'b0;
            EXE_RegWrite    <= 1'b0;
            EXE_pc_to_reg   <= 32'b0;
            EXE_alu_out     <= 32'b0;
            EXE_rs2_data    <= 32'b0;
            EXE_rd_addr     <= 5'b0;
            EXE_funct3      <= 3'b0;

        end else begin
            if(EXEMEM_RegWrite) begin
                EXE_RDsrc       <= ID_RDSrc;
                EXE_MemRead     <= ID_MemRead;
                EXE_MemWrite    <= ID_MemWrite;
                EXE_MemtoReg    <= ID_MemtoReg;
                EXE_RegWrite    <= ID_RegWrite;

                if(ID_PCtoRegSrc)
                    EXE_pc_to_reg <= wire_pc_imm;
                else
                    EXE_pc_to_reg <= wire_pc_4;

                if(ID_CSR_write)
                    EXE_alu_out     <= wire_CSR_rdata;
                else
                    EXE_alu_out     <= wire_alu_out;

                EXE_rs2_data    <= ALU_rs2_1;
                EXE_rd_addr     <= ID_rd_addr;
                EXE_funct3      <= ID_funct3;
            end

        end
    end

    // CSR
    CSR CSR (
        .clk(clk),    // Clock
        .rst(rst),  // Asynchronous reset active low

        // function
        .funct3(ID_funct3),
        .funct7(ID_funct7),

        // source
        // .rs1(ID_rs1),
        .rs1(ALU_rs1), // after forward
        .imm(ID_imm),
        .rs1_addr(ID_rs1_addr),

        // CSR addr, enable
        .CSR_addr(ID_CSR_addr),
        .CSR_write(ID_CSR_write),

        // RegWrite
        .EXEMEM_RegWrite(EXEMEM_RegWrite),

        // interrupt
        .interrupt(interrupt), // need to fix

        // PC
        .EXE_pc(ID_pc_out),
        .CSR_return_pc(CSR_return_pc),
        .CSR_ISR_pc(CSR_ISR_pc),

        // output data
        .CSR_rdata(wire_CSR_rdata),

        // stall
        .CSR_stall(CSR_stall),
        .CSR_control(CSR_control),
        .CSR_ret(CSR_ret)
    );

endmodule : EXE