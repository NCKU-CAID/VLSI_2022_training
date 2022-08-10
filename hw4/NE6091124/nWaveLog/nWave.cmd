wvResizeWindow -win $_nWave1 0 23 1920 1137
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/sam2468sam/VLSI_2021/hw4/NE6091124/build/top.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU"
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
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/CPU/clk} \
{/top_tb/TOP/CPU_wrapper/CPU/rst} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR_wdata\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 3 4 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU"
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/CPU/clk} \
{/top_tb/TOP/CPU_wrapper/CPU/rst} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/EXE_PC\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU/CSR"
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/CPU/clk} \
{/top_tb/TOP/CPU_wrapper/CPU/rst} \
{/top_tb/TOP/CPU_wrapper/CPU/EXE_PC\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mstatus\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR_wdata\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSelectGroup -win $_nWave1 {G3}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSelectGroup -win $_nWave1 {G3}
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetCursor -win $_nWave1 1193119.893970 -snap {("G1" 4)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 9781207.225191 -snap {("G1" 3)}
wvSetSearchMode -win $_nWave1 -value 
wvSetSearchMode -win $_nWave1 -value 10a14
wvSearchNext -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSearchNext -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvExpandBus -win $_nWave1 {("G1" 7)}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvExpandBus -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 71)}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvExpandBus -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 103)}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvCollapseBus -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 71)}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvCollapseBus -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 39)}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvCollapseBus -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU/CSR"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU/RegFile"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU/CSR"
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/CPU/clk} \
{/top_tb/TOP/CPU_wrapper/CPU/rst} \
{/top_tb/TOP/CPU_wrapper/CPU/EXE_PC\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mstatus\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/CSR_write} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSetSearchMode -win $_nWave1 -value 10b00
wvSearchNext -win $_nWave1
wvSetCursor -win $_nWave1 193426906.755799 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 193431055.724859 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 193578719.002787 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 193578371.988941 -snap {("G1" 1)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoom -win $_nWave1 103749555.997349 116199502.717031
wvZoom -win $_nWave1 112363038.022050 112536297.717950
wvSetCursor -win $_nWave1 112424465.415841 -snap {("G1" 5)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 5 6 7 8 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU/CSR"
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/CPU/clk} \
{/top_tb/TOP/CPU_wrapper/CPU/rst} \
{/top_tb/TOP/CPU_wrapper/CPU/EXE_PC\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/interrupt} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mepc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mie\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mip\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mstatus\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mtvec\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 5 6 7 8 9 )} 
wvSetPosition -win $_nWave1 {("G1" 9)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU/CSR"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU/CSR"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/CPU/clk} \
{/top_tb/TOP/CPU_wrapper/CPU/rst} \
{/top_tb/TOP/CPU_wrapper/CPU/EXE_PC\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/interrupt} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mepc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mip\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mie\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 6 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvExpandBus -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 39)}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSelectSignal -win $_nWave1 {( "G1" 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 \
           21 22 23 24 25 26 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 8 9 10 11 12 13 14 15 16 17 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvExpandBus -win $_nWave1 {("G1" 7)}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 \
           22 23 24 25 26 27 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSelectSignal -win $_nWave1 {( "G1" 8 9 10 11 12 13 14 15 16 17 18 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU/CSR"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU/CSR"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/CPU/clk} \
{/top_tb/TOP/CPU_wrapper/CPU/rst} \
{/top_tb/TOP/CPU_wrapper/CPU/EXE_PC\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mepc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mie\[11\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mip\[11\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/CSR_addr\[11:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU/CSR"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU/CSR"
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/CPU/clk} \
{/top_tb/TOP/CPU_wrapper/CPU/rst} \
{/top_tb/TOP/CPU_wrapper/CPU/EXE_PC\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/CSR_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/CSR_STALL} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mepc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mie\[11\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mip\[11\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 8)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU/CSR"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU/CSR"
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/CPU/clk} \
{/top_tb/TOP/CPU_wrapper/CPU/rst} \
{/top_tb/TOP/CPU_wrapper/CPU/EXE_PC\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/CSR_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mepc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mie\[11\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mip\[11\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/CSR_STALL} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/interrupt} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSetPosition -win $_nWave1 {("G1" 9)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 112428742.369923 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 112424551.529035 -snap {("G1" 3)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoom -win $_nWave1 107697124.295891 115568674.908880
wvZoom -win $_nWave1 112183230.012944 112480564.926755
wvZoom -win $_nWave1 112410024.238080 112436427.736059
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 112424765.753615 -snap {("G1" 3)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoom -win $_nWave1 237941534.817645 244248418.873053
wvZoom -win $_nWave1 243287131.044814 243500286.171935
wvZoom -win $_nWave1 243390954.118646 243417792.736375
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 243395035.936171 -snap {("G1" 9)}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU/CSR"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU/CSR"
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/CPU/clk} \
{/top_tb/TOP/CPU_wrapper/CPU/rst} \
{/top_tb/TOP/CPU_wrapper/CPU/EXE_PC\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/CSR_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mepc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mip\[11\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/CSR_STALL} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/interrupt} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mie\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSetPosition -win $_nWave1 {("G1" 9)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvExpandBus -win $_nWave1 {("G1" 9)}
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSelectSignal -win $_nWave1 {( "G1" 9 10 11 12 13 14 15 16 17 18 19 20 21 22 \
           23 24 25 26 27 28 29 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 20)}
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSelectSignal -win $_nWave1 {( "G1" 10 11 12 13 14 15 16 17 18 19 20 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU/CSR"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU/CSR"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/CPU/clk} \
{/top_tb/TOP/CPU_wrapper/CPU/rst} \
{/top_tb/TOP/CPU_wrapper/CPU/EXE_PC\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/CSR_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mepc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mie\[11\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mstatus\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mip\[11\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/CSR_STALL} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/interrupt} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvExpandBus -win $_nWave1 {("G1" 7)}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 \
           22 23 24 25 26 27 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 \
           22 23 24 25 26 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 19)}
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSelectSignal -win $_nWave1 {( "G1" 9 10 11 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 19)}
wvSetPosition -win $_nWave1 {("G1" 16)}
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSelectSignal -win $_nWave1 {( "G1" 10 11 12 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 16)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSelectSignal -win $_nWave1 {( "G1" 11 12 13 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 10)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU/CSR"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU/CSR"
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/CPU/clk} \
{/top_tb/TOP/CPU_wrapper/CPU/rst} \
{/top_tb/TOP/CPU_wrapper/CPU/EXE_PC\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/CSR_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mepc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mstatus\[12\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mstatus\[11\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mstatus\[7\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mstatus\[3\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mie\[11\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mtvec\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mip\[11\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/CSR_STALL} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/interrupt} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 12)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetCursor -win $_nWave1 243403119.535781 -snap {("G1" 3)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSetSearchMode -win $_nWave1 -value 10104
wvSearchPrev -win $_nWave1
wvSearchNext -win $_nWave1
wvSetCursor -win $_nWave1 253927807.463817 -snap {("G1" 3)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoom -win $_nWave1 235451902.982004 261095179.544400
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoom -win $_nWave1 252827814.370358 255002989.585723
wvZoom -win $_nWave1 253910356.839975 253957925.284049
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 253934992.187215 -snap {("G1" 3)}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 4)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU/CSR"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU/CSR"
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/CPU/clk} \
{/top_tb/TOP/CPU_wrapper/CPU/rst} \
{/top_tb/TOP/CPU_wrapper/CPU/EXE_PC\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/CSR_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/CSR_retPC\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mepc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mstatus\[12\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mstatus\[11\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mstatus\[7\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mstatus\[3\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mie\[11\]} \
{/top_tb/TOP/CPU_wrapper/CPU/CSR/mip\[11\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvGetSignalClose -win $_nWave1
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 4)}
wvExit
