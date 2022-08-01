// `include "Arbiter.sv"
// `include "Decoder.sv"
// `include "AXI_define.svh"
`include "../../include/AXI_define.svh"
module RA (
    input clk,    // Clock
    input rst,  // Asynchronous reset active high

    // Master_0 send
    input [`AXI_ID_BITS-1:0] ARID_M0,
    input [`AXI_ADDR_BITS-1:0] ARADDR_M0,
    input [`AXI_LEN_BITS-1:0] ARLEN_M0,
    input [`AXI_SIZE_BITS-1:0] ARSIZE_M0,
    input [1:0] ARBURST_M0,
    input ARVALID_M0,
    // Master_0 receive
    output logic ARREADY_M0,

    // Master_1 send
    input [`AXI_ID_BITS-1:0] ARID_M1,
    input [`AXI_ADDR_BITS-1:0] ARADDR_M1,
    input [`AXI_LEN_BITS-1:0] ARLEN_M1,
    input [`AXI_SIZE_BITS-1:0] ARSIZE_M1,
    input [1:0] ARBURST_M1,
    input ARVALID_M1,
    // Master_1 receive
    output logic ARREADY_M1,

    // Slaves 0 receive
    output logic [`AXI_IDS_BITS-1:0] ARID_S0,
    output logic [`AXI_ADDR_BITS-1:0] ARADDR_S0,
    output logic [`AXI_LEN_BITS-1:0] ARLEN_S0,
    output logic [`AXI_SIZE_BITS-1:0] ARSIZE_S0,
    output logic [1:0] ARBURST_S0,
    output logic ARVALID_S0,
    // Slaves send
    input ARREADY_S0,

    // Slaves 1 receive
    output logic [`AXI_IDS_BITS-1:0] ARID_S1,
    output logic [`AXI_ADDR_BITS-1:0] ARADDR_S1,
    output logic [`AXI_LEN_BITS-1:0] ARLEN_S1,
    output logic [`AXI_SIZE_BITS-1:0] ARSIZE_S1,
    output logic [1:0] ARBURST_S1,
    output logic ARVALID_S1,
    // Slaves receive
    input ARREADY_S1,

    // Slaves 2 receive
    output logic [`AXI_IDS_BITS-1:0] ARID_S2,
    output logic [`AXI_ADDR_BITS-1:0] ARADDR_S2,
    output logic [`AXI_LEN_BITS-1:0] ARLEN_S2,
    output logic [`AXI_SIZE_BITS-1:0] ARSIZE_S2,
    output logic [1:0] ARBURST_S2,
    output logic ARVALID_S2,
    // Slaves receive
    input ARREADY_S2,

    // Slaves 3 receive
    output logic [`AXI_IDS_BITS-1:0] ARID_S3,
    output logic [`AXI_ADDR_BITS-1:0] ARADDR_S3,
    output logic [`AXI_LEN_BITS-1:0] ARLEN_S3,
    output logic [`AXI_SIZE_BITS-1:0] ARSIZE_S3,
    output logic [1:0] ARBURST_S3,
    output logic ARVALID_S3,
    // Slaves receive
    input ARREADY_S3,

    // Slaves 4 receive
    output logic [`AXI_IDS_BITS-1:0] ARID_S4,
    output logic [`AXI_ADDR_BITS-1:0] ARADDR_S4,
    output logic [`AXI_LEN_BITS-1:0] ARLEN_S4,
    output logic [`AXI_SIZE_BITS-1:0] ARSIZE_S4,
    output logic [1:0] ARBURST_S4,
    output logic ARVALID_S4,
    // Slaves receive
    input ARREADY_S4,

    // Slave default receive
    output logic [`AXI_IDS_BITS-1:0] ARID_SDEFAULT,
    output logic [`AXI_ADDR_BITS-1:0] ARADDR_SDEFAULT,
    output logic [`AXI_LEN_BITS-1:0] ARLEN_SDEFAULT,
    output logic [`AXI_SIZE_BITS-1:0] ARSIZE_SDEFAULT,
    output logic [1:0] ARBURST_SDEFAULT,
    output logic ARVALID_SDEFAULT,
    // Slaves default receive
    input ARREADY_SDEFAULT
);

    logic [`AXI_IDS_BITS-1:0] IDS_M;
    logic [`AXI_ADDR_BITS-1:0] ADDR_M;
    logic [`AXI_LEN_BITS-1:0] LEN_M;
    logic [`AXI_SIZE_BITS-1:0] SIZE_M;
    logic [1:0] BURST_M;
    logic VALID_M;
    // Max add for solve overflow
    logic tmp_ARVALID_S0;
    logic tmp_ARVALID_S1;
    logic tmp_ARVALID_S2;
    logic tmp_ARVALID_S3;
    logic tmp_ARVALID_S4;
    logic tmp_ARVALID_SDEFAULT;
    logic busy_S0;
    logic busy_S1;
    logic busy_S2;
    logic busy_S3;
    logic busy_S4;
    logic busy_SDEFAULT;
    logic reg_ARREADY_S0;
    logic reg_ARREADY_S1;
    logic reg_ARREADY_S2;
    logic reg_ARREADY_S3;
    logic reg_ARREADY_S4;
    logic reg_ARREADY_SDEFAULT;

    // slave 0 IM
    assign ARID_S0      = IDS_M;
    assign ARADDR_S0    = ADDR_M;
    assign ARLEN_S0     = LEN_M;
    assign ARSIZE_S0    = SIZE_M;
    assign ARBURST_S0   = BURST_M;
    // ARVALID_S0 is already set in Decoder

    // slave 1 DM
    assign ARID_S1      = IDS_M;
    assign ARADDR_S1    = ADDR_M;
    assign ARLEN_S1     = LEN_M;
    assign ARSIZE_S1    = SIZE_M;
    assign ARBURST_S1   = BURST_M;
    // ARVALID_S1 is already set in Decoder

    // slave 2 DM
    assign ARID_S2      = IDS_M;
    assign ARADDR_S2    = ADDR_M;
    assign ARLEN_S2     = LEN_M;
    assign ARSIZE_S2    = SIZE_M;
    assign ARBURST_S2   = BURST_M;

    // slave 3 DM
    assign ARID_S3      = IDS_M;
    assign ARADDR_S3    = ADDR_M;
    assign ARLEN_S3     = LEN_M;
    assign ARSIZE_S3    = SIZE_M;
    assign ARBURST_S3   = BURST_M;

    // slave 4 DM
    assign ARID_S4      = IDS_M;
    assign ARADDR_S4    = ADDR_M;
    assign ARLEN_S4     = LEN_M;
    assign ARSIZE_S4    = SIZE_M;
    assign ARBURST_S4   = BURST_M;

    // slave default
    assign ARID_SDEFAULT = IDS_M;
    assign ARADDR_SDEFAULT = ADDR_M;
    assign ARLEN_SDEFAULT = LEN_M;
    assign ARSIZE_SDEFAULT = SIZE_M;
    assign ARBURST_SDEFAULT = BURST_M;

    logic READY_S;

    // assign busy_S0       = reg_ARREADY_S0 & ~ARREADY_S0;
    // assign busy_S1       = reg_ARREADY_S1 & ~ARREADY_S1;
    // assign busy_S2       = reg_ARREADY_S2 & ~ARREADY_S2;
    // assign busy_S3       = reg_ARREADY_S3 & ~ARREADY_S3;
    // assign busy_S4       = reg_ARREADY_S4 & ~ARREADY_S4;
    // assign busy_SDEFAULT = reg_ARREADY_SDEFAULT & ~ARREADY_SDEFAULT;

    // assign ARVALID_S0       = busy_S0? 1'b0:tmp_ARVALID_S0;
    // assign ARVALID_S1       = busy_S1? 1'b0:tmp_ARVALID_S1;
    // assign ARVALID_S2       = busy_S2? 1'b0:tmp_ARVALID_S2;
    // assign ARVALID_S3       = busy_S3? 1'b0:tmp_ARVALID_S3;
    // assign ARVALID_S4       = busy_S4? 1'b0:tmp_ARVALID_S4;
    // assign ARVALID_SDEFAULT = busy_SDEFAULT? 1'b0:tmp_ARVALID_SDEFAULT;

    // always_ff@(posedge clk or negedge rst) begin
    //     if(~rst) begin
    //         reg_ARREADY_S0       <= 1'b0;
    //         reg_ARREADY_S1       <= 1'b0;
    //         reg_ARREADY_S2       <= 1'b0;
    //         reg_ARREADY_S3       <= 1'b0;
    //         reg_ARREADY_S4       <= 1'b0;
    //         reg_ARREADY_SDEFAULT <= 1'b0;
    //     end else begin
    //         reg_ARREADY_S0       <= ARREADY_S0? 1'b1:reg_ARREADY_S0;
    //         reg_ARREADY_S1       <= ARREADY_S1? 1'b1:reg_ARREADY_S1;
    //         reg_ARREADY_S2       <= ARREADY_S2? 1'b1:reg_ARREADY_S2;
    //         reg_ARREADY_S3       <= ARREADY_S3? 1'b1:reg_ARREADY_S3;
    //         reg_ARREADY_S4       <= ARREADY_S4? 1'b1:reg_ARREADY_S4;
    //         reg_ARREADY_SDEFAULT <= ARREADY_SDEFAULT? 1'b1:reg_ARREADY_SDEFAULT;
    //     end
    // end

    Arbiter uArbiter(
        .clk(clk),
        .rst(rst),
        // from M0
        .ID_M0(ARID_M0),
        .ADDR_M0(ARADDR_M0),
        .LEN_M0(ARLEN_M0),
        .SIZE_M0(ARSIZE_M0),
        .BURST_M0(ARBURST_M0),
        .VALID_M0(ARVALID_M0),

        .READY_M0(ARREADY_M0),

        // from M1
        .ID_M1(ARID_M1),
        .ADDR_M1(ARADDR_M1),
        .LEN_M1(ARLEN_M1),
        .SIZE_M1(ARSIZE_M1),
        .BURST_M1(ARBURST_M1),
        .VALID_M1(ARVALID_M1),

        .READY_M1(ARREADY_M1),

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
        // .VALID_S0(tmp_ARVALID_S0),
        // .VALID_S1(tmp_ARVALID_S1),
        // .VALID_S2(tmp_ARVALID_S2),
        // .VALID_S3(tmp_ARVALID_S3),
        // .VALID_S4(tmp_ARVALID_S4),
        .VALID_S0(ARVALID_S0),
        .VALID_S1(ARVALID_S1),
        .VALID_S2(ARVALID_S2),
        .VALID_S3(ARVALID_S3),
        .VALID_S4(ARVALID_S4),
        .VALID_SDEFAULT(tmp_ARVALID_SDEFAULT), // not define
        .READY_S0(ARREADY_S0),
        .READY_S1(ARREADY_S1),
        .READY_S2(ARREADY_S2),
        .READY_S3(ARREADY_S3),
        .READY_S4(ARREADY_S4),
        .READY_SDEFAULT(ARREADY_SDEFAULT), // not define
        .READY_S(READY_S)
    );

endmodule : RA
