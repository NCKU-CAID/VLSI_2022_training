module Program_Counter(clk, rst, PC_in, PCWrite, IM_stall, DM_stall, InstrRead, PC_out);

input					clk;
input					rst;
input			[31:0]	PC_in;
input					PCWrite;
input					IM_stall;
input					DM_stall;
output	logic			InstrRead;
output	logic [31:0]	PC_out;

always@(posedge clk or posedge rst)begin
	if(rst)
		PC_out <= 32'h0;
	else if(~PCWrite || IM_stall || DM_stall)
		PC_out <= PC_out;
	else
		PC_out <= PC_in;
end

always@(posedge clk or posedge rst)begin
	if(rst)
		InstrRead <= 1'h1;
	else if(IM_stall)
		InstrRead <= 1'h0;
	else
		InstrRead <= 1'h1;
end

endmodule
