// `include "AXI_define.svh"
`include "../../include/AXI_define.svh"
module RD (

    input clk,
    input rst,
    // Master 0 receive
    output [`AXI_ID_BITS  -1:0] RID_M0,
    output [`AXI_DATA_BITS-1:0] RDATA_M0,
    output [1:0] RRESP_M0,
    output logic RLAST_M0,
    output logic RVALID_M0,
    // Master 0 send
    input RREADY_M0,

    // Master 1 receive
    output [`AXI_ID_BITS  -1:0] RID_M1,
    output [`AXI_DATA_BITS-1:0] RDATA_M1,
    output [1:0] RRESP_M1,
    output logic RLAST_M1,
    output logic RVALID_M1,
    // Master 1 send
    input RREADY_M1,

    // Slave 0 send
    input [`AXI_IDS_BITS -1:0] RID_S0,
    input [`AXI_DATA_BITS-1:0] RDATA_S0,
    input [1:0] RRESP_S0,
    input RLAST_S0,
    input RVALID_S0,
    // Slave 0 receive
    output logic RREADY_S0,

    // slave 1 send
    input [`AXI_IDS_BITS -1:0] RID_S1,
    input [`AXI_DATA_BITS-1:0] RDATA_S1,
    input [1:0] RRESP_S1,
    input RLAST_S1,
    input RVALID_S1,
    // slave 1 receive
    output logic RREADY_S1,

    // slave 2 send
    input [`AXI_IDS_BITS -1:0] RID_S2,
    input [`AXI_DATA_BITS-1:0] RDATA_S2,
    input [1:0] RRESP_S2,
    input RLAST_S2,
    input RVALID_S2,
    // slave 2 receive
    output logic RREADY_S2,

    // slave 3 send
    input [`AXI_IDS_BITS -1:0] RID_S3,
    input [`AXI_DATA_BITS-1:0] RDATA_S3,
    input [1:0] RRESP_S3,
    input RLAST_S3,
    input RVALID_S3,
    // slave 3 receive
    output logic RREADY_S3,

    // slave 4 send
    input [`AXI_IDS_BITS -1:0] RID_S4,
    input [`AXI_DATA_BITS-1:0] RDATA_S4,
    input [1:0] RRESP_S4,
    input RLAST_S4,
    input RVALID_S4,
    // slave 4 receive
    output logic RREADY_S4,

    // slave default send
    input [`AXI_IDS_BITS -1:0] RID_SDEFAULT,
    input [`AXI_DATA_BITS-1:0] RDATA_SDEFAULT,
    input [1:0] RRESP_SDEFAULT,
    input RLAST_SDEFAULT,
    input RVALID_SDEFAULT,
    // slave default receive
    output logic RREADY_SDEFAULT
);

    logic [5:0] slave;
    logic [1:0] master;

    // S
    logic [`AXI_IDS_BITS -1:0] RID_S;
    logic [`AXI_DATA_BITS-1:0] RDATA_S;
    logic [1:0] RRESP_S;
    logic RLAST_S;
    logic RVALID_S;
    // M
    logic READY_M;

    logic lock_s0;
    logic lock_s1;
    logic lock_s2;
    logic lock_s3;
    logic lock_s4;
    logic lock_sdefault;

    // M0
    assign RID_M0   = RID_S[`AXI_ID_BITS-1:0];
    assign RDATA_M0 = RDATA_S;
    assign RRESP_M0 = RRESP_S;
    assign RLAST_M0 = RLAST_S;
    // M1
    assign RID_M1   = RID_S[`AXI_ID_BITS-1:0];
    assign RDATA_M1 = RDATA_S;
    assign RRESP_M1 = RRESP_S;
    assign RLAST_M1 = RLAST_S;

    always_ff@(posedge clk or negedge rst) begin
        if(~rst) begin
            lock_s0 <= 1'b0;
            lock_s1 <= 1'b0;
            lock_s2 <= 1'b0;
            lock_s3 <= 1'b0;
            lock_s4 <= 1'b0;
            lock_sdefault <= 1'b0;
        end
        else begin
            lock_s0       <= (/*lock_s0 &*/ READY_M & RLAST_S0)?             1'b0 : (RVALID_S0 & ~RVALID_S1 & ~RVALID_S2 & ~RVALID_S3 & ~RVALID_S4 & ~RVALID_SDEFAULT /*& ~READY_M*/) ? 1'b1 : lock_s0;
            lock_s1       <= (/*lock_s1 &*/ READY_M & RLAST_S1)?             1'b0 : (~lock_s0  &  RVALID_S1 & ~RVALID_S2 & ~RVALID_S3 & ~RVALID_S4 & ~RVALID_SDEFAULT /*& ~READY_M*/) ? 1'b1 : lock_s1;
            lock_s2       <= (/*lock_s2 &*/ READY_M & RLAST_S2)?             1'b0 : (~lock_s0  & ~lock_s1   & RVALID_S2  & ~RVALID_S3 & ~RVALID_S4 & ~RVALID_SDEFAULT /*& ~READY_M*/) ? 1'b1 : lock_s2;
            lock_s3       <= (/*lock_s3 &*/ READY_M & RLAST_S3)?             1'b0 : (~lock_s0  & ~lock_s1   & ~lock_s2   & RVALID_S3  & ~RVALID_S4 & ~RVALID_SDEFAULT /*& ~READY_M*/) ? 1'b1 : lock_s3;
            lock_s4       <= (/*lock_s3 &*/ READY_M & RLAST_S4)?             1'b0 : (~lock_s0  & ~lock_s1   & ~lock_s2   & ~lock_s3   & RVALID_S4  & ~RVALID_SDEFAULT /*& ~READY_M*/) ? 1'b1 : lock_s4;
            lock_sdefault <= (/*lock_sdefault &*/ READY_M & RLAST_SDEFAULT)? 1'b0 : (~lock_s0  & ~lock_s1   & ~lock_s2   & ~lock_s3   & ~lock_s4   & RVALID_SDEFAULT  /*& ~READY_M*/) ? 1'b1 : lock_sdefault;
        end
    end

    always_comb begin
        if((RVALID_SDEFAULT & ~(lock_s4 | lock_s3 | lock_s2 | lock_s1 | lock_s0)) | lock_sdefault) slave = 6'b100000;
        else if ((RVALID_S4 & ~(lock_s3 | lock_s2 | lock_s1 | lock_s0)) | lock_s4) slave = 6'b010000;
        else if ((RVALID_S3 & ~(lock_s2 | lock_s1 | lock_s0)) | lock_s3) slave = 6'b001000;
        else if ((RVALID_S2 & ~(lock_s1 | lock_s0)) | lock_s2) slave = 6'b000100;
        else if ((RVALID_S1 & ~lock_s0) | lock_s1) slave = 6'b000010;
        else if (RVALID_S0 | lock_s0) slave = 6'b000001;
        else slave = 6'b0;
        
        /*
        if(lock_sdefault)
            slave = 3'b100;
        else if(lock_s1)
            slave = 3'b010;
        else if(lock_s0)
            slave = 3'b001;
        else
            slave = 3'b000;
        */
    end

    always_comb begin
        case(master)
            2'b01: begin
                READY_M = RREADY_M0;
                {RVALID_M1, RVALID_M0} = {1'b0, RVALID_S};
            end
            2'b10: begin
                READY_M = RREADY_M1;
                {RVALID_M1, RVALID_M0} = {RVALID_S, 1'b0};
            end
            default: begin
                READY_M = 1'b1;
                {RVALID_M1, RVALID_M0} = 2'b0;
            end
        endcase
    end

    always_comb begin
        case (slave)
            6'b000001 : begin
                master = RID_S0[5:4];
                RID_S = RID_S0;
                RDATA_S = RDATA_S0;
                RRESP_S = RRESP_S0;
                RLAST_S = RLAST_S0;
                RVALID_S = RVALID_S0;

                {RREADY_SDEFAULT, RREADY_S4, RREADY_S3, RREADY_S2, RREADY_S1, RREADY_S0} = {5'b0, READY_M & RVALID_S0};
            end
            6'b000010 : begin
                master = RID_S1[5:4];
                RID_S = RID_S1;
                RDATA_S = RDATA_S1;
                RRESP_S = RRESP_S1;
                RLAST_S = RLAST_S1;
                RVALID_S = RVALID_S1;

                {RREADY_SDEFAULT, RREADY_S4, RREADY_S3, RREADY_S2, RREADY_S1, RREADY_S0} = {4'b0, READY_M & RVALID_S1, 1'b0};
            end
            6'b000100: begin
                master = RID_S2[5:4];
                RID_S = RID_S2;
                RDATA_S = RDATA_S2;
                RRESP_S = RRESP_S2;
                RLAST_S = RLAST_S2;
                RVALID_S = RVALID_S2;

                {RREADY_SDEFAULT, RREADY_S4, RREADY_S3, RREADY_S2, RREADY_S1, RREADY_S0} = {3'b0, READY_M & RVALID_S2, 2'b0};
            end
            6'b001000: begin
                master = RID_S3[5:4];
                RID_S = RID_S3;
                RDATA_S = RDATA_S3;
                RRESP_S = RRESP_S3;
                RLAST_S = RLAST_S3;
                RVALID_S = RVALID_S3;

                {RREADY_SDEFAULT, RREADY_S4, RREADY_S3, RREADY_S2, RREADY_S1, RREADY_S0} = {2'b0, READY_M & RVALID_S3, 3'b0};
            end
            6'b010000: begin
                master = RID_S4[5:4];
                RID_S = RID_S4;
                RDATA_S = RDATA_S4;
                RRESP_S = RRESP_S4;
                RLAST_S = RLAST_S4;
                RVALID_S = RVALID_S4;

                {RREADY_SDEFAULT, RREADY_S4, RREADY_S3, RREADY_S2, RREADY_S1, RREADY_S0} = {1'b0, READY_M & RVALID_S4, 4'b0};
            end
            6'b100000 : begin
                master = RID_SDEFAULT[5:4];
                RID_S = RID_SDEFAULT;
                RDATA_S = RDATA_SDEFAULT;
                RRESP_S = RRESP_SDEFAULT;
                RLAST_S = RLAST_SDEFAULT;
                RVALID_S = RVALID_SDEFAULT;

                {RREADY_SDEFAULT, RREADY_S4, RREADY_S3, RREADY_S2, RREADY_S1, RREADY_S0} = {READY_M & RVALID_SDEFAULT, 5'b0};
            end
            default: begin
                master = 2'b0;
                RID_S = `AXI_IDS_BITS'b0;
                RDATA_S = `AXI_DATA_BITS'b0;
                RRESP_S = 2'b0;
                RLAST_S = 1'b0;
                RVALID_S = 1'b0;

                {RREADY_SDEFAULT, RREADY_S4, RREADY_S3, RREADY_S2, RREADY_S1, RREADY_S0} = 6'b0;
            end
        endcase
    end

endmodule
