// `include "AXI_define.svh"
`include "../../include/AXI_define.svh"
module Decoder (
    // VALID
    input VALID,
    input [`AXI_ADDR_BITS-1:0] ADDR,
    output logic VALID_S0,
    output logic VALID_S1,
    output logic VALID_S2,
    output logic VALID_S3,
    output logic VALID_S4,
    output logic VALID_SDEFAULT,

    // READY
    input READY_S0,
    input READY_S1,
    input READY_S2,
    input READY_S3,
    input READY_S4,
    input READY_SDEFAULT,
    output logic READY_S
);
    always_comb begin
        if(ADDR >= `AXI_ADDR_BITS'h0 && ADDR <= `AXI_ADDR_BITS'h1fff) begin
            {VALID_SDEFAULT, VALID_S4, VALID_S3, VALID_S2, VALID_S1, VALID_S0} = {5'b0, VALID};
            READY_S = (VALID)? READY_S0:1'b1;
        end
        else if(ADDR >= `AXI_ADDR_BITS'h10000 && ADDR <= `AXI_ADDR_BITS'h1ffff) begin
            {VALID_SDEFAULT, VALID_S4, VALID_S3, VALID_S2, VALID_S1, VALID_S0} = {4'b0, VALID, 1'b0};
            READY_S = (VALID)? READY_S1:1'b1;
        end
        else if(ADDR >= `AXI_ADDR_BITS'h20000 && ADDR <= `AXI_ADDR_BITS'h2ffff) begin
            {VALID_SDEFAULT, VALID_S4, VALID_S3, VALID_S2, VALID_S1, VALID_S0} = {3'b0, VALID, 2'b0};
            READY_S = (VALID)? READY_S2:1'b1;
        end
        else if(ADDR >= `AXI_ADDR_BITS'h10000000 && ADDR <= `AXI_ADDR_BITS'h100003ff) begin
            {VALID_SDEFAULT, VALID_S4, VALID_S3, VALID_S2, VALID_S1, VALID_S0} = {2'b0, VALID, 3'b0};
            READY_S = (VALID)? READY_S3:1'b1;
        end
        else if(ADDR >= `AXI_ADDR_BITS'h20000000 && ADDR <= `AXI_ADDR_BITS'h201fffff) begin
            {VALID_SDEFAULT, VALID_S4, VALID_S3, VALID_S2, VALID_S1, VALID_S0} = {1'b0, VALID, 4'b0};
            READY_S = (VALID)? READY_S4:1'b1;
        end
        else begin
            {VALID_SDEFAULT, VALID_S4, VALID_S3, VALID_S2, VALID_S1, VALID_S0} = {VALID, 5'b0};
            READY_S = (VALID)? READY_SDEFAULT:1'b1;
        end

        // case(ADDR[31:16])
        //     16'h0000: begin
        //         {VALID_SDEFAULT, VALID_S1, VALID_S0} = {2'b0, VALID};
        //         READY_S = (VALID)? READY_S0:1'b1;
        //     end
        //     16'h0001: begin
        //         {VALID_SDEFAULT, VALID_S1, VALID_S0} = {1'b0, VALID, 1'b0};
        //         READY_S = (VALID)? READY_S1:1'b1;
        //     end
        //     default: begin
        //         {VALID_SDEFAULT, VALID_S1, VALID_S0} = {VALID, 2'b0};
        //         READY_S = (VALID)? READY_SDEFAULT:1'b1;
        //     end
        // endcase // ADDR
    end
endmodule : Decoder
