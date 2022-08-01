module ALU (
    input [31:0] rs1,
    input [31:0] rs2,
    input [ 4:0] ALUCtrl,

    output reg ZeroFlag,
    output reg [31:0] alu_out
);

  localparam [4:0] alu_ADD = 5'b00000,  // 0
  alu_SUB = 5'b00001,  // 1
  alu_SLL = 5'b00010,  // 2
  alu_SLT = 5'b00011,  // 3
  alu_SLTU = 5'b00100,  // 4
  alu_XOR = 5'b00101,  // 5
  alu_SRL = 5'b00110,  // 6
  alu_SRA = 5'b00111,  // 7
  alu_OR = 5'b01000,  // 8
  alu_AND = 5'b01001,  // 9
  alu_JALR = 5'b01010,  // a
  alu_BEQ = 5'b01011,  // b
  alu_BNE = 5'b01100,  // c
  alu_BLT = 5'b01101,  // d
  alu_BGE = 5'b01110,  // e
  alu_BLTU = 5'b01111,  // f
  alu_BGEU = 5'b10000,  // 11
  alu_IMM = 5'b10001;  // 12

  wire signed [31:0] signed_rs1;
  wire signed [31:0] signed_rs2;
  assign signed_rs1 = rs1;
  assign signed_rs2 = rs2;

  wire [31:0] sum;
  assign sum = rs1 + rs2;


  // determine alu_out
  always_comb begin
    case (ALUCtrl)
      alu_ADD:  alu_out = sum;  // rs1 + rs2;
      alu_SUB:  alu_out = rs1 - rs2;
      alu_SLL:  alu_out = rs1 << rs2[4:0];
      alu_SLT:  alu_out = (signed_rs1 < signed_rs2) ? 32'b1 : 32'b0;
      alu_SLTU: alu_out = rs1 < rs2 ? 32'b1 : 32'b0;
      alu_XOR:  alu_out = rs1 ^ rs2;
      alu_SRL:  alu_out = rs1 >> rs2[4:0];
      alu_SRA:  alu_out = signed_rs1 >>> rs2[4:0];
      alu_OR:   alu_out = rs1 | rs2;
      alu_AND:  alu_out = rs1 & rs2;
      alu_JALR: alu_out = {sum[31:1], 1'b0};
      alu_IMM:  alu_out = rs2;
      default:  alu_out = 32'b0;  // B-type
    endcase  // ALUCtrl
  end

  // determine ZeroFlag, 1'b1:PC+imm; 1'b0:PC+4
  always_comb begin
    case (ALUCtrl)
      alu_BEQ:  ZeroFlag = (rs1 == rs2) ? 1'b1 : 1'b0;
      alu_BNE:  ZeroFlag = (rs1 != rs2) ? 1'b1 : 1'b0;
      alu_BLT:  ZeroFlag = (signed_rs1 < signed_rs2) ? 1'b1 : 1'b0;
      alu_BGE:  ZeroFlag = (signed_rs1 >= signed_rs2) ? 1'b1 : 1'b0;
      alu_BLTU: ZeroFlag = (rs1 < rs2) ? 1'b1 : 1'b0;
      default:  ZeroFlag = (rs1 >= rs2) ? 1'b1 : 1'b0;  // BGEU
    endcase
  end
endmodule : ALU
