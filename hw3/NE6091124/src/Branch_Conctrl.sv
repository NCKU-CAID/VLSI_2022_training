module Branch_Conctrl(ZeroFlag, PCtoRegSrc, RDSrc, ALUOP, BranchCtrl);
input           ZeroFlag;
input           PCtoRegSrc;
input           RDSrc;
input   [2:0]   ALUOP;
output  [1:0]   BranchCtrl;

assign BranchCtrl = (ALUOP == 3'h5) ? 2'h2 : (((ZeroFlag && ALUOP == 3'h3) || (!PCtoRegSrc && RDSrc)) ? 2'h1 : 2'h0);

endmodule
