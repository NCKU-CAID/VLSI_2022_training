`include "../include/CPU_def.svh"
`include "../include/AXI_define.svh"
`include "./CPU_wrapper.sv"
`include "./SRAM_wrapper.sv"
`include "./AXI/AXI.sv"

module top (
    input clk,
    input rst
);

// {{{ AXI
    // SLAVE INTERFACE FOR MASTERS
    // AW
    logic [`AXI_ID_BITS   -1:0] AWID_M0;
    logic [`AXI_ADDR_BITS -1:0] AWADDR_M0;
    logic [`AXI_LEN_BITS  -1:0] AWLEN_M0;
    logic [`AXI_SIZE_BITS -1:0] AWSIZE_M0;
    logic [`AXI_BURST_BITS-1:0] AWBURST_M0;
    logic AWVALID_M0;
    logic AWREADY_M0;
    logic [`AXI_ID_BITS   -1:0] AWID_M1;
    logic [`AXI_ADDR_BITS -1:0] AWADDR_M1;
    logic [`AXI_LEN_BITS  -1:0] AWLEN_M1;
    logic [`AXI_SIZE_BITS -1:0] AWSIZE_M1;
    logic [`AXI_BURST_BITS-1:0] AWBURST_M1;
    logic AWVALID_M1;
    logic AWREADY_M1;
    // W
    logic [`AXI_DATA_BITS-1:0] WDATA_M0;
    logic [`AXI_STRB_BITS-1:0] WSTRB_M0;
    logic WLAST_M0;
    logic WVALID_M0;
    logic WREADY_M0;
    logic [`AXI_DATA_BITS-1:0] WDATA_M1;
    logic [`AXI_STRB_BITS-1:0] WSTRB_M1;
    logic WLAST_M1;
    logic WVALID_M1;
    logic WREADY_M1;
    // B
    logic [`AXI_ID_BITS  -1:0] BID_M0;
    logic [`AXI_RESP_BITS-1:0] BRESP_M0;
    logic BVALID_M0;
    logic BREADY_M0;
    logic [`AXI_ID_BITS  -1:0] BID_M1;
    logic [`AXI_RESP_BITS-1:0] BRESP_M1;
    logic BVALID_M1;
    logic BREADY_M1;
    // AR
    logic [`AXI_ID_BITS   -1:0] ARID_M0;
    logic [`AXI_ADDR_BITS -1:0] ARADDR_M0;
    logic [`AXI_LEN_BITS  -1:0] ARLEN_M0;
    logic [`AXI_SIZE_BITS -1:0] ARSIZE_M0;
    logic [`AXI_BURST_BITS-1:0] ARBURST_M0;
    logic ARVALID_M0;
    logic ARREADY_M0;
    logic [`AXI_ID_BITS   -1:0] ARID_M1;
    logic [`AXI_ADDR_BITS -1:0] ARADDR_M1;
    logic [`AXI_LEN_BITS  -1:0] ARLEN_M1;
    logic [`AXI_SIZE_BITS -1:0] ARSIZE_M1;
    logic [`AXI_BURST_BITS-1:0] ARBURST_M1;
    logic ARVALID_M1;
    logic ARREADY_M1;
    // R
    logic [`AXI_ID_BITS  -1:0] RID_M0;
    logic [`AXI_DATA_BITS-1:0] RDATA_M0;
    logic [`AXI_RESP_BITS-1:0] RRESP_M0;
    logic RLAST_M0;
    logic RVALID_M0;
    logic RREADY_M0;
    logic [`AXI_ID_BITS  -1:0] RID_M1;
    logic [`AXI_DATA_BITS-1:0] RDATA_M1;
    logic [`AXI_RESP_BITS-1:0] RRESP_M1;
    logic RLAST_M1;
    logic RVALID_M1;
    logic RREADY_M1;

    // MASTER INTERFACE FOR SLAVES
    // AW
    logic [`AXI_IDS_BITS  -1:0] AWID_S0;
    logic [`AXI_ADDR_BITS -1:0] AWADDR_S0;
    logic [`AXI_LEN_BITS  -1:0] AWLEN_S0;
    logic [`AXI_SIZE_BITS -1:0] AWSIZE_S0;
    logic [`AXI_BURST_BITS-1:0] AWBURST_S0;
    logic AWVALID_S0;
    logic AWREADY_S0;
    logic [`AXI_IDS_BITS  -1:0] AWID_S1;
    logic [`AXI_ADDR_BITS -1:0] AWADDR_S1;
    logic [`AXI_LEN_BITS  -1:0] AWLEN_S1;
    logic [`AXI_SIZE_BITS -1:0] AWSIZE_S1;
    logic [`AXI_BURST_BITS-1:0] AWBURST_S1;
    logic AWVALID_S1;
    logic AWREADY_S1;
    // W
    logic [`AXI_DATA_BITS-1:0] WDATA_S0;
    logic [`AXI_STRB_BITS-1:0] WSTRB_S0;
    logic WLAST_S0;
    logic WVALID_S0;
    logic WREADY_S0;
    logic [`AXI_DATA_BITS-1:0] WDATA_S1;
    logic [`AXI_STRB_BITS-1:0] WSTRB_S1;
    logic WLAST_S1;
    logic WVALID_S1;
    logic WREADY_S1;
    // B
    logic [`AXI_IDS_BITS -1:0] BID_S0;
    logic [`AXI_RESP_BITS-1:0] BRESP_S0;
    logic BVALID_S0;
    logic BREADY_S0;
    logic [`AXI_IDS_BITS -1:0] BID_S1;
    logic [`AXI_RESP_BITS-1:0] BRESP_S1;
    logic BVALID_S1;
    logic BREADY_S1;
    // AR
    logic [`AXI_IDS_BITS  -1:0] ARID_S0;
    logic [`AXI_ADDR_BITS -1:0] ARADDR_S0;
    logic [`AXI_LEN_BITS  -1:0] ARLEN_S0;
    logic [`AXI_SIZE_BITS -1:0] ARSIZE_S0;
    logic [`AXI_BURST_BITS-1:0] ARBURST_S0;
    logic ARVALID_S0;
    logic ARREADY_S0;
    logic [`AXI_IDS_BITS  -1:0] ARID_S1;
    logic [`AXI_ADDR_BITS -1:0] ARADDR_S1;
    logic [`AXI_LEN_BITS  -1:0] ARLEN_S1;
    logic [`AXI_SIZE_BITS -1:0] ARSIZE_S1;
    logic [`AXI_BURST_BITS-1:0] ARBURST_S1;
    logic ARVALID_S1;
    logic ARREADY_S1;
    // R
    logic [`AXI_IDS_BITS -1:0] RID_S0;
    logic [`AXI_DATA_BITS-1:0] RDATA_S0;
    logic [`AXI_RESP_BITS-1:0] RRESP_S0;
    logic RLAST_S0;
    logic RVALID_S0;
    logic RREADY_S0;
    logic [`AXI_IDS_BITS -1:0] RID_S1;
    logic [`AXI_DATA_BITS-1:0] RDATA_S1;
    logic [`AXI_RESP_BITS-1:0] RRESP_S1;
    logic RLAST_S1;
    logic RVALID_S1;
    logic RREADY_S1;
// }}}

logic latch_rst;

always_ff@(posedge clk or posedge rst) begin
    latch_rst <= rst ? rst : rst;
end
// {{{ AXI
    AXI AXI(
        .ACLK       (clk       ),
        .ARESETn    (~latch_rst),
        .AWID_M1    (AWID_M1   ),
        .AWADDR_M1  (AWADDR_M1 ),
        .AWLEN_M1   (AWLEN_M1  ),
        .AWSIZE_M1  (AWSIZE_M1 ),
        .AWBURST_M1 (AWBURST_M1),
        .AWVALID_M1 (AWVALID_M1),
        .AWREADY_M1 (AWREADY_M1),
        .WDATA_M1   (WDATA_M1  ),
        .WSTRB_M1   (WSTRB_M1  ),
        .WLAST_M1   (WLAST_M1  ),
        .WVALID_M1  (WVALID_M1 ),
        .WREADY_M1  (WREADY_M1 ),
        .BID_M1     (BID_M1    ),
        .BRESP_M1   (BRESP_M1  ),
        .BVALID_M1  (BVALID_M1 ),
        .BREADY_M1  (BREADY_M1 ),
        .ARID_M0    (ARID_M0   ),
        .ARADDR_M0  (ARADDR_M0 ),
        .ARLEN_M0   (ARLEN_M0  ),
        .ARSIZE_M0  (ARSIZE_M0 ),
        .ARBURST_M0 (ARBURST_M0),
        .ARVALID_M0 (ARVALID_M0),
        .ARREADY_M0 (ARREADY_M0),
        .RID_M0     (RID_M0    ),
        .RDATA_M0   (RDATA_M0  ),
        .RRESP_M0   (RRESP_M0  ),
        .RLAST_M0   (RLAST_M0  ),
        .RVALID_M0  (RVALID_M0 ),
        .RREADY_M0  (RREADY_M0 ),
        .ARID_M1    (ARID_M1   ),
        .ARADDR_M1  (ARADDR_M1 ),
        .ARLEN_M1   (ARLEN_M1  ),
        .ARSIZE_M1  (ARSIZE_M1 ),
        .ARBURST_M1 (ARBURST_M1),
        .ARVALID_M1 (ARVALID_M1),
        .ARREADY_M1 (ARREADY_M1),
        .RID_M1     (RID_M1    ),
        .RDATA_M1   (RDATA_M1  ),
        .RRESP_M1   (RRESP_M1  ),
        .RLAST_M1   (RLAST_M1  ),
        .RVALID_M1  (RVALID_M1 ),
        .RREADY_M1  (RREADY_M1 ),
        .AWID_S0    (AWID_S0   ),
        .AWADDR_S0  (AWADDR_S0 ),
        .AWLEN_S0   (AWLEN_S0  ),
        .AWSIZE_S0  (AWSIZE_S0 ),
        .AWBURST_S0 (AWBURST_S0),
        .AWVALID_S0 (AWVALID_S0),
        .AWREADY_S0 (AWREADY_S0),
        .WDATA_S0   (WDATA_S0  ),
        .WSTRB_S0   (WSTRB_S0  ),
        .WLAST_S0   (WLAST_S0  ),
        .WVALID_S0  (WVALID_S0 ),
        .WREADY_S0  (WREADY_S0 ),
        .BID_S0     (BID_S0    ),
        .BRESP_S0   (BRESP_S0  ),
        .BVALID_S0  (BVALID_S0 ),
        .BREADY_S0  (BREADY_S0 ),
        .AWID_S1    (AWID_S1   ),
        .AWADDR_S1  (AWADDR_S1 ),
        .AWLEN_S1   (AWLEN_S1  ),
        .AWSIZE_S1  (AWSIZE_S1 ),
        .AWBURST_S1 (AWBURST_S1),
        .AWVALID_S1 (AWVALID_S1),
        .AWREADY_S1 (AWREADY_S1),
        .WDATA_S1   (WDATA_S1  ),
        .WSTRB_S1   (WSTRB_S1  ),
        .WLAST_S1   (WLAST_S1  ),
        .WVALID_S1  (WVALID_S1 ),
        .WREADY_S1  (WREADY_S1 ),
        .BID_S1     (BID_S1    ),
        .BRESP_S1   (BRESP_S1  ),
        .BVALID_S1  (BVALID_S1 ),
        .BREADY_S1  (BREADY_S1 ),
        .ARID_S0    (ARID_S0   ),
        .ARADDR_S0  (ARADDR_S0 ),
        .ARLEN_S0   (ARLEN_S0  ),
        .ARSIZE_S0  (ARSIZE_S0 ),
        .ARBURST_S0 (ARBURST_S0),
        .ARVALID_S0 (ARVALID_S0),
        .ARREADY_S0 (ARREADY_S0),
        .RID_S0     (RID_S0    ),
        .RDATA_S0   (RDATA_S0  ),
        .RRESP_S0   (RRESP_S0  ),
        .RLAST_S0   (RLAST_S0  ),
        .RVALID_S0  (RVALID_S0 ),
        .RREADY_S0  (RREADY_S0 ),
        .ARID_S1    (ARID_S1   ),
        .ARADDR_S1  (ARADDR_S1 ),
        .ARLEN_S1   (ARLEN_S1  ),
        .ARSIZE_S1  (ARSIZE_S1 ),
        .ARBURST_S1 (ARBURST_S1),
        .ARVALID_S1 (ARVALID_S1),
        .ARREADY_S1 (ARREADY_S1),
        .RID_S1     (RID_S1    ),
        .RDATA_S1   (RDATA_S1  ),
        .RRESP_S1   (RRESP_S1  ),
        .RLAST_S1   (RLAST_S1  ),
        .RVALID_S1  (RVALID_S1 ),
        .RREADY_S1  (RREADY_S1 )
    );
// }}}

    CPU_wrapper CPU_wrapper (
        .clk        (clk       ),
        .rst        (~latch_rst),
        .AWID_M1    (AWID_M1   ),
        .AWADDR_M1  (AWADDR_M1 ),
        .AWLEN_M1   (AWLEN_M1  ),
        .AWSIZE_M1  (AWSIZE_M1 ),
        .AWBURST_M1 (AWBURST_M1),
        .AWVALID_M1 (AWVALID_M1),
        .AWREADY_M1 (AWREADY_M1),
        .WDATA_M1   (WDATA_M1  ),
        .WSTRB_M1   (WSTRB_M1  ),
        .WLAST_M1   (WLAST_M1  ),
        .WVALID_M1  (WVALID_M1 ),
        .WREADY_M1  (WREADY_M1 ),
        .BID_M1     (BID_M1    ),
        .BRESP_M1   (BRESP_M1  ),
        .BVALID_M1  (BVALID_M1 ),
        .BREADY_M1  (BREADY_M1 ),
        .ARID_M1    (ARID_M1   ),
        .ARADDR_M1  (ARADDR_M1 ),
        .ARLEN_M1   (ARLEN_M1  ),
        .ARSIZE_M1  (ARSIZE_M1 ),
        .ARBURST_M1 (ARBURST_M1),
        .ARVALID_M1 (ARVALID_M1),
        .ARREADY_M1 (ARREADY_M1),
        .RID_M1     (RID_M1    ),
        .RDATA_M1   (RDATA_M1  ),
        .RRESP_M1   (RRESP_M1  ),
        .RLAST_M1   (RLAST_M1  ),
        .RVALID_M1  (RVALID_M1 ),
        .RREADY_M1  (RREADY_M1 ),
        .AWID_M0    (AWID_M0   ),
        .AWADDR_M0  (AWADDR_M0 ),
        .AWLEN_M0   (AWLEN_M0  ),
        .AWSIZE_M0  (AWSIZE_M0 ),
        .AWBURST_M0 (AWBURST_M0),
        .AWVALID_M0 (AWVALID_M0),
        .AWREADY_M0 (AWREADY_M0),
        .WDATA_M0   (WDATA_M0  ),
        .WSTRB_M0   (WSTRB_M0  ),
        .WLAST_M0   (WLAST_M0  ),
        .WVALID_M0  (WVALID_M0 ),
        .WREADY_M0  (WREADY_M0 ),
        .BID_M0     (BID_M0    ),
        .BRESP_M0   (BRESP_M0  ),
        .BVALID_M0  (BVALID_M0 ),
        .BREADY_M0  (BREADY_M0 ),
        .ARID_M0    (ARID_M0   ),
        .ARADDR_M0  (ARADDR_M0 ),
        .ARLEN_M0   (ARLEN_M0  ),
        .ARSIZE_M0  (ARSIZE_M0 ),
        .ARBURST_M0 (ARBURST_M0),
        .ARVALID_M0 (ARVALID_M0),
        .ARREADY_M0 (ARREADY_M0),
        .RID_M0     (RID_M0    ),
        .RDATA_M0   (RDATA_M0  ),
        .RRESP_M0   (RRESP_M0  ),
        .RLAST_M0   (RLAST_M0  ),
        .RVALID_M0  (RVALID_M0 ),
        .RREADY_M0  (RREADY_M0 )
    );

    SRAM_wrapper IM1 (
        .clk       (clk       ),
        .rst       (~latch_rst),
        .awid_i    (AWID_S0   ),
        .awaddr_i  (AWADDR_S0 ),
        .awlen_i   (AWLEN_S0  ),
        .awsize_i  (AWSIZE_S0 ),
        .awburst_i (AWBURST_S0),
        .awvalid_i (AWVALID_S0),
        .awready_o (AWREADY_S0),
        .wdata_i   (WDATA_S0  ),
        .wstrb_i   (WSTRB_S0  ),
        .wlast_i   (WLAST_S0  ),
        .wvalid_i  (WVALID_S0 ),
        .wready_o  (WREADY_S0 ),
        .bid_o     (BID_S0    ),
        .bresp_o   (BRESP_S0  ),
        .bvalid_o  (BVALID_S0 ),
        .bready_i  (BREADY_S0 ),
        .arid_i    (ARID_S0   ),
        .araddr_i  (ARADDR_S0 ),
        .arlen_i   (ARLEN_S0  ),
        .arsize_i  (ARSIZE_S0 ),
        .arburst_i (ARBURST_S0),
        .arvalid_i (ARVALID_S0),
        .arready_o (ARREADY_S0),
        .rid_o     (RID_S0    ),
        .rdata_o   (RDATA_S0  ),
        .rresp_o   (RRESP_S0  ),
        .rlast_o   (RLAST_S0  ),
        .rvalid_o  (RVALID_S0 ),
        .rready_i  (RREADY_S0 )
    );

    SRAM_wrapper DM1 (
        .clk       (clk       ),
        .rst       (~latch_rst),
        .awid_i    (AWID_S1   ),
        .awaddr_i  (AWADDR_S1 ),
        .awlen_i   (AWLEN_S1  ),
        .awsize_i  (AWSIZE_S1 ),
        .awburst_i (AWBURST_S1),
        .awvalid_i (AWVALID_S1),
        .awready_o (AWREADY_S1),
        .wdata_i   (WDATA_S1  ),
        .wstrb_i   (WSTRB_S1  ),
        .wlast_i   (WLAST_S1  ),
        .wvalid_i  (WVALID_S1 ),
        .wready_o  (WREADY_S1 ),
        .bid_o     (BID_S1    ),
        .bresp_o   (BRESP_S1  ),
        .bvalid_o  (BVALID_S1 ),
        .bready_i  (BREADY_S1 ),
        .arid_i    (ARID_S1   ),
        .araddr_i  (ARADDR_S1 ),
        .arlen_i   (ARLEN_S1  ),
        .arsize_i  (ARSIZE_S1 ),
        .arburst_i (ARBURST_S1),
        .arvalid_i (ARVALID_S1),
        .arready_o (ARREADY_S1),
        .rid_o     (RID_S1    ),
        .rdata_o   (RDATA_S1  ),
        .rresp_o   (RRESP_S1  ),
        .rlast_o   (RLAST_S1  ),
        .rvalid_o  (RVALID_S1 ),
        .rready_i  (RREADY_S1 )
    );


/*
    SRAM_wrapper IM1 (
        .CK  (~clk         ),
        .CS  (1'b1         ),
        .OE  (1'b1         ),
        .WEB (4'hf         ),
        .A   (inst_pc[15:2]),
        .DI  (`DATA_BITS'h0),
        .DO  (inst         )
    );
    SRAM_wrapper DM1 (
        .CK  (~clk         ),
        .CS  (1'b1         ),
        .OE  (1'b1         ),
        .WEB (web          ),
        .A   (dm_addr[15:2]),
        .DI  (dm_data_out  ),
        .DO  (dm_data_in   )
    );
*/
endmodule
