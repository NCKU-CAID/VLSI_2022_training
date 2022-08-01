module HazardCtrl (
    input [1:0] BranchCtrl,
    input ID_MemRead,
    input [4:0] ID_rd_addr,
    input [4:0] rs1_addr,
    input [4:0] rs2_addr,

    output reg InstrFlush,
    output reg CtrlSignalFlush,
    output reg IFID_RegWrite,
    output reg PCWrite,

    input IM_stall,
    output reg IDEXE_RegWrite,
    input DM_stall,
    output reg EXEMEM_RegWrite,
    output reg MEMWB_RegWrite
);
    localparam [1:0] PC4    = 2'b00,
                     PCIMM  = 2'b01,
                     IMMRS1 = 2'b10;

    always_comb begin
        /*if (DM_stall) begin // 0726 Max modify, Hazard priority changed.
            InstrFlush      = 1'b0;
            CtrlSignalFlush = 1'b0;
            IFID_RegWrite   = 1'b0;
            PCWrite         = 1'b0;
            IDEXE_RegWrite  = 1'b0;
            EXEMEM_RegWrite = 1'b0;
            MEMWB_RegWrite  = 1'b0;
        end
        else */
        if (IM_stall | DM_stall) begin
            InstrFlush      = 1'b0;
            CtrlSignalFlush = 1'b0;
            IFID_RegWrite   = 1'b0;
            PCWrite         = 1'b0;
            IDEXE_RegWrite  = 1'b0;
            EXEMEM_RegWrite = 1'b0;
            MEMWB_RegWrite  = 1'b0;
        end
        else if(BranchCtrl != PC4) begin
            InstrFlush      = 1'b1; // let second instruction which is after branch instruction become NOP
            CtrlSignalFlush = 1'b1; // let first instruction which is after branch instruction become NOP
            IFID_RegWrite   = 1'b1;
            PCWrite         = 1'b1;
            IDEXE_RegWrite  = 1'b1;
            EXEMEM_RegWrite = 1'b1;
            MEMWB_RegWrite  = 1'b1;
        end
        else if (ID_MemRead && ((ID_rd_addr == rs1_addr) || (ID_rd_addr == rs2_addr))) begin // load use
            InstrFlush      = 1'b0;
            CtrlSignalFlush = 1'b1; // let the first instruction which after the lw instruction become NOP
            IFID_RegWrite   = 1'b0; // keep first instruction which after the lw instruction
            PCWrite         = 1'b0; // keep second instruction address which after the lw instruction
            IDEXE_RegWrite  = 1'b1;
            EXEMEM_RegWrite = 1'b1;
            MEMWB_RegWrite  = 1'b1;
        end
        else begin
            InstrFlush      = 1'b0;
            CtrlSignalFlush = 1'b0;
            IFID_RegWrite   = 1'b1;
            PCWrite         = 1'b1;
            IDEXE_RegWrite  = 1'b1;
            EXEMEM_RegWrite = 1'b1;
            MEMWB_RegWrite  = 1'b1;
        end
    end

endmodule : HazardCtrl
