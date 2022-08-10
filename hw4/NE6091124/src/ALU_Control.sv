module ALU_Control(ALUOP, funct3, funct7, ALUCtrl);

input			[2:0]   ALUOP;
input			[2:0]   funct3;
input			[6:0]   funct7;
output	logic	[3:0]   ALUCtrl;

always@(*)begin
    case(ALUOP)
        3'h0:begin
            case(funct3)
                3'h0:begin
                    if(funct7 == 7'h0)
                        ALUCtrl = 4'h0;
                    else
                        ALUCtrl = 4'h1;
                end
                3'h1:ALUCtrl = 4'h5;
                3'h2:ALUCtrl = 4'ha;
                3'h3:ALUCtrl = 4'hb;
                3'h4:ALUCtrl = 4'h2;
                3'h5:begin
                    if(funct7 == 7'h0)
                        ALUCtrl = 4'h6;
                    else
                        ALUCtrl = 4'h7;
                end
                3'h6:ALUCtrl = 4'h3;
                default:ALUCtrl = 4'h4;
            endcase
        end
        3'h1:begin
            case(funct3)
                3'h0:ALUCtrl = 4'h0;
                3'h1:ALUCtrl = 4'h5;
                3'h2:ALUCtrl = 4'ha;
                3'h3:ALUCtrl = 4'hb;
                3'h4:ALUCtrl = 4'h2;
                3'h5:begin
                    if(funct7 == 7'h0)
                        ALUCtrl = 4'h6;
                    else
                        ALUCtrl = 4'h7;
                end
                3'h6:ALUCtrl = 4'h3;
                default:ALUCtrl = 4'h4;
            endcase
        end
        3'h3:begin
            case(funct3)
                3'h1:ALUCtrl = 4'h9;
                3'h4:ALUCtrl = 4'ha;
                3'h5:ALUCtrl = 4'hc;
                3'h6:ALUCtrl = 4'hb;
                3'h7:ALUCtrl = 4'hd;
                default:ALUCtrl = 4'h8;
            endcase
        end
        3'h4:ALUCtrl = 4'he;
		3'h5:ALUCtrl = 4'hf;
        default:ALUCtrl = 4'h0;
    endcase
end

endmodule
