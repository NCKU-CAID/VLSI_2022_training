wvResizeWindow -win $_nWave1 1920 23 1920 1017
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/sam2468sam/VLSI_2021/hw3/NE6091124/build/top.fsdb}
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
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/CPU/clk} \
{/top_tb/TOP/CPU_wrapper/CPU/rst} \
{/top_tb/TOP/CPU_wrapper/CPU/instr_out\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/pc_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 3 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvZoom -win $_nWave1 239601.613988 407322.743779
wvSetCursor -win $_nWave1 20302.490493 -snap {("G1" 3)}
wvSetSearchMode -win $_nWave1 -value 
wvSetSearchMode -win $_nWave1 -value 10040
wvSearchNext -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSearchNext -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvSearchNext -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/L1CD"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/CPU/clk} \
{/top_tb/TOP/CPU_wrapper/CPU/rst} \
{/top_tb/TOP/CPU_wrapper/CPU/pc_out\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_addr\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_out\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_addr\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_out\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/instr_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 5 6 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/L1CD"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU/BranchCtrl"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU/ID"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU/ID/RegisterFile"
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/CPU/clk} \
{/top_tb/TOP/CPU_wrapper/CPU/rst} \
{/top_tb/TOP/CPU_wrapper/CPU/pc_out\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/instr_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU_wrapper/L1CD/D_addr\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_out\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_addr\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_out\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/ID/RegisterFile/register\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 5 )} 
wvSetPosition -win $_nWave1 {("G2" 5)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvExpandBus -win $_nWave1 {("G3" 1)}
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 16)}
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSearchNext -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 3 )} {( "G2" 4 )} 
wvSetCursor -win $_nWave1 42449561.525811 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 42453616.384320 -snap {("G1" 4)}
wvSetSearchMode -win $_nWave1 -value 10000
wvSearchPrev -win $_nWave1
wvSetCursor -win $_nWave1 42285470.137406 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 42291476.290843 -snap {("G1" 3)}
wvSelectSignal -win $_nWave1 {( "G3" 8 )} 
wvSetCursor -win $_nWave1 42302529.869000 -snap {("G3" 8)}
wvSetCursor -win $_nWave1 42301430.150765 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 42305547.044671 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 42326493.857261 -snap {("G3" 1)}
wvSetCursor -win $_nWave1 42333204.958285 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 42362451.823757 -snap {("G3" 1)}
wvSetCursor -win $_nWave1 42390394.536192 -snap {("G3" 1)}
wvSetCursor -win $_nWave1 42405326.735969 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 42415397.617189 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 42443623.718554 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 42466641.667147 -snap {("G3" 1)}
wvSetCursor -win $_nWave1 42465429.157298 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 42493359.180683 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 42475481.709889 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 42459452.611662 -snap {("G1" 3)}
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU/ID"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/L1CD"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU/ID/RegisterFile"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU/EXE"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/CPU/EXE/ALU"
wvSetPosition -win $_nWave1 {("G3" 18)}
wvSetPosition -win $_nWave1 {("G3" 18)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/CPU/clk} \
{/top_tb/TOP/CPU_wrapper/CPU/rst} \
{/top_tb/TOP/CPU_wrapper/CPU/pc_out\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/instr_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU_wrapper/L1CD/D_addr\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/D_out\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_addr\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/L1CD/core_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/CPU_wrapper/CPU/ID/RegisterFile/register\[15\]\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/ID/RegisterFile/register\[14\]\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/ID/RegisterFile/register\[13\]\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/ID/RegisterFile/register\[12\]\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/ID/RegisterFile/register\[11\]\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/ID/RegisterFile/register\[10\]\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/ID/RegisterFile/register\[9\]\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/ID/RegisterFile/register\[8\]\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/ID/RegisterFile/register\[7\]\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/ID/RegisterFile/register\[6\]\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/ID/RegisterFile/register\[5\]\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/ID/RegisterFile/register\[4\]\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/ID/RegisterFile/register\[3\]\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/ID/RegisterFile/register\[2\]\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/ID/RegisterFile/register\[1\]\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/ID/RegisterFile/register\[0\]\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/EXE/ALU/rs1\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/CPU/EXE/ALU/rs2\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 17 18 )} 
wvSetPosition -win $_nWave1 {("G3" 18)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 42465402.369293 -snap {("G1" 3)}
wvExit
