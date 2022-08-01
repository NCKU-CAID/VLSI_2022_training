// `include "Arbiter.sv"
// `include "Decoder.sv"
// `include "AXI_define.svh"
`include "../../include/AXI_define.svh"
module WA (
    input clk,    // Clock
    input rst,  // Asynchronous reset active high

    // Master 1 send, only DM will be write
    input [`AXI_ID_BITS-1:0] AWID_M1,
    input [`AXI_ADDR_BITS-1:0] AWADDR_M1,
    input [`AXI_LEN_BITS-1:0] AWLEN_M1,
    input [`AXI_SIZE_BITS-1:0] AWSIZE_M1,
    input [1:0] AWBURST_M1,
    input AWVALID_M1,
    // Master 1 receive
    output logic AWREADY_M1,

    // Slave 0 receive
    output logic [`AXI_IDS_BITS-1:0] AWID_S0,
    output logic [`AXI_ADDR_BITS-1:0] AWADDR_S0,
    output logic [`AXI_LEN_BITS-1:0] AWLEN_S0,
    output logic [`AXI_SIZE_BITS-1:0] AWSIZE_S0,
    output logic [1:0] AWBURST_S0,
    output logic AWVALID_S0,
    // Slave 0 send
    input AWREADY_S0,

    // Slave 1 receive
    output logic [`AXI_IDS_BITS-1:0] AWID_S1,
    output logic [`AXI_ADDR_BITS-1:0] AWADDR_S1,
    output logic [`AXI_LEN_BITS-1:0] AWLEN_S1,
    output logic [`AXI_SIZE_BITS-1:0] AWSIZE_S1,
    output logic [1:0] AWBURST_S1,
    output logic AWVALID_S1,
    // Slave 1 send
    input AWREADY_S1,

    // Slave 2 receive
    output logic [`AXI_IDS_BITS-1:0] AWID_S2,
    output logic [`AXI_ADDR_BITS-1:0] AWADDR_S2,
    output logic [`AXI_LEN_BITS-1:0] AWLEN_S2,
    output logic [`AXI_SIZE_BITS-1:0] AWSIZE_S2,
    output logic [1:0] AWBURST_S2,
    output logic AWVALID_S2,
    // Slave 2 send
    input AWREADY_S2,

    // Slave 3 receive
    output logic [`AXI_IDS_BITS-1:0] AWID_S3,
    output logic [`AXI_ADDR_BITS-1:0] AWADDR_S3,
    output logic [`AXI_LEN_BITS-1:0] AWLEN_S3,
    output logic [`AXI_SIZE_BITS-1:0] AWSIZE_S3,
    output logic [1:0] AWBURST_S3,
    output logic AWVALID_S3,
    // Slave 3 send
    input AWREADY_S3,

    // Slave default receive
    output logic [`AXI_IDS_BITS-1:0] AWID_SDEFAULT,
    output logic [`AXI_ADDR_BITS-1:0] AWADDR_SDEFAULT,
    output logic [`AXI_LEN_BITS-1:0] AWLEN_SDEFAULT,
    output logic [`AXI_SIZE_BITS-1:0] AWSIZE_SDEFAULT,
    output logic [1:0] AWBURST_SDEFAULT,
    output logic AWVALID_SDEFAULT,
    // slave default send
    input AWREADY_SDEFAULT
);

    logic [`AXI_IDS_BITS-1:0] IDS_M;
    logic [`AXI_ADDR_BITS-1:0] ADDR_M;
    logic [`AXI_LEN_BITS-1:0] LEN_M;
    logic [`AXI_SIZE_BITS-1:0] SIZE_M;
    logic [1:0] BURST_M;
    logic VALID_M;

    // slave 0 IM
    assign AWID_S0      = IDS_M;
    assign AWADDR_S0    = ADDR_M;
    assign AWLEN_S0     = LEN_M;
    assign AWSIZE_S0    = SIZE_M;
    assign AWBURST_S0   = BURST_M;

    // slave 1 DM
    assign AWID_S1      = IDS_M;
    assign AWADDR_S1    = ADDR_M;
    assign AWLEN_S1     = LEN_M;
    assign AWSIZE_S1    = SIZE_M;
    assign AWBURST_S1   = BURST_M;

    // slave 2 DM
    assign AWID_S2      = IDS_M;
    assign AWADDR_S2    = ADDR_M;
    assign AWLEN_S2     = LEN_M;
    assign AWSIZE_S2    = SIZE_M;
    assign AWBURST_S2   = BURST_M;

    // slave 3 DM
    assign AWID_S3      = IDS_M;
    assign AWADDR_S3    = ADDR_M;
    assign AWLEN_S3     = LEN_M;
    assign AWSIZE_S3    = SIZE_M;
    assign AWBURST_S3   = BURST_M;

    // slave default
    assign AWID_SDEFAULT    = IDS_M;
    assign AWADDR_SDEFAULT  = ADDR_M;
    assign AWLEN_SDEFAULT   = LEN_M;
    assign AWSIZE_SDEFAULT  = SIZE_M;
    assign AWBURST_SDEFAULT = BURST_M;

    logic READY_S;

    logic ARREADY_M0;

    Arbiter uArbiter(
        .clk(clk),
        .rst(rst),
        // from M0
        .ID_M0(`AXI_ID_BITS'b0),
        .ADDR_M0(`AXI_ADDR_BITS'b0),
        .LEN_M0(`AXI_LEN_BITS'b0),
        .SIZE_M0(`AXI_SIZE_BITS'b0),
        .BURST_M0(2'b0),
        .VALID_M0(1'b0),

        .READY_M0(ARREADY_M0), // Because READY_M0 doesn't exist
        // from M1
        .ID_M1(AWID_M1),
        .ADDR_M1(AWADDR_M1),
        .LEN_M1(AWLEN_M1),
        .SIZE_M1(AWSIZE_M1),
        .BURST_M1(AWBURST_M1),
        .VALID_M1(AWVALID_M1),

        .READY_M1(AWREADY_M1),

        // to slaves
        .IDS_M(IDS_M),
        .ADDR_M(ADDR_M),
        .LEN_M(LEN_M),
        .SIZE_M(SIZE_M),
        .BURST_M(BURST_M),
        .VALID_M(VALID_M),

        .READY_M(READY_S)
    );

    Decoder uDecoder(
        .VALID(VALID_M),
        .ADDR(ADDR_M),
        .VALID_S0(AWVALID_S0),
        .VALID_S1(AWVALID_S1),
        .VALID_S2(AWVALID_S2),
        .VALID_S3(AWVALID_S3),
        .VALID_SDEFAULT(AWVALID_SDEFAULT), // not define
        .READY_S0(AWREADY_S0),
        .READY_S1(AWREADY_S1),
        .READY_S2(AWREADY_S2),
        .READY_S3(AWREADY_S3),
        .READY_SDEFAULT(AWREADY_SDEFAULT), // not define
        .READY_S(READY_S)
    );

endmodule : WA
