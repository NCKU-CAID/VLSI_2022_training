module ProgramCounter (
    input clk,
    input rst,
    input [31:0] pc_in,
    input PCWrite,

    output reg [31:0] pc_out
);
  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      pc_out <= 32'b0;
    end else begin
      if (PCWrite) pc_out <= pc_in;
    end
  end

endmodule  // ProgramCounter
