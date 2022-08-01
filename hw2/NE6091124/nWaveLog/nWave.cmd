wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/sam2468sam/VLSI_2021/hw2/NE6091124/build/top.fsdb}
wvResizeWindow -win $_nWave1 0 23 1920 1137
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/DM"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU"
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/CPU/clk} \
{/top_tb/TOP/CPU_wrapper/CPU/rst} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 )} 
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/CPU/clk} \
{/top_tb/TOP/CPU_wrapper/CPU/rst} \
{/top_tb/TOP/CPU_wrapper/CPU/Instr_out\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/PC_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 3 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/IM"
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/CPU/clk} \
{/top_tb/TOP/CPU_wrapper/CPU/rst} \
{/top_tb/TOP/CPU_wrapper/CPU/Instr_out\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/PC_out\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/IM/ARADDR\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/IM/ARREADY} \
{/top_tb/TOP/CPU_wrapper/IM/ARVALID} \
{/top_tb/TOP/CPU_wrapper/IM/RDATA\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/IM/RREADY} \
{/top_tb/TOP/CPU_wrapper/IM/RVALID} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 6 7 8 9 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/DM"
wvSetPosition -win $_nWave1 {("G2" 21)}
wvSetPosition -win $_nWave1 {("G2" 21)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/CPU/clk} \
{/top_tb/TOP/CPU_wrapper/CPU/rst} \
{/top_tb/TOP/CPU_wrapper/CPU/Instr_out\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/PC_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU_wrapper/IM/ARADDR\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/IM/ARREADY} \
{/top_tb/TOP/CPU_wrapper/IM/ARVALID} \
{/top_tb/TOP/CPU_wrapper/IM/RDATA\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/IM/RREADY} \
{/top_tb/TOP/CPU_wrapper/IM/RVALID} \
{/top_tb/TOP/CPU_wrapper/DM/ARADDR\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/DM/ARREADY} \
{/top_tb/TOP/CPU_wrapper/DM/ARVALID} \
{/top_tb/TOP/CPU_wrapper/DM/AWADDR\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/DM/AWREADY} \
{/top_tb/TOP/CPU_wrapper/DM/AWVALID} \
{/top_tb/TOP/CPU_wrapper/DM/BREADY} \
{/top_tb/TOP/CPU_wrapper/DM/BVALID} \
{/top_tb/TOP/CPU_wrapper/DM/RDATA\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/DM/RREADY} \
{/top_tb/TOP/CPU_wrapper/DM/RVALID} \
{/top_tb/TOP/CPU_wrapper/DM/WDATA\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/DM/WREADY} \
{/top_tb/TOP/CPU_wrapper/DM/WRITE\[3:0\]} \
{/top_tb/TOP/CPU_wrapper/DM/WVALID} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 \
           )} 
wvSetPosition -win $_nWave1 {("G2" 21)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 12)}
wvSetPosition -win $_nWave1 {("G2" 18)}
wvSetPosition -win $_nWave1 {("G2" 19)}
wvSetPosition -win $_nWave1 {("G2" 21)}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 15)}
wvSetPosition -win $_nWave1 {("G3" 15)}
wvSetCursor -win $_nWave1 253953.256426 -snap {("G2" 6)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetPosition -win $_nWave1 {("G3" 2)}
wvSetPosition -win $_nWave1 {("G3" 3)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 3)}
wvSelectSignal -win $_nWave1 {( "G3" 9 )} 
wvSelectSignal -win $_nWave1 {( "G3" 9 10 11 )} 
wvSetPosition -win $_nWave1 {("G3" 9)}
wvSetPosition -win $_nWave1 {("G3" 6)}
wvSetPosition -win $_nWave1 {("G3" 5)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 3)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 3)}
wvSetPosition -win $_nWave1 {("G3" 6)}
wvSelectSignal -win $_nWave1 {( "G3" 4 )} 
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 5)}
wvSetPosition -win $_nWave1 {("G3" 6)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 6)}
wvSelectSignal -win $_nWave1 {( "G3" 6 )} 
wvSelectSignal -win $_nWave1 {( "G3" 7 )} 
wvSetPosition -win $_nWave1 {("G3" 7)}
wvSetPosition -win $_nWave1 {("G3" 8)}
wvSetPosition -win $_nWave1 {("G3" 9)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 9)}
wvSelectSignal -win $_nWave1 {( "G3" 12 )} 
wvSelectSignal -win $_nWave1 {( "G3" 12 13 14 15 )} 
wvSetPosition -win $_nWave1 {("G3" 12)}
wvSetPosition -win $_nWave1 {("G3" 11)}
wvSetPosition -win $_nWave1 {("G3" 10)}
wvSetPosition -win $_nWave1 {("G3" 9)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 9)}
wvSetPosition -win $_nWave1 {("G3" 13)}
wvSelectSignal -win $_nWave1 {( "G3" 10 )} 
wvSetPosition -win $_nWave1 {("G3" 10)}
wvSetPosition -win $_nWave1 {("G3" 12)}
wvSetPosition -win $_nWave1 {("G3" 13)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 13)}
wvSelectSignal -win $_nWave1 {( "G3" 11 )} 
wvSetPosition -win $_nWave1 {("G3" 11)}
wvSetPosition -win $_nWave1 {("G3" 12)}
wvSetPosition -win $_nWave1 {("G3" 13)}
wvSetPosition -win $_nWave1 {("G3" 12)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 12)}
wvSetCursor -win $_nWave1 559771.636922 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 558337.412959 -snap {("G1" 3)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetSearchMode -win $_nWave1 -value 
wvSetSearchMode -win $_nWave1 -value 138
wvSearchNext -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 10 )} 
wvSelectSignal -win $_nWave1 {( "G3" 8 )} 
wvSelectSignal -win $_nWave1 {( "G3" 7 )} 
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU"
wvSetPosition -win $_nWave1 {("G3" 14)}
wvSetPosition -win $_nWave1 {("G3" 14)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/CPU/clk} \
{/top_tb/TOP/CPU_wrapper/CPU/rst} \
{/top_tb/TOP/CPU_wrapper/CPU/PC_out\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/Instr_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU_wrapper/IM/ARREADY} \
{/top_tb/TOP/CPU_wrapper/IM/ARVALID} \
{/top_tb/TOP/CPU_wrapper/IM/ARADDR\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/IM/RREADY} \
{/top_tb/TOP/CPU_wrapper/IM/RVALID} \
{/top_tb/TOP/CPU_wrapper/IM/RDATA\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/CPU_wrapper/DM/ARREADY} \
{/top_tb/TOP/CPU_wrapper/DM/ARVALID} \
{/top_tb/TOP/CPU_wrapper/DM/ARADDR\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/DM/RREADY} \
{/top_tb/TOP/CPU_wrapper/DM/RVALID} \
{/top_tb/TOP/CPU_wrapper/DM/RDATA\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/DM/AWREADY} \
{/top_tb/TOP/CPU_wrapper/DM/AWVALID} \
{/top_tb/TOP/CPU_wrapper/DM/AWADDR\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/DM/WREADY} \
{/top_tb/TOP/CPU_wrapper/DM/WVALID} \
{/top_tb/TOP/CPU_wrapper/DM/WRITE\[3:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/ID_Instr\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/ID_PC\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/DM/WDATA\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/DM/BREADY} \
{/top_tb/TOP/CPU_wrapper/DM/BVALID} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 13 14 )} 
wvSetPosition -win $_nWave1 {("G3" 14)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 13)}
wvSetPosition -win $_nWave1 {("G3" 8)}
wvSetPosition -win $_nWave1 {("G3" 3)}
wvSetPosition -win $_nWave1 {("G3" 2)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 )} 
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetPosition -win $_nWave1 {("G3" 6)}
wvSetPosition -win $_nWave1 {("G3" 12)}
wvSetPosition -win $_nWave1 {("G3" 13)}
wvSetPosition -win $_nWave1 {("G3" 14)}
wvSetPosition -win $_nWave1 {("G3" 15)}
wvSetPosition -win $_nWave1 {("G4" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 15)}
wvSetPosition -win $_nWave1 {("G4" 15)}
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvSelectSignal -win $_nWave1 {( "G2" 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 6)}
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetCursor -win $_nWave1 9820152.192495 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 9830502.508763 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 9826056.414477 -snap {("G2" 1)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU"
wvGetSignalClose -win $_nWave1
wvExit
