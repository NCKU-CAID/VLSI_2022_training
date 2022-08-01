wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 {/home/wang/VLSI_2021/hw3/P76091690/build/top.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/L1CD"
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/STATE\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetPosition -win $_nWave1 {("G1" 1)}
wvResizeWindow -win $_nWave1 0 23 1920 1147
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetSearchMode -win $_nWave1 -value 
wvSetCursor -win $_nWave1 61789030.063422 -snap {("G1" 1)}
wvSetSearchMode -win $_nWave1 -value 2
wvSearchPrev -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/DRAM_wrapper"
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/clk} \
{/top_tb/TOP/CPU_wrapper/L1CD/STATE\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/DRAM_wrapper/STATE\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSearchNext -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSearchNext -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/L1CD"
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/clk} \
{/top_tb/TOP/CPU_wrapper/L1CD/STATE\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/DRAM_wrapper/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_read} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_write} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 2 3 )} 
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 0)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSelectSignal -win $_nWave1 {( "G2" 1 2 )} 
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/clk} \
{/top_tb/TOP/CPU_wrapper/L1CD/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_read} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_write} \
{/top_tb/TOP/CPU_wrapper/L1CD/hit} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/clk} \
{/top_tb/TOP/CPU_wrapper/L1CD/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_read} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_write} \
{/top_tb/TOP/CPU_wrapper/L1CD/hit} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_out\[127:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/clk} \
{/top_tb/TOP/CPU_wrapper/L1CD/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_read} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_write} \
{/top_tb/TOP/CPU_wrapper/L1CD/hit} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_out\[127:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_in\[127:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/clk} \
{/top_tb/TOP/CPU_wrapper/L1CD/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_read} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_write} \
{/top_tb/TOP/CPU_wrapper/L1CD/hit} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_out\[127:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_in\[127:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_in\[21:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_out\[21:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 8 9 )} 
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/clk} \
{/top_tb/TOP/CPU_wrapper/L1CD/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_read} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_write} \
{/top_tb/TOP/CPU_wrapper/L1CD/hit} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_out\[127:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_in\[127:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_in\[21:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_out\[21:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_req} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/clk} \
{/top_tb/TOP/CPU_wrapper/L1CD/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_read} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_write} \
{/top_tb/TOP/CPU_wrapper/L1CD/hit} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_out\[127:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_in\[127:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_in\[21:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_out\[21:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_req} \
{/top_tb/TOP/CPU_wrapper/L1CD/cnt\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetCursor -win $_nWave1 62118398.590845 -snap {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/clk} \
{/top_tb/TOP/CPU_wrapper/L1CD/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_read} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_write} \
{/top_tb/TOP/CPU_wrapper/L1CD/hit} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_out\[127:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_in\[127:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_in\[21:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_out\[21:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_req} \
{/top_tb/TOP/CPU_wrapper/L1CD/cnt\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_wait} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetCursor -win $_nWave1 62123786.226990 -snap {("G3" 0)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/clk} \
{/top_tb/TOP/CPU_wrapper/L1CD/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_read} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_write} \
{/top_tb/TOP/CPU_wrapper/L1CD/hit} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_out\[127:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_in\[127:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_in\[21:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_out\[21:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_req} \
{/top_tb/TOP/CPU_wrapper/L1CD/cnt\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_wait} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 14)}
wvSetPosition -win $_nWave1 {("G1" 14)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/clk} \
{/top_tb/TOP/CPU_wrapper/L1CD/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_read} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_write} \
{/top_tb/TOP/CPU_wrapper/L1CD/hit} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_out\[127:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_in\[127:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_in\[21:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_out\[21:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_req} \
{/top_tb/TOP/CPU_wrapper/L1CD/cnt\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_wait} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_out\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_in\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvSetPosition -win $_nWave1 {("G1" 14)}
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 14)}
wvSetPosition -win $_nWave1 {("G1" 14)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/clk} \
{/top_tb/TOP/CPU_wrapper/L1CD/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_read} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_write} \
{/top_tb/TOP/CPU_wrapper/L1CD/hit} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_out\[127:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_in\[127:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_in\[21:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_out\[21:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_req} \
{/top_tb/TOP/CPU_wrapper/L1CD/cnt\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_wait} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_in\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_write\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvSetPosition -win $_nWave1 {("G1" 14)}
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvSetCursor -win $_nWave1 62102159.370285 -snap {("G3" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvResizeWindow -win $_nWave1 0 23 1920 1147
wvSetSearchMode -win $_nWave1 -value ffffcccc
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/clk} \
{/top_tb/TOP/CPU_wrapper/L1CD/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_read} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_write} \
{/top_tb/TOP/CPU_wrapper/L1CD/hit} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_out\[127:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_in\[127:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_in\[21:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_out\[21:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_req} \
{/top_tb/TOP/CPU_wrapper/L1CD/cnt\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_wait} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_in\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_write\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/DRAM_wrapper/STATE\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvSetCursor -win $_nWave1 117263500.503176 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetSearchMode -win $_nWave1 -value ffffffcc
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 117870662.336477 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSearchNext -win $_nWave1
wvSetSearchMode -win $_nWave1 -value ffffcccc
wvSearchNext -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSearchNext -win $_nWave1
wvSearchPrev -win $_nWave1
wvZoom -win $_nWave1 117259496.521486 117265664.714500
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/L1CD"
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 14)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 14)}
wvZoom -win $_nWave1 117256675.452965 117259342.779674
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 117261165.052424 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 117261914.787499 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetCursor -win $_nWave1 117272555.258287 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 117269505.054050 -snap {("G4" 0)}
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSetSearchMode -win $_nWave1 -value ffffffcc
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/L1CD"
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvZoomAll -win $_nWave1
wvSearchNext -win $_nWave1
wvZoom -win $_nWave1 116595934.108108 121268532.594595
wvZoom -win $_nWave1 117707254.829210 118380782.538974
wvZoom -win $_nWave1 117831442.821331 117935404.756111
wvZoom -win $_nWave1 117849144.448011 117863255.797717
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 117878676.578932 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 117856640.837650 -snap {("G2" 0)}
wvZoom -win $_nWave1 117845792.472711 117863217.658894
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/clk} \
{/top_tb/TOP/CPU_wrapper/L1CD/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_read} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_write} \
{/top_tb/TOP/CPU_wrapper/L1CD/cnt\[2:0\]} \
{/top_tb/TOP/DRAM_wrapper/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/hit} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_out\[127:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/TA_in\[21:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_req} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_wait} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_in\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_write\[15:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_in\[127:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/DRAM_wrapper/STATE\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 4 5 6 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 4 5 6 7 8 9 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 2)}
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/L1CD"
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/clk} \
{/top_tb/TOP/CPU_wrapper/L1CD/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/c_in\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_in\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/DRAM_wrapper/STATE\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G1" 3 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 117849167.621304 -snap {("G1" 2)}
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/L1CD"
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/clk} \
{/top_tb/TOP/CPU_wrapper/L1CD/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_in\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_addr\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/DRAM_wrapper/STATE\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/clk} \
{/top_tb/TOP/CPU_wrapper/L1CD/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_in\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_addr\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_type\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/DRAM_wrapper/STATE\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetCursor -win $_nWave1 117847273.351805 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 117857173.787945 -snap {("G1" 2)}
wvResizeWindow -win $_nWave1 0 23 1920 1147
wvSetCursor -win $_nWave1 117847174.237778 -snap {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/clk} \
{/top_tb/TOP/CPU_wrapper/L1CD/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_in\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_addr\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_type\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_req} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_type\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_wait} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_write} \
{/top_tb/TOP/CPU_wrapper/L1CD/valid\[63:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/DRAM_wrapper/STATE\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G1" 6 7 8 9 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSetCursor -win $_nWave1 117854539.408377 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 117854874.188859 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 117854330.170576 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 117847927.493862 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSetSearchMode -win $_nWave1 -value 2
wvSearchNext -win $_nWave1
wvSetCursor -win $_nWave1 118604231.723490 -snap {("G1" 2)}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSelectSignal -win $_nWave1 {( "G1" 8 9 )} 
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/L1CD"
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/clk} \
{/top_tb/TOP/CPU_wrapper/L1CD/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_addr\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/hit} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_req} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_wait} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_in\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_type\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_type\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_write} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/DRAM_wrapper/STATE\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/clk} \
{/top_tb/TOP/CPU_wrapper/L1CD/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_addr\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/hit} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_write} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_req} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_wait} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_in\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_type\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_type\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_write} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/DRAM_wrapper/STATE\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/clk} \
{/top_tb/TOP/CPU_wrapper/L1CD/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_addr\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/hit} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_write} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_wait} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_req} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_wait} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_in\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_type\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_type\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_write} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/DRAM_wrapper/STATE\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetCursor -win $_nWave1 118614986.546467 -snap {("G4" 0)}
wvSetCursor -win $_nWave1 118604250.000000
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetCursor -win $_nWave1 118623021.278030 -snap {("G4" 0)}
wvSelectGroup -win $_nWave1 {G2}
wvRenameGroup -win $_nWave1 {G2} {write through}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/clk} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_wait} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_addr\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_in\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_write} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_in\[127:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_write\[15:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/hit} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_req} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_wait} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_write} \
}
wvAddSignal -win $_nWave1 -group {"write through" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/DRAM_wrapper/STATE\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G1" 6 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSelectSignal -win $_nWave1 {( "G1" 6 7 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 12)}
wvZoom -win $_nWave1 118616032.735472 118619840.863453
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSelectSignal -win $_nWave1 {( "G1" 11 12 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("write through" 0)}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvSetPosition -win $_nWave1 {("write through" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("write through" 2)}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetSearchMode -win $_nWave1 -value 5
wvSearchPrev -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 0)}
wvSetPosition -win $_nWave1 {("write through" 2)}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 0)}
wvSetPosition -win $_nWave1 {("write through" 2)}
wvSelectGroup -win $_nWave1 {write through}
wvSelectGroup -win $_nWave1 {write through}
wvSetPosition -win $_nWave1 {("write through" 0)}
wvSelectGroup -win $_nWave1 {write through}
wvSetCursor -win $_nWave1 118549080.379264 -snap {("G4" 0)}
wvSetCursor -win $_nWave1 118532905.195986 -snap {("G1" 4)}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("write through" 1)}
wvSetPosition -win $_nWave1 {("write through" 0)}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("write through" 1)}
wvSetPosition -win $_nWave1 {("write through" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/clk} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_wait} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_addr\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/hit} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_req} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_wait} \
}
wvAddSignal -win $_nWave1 -group {"write through" \
{/top_tb/TOP/CPU_wrapper/L1CD/cnt\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_in\[127:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_write\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/DRAM_wrapper/STATE\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "write through" 1 )} 
wvSetPosition -win $_nWave1 {("write through" 1)}
wvSelectSignal -win $_nWave1 {( "write through" 2 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("write through" 1)}
wvSetPosition -win $_nWave1 {("write through" 3)}
wvSetPosition -win $_nWave1 {("write through" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/clk} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_wait} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_addr\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/hit} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_req} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_wait} \
}
wvAddSignal -win $_nWave1 -group {"write through" \
{/top_tb/TOP/CPU_wrapper/L1CD/cnt\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_in\[127:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_out\[127:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_write\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/DRAM_wrapper/STATE\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "write through" 2 3 )} 
wvSetPosition -win $_nWave1 {("write through" 3)}
wvSelectSignal -win $_nWave1 {( "write through" 3 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("write through" 3)}
wvSetPosition -win $_nWave1 {("write through" 2)}
wvSetPosition -win $_nWave1 {("write through" 3)}
wvSetPosition -win $_nWave1 {("write through" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/clk} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_wait} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_addr\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/hit} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_req} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_wait} \
}
wvAddSignal -win $_nWave1 -group {"write through" \
{/top_tb/TOP/CPU_wrapper/L1CD/cnt\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_in\[127:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_out\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_write\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/DRAM_wrapper/STATE\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "write through" 3 )} 
wvSetPosition -win $_nWave1 {("write through" 3)}
wvSetCursor -win $_nWave1 118534820.492790 -snap {("G4" 0)}
wvSetCursor -win $_nWave1 118561215.290775 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 118553955.840327 -snap {("G4" 0)}
wvSetCursor -win $_nWave1 118587539.608658 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 118555154.002052 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 118572456.866952 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 118556316.923725 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 118553251.039313 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 118579892.517653 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "write through" 4 )} 
wvSetCursor -win $_nWave1 118572597.827155 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 118583663.203079 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 118573161.667966 -snap {("G4" 0)}
wvSetCursor -win $_nWave1 118586200.486731 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 118583557.482927 -snap {("G4" 0)}
wvSetCursor -win $_nWave1 118564668.815744 -snap {("G4" 0)}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetSearchMode -win $_nWave1 -value 4
wvSearchNext -win $_nWave1
wvSetSearchMode -win $_nWave1 -value 5
wvSearchPrev -win $_nWave1
wvSelectGroup -win $_nWave1 {G1}
wvSelectGroup -win $_nWave1 {G1}
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/DRAM_wrapper"
wvSetPosition -win $_nWave1 {("write through" 5)}
wvSetPosition -win $_nWave1 {("write through" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/clk} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_wait} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_addr\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/hit} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_req} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_wait} \
}
wvAddSignal -win $_nWave1 -group {"write through" \
{/top_tb/TOP/CPU_wrapper/L1CD/cnt\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_in\[127:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_out\[31:0\]} \
{/top_tb/TOP/DRAM_wrapper/DRAM_CSn_o} \
{/top_tb/TOP/DRAM_wrapper/col\[10:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_write\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/DRAM_wrapper/STATE\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "write through" 4 5 )} 
wvSetPosition -win $_nWave1 {("write through" 5)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 118587758.977981 -snap {("G4" 0)}
wvSetCursor -win $_nWave1 118557910.655027 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "write through" 4 )} 
wvSelectSignal -win $_nWave1 {( "write through" 4 5 )} 
wvSetPosition -win $_nWave1 {("write through" 4)}
wvSetPosition -win $_nWave1 {("write through" 6)}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 3)}
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/DRAM_wrapper"
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/clk} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_wait} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_addr\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/hit} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_req} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_wait} \
}
wvAddSignal -win $_nWave1 -group {"write through" \
{/top_tb/TOP/CPU_wrapper/L1CD/cnt\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_in\[127:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_out\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_write\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/DRAM_wrapper/STATE\[2:0\]} \
{/top_tb/TOP/DRAM_wrapper/DRAM_CSn_o} \
{/top_tb/TOP/DRAM_wrapper/col\[10:0\]} \
{/top_tb/TOP/DRAM_wrapper/DRAM_A_o\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 4 )} 
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSelectSignal -win $_nWave1 {( "G3" 3 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G3" 3)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/clk} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_wait} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_addr\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/hit} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_req} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_wait} \
}
wvAddSignal -win $_nWave1 -group {"write through" \
{/top_tb/TOP/CPU_wrapper/L1CD/cnt\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_in\[127:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_out\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_write\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/DRAM_wrapper/STATE\[2:0\]} \
{/top_tb/TOP/DRAM_wrapper/DRAM_CSn_o} \
{/top_tb/TOP/DRAM_wrapper/DRAM_A_o\[10:0\]} \
{/top_tb/TOP/DRAM_wrapper/DRAM_CASn_o} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 4 )} 
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G3" 3)}
wvSelectGroup -win $_nWave1 {G3}
wvRenameGroup -win $_nWave1 {G3} {DRAM}
wvSetPosition -win $_nWave1 {("DRAM" 4)}
wvSetPosition -win $_nWave1 {("DRAM" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/clk} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_wait} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_addr\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/hit} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_req} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_wait} \
}
wvAddSignal -win $_nWave1 -group {"write through" \
{/top_tb/TOP/CPU_wrapper/L1CD/cnt\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_in\[127:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_out\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_write\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"DRAM" \
{/top_tb/TOP/DRAM_wrapper/STATE\[2:0\]} \
{/top_tb/TOP/DRAM_wrapper/DRAM_A_o\[10:0\]} \
{/top_tb/TOP/DRAM_wrapper/DRAM_CASn_o} \
{/top_tb/TOP/DRAM_wrapper/DRAM_valid_i} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "DRAM" 4 )} 
wvSetPosition -win $_nWave1 {("DRAM" 4)}
wvSelectSignal -win $_nWave1 {( "DRAM" 4 )} 
wvSelectSignal -win $_nWave1 {( "DRAM" 4 )} 
wvSetCursor -win $_nWave1 118560499.036767 -snap {("G4" 0)}
wvSelectSignal -win $_nWave1 {( "DRAM" 1 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetCursor -win $_nWave1 118563529.681129 -snap {("G1" 4)}
wvSetSearchMode -win $_nWave1 -value 4
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvResizeWindow -win $_nWave1 809 164 960 332
wvResizeWindow -win $_nWave1 809 164 960 502
wvSetCursor -win $_nWave1 117168189.594207 -snap {("G1" 0)}
wvSetCursor -win $_nWave1 117169579.687701 -snap {("G1" 1)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetCursor -win $_nWave1 1998153.634330 -snap {("G1" 3)}
wvSetSearchMode -win $_nWave1 -value 3
wvSearchNext -win $_nWave1
wvResizeWindow -win $_nWave1 0 23 1920 1147
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 11201796.484485 -snap {("G1" 4)}
wvSelectSignal -win $_nWave1 {( "write through" 4 )} 
wvSetPosition -win $_nWave1 {("write through" 4)}
wvSetPosition -win $_nWave1 {("write through" 3)}
wvSetPosition -win $_nWave1 {("write through" 2)}
wvSetPosition -win $_nWave1 {("write through" 1)}
wvSetPosition -win $_nWave1 {("write through" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("write through" 0)}
wvSetPosition -win $_nWave1 {("write through" 1)}
wvSelectSignal -win $_nWave1 {( "write through" 1 )} 
wvSelectSignal -win $_nWave1 {( "write through" 2 )} 
wvSelectSignal -win $_nWave1 {( "write through" 2 3 4 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("write through" 1)}
wvSelectGroup -win $_nWave1 {write through}
wvRenameGroup -win $_nWave1 {write through} {write arounf}
wvRenameGroup -win $_nWave1 {write arounf} {write around}
wvSetCursor -win $_nWave1 11224033.502894 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/L1CD"
wvSetPosition -win $_nWave1 {("G4" 1)}
wvSetPosition -win $_nWave1 {("G4" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/clk} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_wait} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_addr\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/hit} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_req} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_wait} \
}
wvAddSignal -win $_nWave1 -group {"write around" \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_write\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"DRAM" \
{/top_tb/TOP/DRAM_wrapper/STATE\[2:0\]} \
{/top_tb/TOP/DRAM_wrapper/DRAM_A_o\[10:0\]} \
{/top_tb/TOP/DRAM_wrapper/DRAM_CASn_o} \
{/top_tb/TOP/DRAM_wrapper/DRAM_valid_i} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/top_tb/TOP/CPU_wrapper/L1CD/D_write} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G4" 1 )} 
wvSetPosition -win $_nWave1 {("G4" 1)}
wvSelectSignal -win $_nWave1 {( "G4" 1 )} 
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("DRAM" 2)}
wvSetPosition -win $_nWave1 {("DRAM" 0)}
wvSetPosition -win $_nWave1 {("write around" 1)}
wvSetPosition -win $_nWave1 {("write around" 0)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetCursor -win $_nWave1 11214940.694690 -snap {("G5" 0)}
wvSetCursor -win $_nWave1 11226109.973342 -snap {("G5" 0)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/clk} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_wait} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_addr\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/hit} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_req} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_write} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_req} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_wait} \
}
wvAddSignal -win $_nWave1 -group {"write around" \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_write\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"DRAM" \
{/top_tb/TOP/DRAM_wrapper/STATE\[2:0\]} \
{/top_tb/TOP/DRAM_wrapper/DRAM_A_o\[10:0\]} \
{/top_tb/TOP/DRAM_wrapper/DRAM_CASn_o} \
{/top_tb/TOP/DRAM_wrapper/DRAM_valid_i} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvResizeWindow -win $_nWave1 0 23 1920 1147
wvSetCursor -win $_nWave1 11226021.436816 -snap {("G5" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("DRAM" 1)}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSelectGroup -win $_nWave1 {G1}
wvSelectGroup -win $_nWave1 {G1}
wvSelectGroup -win $_nWave1 {G1}
wvSelectGroup -win $_nWave1 {G4}
wvSelectGroup -win $_nWave1 {G1}
wvSelectGroup -win $_nWave1 {G1} {write around} {DRAM} {G4}
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G5" 0)}
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/L1CI"
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CI/STATE\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"write around" \
{/top_tb/TOP/CPU_wrapper/L1CD/DA_write\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"DRAM" \
{/top_tb/TOP/DRAM_wrapper/STATE\[2:0\]} \
{/top_tb/TOP/DRAM_wrapper/DRAM_A_o\[10:0\]} \
{/top_tb/TOP/DRAM_wrapper/DRAM_CASn_o} \
{/top_tb/TOP/DRAM_wrapper/DRAM_valid_i} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetPosition -win $_nWave1 {("G1" 1)}
wvGetSignalClose -win $_nWave1
wvSelectGroup -win $_nWave1 {write around}
wvSelectGroup -win $_nWave1 {write around}
wvSelectGroup -win $_nWave1 {write around}
wvSelectGroup -win $_nWave1 {write around}
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSelectSignal -win $_nWave1 {( "DRAM" 1 )} 
wvSelectGroup -win $_nWave1 {DRAM}
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 1)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/L1CI"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/L1CI"
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CI/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/hit} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CI/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/hit} \
{/top_tb/TOP/CPU_wrapper/L1CI/DA_read} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CI/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/hit} \
{/top_tb/TOP/CPU_wrapper/L1CI/DA_read} \
{/top_tb/TOP/CPU_wrapper/L1CI/DA_in\[127:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CI/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/hit} \
{/top_tb/TOP/CPU_wrapper/L1CI/DA_read} \
{/top_tb/TOP/CPU_wrapper/L1CI/DA_in\[127:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/DA_out\[127:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CI/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/hit} \
{/top_tb/TOP/CPU_wrapper/L1CI/DA_read} \
{/top_tb/TOP/CPU_wrapper/L1CI/DA_out\[127:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/core_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetCursor -win $_nWave1 13257.654245 -snap {("G5" 0)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CI/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/hit} \
{/top_tb/TOP/CPU_wrapper/L1CI/DA_read} \
{/top_tb/TOP/CPU_wrapper/L1CI/DA_out\[127:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/core_out\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/core_addr\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoom -win $_nWave1 4825.582963 21232.565035
wvZoom -win $_nWave1 7351.275988 11751.193599
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvResizeWindow -win $_nWave1 2321 66 960 502
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/L1CI"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/L1CI"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/L1CD"
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CI/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/hit} \
{/top_tb/TOP/CPU_wrapper/L1CI/DA_read} \
{/top_tb/TOP/CPU_wrapper/L1CI/DA_out\[127:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/core_out\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/core_addr\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_rhits\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_rmiss\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_whits\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_wmiss\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G1" 7 8 9 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSelectGroup -win $_nWave1 {G1}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 4)}
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/L1CI"
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_rhits\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_rmiss\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_whits\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_wmiss\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/L1CI_rhits\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/L1CI_rmiss\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvResizeWindow -win $_nWave1 1920 23 1920 1147
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
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomAll -win $_nWave1
wvZoomAll -win $_nWave1
wvZoom -win $_nWave1 95837408.136836 98487845.571167
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 )} 
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetCursor -win $_nWave1 97588298.262894 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 97627156.233831 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 97630394.398075 -snap {("G1" 4)}
wvSelectGroup -win $_nWave1 {G5}
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 83489106.714015 -snap {("G5" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoom -win $_nWave1 96906590.366076 98542868.860230
wvZoom -win $_nWave1 97612279.197391 97770209.559075
wvSetCursor -win $_nWave1 97631477.818022 -snap {("G1" 4)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 97631477.818022 -snap {("G1" 4)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvResizeWindow -win $_nWave1 1920 23 1920 1147
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 1848048723.440031 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 1848048723.440031 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 1848048723.440031 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 1848048337.508208 -snap {("G1" 4)}
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/L1CI"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_rhits\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_rmiss\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_whits\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_wmiss\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/L1CI_rhits\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/L1CI_rmiss\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/STATE\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_rhits\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_rmiss\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_whits\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_wmiss\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/L1CI_rhits\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/L1CI_rmiss\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/hit} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_rhits\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_rmiss\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_whits\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_wmiss\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/L1CI_rhits\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/L1CI_rmiss\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/hit} \
{/top_tb/TOP/CPU_wrapper/L1CI/core_write} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSelectGroup -win $_nWave1 {G4}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G1" 7)}
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
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 60925395.599446 -snap {("G5" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 107330846.618904 -snap {("G5" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 41516826.462377 -snap {("G5" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 1173196929.153879 -snap {("G1" 1)}
wvZoom -win $_nWave1 1169329808.235591 1178523340.984729
wvZoom -win $_nWave1 1172952875.328256 1173835997.932237
wvSetCursor -win $_nWave1 1173211721.608477 -snap {("G1" 4)}
wvZoom -win $_nWave1 1173187794.641374 1173292203.225096
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G1" 6)}
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
wvSetCursor -win $_nWave1 86371324.498153 -snap {("G5" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 183839362.209975 -snap {("G1" 1)}
wvZoom -win $_nWave1 181665779.209360 184983353.262931
wvZoom -win $_nWave1 183790334.021932 184017089.391357
wvSetCursor -win $_nWave1 183944622.619939 -snap {("G1" 4)}
wvZoom -win $_nWave1 183940294.161532 183955792.835181
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/DM1"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_rhits\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_rmiss\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_whits\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_wmiss\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/L1CI_rhits\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/L1CI_rmiss\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inst_cnt\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetRadix -win $_nWave1 -format UDec
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalClose -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 80028180.886700 -snap {("G5" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 85614366.502463 -snap {("G5" 0)}
wvZoom -win $_nWave1 97333212.413793 98183284.137931
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 1826592072.293284 -snap {("G5" 0)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/L1CD"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/L1CI"
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_rhits\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_rmiss\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_whits\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_wmiss\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/L1CI_rhits\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/L1CI_rmiss\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inst_cnt\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/STATE\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetCursor -win $_nWave1 17335.841841 -snap {("G5" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/L1CI"
wvSetPosition -win $_nWave1 {("G5" 1)}
wvSetPosition -win $_nWave1 {("G5" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_rhits\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_rmiss\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_whits\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_wmiss\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/L1CI_rhits\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/L1CI_rmiss\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inst_cnt\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/STATE\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/top_tb/TOP/CPU_wrapper/L1CI/insts\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvSelectSignal -win $_nWave1 {( "G5" 1 )} 
wvSetPosition -win $_nWave1 {("G5" 1)}
wvSetCursor -win $_nWave1 8684.122642 -snap {("G6" 0)}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G5" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G5" 1)}
wvSelectSignal -win $_nWave1 {( "G5" 2 )} 
wvSelectSignal -win $_nWave1 {( "G5" 2 )} 
wvSetRadix -win $_nWave1 -format Bin
wvSelectSignal -win $_nWave1 {( "G5" 2 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetPosition -win $_nWave1 {("G5" 2)}
wvSetPosition -win $_nWave1 {("G5" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_rhits\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_rmiss\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_whits\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_wmiss\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/L1CI_rhits\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/L1CI_rmiss\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/STATE\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inst_cnt\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/core_out\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/insts\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvSelectSignal -win $_nWave1 {( "G5" 2 )} 
wvSetPosition -win $_nWave1 {("G5" 2)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSelectGroup -win $_nWave1 {G4}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_rhits\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_rmiss\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_whits\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_wmiss\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/L1CI_rhits\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/L1CI_rmiss\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/STATE\[2:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/flag} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inst_cnt\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/insts\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetCursor -win $_nWave1 47373.833219 -snap {("G6" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 97630513.713257 -snap {("G5" 1)}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 8 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G5" 0)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetCursor -win $_nWave1 97630513.713257 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 97630513.713257 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 97631550.623423 -snap {("G1" 4)}
wvSelectSignal -win $_nWave1 {( "G5" 1 )} 
wvSelectSignal -win $_nWave1 {( "G5" 2 )} 
wvSetPosition -win $_nWave1 {("G5" 2)}
wvSetPosition -win $_nWave1 {("G5" 0)}
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetCursor -win $_nWave1 97051917.840513 -snap {("G6" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoom -win $_nWave1 1765870413.273710 1766019728.337644
wvSetCursor -win $_nWave1 1765879331.722016 -snap {("G1" 1)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomOut -win $_nWave1
wvZoom -win $_nWave1 234216191.466133 236696986.017488
wvSetCursor -win $_nWave1 1171225581.648513 -snap {("G6" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 1173211397.985907 -snap {("G1" 4)}
wvResizeWindow -win $_nWave1 1920 23 1920 1147
wvSetCursor -win $_nWave1 1173201362.623554 -snap {("G6" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomAll -win $_nWave1
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
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoom -win $_nWave1 183914081.054586 184132310.628982
wvSetCursor -win $_nWave1 183944446.950752 -snap {("G1" 4)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoom -win $_nWave1 96391018.613367 97622852.717052
wvZoom -win $_nWave1 96945343.960025 97930811.242973
wvSetCursor -win $_nWave1 97631575.351857 -snap {("G1" 4)}
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/L1CD"
wvSetPosition -win $_nWave1 {("G6" 2)}
wvSetPosition -win $_nWave1 {("G6" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_rhits\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_rmiss\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_whits\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_wmiss\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/L1CI_rhits\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/L1CI_rmiss\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CI/insts\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inst_cnt\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_hits\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/L1CD_miss\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G7" \
}
wvSelectSignal -win $_nWave1 {( "G6" 1 2 )} 
wvSetPosition -win $_nWave1 {("G6" 2)}
wvSelectSignal -win $_nWave1 {( "G6" 1 2 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetPosition -win $_nWave1 {("G6" 1)}
wvSetPosition -win $_nWave1 {("G5" 1)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 )} 
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G5" 0)}
wvSetPosition -win $_nWave1 {("G4" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 4)}
wvZoom -win $_nWave1 97626090.376256 97658390.788127
wvZoom -win $_nWave1 97629546.140785 97630544.916663
wvZoom -win $_nWave1 97629743.795870 97629770.973445
wvZoom -win $_nWave1 97629751.460047 97629754.821528
wvSetCursor -win $_nWave1 97629752.832073 -snap {("G7" 0)}
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
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 1848045839.857728 -snap {("G1" 2)}
wvZoom -win $_nWave1 1848038210.488680 1848151561.114531
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoom -win $_nWave1 1167921287.156777 1182723838.324797
wvZoom -win $_nWave1 1173166718.089380 1173642743.235167
wvSetCursor -win $_nWave1 1173211465.041480 -snap {("G1" 2)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoom -win $_nWave1 183347253.129294 184275593.651468
wvSetCursor -win $_nWave1 183943756.408445 -snap {("G1" 2)}
wvZoom -win $_nWave1 183932848.263781 184002315.921903
wvExit
