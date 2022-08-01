module WB (
    input clk,  // Clock
    input rst,

    input MEM_MemtoReg,
    input MEM_RegWrite,
    input [31:0] MEM_rd_data,  // Data from ALU
    input [31:0] MEM_lw_data,  // Data from Data memory
    input [4:0] MEM_rd_addr,

    output [31:0] WB_rd_data,
    output [4:0] WB_rd_addr,
    output WB_RegWrite
);

  assign WB_rd_data  = (MEM_MemtoReg == 1'b0) ? MEM_rd_data : MEM_lw_data;
  assign WB_rd_addr  = MEM_rd_addr;
  assign WB_RegWrite = MEM_RegWrite;

endmodule : WB
