`include "./Def.sv"

interface inf_IF_ID;
  logic [`DATA_BITS-1:0] inst;
  logic [`ADDR_BITS-1:0] pc;

  modport IF2ID(output inst, pc);
  modport ID2IF(input inst, pc);

endinterface : inf_IF_ID
