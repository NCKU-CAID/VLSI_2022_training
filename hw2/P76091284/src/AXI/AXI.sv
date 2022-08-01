//================================================
// Auther:      Chen Tsung-Chi (Michael)           
// Filename:    AXI.sv                            
// Description: Top module of AXI                  
// Version:     1.0 
//================================================
// `include "AXI_define.svh"
`include "../../include/AXI_define.svh"
`include "RA.sv"
`include "RD.sv"
`include "WA.sv"
`include "WD.sv"
`include "WR.sv"
`include "DefaultSlave.sv"
`include "Arbiter.sv"
`include "Decoder.sv"
// `include "R_ch.sv"
// `include "B_ch.sv"
// `include "W_ch.sv"

module AXI(

    input ACLK,
    input ARESETn,

    //SLAVE INTERFACE FOR MASTERS
    //WRITE ADDRESS
    input [`AXI_ID_BITS-1:0] AWID_M1,
    input [`AXI_ADDR_BITS-1:0] AWADDR_M1,
    input [`AXI_LEN_BITS-1:0] AWLEN_M1,
    input [`AXI_SIZE_BITS-1:0] AWSIZE_M1,
    input [1:0] AWBURST_M1,
    input AWVALID_M1,
    output AWREADY_M1,
    //WRITE DATA
    input [`AXI_DATA_BITS-1:0] WDATA_M1,
    input [`AXI_STRB_BITS-1:0] WSTRB_M1,
    input WLAST_M1,
    input WVALID_M1,
    output WREADY_M1,
    //WRITE RESPONSE
    output [`AXI_ID_BITS-1:0] BID_M1,
    output [1:0] BRESP_M1,
    output BVALID_M1,
    input BREADY_M1,

    //READ ADDRESS0
    input [`AXI_ID_BITS-1:0] ARID_M0,
    input [`AXI_ADDR_BITS-1:0] ARADDR_M0,
    input [`AXI_LEN_BITS-1:0] ARLEN_M0,
    input [`AXI_SIZE_BITS-1:0] ARSIZE_M0,
    input [1:0] ARBURST_M0,
    input ARVALID_M0,
    output ARREADY_M0,
    //READ DATA0
    output [`AXI_ID_BITS-1:0] RID_M0,
    output [`AXI_DATA_BITS-1:0] RDATA_M0,
    output [1:0] RRESP_M0,
    output RLAST_M0,
    output RVALID_M0,
    input RREADY_M0,
    //READ ADDRESS1
    input [`AXI_ID_BITS-1:0] ARID_M1,
    input [`AXI_ADDR_BITS-1:0] ARADDR_M1,
    input [`AXI_LEN_BITS-1:0] ARLEN_M1,
    input [`AXI_SIZE_BITS-1:0] ARSIZE_M1,
    input [1:0] ARBURST_M1,
    input ARVALID_M1,
    output ARREADY_M1,
    //READ DATA1
    output [`AXI_ID_BITS-1:0] RID_M1,
    output [`AXI_DATA_BITS-1:0] RDATA_M1,
    output [1:0] RRESP_M1,
    output RLAST_M1,
    output RVALID_M1,
    input RREADY_M1,

    //MASTER INTERFACE FOR SLAVES
    //WRITE ADDRESS0
    output [`AXI_IDS_BITS-1:0] AWID_S0,
    output [`AXI_ADDR_BITS-1:0] AWADDR_S0,
    output [`AXI_LEN_BITS-1:0] AWLEN_S0,
    output [`AXI_SIZE_BITS-1:0] AWSIZE_S0,
    output [1:0] AWBURST_S0,
    output AWVALID_S0,
    input AWREADY_S0,
    //WRITE DATA0
    output [`AXI_DATA_BITS-1:0] WDATA_S0,
    output [`AXI_STRB_BITS-1:0] WSTRB_S0,
    output WLAST_S0,
    output WVALID_S0,
    input WREADY_S0,
    //WRITE RESPONSE0
    input [`AXI_IDS_BITS-1:0] BID_S0,
    input [1:0] BRESP_S0,
    input BVALID_S0,
    output BREADY_S0,

    //WRITE ADDRESS1
    output [`AXI_IDS_BITS-1:0] AWID_S1,
    output [`AXI_ADDR_BITS-1:0] AWADDR_S1,
    output [`AXI_LEN_BITS-1:0] AWLEN_S1,
    output [`AXI_SIZE_BITS-1:0] AWSIZE_S1,
    output [1:0] AWBURST_S1,
    output AWVALID_S1,
    input AWREADY_S1,
    //WRITE DATA1
    output [`AXI_DATA_BITS-1:0] WDATA_S1,
    output [`AXI_STRB_BITS-1:0] WSTRB_S1,
    output WLAST_S1,
    output WVALID_S1,
    input WREADY_S1,
    //WRITE RESPONSE1
    input [`AXI_IDS_BITS-1:0] BID_S1,
    input [1:0] BRESP_S1,
    input BVALID_S1,
    output BREADY_S1,

    //READ ADDRESS0
    output [`AXI_IDS_BITS-1:0] ARID_S0,
    output [`AXI_ADDR_BITS-1:0] ARADDR_S0,
    output [`AXI_LEN_BITS-1:0] ARLEN_S0,
    output [`AXI_SIZE_BITS-1:0] ARSIZE_S0,
    output [1:0] ARBURST_S0,
    output ARVALID_S0,
    input ARREADY_S0,
    //READ DATA0
    input [`AXI_IDS_BITS-1:0] RID_S0,
    input [`AXI_DATA_BITS-1:0] RDATA_S0,
    input [1:0] RRESP_S0,
    input RLAST_S0,
    input RVALID_S0,
    output RREADY_S0,
    //READ ADDRESS1
    output [`AXI_IDS_BITS-1:0] ARID_S1,
    output [`AXI_ADDR_BITS-1:0] ARADDR_S1,
    output [`AXI_LEN_BITS-1:0] ARLEN_S1,
    output [`AXI_SIZE_BITS-1:0] ARSIZE_S1,
    output [1:0] ARBURST_S1,
    output ARVALID_S1,
    input ARREADY_S1,
    //READ DATA1
    input [`AXI_IDS_BITS-1:0] RID_S1,
    input [`AXI_DATA_BITS-1:0] RDATA_S1,
    input [1:0] RRESP_S1,
    input RLAST_S1,
    input RVALID_S1,
    output RREADY_S1

);
    //---------- you should put your design here ----------//
    // DA receive
    logic [`AXI_IDS_BITS-1:0] w_ARID_SDEFAULT;
    logic [`AXI_ADDR_BITS-1:0] w_ARADDR_SDEFAULT;
    logic [`AXI_LEN_BITS-1:0] w_ARLEN_SDEFAULT;
    logic [`AXI_SIZE_BITS-1:0] w_ARSIZE_SDEFAULT;
    logic [1:0] w_ARBURST_SDEFAULT;
    logic w_ARVALID_SDEFAULT;
    // DA send
    logic w_ARREADY_SDEFAULT;

    // DR send
    logic [`AXI_IDS_BITS-1:0] w_RID_SDEFAULT;
    logic [`AXI_DATA_BITS-1:0] w_RDATA_SDEFAULT;
    logic [1:0] w_RRESP_SDEFAULT;
    logic w_RLAST_SDEFAULT;
    logic w_RVALID_SDEFAULT;
    // DR receive
    logic w_RREADY_SDEFAULT;

    // WA receive
    logic [`AXI_IDS_BITS-1:0] w_AWID_SDEFAULT;
    logic [`AXI_ADDR_BITS-1:0] w_AWADDR_SDFAULT;
    logic [`AXI_LEN_BITS-1:0] w_AWLEN_SDEFAULT;
    logic [`AXI_SIZE_BITS-1:0] w_AWSIZE_SDEFAULT;
    logic [1:0] w_AWBURST_SDEFAULT;
    logic w_AWVALID_SDEFAULT;
    // WA send
    logic w_AWREADY_SDEFAULT;

    // WD receive
    logic [`AXI_DATA_BITS-1:0] w_WDATA_SDEFAULT;
    logic [`AXI_STRB_BITS-1:0] w_WSTRB_SDEFAULT;
    logic w_WLAST_SDEFAULT;
    logic w_WVALID_SDEFAULT;
    // WD send
    logic w_WREADY_SDEFAULT;

    // WR send
    logic [`AXI_IDS_BITS-1:0] w_BID_SDEFAULT;
    logic [1:0] w_BRESP_SDEFAULT;
    logic w_BVALID_SDEFAULT;
    // WR receive
    logic w_BREADY_SDEFAULT;

    DefaultSlave uDefaultSlave (
        .clk(ACLK),    // Clock
        .rst(ARESETn),  // Asynchronous reset active low

        // DA receive
        .ARID_SDEFAULT(w_ARID_SDEFAULT),
        .ARADDR_SDEFAULT(w_ARADDR_SDEFAULT),
        .ARLEN_SDEFAULT(w_ARLEN_SDEFAULT),
        .ARSIZE_SDEFAULT(w_ARSIZE_SDEFAULT),
        .ARBURST_SDEFAULT(w_ARBURST_SDEFAULT),
        .ARVALID_SDEFAULT(w_ARVALID_SDEFAULT),
        // DA send
        .ARREADY_SDEFAULT(w_ARREADY_SDEFAULT),

        // DR send
        .RID_SDEFAULT(w_RID_SDEFAULT),
        .RDATA_SDEFAULT(w_RDATA_SDEFAULT),
        .RRESP_SDEFAULT(w_RRESP_SDEFAULT),
        .RLAST_SDEFAULT(w_RLAST_SDEFAULT),
        .RVALID_SDEFAULT(w_RVALID_SDEFAULT),
        // DR receive
        .RREADY_SDEFAULT(w_RREADY_SDEFAULT),

        // WA receive
        .AWID_SDEFAULT(w_AWID_SDEFAULT),
        .AWADDR_SDFAULT(w_AWADDR_SDFAULT),
        .AWLEN_SDEFAULT(w_AWLEN_SDEFAULT),
        .AWSIZE_SDEFAULT(w_AWSIZE_SDEFAULT),
        .AWBURST_SDEFAULT(w_AWBURST_SDEFAULT),
        .AWVALID_SDEFAULT(w_AWVALID_SDEFAULT),
        // WA send
        .AWREADY_SDEFAULT(w_AWREADY_SDEFAULT),

        // WD receive
        .WDATA_SDEFAULT(w_WDATA_SDEFAULT),
        .WSTRB_SDEFAULT(w_WSTRB_SDEFAULT),
        .WLAST_SDEFAULT(w_WLAST_SDEFAULT),
        .WVALID_SDEFAULT(w_WVALID_SDEFAULT),
        // WD send
        .WREADY_SDEFAULT(w_WREADY_SDEFAULT),

        // WR send
        .BID_SDEFAULT(w_BID_SDEFAULT),
        .BRESP_SDEFAULT(w_BRESP_SDEFAULT),
        .BVALID_SDEFAULT(w_BVALID_SDEFAULT),
        // WR receive
        .BREADY_SDEFAULT(w_BREADY_SDEFAULT)
    );

    RA uRA (
        .clk(ACLK),    // Clock
        .rst(ARESETn),  // Asynchronous reset active high

        // Master_0 send
        .ARID_M0(ARID_M0),
        .ARADDR_M0(ARADDR_M0),
        .ARLEN_M0(ARLEN_M0),
        .ARSIZE_M0(ARSIZE_M0),
        .ARBURST_M0(ARBURST_M0),
        .ARVALID_M0(ARVALID_M0),
        // Master_0 receive
        .ARREADY_M0(ARREADY_M0),

        // Master_1 send
        .ARID_M1(ARID_M1),
        .ARADDR_M1(ARADDR_M1),
        .ARLEN_M1(ARLEN_M1),
        .ARSIZE_M1(ARSIZE_M1),
        .ARBURST_M1(ARBURST_M1),
        .ARVALID_M1(ARVALID_M1),
        // Master_1 receive
        .ARREADY_M1(ARREADY_M1),

        // Slaves 0 receive
        .ARID_S0(ARID_S0),
        .ARADDR_S0(ARADDR_S0),
        .ARLEN_S0(ARLEN_S0),
        .ARSIZE_S0(ARSIZE_S0),
        .ARBURST_S0(ARBURST_S0),
        .ARVALID_S0(ARVALID_S0),
        // Slaves send
        .ARREADY_S0(ARREADY_S0),

        // Slaves 1 receive
        .ARID_S1(ARID_S1),
        .ARADDR_S1(ARADDR_S1),
        .ARLEN_S1(ARLEN_S1),
        .ARSIZE_S1(ARSIZE_S1),
        .ARBURST_S1(ARBURST_S1),
        .ARVALID_S1(ARVALID_S1),
        // Slaves receive
        .ARREADY_S1(ARREADY_S1),

        // Slave default receive
        .ARID_SDEFAULT(w_ARID_SDEFAULT),
        .ARADDR_SDEFAULT(w_ARADDR_SDEFAULT),
        .ARLEN_SDEFAULT(w_ARLEN_SDEFAULT),
        .ARSIZE_SDEFAULT(w_ARSIZE_SDEFAULT),
        .ARBURST_SDEFAULT(w_ARBURST_SDEFAULT),
        .ARVALID_SDEFAULT(w_ARVALID_SDEFAULT),
        // Slaves default receive
        .ARREADY_SDEFAULT(w_ARREADY_SDEFAULT)
    );
    
    RD uRD (
        .clk(ACLK),    // Clock
        .rst(ARESETn),  // Asynchronous reset active high

        // Master 0 receive
        .RID_M0(RID_M0),
        .RDATA_M0(RDATA_M0),
        .RRESP_M0(RRESP_M0),
        .RLAST_M0(RLAST_M0),
        .RVALID_M0(RVALID_M0),
        // Master 0 send
        .RREADY_M0(RREADY_M0),

        // Master 1 receive
        .RID_M1(RID_M1),
        .RDATA_M1(RDATA_M1),
        .RRESP_M1(RRESP_M1),
        .RLAST_M1(RLAST_M1),
        .RVALID_M1(RVALID_M1),
        // Master 1 send
        .RREADY_M1(RREADY_M1),

        // Slave 0 send
        .RID_S0(RID_S0),
        .RDATA_S0(RDATA_S0),
        .RRESP_S0(RRESP_S0),
        .RLAST_S0(RLAST_S0),
        .RVALID_S0(RVALID_S0),
        // Slave 0 receive
        .RREADY_S0(RREADY_S0),

        // Slave 1 send
        .RID_S1(RID_S1),
        .RDATA_S1(RDATA_S1),
        .RRESP_S1(RRESP_S1),
        .RLAST_S1(RLAST_S1),
        .RVALID_S1(RVALID_S1),
        // Slave 1 receive
        .RREADY_S1(RREADY_S1),

        // Slave default send
        .RID_SDEFAULT(w_RID_SDEFAULT),
        .RDATA_SDEFAULT(w_RDATA_SDEFAULT),
        .RRESP_SDEFAULT(w_RRESP_SDEFAULT),
        .RLAST_SDEFAULT(w_RLAST_SDEFAULT),
        .RVALID_SDEFAULT(w_RVALID_SDEFAULT),
        // Slave defualt receive
        .RREADY_SDEFAULT(w_RREADY_SDEFAULT)
    );

    WA uWA (
        .clk(ACLK),    // Clock
        .rst(ARESETn),  // Asynchronous reset active high

        // Master 1 send, only DM will be write
        .AWID_M1(AWID_M1),
        .AWADDR_M1(AWADDR_M1),
        .AWLEN_M1(AWLEN_M1),
        .AWSIZE_M1(AWSIZE_M1),
        .AWBURST_M1(AWBURST_M1),
        .AWVALID_M1(AWVALID_M1),
        // Master 1 receive
        .AWREADY_M1(AWREADY_M1),

        // Slave 0 receive
        .AWID_S0(AWID_S0),
        .AWADDR_S0(AWADDR_S0),
        .AWLEN_S0(AWLEN_S0),
        .AWSIZE_S0(AWSIZE_S0),
        .AWBURST_S0(AWBURST_S0),
        .AWVALID_S0(AWVALID_S0),
        // Slave 0 send
        .AWREADY_S0(AWREADY_S0),

        // Slave 1 receive
        .AWID_S1(AWID_S1),
        .AWADDR_S1(AWADDR_S1),
        .AWLEN_S1(AWLEN_S1),
        .AWSIZE_S1(AWSIZE_S1),
        .AWBURST_S1(AWBURST_S1),
        .AWVALID_S1(AWVALID_S1),
        // Slave 1 send
        .AWREADY_S1(AWREADY_S1),

        // Slave default receive
        .AWID_SDEFAULT(w_AWID_SDEFAULT),
        .AWADDR_SDEFAULT(w_AWADDR_SDFAULT),
        .AWLEN_SDEFAULT(w_AWLEN_SDEFAULT),
        .AWSIZE_SDEFAULT(w_AWSIZE_SDEFAULT),
        .AWBURST_SDEFAULT(w_AWBURST_SDEFAULT),
        .AWVALID_SDEFAULT(w_AWVALID_SDEFAULT),
        // slave default send
        .AWREADY_SDEFAULT(w_AWREADY_SDEFAULT)
    );

    WD uWD (
        .clk(ACLK),    // Clock
        .rst(ARESETn),  // Asynchronous reset active high

        // master 1 send
        .WDATA_M1(WDATA_M1),
        .WSTRB_M1(WSTRB_M1),
        .WLAST_M1(WLAST_M1),
        .WVALID_M1(WVALID_M1),
        // master 1 receive
        .WREADY_M1(WREADY_M1),

        // slave 0 receive
        .WDATA_S0(WDATA_S0),
        .WSTRB_S0(WSTRB_S0),
        .WLAST_S0(WLAST_S0),
        .WVALID_S0(WVALID_S0),
        // slave 0 send
        .WREADY_S0(WREADY_S0),

        // slave 1 receive
        .WDATA_S1(WDATA_S1),
        .WSTRB_S1(WSTRB_S1),
        .WLAST_S1(WLAST_S1),
        .WVALID_S1(WVALID_S1),
        // slave 0 send
        .WREADY_S1(WREADY_S1),

        // slave default receive
        .WDATA_SDEFAULT(w_WDATA_SDEFAULT),
        .WSTRB_SDEFAULT(w_WSTRB_SDEFAULT),
        .WLAST_SDEFAULT(w_WLAST_SDEFAULT),
        .WVALID_SDEFAULT(w_WVALID_SDEFAULT),
        // slave 0 send
        .WREADY_SDEFAULT(w_WREADY_SDEFAULT),

        .AWVALID_S0(AWVALID_S0),
        .AWVALID_S1(AWVALID_S1),
        .AWVALID_SDEFAULT(w_AWVALID_SDEFAULT)
    );

    WR uWR (
        .clk(ACLK),    // Clock
        .rst(ARESETn),  // Asynchronous reset active high

        // master 1 receive
        .BID_M1(BID_M1),
        .BRESP_M1(BRESP_M1),
        .BVALID_M1(BVALID_M1),
        // master 1 send
        .BREADY_M1(BREADY_M1),

        // slave 0 send
        .BID_S0(BID_S0),
        .BRESP_S0(BRESP_S0),
        .BVALID_S0(BVALID_S0),
        // slave 0 receive
        .BREADY_S0(BREADY_S0),

        // slave 1 send
        .BID_S1(BID_S1),
        .BRESP_S1(BRESP_S1),
        .BVALID_S1(BVALID_S1),
        // slave 0 receive
        .BREADY_S1(BREADY_S1),

        // slave default send
        .BID_SDEFAULT(w_BID_SDEFAULT),
        .BRESP_SDEFAULT(w_BRESP_SDEFAULT),
        .BVALID_SDEFAULT(w_BVALID_SDEFAULT),
        // slave 0 receive
        .BREADY_SDEFAULT(w_BREADY_SDEFAULT)
    );
endmodule
