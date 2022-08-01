`include "../include/CPU_def.svh"
`include "../include/AXI_define.svh"
`include "./CPU_wrapper.sv"
`include "./SRAM_wrapper.sv"
`include "./ROM_wrapper.sv"
`include "./DRAM_wrapper.sv"
`include "./Interface/inf_Slave.sv"
`include "./Interface/inf_Master.sv"
`include "./AXI/AXI.sv"

module top (
    input clk, rst,

    input        [`DATA_BITS -1:0] ROM_out,
    output logic                   ROM_read,
    output logic                   ROM_enable,
    output logic [`ADDR_BITS-21:0] ROM_address,

    input        [`DATA_BITS-1:0] DRAM_Q,
    input                         DRAM_valid,
    output logic                  DRAM_CSn,
    output logic [`WEB_BITS -1:0] DRAM_WEn,
    output logic                  DRAM_RASn,
    output logic                  DRAM_CASn,
    output logic [          10:0] DRAM_A,
    output logic [`DATA_BITS-1:0] DRAM_D
);


    inf_Master master0();
    inf_Master master1();
	inf_Slave  slave0();
	inf_Slave  slave1();
    inf_Slave  slave2();
	inf_Slave  slave4();

logic latch_rst;

always_ff@(posedge clk or posedge rst) begin
    latch_rst <= rst ? rst : rst;
end

    AXI AXI (
        .ACLK     (clk       ),
        .ARESETn  (~latch_rst),
        .axi2m0_i (master0),
        .axi2m0_o (master0),
        .axi2m1_i (master1),
        .axi2m1_o (master1),
		.axi2s0_i (slave0 ),
		.axi2s0_o (slave0 ),
		.axi2s1_i (slave1 ),
		.axi2s1_o (slave1 ),
		.axi2s2_i (slave2 ),
		.axi2s2_o (slave2 ),
		.axi2s4_i (slave4 ),
		.axi2s4_o (slave4 )

    );

    CPU_wrapper CPU_wrapper (
        .clk      (clk       ),
        .rst      (~latch_rst),
        .m02axi_i (master0   ),
	    .m02axi_o (master0   ),
	    .m12axi_i (master1   ),
	    .m12axi_o (master1   )
    );

	ROM_wrapper ROM_wrapper (
		.clk         (clk),
		.rst         (~latch_rst),
		.s2axi_i     (slave0),
		.s2axi_o     (slave0),
		.ROM_out_i   (ROM_out    ),
		.ROM_en_o    (ROM_enable ),
		.ROM_read_o  (ROM_read   ),
		.ROM_addr_o  (ROM_address)
	);

    SRAM_wrapper IM1 (
        .clk     (clk       ),
        .rst     (~latch_rst),
		.s2axi_i (slave1    ),
		.s2axi_o (slave1    )
    );

    SRAM_wrapper DM1 (
        .clk     (clk       ),
        .rst     (~latch_rst),
		.s2axi_i (slave2    ), 
		.s2axi_o (slave2    )
    );

	DRAM_wrapper DRAM_wrapper (
		.clk          (clk       ),
		.rst          (~latch_rst),
		.s2axi_i      (slave4    ),
		.s2axi_o      (slave4    ),
		.DRAM_Q_i     (DRAM_Q    ),
		.DRAM_valid_i (DRAM_valid),
		.DRAM_CSn_o   (DRAM_CSn  ),
		.DRAM_WEn_o   (DRAM_WEn  ),
		.DRAM_RASn_o  (DRAM_RASn ),
		.DRAM_CASn_o  (DRAM_CASn ),
		.DRAM_A_o     (DRAM_A    ),
		.DRAM_D_o     (DRAM_D    )
	);

endmodule
