module ALUCtrl (
    input [2:0] ALUOP,
    input [2:0] funct3,
    input [6:0] funct7,

    output reg [4:0] ALUCtrl
);
  localparam [2:0] R_type = 3'b000,  // 0
  I_type = 3'b001,  // 1
  ADD_type = 3'b010,  // 2
  JALR_type = 3'b011,  // 3
  B_type = 3'b100,  // 4
  LUI_type = 3'b101;  // 5

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
  alu_BLTU = 5'b01111,  // 10
  alu_BGEU = 5'b10000,  // 11
  alu_IMM = 5'b10001;  // 12

  always_comb begin
    case (ALUOP)
      R_type: begin
        case (funct3)
          3'b000: begin
            if (funct7 == 7'b0) ALUCtrl = alu_ADD;
            else ALUCtrl = alu_SUB;
          end
          3'b001: ALUCtrl = alu_SLL;
          3'b010: ALUCtrl = alu_SLT;
          3'b011: ALUCtrl = alu_SLTU;
          3'b100: ALUCtrl = alu_XOR;
          3'b101:
          if (funct7 == 7'b0) ALUCtrl = alu_SRL;
          else ALUCtrl = alu_SRA;
          3'b110: ALUCtrl = alu_OR;
          default:  // 3'b111:
          ALUCtrl = alu_AND;
        endcase  // funct3
      end
      I_type: begin
        case (funct3)
          3'b000: ALUCtrl = alu_ADD;
          3'b010: ALUCtrl = alu_SLT;
          3'b011: ALUCtrl = alu_SLTU;
          3'b100: ALUCtrl = alu_XOR;
          3'b110: ALUCtrl = alu_OR;
          3'b111: ALUCtrl = alu_AND;
          3'b001: ALUCtrl = alu_SLL;
          default: begin  // 3'b101
            if (funct7 == 7'b0) ALUCtrl = alu_SRL;
            else ALUCtrl = alu_SRA;
          end
        endcase  // funct3
      end
      ADD_type: begin
        ALUCtrl = alu_ADD;
      end
      JALR_type: begin
        ALUCtrl = alu_JALR;
      end
      B_type: begin
        case (funct3)
          3'b000:  ALUCtrl = alu_BEQ;
          3'b001:  ALUCtrl = alu_BNE;
          3'b100:  ALUCtrl = alu_BLT;
          3'b101:  ALUCtrl = alu_BGE;
          3'b110:  ALUCtrl = alu_BLTU;
          default: ALUCtrl = alu_BGEU;  /*3'b111*/
        endcase  // funct3
      end
      default: begin  // LUI_type
        ALUCtrl = alu_IMM;
      end
    endcase  // ALUOP
  end
endmodule : ALUCtrl
