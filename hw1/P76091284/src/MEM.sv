module MEM (
    input clk,    // Clock
    input rst,

    input EXE_RDsrc,
    input EXE_MemRead,
    input EXE_MemWrite,
    input EXE_MemtoReg,
    input EXE_RegWrite,
    input [31:0] EXE_pc_to_reg,
    input [31:0] EXE_alu_out,
    input [31:0] EXE_rs2_data,
    input [4:0] EXE_rd_addr,
    input [2:0] EXE_funct3,

    output reg MEM_MemtoReg,
    output reg MEM_RegWrite,
    output reg [31:0] MEM_rd_data, // Data from ALU
    output reg [31:0] MEM_lw_data, // Data from Data memory
    output reg [4:0] MEM_rd_addr,
    output [31:0] wire_MEM_rd_data,

    // DM
    input [31:0] wire_lw_data,
    output wire_chipSelect,
    output reg [3:0] wire_writeEnable,
    output reg [31:0] wire_dataIn
);

    // wire [31:0] wire_lw_data;
    // wire wire_chipSelect;

    assign wire_chipSelect = EXE_MemRead | EXE_MemWrite;
    assign wire_MEM_rd_data = (EXE_RDsrc == 1'b1)? EXE_pc_to_reg:EXE_alu_out;
    
    always_comb begin
        wire_writeEnable = 4'b1111;
        if(EXE_MemWrite) begin
            case (EXE_funct3)
                3'b000: // SB
                    wire_writeEnable[EXE_alu_out[1:0]] = 1'b0;
                3'b001: // SH
                    wire_writeEnable[{EXE_alu_out[1],1'b0}+:2] = 2'b00;
                default: // SW
                    wire_writeEnable = 4'b0000;
            endcase
        end
    end

    always_comb begin
        wire_dataIn = 32'b0;
        case (EXE_funct3)
            3'b000: // SB
                wire_dataIn[{EXE_alu_out[1:0], 3'b0}+:8] = EXE_rs2_data[7:0];
            3'b001: // SH
                wire_dataIn[{EXE_alu_out[1], 4'b0}+:16] = EXE_rs2_data[15:0];
            default : // SW
                wire_dataIn = EXE_rs2_data;
        endcase
    end

    always_ff @(posedge clk or posedge rst) begin
        if(rst) begin
            MEM_MemtoReg    <= 1'b0;
            MEM_RegWrite    <= 1'b0;
            MEM_rd_data     <= 32'b0;
            MEM_lw_data     <= 32'b0;
            MEM_rd_addr     <= 5'b0;
        end else begin
            MEM_MemtoReg    <= EXE_MemtoReg;
            MEM_RegWrite    <= EXE_RegWrite;

            if(EXE_RDsrc)
                MEM_rd_data <= EXE_pc_to_reg;
            else
                MEM_rd_data <= EXE_alu_out;

            // 0928 Max modify
            // MEM_lw_data     <= wire_lw_data;
            case(EXE_funct3)
                3'b010: // LW
                    MEM_lw_data <= wire_lw_data;
                3'b000: // LB
                    MEM_lw_data <= {{24{wire_lw_data[7]}}, wire_lw_data[7:0]};
                3'b001: // LH
                    MEM_lw_data <= {{16{wire_lw_data[15]}}, wire_lw_data[15:0]};
                3'b100: // LBU
                    MEM_lw_data <= {24'b0, wire_lw_data[7:0]};
                3'b101: // LHU
                    MEM_lw_data <= {16'b0, wire_lw_data[15:0]};
                default:
                    MEM_lw_data <= 32'b0;
            endcase // EXE_funct3

            MEM_rd_addr     <= EXE_rd_addr;
        end
    end

endmodule : MEM