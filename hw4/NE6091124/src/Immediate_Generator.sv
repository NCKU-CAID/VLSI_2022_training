module Immediate_Generator(ImmType, Imm_in, Imm_out);

input           [ 2:0]  ImmType;
input           [24:0]  Imm_in;
output  logic   [31:0]  Imm_out;

always@(*)begin
    case(ImmType[2:0])
        3'h0:begin//I-type
            if(Imm_in[24])
                Imm_out = {20'hfffff,Imm_in[24:13]};
            else
                Imm_out = {20'h0,Imm_in[24:13]};
        end
        3'h1:begin//S-type
            if(Imm_in[24])
                Imm_out = {20'hfffff,Imm_in[24:18],Imm_in[4:0]};
            else
                Imm_out = {20'h0,Imm_in[24:18],Imm_in[4:0]};
        end
        3'h2:begin//B-type
            if(Imm_in[24])
                Imm_out = {19'h7ffff,Imm_in[24],Imm_in[0],Imm_in[23:18],Imm_in[4:1],1'h0};
            else
                Imm_out = {19'h0,Imm_in[24],Imm_in[0],Imm_in[23:18],Imm_in[4:1],1'h0};
        end
        3'h3:begin//U-type
            Imm_out = {Imm_in[24:5],12'h0};
        end
        default:begin//J-type
            if(Imm_in[24])
                Imm_out = {11'h7ff,Imm_in[24],Imm_in[12:5],Imm_in[13],Imm_in[23:14],1'h0};
            else
                Imm_out = {11'h0,Imm_in[24],Imm_in[12:5],Imm_in[13],Imm_in[23:14],1'h0};
        end
    endcase
end

endmodule
