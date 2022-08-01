module Control_Unit(OPcode, funct3, ALUOP, ALUSrc, PCtoRegSrc, RDSrc, MemRead, MemWrite, MemtoReg, RegWrite, ImmType);

input           [ 6:0]   OPcode;
input           [ 2:0]   funct3;
output  logic   [ 2:0]   ALUOP;
output  logic           ALUSrc;
output  logic           PCtoRegSrc;
output  logic           RDSrc;
output  logic           MemRead;
output  logic   [ 3:0]   MemWrite;
output  logic           MemtoReg;
output  logic   [ 2:0]   RegWrite;
output  logic   [ 2:0]   ImmType;

//7'h67 = Jalr, 7'h37 = LUI, 7'h63 = B-type, 7'h3 or 7'h23 = LW/SW, 7'h13 = I-type, others = R-type 
assign  ALUOP = (OPcode == 7'h67) ? 3'h5 : ((OPcode == 7'h37) ? 3'h4 : ((OPcode == 7'h63) ? 3'h3 : (((OPcode == 7'h3) || (OPcode == 7'h23)) ? 3'h2 : ((OPcode == 7'h13) ? 3'h1 : 3'h0))));
assign  ALUSrc = ((OPcode == 7'h33) || (OPcode == 7'h63)) ? 1'h1 : 1'h0;//1 = rs2, 0 = Imm
assign  PCtoRegSrc = (OPcode == 7'h17) ? 1'h1 : 1'h0;//1 = PC + Imm, 0 = PC + 4
assign  RDSrc = ((OPcode == 7'h17) || (OPcode == 7'h67) || (OPcode == 7'h6f)) ? 1'h1 : 1'h0;//1 = PC, 0 = ALU_out
assign  MemRead = (OPcode == 7'h3) ? 1'h1 : 1'h0;
//assign  MemWrite = (OPcode == 7'h23) ? 4'h0 : 4'hf;
assign  MemtoReg = (OPcode == 7'h3) ? 1'h1 : 1'h0;//1 = data_out, 0 = rd
//assign  RegWrite = ((OPcode == 7'h23) || (OPcode == 7'h63)) ? 1'h0 : 1'h1;
assign  ImmType = (OPcode == 7'h6f) ? 3'h4 : (((OPcode == 7'h17) || (OPcode == 7'h37)) ? 3'h3 : ((OPcode == 7'h63) ? 3'h2 : ((OPcode == 7'h23) ? 3'h1 : 3'h0)));

always_comb begin//S-type
    case(OPcode)
        7'h23:begin
            case(funct3)
                3'b000://SB
                    MemWrite = 4'he;
                3'b001://SH
                    MemWrite = 4'hc;
                default://SW
                    MemWrite = 4'h0;
            endcase
        end
        default:
            MemWrite = 4'hf;
    endcase
end

always_comb begin//L-type
    case(OPcode)
        7'h23:
            RegWrite = 3'h0;
        7'h63:
            RegWrite = 3'h0;
        7'h3:begin
            case(funct3)
                3'b000://LB
                    RegWrite = 3'h4;
                3'b001://LH
                    RegWrite = 3'h5;
                3'b100://LBU
                    RegWrite = 3'h2;
                3'b101://LHU
                    RegWrite = 3'h3;
                default://LW
                    RegWrite = 3'h1;
            endcase
        end
        default:
            RegWrite = 3'h1;
    endcase
end

endmodule
