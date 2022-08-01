`include "ProgramCounter.sv"
module IFE (
    input clk,  // Clock
    input rst,
    input [1:0] BranchCtrl,
    input [31:0] pc_imm,
    input [31:0] pc_immrs1,

    input InstrFlush,
    input IFID_RegWrite,

    input PCWrite,

    input [31:0] instr_out,

    output reg [31:0] IF_pc_out,
    output reg [31:0] IF_instr_out,

    output [31:0] pc_out
);
  localparam [1:0] PC4 = 2'b00, PCIMM = 2'b01, IMMRS1 = 2'b10;

  reg  [31:0] pc_in;
  reg  [31:0] wire_pc_out;
  wire [31:0] pc_4;

  assign pc_4   = wire_pc_out + 32'd4;

  assign pc_out = wire_pc_out;

  always_comb begin
    case (BranchCtrl)
      PCIMM:   pc_in = pc_imm;
      IMMRS1:  pc_in = pc_immrs1;  // imm_rs1
      default: pc_in = pc_4;  // PC4
    endcase
  end

  ProgramCounter ProgramCounter (
      .clk(clk),
      .rst(rst),
      .pc_in(pc_in),
      .PCWrite(PCWrite),
      .pc_out(wire_pc_out)
  );

  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      IF_pc_out    <= 32'b0;
      IF_instr_out <= 32'b0;
    end else begin
      if (IFID_RegWrite) begin
        IF_pc_out <= wire_pc_out;

        if (InstrFlush) IF_instr_out <= 32'b0;
        else IF_instr_out <= instr_out;
      end
    end
  end

endmodule : IFE
