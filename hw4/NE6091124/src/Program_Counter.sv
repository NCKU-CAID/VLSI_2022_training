module Program_Counter(clk, rst, PC_in, PCWrite, IM_STALL, DM_STALL, CSR_STALL, Instr_read, PC_out);

input					clk;
input					rst;
input			[31:0]	PC_in;
input					PCWrite;
input					IM_STALL;
input					DM_STALL;
input					CSR_STALL;
output					Instr_read;
output	logic	[31:0]	PC_out;

assign Instr_read = (DM_STALL) ? 1'b0 : 1'b1;

always@(posedge clk or posedge rst)begin
	if(rst)
		PC_out <= 32'h0;
	else begin
		if (PCWrite & ~IM_STALL & ~DM_STALL & ~CSR_STALL)
			PC_out <= PC_in;
	end
end

endmodule
