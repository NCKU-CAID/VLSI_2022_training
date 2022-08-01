`include "../include/CPU_def.svh"
`include "../include/AXI_define.svh"
`include "./CPU_wrapper.sv"
`include "./SRAM_wrapper.sv"
`include "./Interface/inf_Slave.sv"
`include "./Interface/inf_Master.sv"
`include "./AXI/AXI.sv"

module top (
    input clk,
    input rst
);

    inf_Master master0();
    inf_Master master1();
	inf_Slave  slave0();
	inf_Slave  slave1();

logic latch_rst;

always_ff@(posedge clk or posedge rst) begin
    latch_rst <= rst ? rst : rst;
end
// {{{ AXI
    AXI AXI(
        .ACLK     (clk       ),
        .ARESETn  (~latch_rst),
        .axi2m0_i (master0),
        .axi2m0_o (master0),
        .axi2m1_i (master1),
        .axi2m1_o (master1),
		.axi2s0_i (slave0 ), 
		.axi2s0_o (slave0 ),
		.axi2s1_i (slave1 ),
		.axi2s1_o (slave1 )
    );
// }}}

    CPU_wrapper CPU_wrapper (
        .clk      (clk       ),
        .rst      (~latch_rst),
        .m02axi_i (master0   ),
	    .m02axi_o (master0   ),
	    .m12axi_i (master1   ),
	    .m12axi_o (master1   )
    );
    SRAM_wrapper IM1 (
        .clk     (clk       ),
        .rst     (~latch_rst),
		.s2axi_i (slave0    ),
		.s2axi_o (slave0    )
    );

    SRAM_wrapper DM1 (
        .clk     (clk       ),
        .rst     (~latch_rst),
		.s2axi_i (slave1    ), 
		.s2axi_o (slave1    )
    );

endmodule
