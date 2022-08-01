module ImmediateGenerator (
    input [2:0] ImmType,
    input [31:0] instr_out,

    output reg [31:0] imm
);

    localparam [2:0] I_Imm = 3'b000,
                     S_Imm = 3'b001,
                     B_Imm = 3'b010,
                     U_Imm = 3'b011,
                     J_Imm = 3'b100;

    always_comb begin
        case(ImmType)
            I_Imm:
                imm = {{20{instr_out[31]}}, instr_out[31:20]};
            S_Imm:
                imm = {{20{instr_out[31]}}, instr_out[31:25], instr_out[11:7]};
            B_Imm:
                imm = {{19{instr_out[31]}}, instr_out[31], instr_out[7], instr_out[30:25], instr_out[11:8], 1'b0};
            U_Imm:
                imm = {instr_out[31:12], 12'b0};
            default: // J_Imm
                imm = {{11{instr_out[31]}}, instr_out[31], instr_out[19:12], instr_out[20], instr_out[30:21], 1'b0};
        endcase // ImmType
    end
endmodule : ImmediateGenerator