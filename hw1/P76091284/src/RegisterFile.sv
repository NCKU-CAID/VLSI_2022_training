module RegisterFile (
    input clk,  // Clock
    input rst,
    input RegWrite,
    input [4:0] rs1_addr,
    input [4:0] rs2_addr,
    input [4:0] WB_rd_addr,
    input [31:0] WB_rd_data,

    output [31:0] RS1Data,
    output [31:0] RS2Data
);

  reg [31:0] register[31:0];

  assign RS1Data = register[rs1_addr];
  assign RS2Data = register[rs2_addr];

  integer i;
  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      for (int i = 0; i < 32; i++) begin
        register[i] <= 32'b0;
      end
    end else begin
      if (RegWrite && (WB_rd_addr != 5'b0)) register[WB_rd_addr] <= WB_rd_data;
    end
  end
endmodule  // RegisterFile
