`include "CPU.sv"
`include "SRAM_wrapper.sv"

module top(
	input clk,
	input rst
);

logic	[31:0]	ADDR_instr;
logic			READ_instr;
logic	[ 3:0]	WRITE_instr;
logic	[31:0]	WDATA_instr;
logic	[31:0]	RDATA_instr;
logic	[31:0]	ADDR_data;
logic			READ_data;
logic	[ 3:0]	WRITE_data;
logic	[31:0]	WDATA_data;
logic	[31:0]	RDATA_data;

CPU CPU(
	.clk			(clk				),
	.rst			(rst				),
	.ADDR_instr		(ADDR_instr			),
	.READ_instr		(READ_instr			),
	.WRITE_instr	(WRITE_instr		),
	.WDATA_instr	(WDATA_instr		),
	.RDATA_instr	(RDATA_instr		),
	.ADDR_data		(ADDR_data			),
	.READ_data		(READ_data			),
	.WRITE_data		(WRITE_data			),
	.WDATA_data		(WDATA_data			),
	.RDATA_data		(RDATA_data			)
);

SRAM_wrapper IM1(
	.CK				(clk				),
	.CS				(1'h1				),
	.OE				(READ_instr			),
	.WEB			(WRITE_instr		),
	.A				(ADDR_instr[15:2]	),
	.DI				(WDATA_instr		),
	.DO				(RDATA_instr		)
);

SRAM_wrapper DM1(
    .CK     		(clk				),
    .CS     		(1'h1				),
    .OE     		(READ_data			),
    .WEB    		(WRITE_data			),
    .A      		(ADDR_data[15:2]	),
    .DI     		(WDATA_data			),
    .DO     		(RDATA_data			)
);

endmodule
