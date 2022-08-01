module Register_File(clk, rst, rs1_addr, rs2_addr, rd_addr, data_in, RegWrite, rs1_data, rs2_data);

input       	        clk;
input       	        rst;
input       	[ 4:0]  rs1_addr;
input       	[ 4:0]  rs2_addr;
input       	[ 4:0]  rd_addr;
input       	[31:0]  data_in;
input       	[ 2:0]  RegWrite;
output  logic	[31:0]  rs1_data;
output  logic	[31:0]  rs2_data;

logic			[31:0]  Register[31:0];

integer				i;

always@(posedge clk or posedge rst)begin
    if(rst)
		for(i = 0; i < 32; i = i + 1)
            Register[i] <= 32'h0;
    else begin
        if(rd_addr != 5'h0)begin
            if(RegWrite == 3'h1)
                Register[rd_addr] <= data_in;
            else if(RegWrite == 3'h2)begin
                Register[rd_addr][31: 8] <= 24'h0;
                Register[rd_addr][ 7: 0] <= data_in[7:0];
            end
            else if(RegWrite == 3'h3)begin
                Register[rd_addr][31:16] <= 16'h0;
                Register[rd_addr][15: 0] <= data_in[15:0];
            end
            else if(RegWrite == 3'h4)begin
                if(data_in[7])
                    Register[rd_addr][31: 8] <= 24'hffffff;
                else
                    Register[rd_addr][31: 8] <= 24'h0;
                Register[rd_addr][ 7: 0] <= data_in[7:0];
            end
            else if(RegWrite == 3'h5)begin
                if(data_in[7])
                    Register[rd_addr][31:16] <= 16'hffff;
                else
                    Register[rd_addr][31:16] <= 16'h0;
                Register[rd_addr][15: 0] <= data_in[15:0];
            end
        end
    end
end

always@(*)begin
	rs1_data = Register[rs1_addr];
	rs2_data = Register[rs2_addr];
end

endmodule
