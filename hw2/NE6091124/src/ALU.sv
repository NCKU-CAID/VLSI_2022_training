module ALU(ALU_in1, ALU_in2, ALUCtrl, ALU_out, ZeroFlag);

input       	[31:0]  ALU_in1;
input       	[31:0]  ALU_in2;
input       	[ 3:0]  ALUCtrl;
output	logic	[31:0]  ALU_out;
output  logic			ZeroFlag;

always@(*)begin
    ZeroFlag = 1'h0;
    case(ALUCtrl)
        4'h0:ALU_out = ALU_in1 + ALU_in2;
        4'h1:ALU_out = ALU_in1 - ALU_in2;
        4'h2:ALU_out = ALU_in1 ^ ALU_in2;
        4'h3:ALU_out = ALU_in1 | ALU_in2;
        4'h4:ALU_out = ALU_in1 & ALU_in2;
        4'h5:ALU_out = ALU_in1 << ALU_in2[4:0];
        4'h6:ALU_out = ALU_in1 >> ALU_in2[4:0];
        4'h7:ALU_out = $signed(ALU_in1) >>> ALU_in2[4:0];
        4'h8:begin
            if(ALU_in1 == ALU_in2)begin
                ALU_out = 32'h1;
                ZeroFlag = 1'h1;
            end
            else
                ALU_out = 32'h0;
        end
        4'h9:begin
            if(ALU_in1 != ALU_in2)begin
                ALU_out = 32'h1;
                ZeroFlag = 1'h1;
            end
            else
                ALU_out = 32'h0;
        end
        4'ha:begin
            if($signed(ALU_in1) < $signed(ALU_in2))begin
                ALU_out = 32'h1;
                ZeroFlag = 1'h1;
            end
            else
                ALU_out = 32'h0;
        end
        4'hb:begin
            if(ALU_in1 < ALU_in2)begin
                ALU_out = 32'h1;
                ZeroFlag = 1'h1;
            end
            else
                ALU_out = 32'h0;
        end
        4'hc:begin
            if($signed(ALU_in1) >= $signed(ALU_in2))begin
                ALU_out = 32'h1;
                ZeroFlag = 1'h1;
            end
            else
                ALU_out = 32'h0;
        end
        4'hd:begin
            if(ALU_in1 >= ALU_in2)begin
                ALU_out = 32'h1;
                ZeroFlag = 1'h1;
            end
            else
                ALU_out = 32'h0;
        end
        4'he:ALU_out = ALU_in2;
		default:ALU_out = (ALU_in1 + ALU_in2) & 32'hfffffffe;
    endcase
end

endmodule
