// `include "AXI_define.svh"
`include "../../include/AXI_define.svh"
module WR (
    input clk,    // Clock
    input rst,  // Asynchronous reset active high

    // master 1 receive
    output logic [`AXI_ID_BITS-1:0] BID_M1,
    output logic [1:0] BRESP_M1,
    output logic BVALID_M1,
    // master 1 send
    input BREADY_M1,

    // slave 0 send
    input [`AXI_IDS_BITS-1:0] BID_S0,
    input [1:0] BRESP_S0,
    input BVALID_S0,
    // slave 0 receive
    output logic BREADY_S0,

    // slave 1 send
    input [`AXI_IDS_BITS-1:0] BID_S1,
    input [1:0] BRESP_S1,
    input BVALID_S1,
    // slave 1 receive
    output logic BREADY_S1,

    // slave 2 send
    input [`AXI_IDS_BITS-1:0] BID_S2,
    input [1:0] BRESP_S2,
    input BVALID_S2,
    // slave 2 receive
    output logic BREADY_S2,

    // slave 3 send
    input [`AXI_IDS_BITS-1:0] BID_S3,
    input [1:0] BRESP_S3,
    input BVALID_S3,
    // slave 3 receive
    output logic BREADY_S3,

    // slave 4 send
    input [`AXI_IDS_BITS-1:0] BID_S4,
    input [1:0] BRESP_S4,
    input BVALID_S4,
    // slave 4 receive
    output logic BREADY_S4,

    // slave default send
    input [`AXI_IDS_BITS-1:0] BID_SDEFAULT,
    input [1:0] BRESP_SDEFAULT,
    input BVALID_SDEFAULT,
    // slave 0 receive
    output logic BREADY_SDEFAULT
);
    logic [5:0] slave;

    logic [`AXI_ID_BITS-1:0] BID_M;
    logic [1:0] BRESP_M;
    logic BVALID_M;

    assign BID_M1 = BID_M;
    assign BRESP_M1 = BRESP_M;

    logic [1:0] master;

    logic READY;

    // logic lock_S0, lock_S1, lock_S2, lock_S3, lock_SDEFAULT;
    // always_ff @(posedge clk or negedge rst) begin
    //     if(~rst) begin
    //         lock_S0 <= 1'b0;
    //         lock_S1 <= 1'b0;
    //         lock_S2 <= 1'b0;
    //         lock_S3 <= 1'b0;
    //         lock_SDEFAULT <= 1'b0;
    //     end else begin
    //         lock_S0 <= (lock_S0 & READY)? 1'b0:(BVALID_S0 & ~BVALID_S1 & ~BVALID_S2 & ~BVALID_S3 & ~BVALID_SDEFAULT & ~READY)? 1'b1:lock_S0;
    //         lock_S1 <= (lock_S1 & READY)? 1'b0:(~lock_S0  & BVALID_S1  & ~BVALID_S2 & ~BVALID_S3 & ~BVALID_SDEFAULT & ~READY)? 1'b1:lock_S1;
    //         lock_S2 <= (lock_S2 & READY)? 1'b0:(~lock_S0  & ~lock_S1   & BVALID_S2  & ~BVALID_S3 & ~BVALID_SDEFAULT & ~READY)? 1'b1:lock_S2;
    //         lock_S3 <= (lock_S3 & READY)? 1'b0:(~lock_S0  & ~lock_S1   & ~lock_S2   & BVALID_S3  & ~BVALID_SDEFAULT & ~READY)? 1'b1:lock_S3;
    //         lock_SDEFAULT <= (lock_SDEFAULT & READY)? 1'b0:(~lock_S0 & ~lock_S1 & ~lock_S2 & ~lock_S3 & BVALID_SDEFAULT & ~READY)? 1'b1:lock_SDEFAULT;
    //     end
    // end

    // always_comb begin
    //     if((BVALID_SDEFAULT & ~(lock_S3 | lock_S2 | lock_S1 | lock_S0)) | lock_SDEFAULT)
    //         slave = 5'b10000;
    //     else if((BVALID_S3 & ~(lock_S2 | lock_S1 | lock_S0)) | lock_S3)
    //         slave = 5'b01000;
    //     else if((BVALID_S2 & ~(lock_S1 | lock_S0)) | lock_S2)
    //         slave = 5'b00100;
    //     else if((BVALID_S1 & ~lock_S0)| lock_S1)
    //         slave = 5'b00010;
    //     else if (BVALID_S0 | lock_S0)
    //         slave = 5'b00001;
    //     else
    //         slave = 5'b0;
    // end

    // always_comb begin
    //     if(BVALID_SDEFAULT)
    //         slave = 3'b100;
    //     else if(BVALID_S1)
    //         slave = 3'b010;
    //     else if(BVALID_S0)
    //         slave = 3'b001;
    //     else
    //         slave = 3'b000;
    // end

    always_comb begin
        if(BVALID_SDEFAULT)
            slave = 6'b100000;
        else if(BVALID_S4)
            slave = 6'b010000;
        else if(BVALID_S3)
            slave = 6'b001000;
        else if(BVALID_S2)
            slave = 6'b000100;
        else if(BVALID_S1)
            slave = 6'b000010;
        else if(BVALID_S0)
            slave = 6'b000001;
        else
            slave = 6'b000000;
    end

    always_comb begin
        case(master)
            2'b10: begin
                READY = BREADY_M1;
                BVALID_M1 = BVALID_M;
            end
            default: begin
                READY = 1'b1;
                BVALID_M1 = 1'b0;
            end
        endcase
    end

    // assign slave = {BVALID_S0, BVALID_S1, BVALID_SDEFAULT};

    always_comb begin
        case(slave)
            6'b000001: begin
                master = BID_S0[5:4];
                BID_M = BID_S0[`AXI_ID_BITS-1:0];
                BRESP_M = BRESP_S0;
                BVALID_M = BVALID_S0;
                {BREADY_SDEFAULT, BREADY_S4, BREADY_S3, BREADY_S2, BREADY_S1, BREADY_S0} = {5'b0, READY & BVALID_S0};
            end
            6'b000010: begin
                master = BID_S1[5:4];
                BID_M = BID_S1[`AXI_ID_BITS-1:0];
                BRESP_M = BRESP_S1;
                BVALID_M = BVALID_S1;
                {BREADY_SDEFAULT, BREADY_S4, BREADY_S3, BREADY_S2, BREADY_S1, BREADY_S0} = {4'b0, READY & BVALID_S1, 1'b0};
            end
            6'b000100: begin
                master = BID_S2[5:4];
                BID_M = BID_S2[`AXI_ID_BITS-1:0];
                BRESP_M = BRESP_S2;
                BVALID_M = BVALID_S2;
                {BREADY_SDEFAULT, BREADY_S4, BREADY_S3, BREADY_S2, BREADY_S1, BREADY_S0} = {3'b0, READY & BVALID_S2, 2'b0};
            end
            6'b001000: begin
                master = BID_S3[5:4];
                BID_M = BID_S3[`AXI_ID_BITS-1:0];
                BRESP_M = BRESP_S3;
                BVALID_M = BVALID_S3;
                {BREADY_SDEFAULT, BREADY_S4, BREADY_S3, BREADY_S2, BREADY_S1, BREADY_S0} = {2'b0, READY & BVALID_S3, 3'b0};
            end
            6'b010000: begin
                master = BID_S4[5:4];
                BID_M = BID_S4[`AXI_ID_BITS-1:0];
                BRESP_M = BRESP_S4;
                BVALID_M = BVALID_S4;
                {BREADY_SDEFAULT, BREADY_S4, BREADY_S3, BREADY_S2, BREADY_S1, BREADY_S0} = {1'b0, READY & BVALID_S4, 4'b0};
            end
            6'b100000: begin
                master = BID_SDEFAULT[5:4];
                BID_M = BID_SDEFAULT[`AXI_ID_BITS-1:0];
                BRESP_M = BRESP_SDEFAULT;
                BVALID_M = BVALID_SDEFAULT;
                {BREADY_SDEFAULT, BREADY_S4, BREADY_S3, BREADY_S2, BREADY_S1, BREADY_S0} = {READY & BVALID_SDEFAULT, 5'b0};
            end
            default: begin
                master = 2'b0;
                BID_M = `AXI_ID_BITS'b0;
                BRESP_M = 2'b0;
                BVALID_M = 1'b0;
                {BREADY_SDEFAULT, BREADY_S4, BREADY_S3, BREADY_S2, BREADY_S1, BREADY_S0} = 6'b0;
            end
        endcase // slave
    end

endmodule : WR
