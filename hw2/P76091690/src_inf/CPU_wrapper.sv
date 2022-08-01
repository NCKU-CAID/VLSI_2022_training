`include "../include/AXI_define.svh"
`include "./Master.sv"
`include "./CPU.sv"

module CPU_wrapper (
    input  clk, rst,
	inf_Master.M2AXIin  m02axi_i,
	inf_Master.M2AXIout m02axi_o,
	inf_Master.M2AXIin  m12axi_i,
	inf_Master.M2AXIout m12axi_o
);


	logic [`WEB_BITS -1:0] cpuweb_1;
	logic [`ADDR_BITS-1:0] cpuaddr_1;
	logic [`DATA_BITS-1:0] crdata_1;
	logic [`DATA_BITS-1:0] cpuwdata_1;
	logic cwait_1;
    logic cpureq_1;
	logic cpuread_1, cpuwrite_1;
    logic req_read1, req_write1;
	assign cpuweb_1   = 4'hf;
	assign cpuwdata_1 = `DATA_BITS'h0;
	assign req_read1  = cpureq_1 & cpuread_1;
	assign req_write1 = cpureq_1 & cpuwrite_1;

	logic [`WEB_BITS -1:0] cpuweb_2;
	logic [`ADDR_BITS-1:0] cpuaddr2;
	logic [`DATA_BITS-1:0] crdata_2;
	logic [`DATA_BITS-1:0] cpuwdata_2;
	logic cwait_2;
    logic cpureq_2;
	logic cpuread_2, cpuwrite_2;
    logic req_read2, req_write2;
	assign req_read2  = cpureq_2 & cpuread_2;
	assign req_write2 = cpureq_2 & cpuwrite_2;

	logic latch_rst;
	always_ff @(posedge clk or negedge rst) begin
		latch_rst <= ~rst ? rst : rst;
	end
	CPU i_CPU (
        .clk       (clk     ),
        .rst       (~latch_rst),
        .inst_i    (crdata_1),
        .inst_pc_o (cpuaddr_1 ),
        .dm_data_i (crdata_2),
        .dm_addr_o (cpuaddr2 ),
        .dm_data_o (cpuwdata_2),
        .web_o     (cpuweb_2  ),
		// Master
		.wait1_i  (cwait_1 ),
        .req1_o   (cpureq_1   ),
        .read1_o  (cpuread_1   ),
        .write1_o (cpuwrite_1  ),
		.wait2_i  (cwait_2 ),
        .req2_o   (cpureq_2   ),
        .read2_o  (cpuread_2   ),
        .write2_o (cpuwrite_2  )		
    );



	Master M0 (
		.clk       (clk       ),
		.rst       (rst       ),
		.m2axi_i   (m02axi_i  ),
		.m2axi_o   (m02axi_o  ),
		.read_i    (req_read1 ),
		.write_i   (req_write1),
		.wtype_i   (cpuweb_1    ),
		.datain_i  (cpuwdata_1  ),
		.addr_i    (cpuaddr_1   ),
		.dataout_o (crdata_1  ),
		.wait_o    (cwait_1  )
	);

	Master M1 (
		.clk       (clk       ),
		.rst       (rst       ),
		.m2axi_i   (m12axi_i  ),
		.m2axi_o   (m12axi_o  ),
		.read_i    (req_read2 ),
		.write_i   (req_write2),
		.wtype_i   (cpuweb_2    ),
		.datain_i  (cpuwdata_2  ),
		.addr_i    (cpuaddr2   ),
		.dataout_o (crdata_2  ),
		.wait_o    (cwait_2  )
	);

endmodule

