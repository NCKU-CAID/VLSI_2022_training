module ForwardUnit (
    input [4:0] ID_rs1_addr,
    input [4:0] ID_rs2_addr,
    input EXE_RegWrite,
    input [4:0] EXE_rd_addr,
    input MEM_RegWrite,
    input [4:0] MEM_rd_addr,

    output reg [1:0] ForwardRS1Src,
    output reg [1:0] ForwardRS2Src
);
  always_comb begin
    if (EXE_RegWrite && (ID_rs1_addr == EXE_rd_addr)) ForwardRS1Src = 2'b01;
    else if (MEM_RegWrite && (ID_rs1_addr == MEM_rd_addr))
      ForwardRS1Src = 2'b10;
    else ForwardRS1Src = 2'b00;
  end

  always_comb begin
    if (EXE_RegWrite && (ID_rs2_addr == EXE_rd_addr)) ForwardRS2Src = 2'b01;
    else if (MEM_RegWrite && (ID_rs2_addr == MEM_rd_addr))
      ForwardRS2Src = 2'b10;
    else ForwardRS2Src = 2'b00;
  end

endmodule : ForwardUnit
