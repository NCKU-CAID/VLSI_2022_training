`include "ControlUnit.sv"
`include "RegisterFile.sv"
`include "ImmediateGenerator.sv"
module ID (
    input clk,    // Clock
    input rst,
    input [31:0] IF_instr_out,
    input [31:0] IF_pc_out,

    input [31:0] WB_rd_data,
    input [4:0]  WB_rd_addr,
    input WB_RegWrite,

    input CtrlSignalFlush,

    output reg [31:0] ID_pc_out,
    output reg [31:0] ID_rs1,
    output reg [31:0] ID_rs2,
    output reg [31:0] ID_imm,
    output reg [2:0] ID_funct3,
    output reg [6:0] ID_funct7,
    output reg [4:0] ID_rd_addr,
    output reg [4:0] ID_rs1_addr,
    output reg [4:0] ID_rs2_addr,
    output reg [2:0] ID_ALUOP,
    output reg ID_PCtoRegSrc,
    output reg ID_ALUSrc,
    output reg ID_RDSrc,
    output reg ID_MemRead,
    output reg ID_MemWrite,
    output reg ID_MemtoReg,
    output reg ID_RegWrite,
    output reg [1:0] ID_branch,

    // CSR
    output reg ID_CSR_write,
    output reg [11:0] ID_CSR_addr,

    output [4:0] rs1_addr,
    output [4:0] rs2_addr,

    input IDEXE_RegWrite
);
    assign rs1_addr = IF_instr_out[19:15];
    assign rs2_addr = IF_instr_out[24:20];

    wire [31:0] wire_rs1, wire_rs2;

    // Imm signal from Control Unit
    wire [31:0] wire_imm;

    // Signals from Control Unit
    wire [2:0] wire_ALUOP;
    wire wire_PCtoRegSrc;
    wire wire_ALUSrc;
    wire wire_RDSrc;
    wire wire_MemRead;
    wire wire_MemWrite;
    wire wire_MemtoReg;
    wire wire_RegWrite;
    wire [1:0] wire_branch;
    logic wire_CSR_write;

    RegisterFile RegisterFile(
        .clk(clk),
        .rst(rst),
        .RegWrite(WB_RegWrite),
        .rs1_addr(IF_instr_out[19:15]),
        .rs2_addr(IF_instr_out[24:20]),
        .WB_rd_addr(WB_rd_addr),
        .WB_rd_data(WB_rd_data),

        .RS1Data(wire_rs1),
        .RS2Data(wire_rs2)
    );

    wire [2:0] wire_ImmType;

    ImmediateGenerator ImmGen(
        .ImmType(wire_ImmType),
        .instr_out(IF_instr_out),
        .imm(wire_imm)
    );

    ControlUnit ControlUnit(
        .opcode(IF_instr_out[6:0]),
        .ImmType(wire_ImmType),
        .ALUOP(wire_ALUOP),
        .PCtoRegSrc(wire_PCtoRegSrc),
        .ALUSrc(wire_ALUSrc),
        .RDSrc(wire_RDSrc),
        .MemRead(wire_MemRead),
        .MemWrite(wire_MemWrite),
        .MemtoReg(wire_MemtoReg),
        .RegWrite(wire_RegWrite),
        .branch(wire_branch),
        .CSR_write(wire_CSR_write)
    );

    always_ff @(posedge clk or posedge rst) begin
        if(rst) begin
            ID_pc_out       <= 32'b0;
            ID_rs1          <= 32'b0;
            ID_rs2          <= 32'b0;
            ID_imm          <= 32'b0;
            ID_funct3       <= 3'b0;
            ID_funct7       <= 7'b0;
            ID_rd_addr      <= 5'b0;
            ID_rs1_addr     <= 5'b0;
            ID_rs2_addr     <= 5'b0;

            ID_ALUOP        <= 3'b0;
            ID_PCtoRegSrc   <= 1'b0;
            ID_ALUSrc       <= 1'b0;
            ID_RDSrc        <= 1'b0;
            ID_MemRead      <= 1'b0;
            ID_MemWrite     <= 1'b0;
            ID_MemtoReg     <= 1'b0;
            ID_RegWrite     <= 1'b0;
            ID_branch       <= 2'b0;
            ID_CSR_write    <= 1'b0;
            ID_CSR_addr     <= 12'b0;
        end
        else begin
            if(IDEXE_RegWrite) begin
                ID_pc_out       <= IF_pc_out;
                ID_rs1          <= wire_rs1;
                ID_rs2          <= wire_rs2;
                ID_imm          <= wire_imm;
                ID_funct3       <= IF_instr_out[14:12];
                ID_funct7       <= IF_instr_out[31:25];
                ID_rd_addr      <= IF_instr_out[11:7];
                ID_rs1_addr     <= IF_instr_out[19:15];
                ID_rs2_addr     <= IF_instr_out[24:20];

                ID_ALUOP        <= wire_ALUOP;
                ID_PCtoRegSrc   <= wire_PCtoRegSrc;
                ID_ALUSrc       <= wire_ALUSrc;
                ID_RDSrc        <= wire_RDSrc;
                ID_MemtoReg     <= wire_MemtoReg;

                ID_MemWrite     <= (CtrlSignalFlush) ? 1'b0:wire_MemWrite;
                ID_MemRead      <= (CtrlSignalFlush) ? 1'b0:wire_MemRead;
                ID_RegWrite     <= (CtrlSignalFlush) ? 1'b0:wire_RegWrite;
                ID_branch       <= (CtrlSignalFlush) ? 2'b0:wire_branch;

                // CSR
                ID_CSR_write    <= (CtrlSignalFlush) ? 1'b0:wire_CSR_write;
                ID_CSR_addr     <= (CtrlSignalFlush) ? 12'b0:IF_instr_out[31:20];
            end
            else if ((~IDEXE_RegWrite) & CtrlSignalFlush) begin // IM stall
                ID_MemWrite <= 1'b0;
                ID_MemRead  <= 1'b0;
                ID_RegWrite <= 1'b0;
            end
        end
    end

endmodule : ID
