module HazardCtrl (
    input [1:0] BranchCtrl,
    input ID_MemRead,
    input [4:0] ID_rd_addr,
    input [4:0] rs1_addr,
    input [4:0] rs2_addr,

    output reg InstrFlush,
    output reg CtrlSignalFlush,
    output reg IFID_RegWrite,
    output reg PCWrite
);
  localparam [1:0] PC4 = 2'b00, PCIMM = 2'b01, IMMRS1 = 2'b10;

  always_comb begin
    if (BranchCtrl != PC4) begin
      InstrFlush      = 1'b1; // let second instruction which is after branch instruction become NOP
      CtrlSignalFlush = 1'b1; // let first instruction which is after branch instruction become NOP
      IFID_RegWrite = 1'b1;
      PCWrite = 1'b1;
    end
        else if (ID_MemRead && ((ID_rd_addr == rs1_addr) || (ID_rd_addr == rs2_addr))) begin // load use
      InstrFlush = 1'b0;
      CtrlSignalFlush = 1'b1; // let the first instruction which after the lw instruction become NOP
      IFID_RegWrite   = 1'b0; // keep first instruction which after the lw instruction
      PCWrite         = 1'b0; // keep second instruction address which after the lw instruction
    end else begin
      InstrFlush      = 1'b0;
      CtrlSignalFlush = 1'b0;
      IFID_RegWrite   = 1'b1;
      PCWrite         = 1'b1;
    end
  end

endmodule : HazardCtrl
