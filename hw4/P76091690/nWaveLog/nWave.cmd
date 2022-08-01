wvResizeWindow -win $_nWave1 1920 23 1920 1147
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 {/home/wang/VLSI_2021/hw4/P76091690/build/top.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR"
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/wr} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU/i_csr"
wvSetPosition -win $_nWave1 {("G2" 17)}
wvSetPosition -win $_nWave1 {("G2" 17)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/wr} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/clk} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_data\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_pc_o\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_ret_pc_o} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_retpc_o\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_stall_o} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/int_taken_i} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mcycle_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mcycleh_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mepc_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mie_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/minstret_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/minstreth_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mip_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mstatus_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mtvec_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/rst} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           )} 
wvSetPosition -win $_nWave1 {("G2" 17)}
wvResizeWindow -win $_nWave1 1920 23 1920 1147
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 5 )} 
wvSetCursor -win $_nWave1 10650535.575931 -snap {("G3" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvUnknownSaveResult -win $_nWave1 -clear
wvSelectGroup -win $_nWave1 {G1}
wvRenameGroup -win $_nWave1 {G1} {EXE}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX"
wvSetPosition -win $_nWave1 {("G3" 10)}
wvSetPosition -win $_nWave1 {("G3" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"EXE" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/wr} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/clk} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_data\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_pc_o\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_retpc_o\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_stall_o} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/int_taken_i} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mcycle_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mcycleh_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mepc_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mie_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/minstret_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/minstreth_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mip_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mstatus_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mtvec_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/rst} \
}
wvCollapseGroup -win $_nWave1 "G2"
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_src} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/rs1_data\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 5 6 7 8 9 10 )} 
wvSetPosition -win $_nWave1 {("G3" 10)}
wvSelectGroup -win $_nWave1 {G3}
wvRenameGroup -win $_nWave1 {G3} {ID}
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
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoom -win $_nWave1 221358225.000000 227561895.000000
wvZoom -win $_nWave1 224590582.759901 225792159.931931
wvZoom -win $_nWave1 224651553.878778 224740779.906404
wvZoomOut -win $_nWave1
wvSetPosition -win $_nWave1 {("ID" 10)}
wvSetPosition -win $_nWave1 {("ID" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"EXE" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/wr} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/clk} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_data\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_pc_o\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_retpc_o\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_stall_o} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/int_taken_i} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mcycle_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mcycleh_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mepc_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mie_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/minstret_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/minstreth_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mip_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mstatus_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mtvec_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/rst} \
}
wvCollapseGroup -win $_nWave1 "G2"
wvAddSignal -win $_nWave1 -group {"ID" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_src} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/rs1_data\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "ID" 1 2 3 4 5 6 7 8 9 10 )} 
wvSetPosition -win $_nWave1 {("ID" 10)}
wvSetPosition -win $_nWave1 {("ID" 10)}
wvSetPosition -win $_nWave1 {("ID" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"EXE" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/wr} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/clk} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_data\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_pc_o\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_retpc_o\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_stall_o} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/int_taken_i} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mcycle_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mcycleh_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mepc_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mie_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/minstret_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/minstreth_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mip_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mstatus_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mtvec_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/rst} \
}
wvCollapseGroup -win $_nWave1 "G2"
wvAddSignal -win $_nWave1 -group {"ID" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_src} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/rs1_data\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "ID" 1 2 3 4 5 6 7 8 9 10 )} 
wvSetPosition -win $_nWave1 {("ID" 10)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX"
wvSetCursor -win $_nWave1 224640069.340504 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvSelectSignal -win $_nWave1 {( "EXE" 4 )} 
wvSelectGroup -win $_nWave1 {G4}
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU/i_csr"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR"
wvGetSignalSetScope -win $_nWave1 \
           "/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX"
wvGetSignalSetScope -win $_nWave1 \
           "/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR"
wvGetSignalSetScope -win $_nWave1 \
           "/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX"
wvSetPosition -win $_nWave1 {("G5" 10)}
wvSetPosition -win $_nWave1 {("G5" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"EXE" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/wr} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/clk} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_data\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_pc_o\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_retpc_o\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_stall_o} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/int_taken_i} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mcycle_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mcycleh_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mepc_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mie_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/minstret_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/minstreth_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mip_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mstatus_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mtvec_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/rst} \
}
wvCollapseGroup -win $_nWave1 "G2"
wvAddSignal -win $_nWave1 -group {"ID" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_src} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/rs1_data\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX/clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX/mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX/set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX/wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX/wr} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvSelectSignal -win $_nWave1 {( "G5" 1 2 3 4 5 6 7 8 9 10 )} 
wvSetPosition -win $_nWave1 {("G5" 10)}
wvSelectGroup -win $_nWave1 {G4}
wvRenameGroup -win $_nWave1 {G4} {EX2CSR}
wvSelectGroup -win $_nWave1 {G5}
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("EX2CSR" 10)}
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU/i_csr"
wvSelectGroup -win $_nWave1 {G2}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 7 )} 
wvSelectSignal -win $_nWave1 {( "G2" 7 8 )} 
wvSelectSignal -win $_nWave1 {( "G2" 7 8 11 )} 
wvSelectSignal -win $_nWave1 {( "G2" 7 8 11 12 )} 
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 9)}
wvSetPosition -win $_nWave1 {("G2" 10)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSetPosition -win $_nWave1 {("G2" 12)}
wvSetPosition -win $_nWave1 {("G2" 13)}
wvSetPosition -win $_nWave1 {("G2" 14)}
wvSetPosition -win $_nWave1 {("G2" 15)}
wvSetPosition -win $_nWave1 {("G2" 16)}
wvSetPosition -win $_nWave1 {("G2" 15)}
wvSetPosition -win $_nWave1 {("G2" 16)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 16)}
wvSelectSignal -win $_nWave1 {( "G2" 12 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("ID" 0)}
wvSetPosition -win $_nWave1 {("G2" 15)}
wvSelectSignal -win $_nWave1 {( "G2" 6 )} 
wvSelectSignal -win $_nWave1 {( "G2" 5 )} 
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvSelectGroup -win $_nWave1 {EX2CSR}
wvSetCursor -win $_nWave1 224694400.040521 -snap {("G6" 0)}
wvSetCursor -win $_nWave1 224693281.954469 -snap {("G6" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSelectSignal -win $_nWave1 {( "ID" 10 )} 
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSelectSignal -win $_nWave1 {( "ID" 3 )} 
wvSelectSignal -win $_nWave1 {( "ID" 8 )} 
wvSetCursor -win $_nWave1 224699700.596588 -snap {("G6" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "ID" 8 )} 
wvSelectSignal -win $_nWave1 {( "ID" 10 )} 
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSelectSignal -win $_nWave1 {( "ID" 2 )} 
wvSetCursor -win $_nWave1 224650891.309200 -snap {("G6" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "ID" 5 )} 
wvSelectSignal -win $_nWave1 {( "EXE" 8 )} 
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoom -win $_nWave1 224668329.641819 224717488.767479
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "EXE" 7 )} 
wvSelectSignal -win $_nWave1 {( "EXE" 5 )} 
wvSetPosition -win $_nWave1 {("EXE" 5)}
wvSetPosition -win $_nWave1 {("EXE" 6)}
wvSetPosition -win $_nWave1 {("EXE" 7)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("EXE" 7)}
wvSelectSignal -win $_nWave1 {( "EXE" 1 )} 
wvSelectSignal -win $_nWave1 {( "EXE" 1 2 3 4 5 6 7 8 9 10 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("EXE" 0)}
wvSelectGroup -win $_nWave1 {EXE}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/EX2ID"
wvSetPosition -win $_nWave1 {("EXE" 1)}
wvSetPosition -win $_nWave1 {("EXE" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"EXE" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/EX2ID/csr} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/clk} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_data\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_pc_o\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_retpc_o\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_stall_o} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/int_taken_i} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mepc_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mie_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mip_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mstatus_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mtvec_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mcycle_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mcycleh_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/minstret_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/minstreth_r\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"ID" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_src} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/rs1_data\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"EX2CSR" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
}
wvCollapseGroup -win $_nWave1 "EX2CSR"
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvSelectSignal -win $_nWave1 {( "EXE" 1 )} 
wvSetPosition -win $_nWave1 {("EXE" 1)}
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU/i_exe"
wvSetPosition -win $_nWave1 {("EXE" 2)}
wvSetPosition -win $_nWave1 {("EXE" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"EXE" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/EX2ID/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/aluout\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/clk} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_data\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_pc_o\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_retpc_o\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_stall_o} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/int_taken_i} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mepc_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mie_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mip_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mstatus_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mtvec_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mcycle_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mcycleh_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/minstret_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/minstreth_r\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"ID" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_src} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/rs1_data\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"EX2CSR" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
}
wvCollapseGroup -win $_nWave1 "EX2CSR"
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvSelectSignal -win $_nWave1 {( "EXE" 2 )} 
wvSetPosition -win $_nWave1 {("EXE" 2)}
wvGetSignalSetScope -win $_nWave1 \
           "/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR"
wvSetPosition -win $_nWave1 {("EXE" 3)}
wvSetPosition -win $_nWave1 {("EXE" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"EXE" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/EX2ID/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/aluout\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/clk} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_data\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_pc_o\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_retpc_o\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_stall_o} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/int_taken_i} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mepc_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mie_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mip_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mstatus_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mtvec_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mcycle_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mcycleh_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/minstret_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/minstreth_r\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"ID" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_src} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/rs1_data\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"EX2CSR" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
}
wvCollapseGroup -win $_nWave1 "EX2CSR"
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvSelectSignal -win $_nWave1 {( "EXE" 3 )} 
wvSetPosition -win $_nWave1 {("EXE" 3)}
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvSelectGroup -win $_nWave1 {G2}
wvSelectSignal -win $_nWave1 {( "ID" 9 )} 
wvGetSignalSetScope -win $_nWave1 \
           "/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX"
wvSelectGroup -win $_nWave1 {ID}
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU/i_id"
wvSetPosition -win $_nWave1 {("EXE" 4)}
wvSetPosition -win $_nWave1 {("EXE" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"EXE" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/EX2ID/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/aluout\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/rs1_addr\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/clk} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_data\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_pc_o\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_retpc_o\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_stall_o} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/int_taken_i} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mepc_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mie_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mip_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mstatus_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mtvec_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mcycle_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mcycleh_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/minstret_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/minstreth_r\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"ID" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_src} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/csr_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/rs1_data\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"EX2CSR" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
}
wvCollapseGroup -win $_nWave1 "EX2CSR"
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvSelectSignal -win $_nWave1 {( "EXE" 4 )} 
wvSetPosition -win $_nWave1 {("EXE" 4)}
wvSelectSignal -win $_nWave1 {( "EXE" 4 )} 
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("ID" 5)}
wvSetPosition -win $_nWave1 {("ID" 6)}
wvSetPosition -win $_nWave1 {("ID" 7)}
wvSetPosition -win $_nWave1 {("ID" 8)}
wvSetPosition -win $_nWave1 {("ID" 9)}
wvSetPosition -win $_nWave1 {("ID" 10)}
wvSetPosition -win $_nWave1 {("EX2CSR" 0)}
wvSetPosition -win $_nWave1 {("G6" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G6" 1)}
wvSetPosition -win $_nWave1 {("G6" 1)}
wvSelectGroup -win $_nWave1 {G2}
wvSetCursor -win $_nWave1 224671128.304885 -snap {("G6" 1)}
wvSelectSignal -win $_nWave1 {( "G6" 1 )} 
wvSelectSignal -win $_nWave1 {( "G6" 1 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G7" 0)}
wvSetPosition -win $_nWave1 {("G6" 0)}
wvSelectSignal -win $_nWave1 {( "ID" 1 )} 
wvSelectSignal -win $_nWave1 {( "ID" 1 2 3 4 5 6 7 8 9 10 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G6" 0)}
wvSelectGroup -win $_nWave1 {ID}
wvSetPosition -win $_nWave1 {("ID" 10)}
wvSetPosition -win $_nWave1 {("ID" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"EXE" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/EX2ID/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/aluout\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/clk} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_data\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_pc_o\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_retpc_o\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_stall_o} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/int_taken_i} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mepc_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mie_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mip_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mstatus_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mtvec_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mcycle_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mcycleh_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/minstret_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/minstreth_r\[31:0\]} \
}
wvCollapseGroup -win $_nWave1 "G2"
wvAddSignal -win $_nWave1 -group {"ID" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_ctrl\[6:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_src} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_wr} \
}
wvAddSignal -win $_nWave1 -group {"EX2CSR" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
}
wvCollapseGroup -win $_nWave1 "EX2CSR"
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
}
wvSelectSignal -win $_nWave1 {( "ID" 1 2 3 4 5 6 7 8 9 10 )} 
wvSetPosition -win $_nWave1 {("ID" 10)}
wvSetPosition -win $_nWave1 {("ID" 11)}
wvSetPosition -win $_nWave1 {("ID" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"EXE" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/EX2ID/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/aluout\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/clk} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_data\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_pc_o\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_retpc_o\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_stall_o} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/int_taken_i} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mepc_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mie_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mip_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mstatus_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mtvec_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mcycle_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mcycleh_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/minstret_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/minstreth_r\[31:0\]} \
}
wvCollapseGroup -win $_nWave1 "G2"
wvAddSignal -win $_nWave1 -group {"ID" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_ctrl\[6:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_src} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/rs1_addr_o\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"EX2CSR" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
}
wvCollapseGroup -win $_nWave1 "EX2CSR"
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
}
wvSelectSignal -win $_nWave1 {( "ID" 11 )} 
wvSetPosition -win $_nWave1 {("ID" 11)}
wvSetPosition -win $_nWave1 {("ID" 12)}
wvSetPosition -win $_nWave1 {("ID" 12)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"EXE" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/EX2ID/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/aluout\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/clk} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_data\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_pc_o\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_retpc_o\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_stall_o} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/int_taken_i} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mepc_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mie_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mip_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mstatus_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mtvec_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mcycle_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mcycleh_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/minstret_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/minstreth_r\[31:0\]} \
}
wvCollapseGroup -win $_nWave1 "G2"
wvAddSignal -win $_nWave1 -group {"ID" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_ctrl\[6:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_src} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/rs1_addr_o\[4:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/rs1_data_i\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"EX2CSR" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
}
wvCollapseGroup -win $_nWave1 "EX2CSR"
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
}
wvSelectSignal -win $_nWave1 {( "ID" 12 )} 
wvSetPosition -win $_nWave1 {("ID" 12)}
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU/inf_IF_ID"
wvSetPosition -win $_nWave1 {("ID" 14)}
wvSetPosition -win $_nWave1 {("ID" 14)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"EXE" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/EX2ID/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/aluout\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/clk} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_data\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_pc_o\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_retpc_o\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_stall_o} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/int_taken_i} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mepc_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mie_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mip_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mstatus_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mtvec_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mcycle_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mcycleh_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/minstret_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/minstreth_r\[31:0\]} \
}
wvCollapseGroup -win $_nWave1 "G2"
wvAddSignal -win $_nWave1 -group {"ID" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_ctrl\[6:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_src} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/rs1_addr_o\[4:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/rs1_data_i\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_IF_ID/inst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_IF_ID/pc\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"EX2CSR" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
}
wvCollapseGroup -win $_nWave1 "EX2CSR"
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
}
wvSelectSignal -win $_nWave1 {( "ID" 13 14 )} 
wvSetPosition -win $_nWave1 {("ID" 14)}
wvSelectSignal -win $_nWave1 {( "ID" 12 )} 
wvSelectSignal -win $_nWave1 {( "ID" 13 )} 
wvSelectSignal -win $_nWave1 {( "ID" 13 )} 
wvSelectSignal -win $_nWave1 {( "ID" 14 )} 
wvSelectSignal -win $_nWave1 {( "ID" 13 )} 
wvSelectSignal -win $_nWave1 {( "ID" 14 )} 
wvSelectSignal -win $_nWave1 {( "ID" 13 )} 
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU/i_exe"
wvSetPosition -win $_nWave1 {("EXE" 5)}
wvSetPosition -win $_nWave1 {("EXE" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"EXE" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/EX2ID/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/aluout\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/alu1\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/alu2\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/clk} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_data\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_pc_o\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_retpc_o\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_stall_o} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/int_taken_i} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mepc_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mie_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mip_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mstatus_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mtvec_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mcycle_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mcycleh_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/minstret_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/minstreth_r\[31:0\]} \
}
wvCollapseGroup -win $_nWave1 "G2"
wvAddSignal -win $_nWave1 -group {"ID" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_ctrl\[6:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_src} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/rs1_addr_o\[4:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/rs1_data_i\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_IF_ID/inst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_IF_ID/pc\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"EX2CSR" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
}
wvCollapseGroup -win $_nWave1 "EX2CSR"
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
}
wvSelectSignal -win $_nWave1 {( "EXE" 4 5 )} 
wvSetPosition -win $_nWave1 {("EXE" 5)}
wvSelectSignal -win $_nWave1 {( "ID" 13 )} 
wvSelectSignal -win $_nWave1 {( "ID" 14 )} 
wvGetSignalSetScope -win $_nWave1 \
           "/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR"
wvSetPosition -win $_nWave1 {("EXE" 6)}
wvSetPosition -win $_nWave1 {("EXE" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"EXE" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/EX2ID/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/aluout\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/alu1\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/alu2\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/clk} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_data\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_pc_o\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_retpc_o\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_stall_o} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/int_taken_i} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mepc_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mie_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mip_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mstatus_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mtvec_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mcycle_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mcycleh_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/minstret_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/minstreth_r\[31:0\]} \
}
wvCollapseGroup -win $_nWave1 "G2"
wvAddSignal -win $_nWave1 -group {"ID" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_ctrl\[6:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_src} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/rs1_addr_o\[4:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/rs1_data_i\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_IF_ID/inst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_IF_ID/pc\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"EX2CSR" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
}
wvCollapseGroup -win $_nWave1 "EX2CSR"
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
}
wvSelectSignal -win $_nWave1 {( "EXE" 6 )} 
wvSetPosition -win $_nWave1 {("EXE" 6)}
wvSelectSignal -win $_nWave1 {( "EXE" 5 )} 
wvSelectSignal -win $_nWave1 {( "EXE" 6 )} 
wvSelectGroup -win $_nWave1 {G2}
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU/i_exe"
wvGetSignalSetScope -win $_nWave1 \
           "/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR"
wvSetPosition -win $_nWave1 {("EXE" 7)}
wvSetPosition -win $_nWave1 {("EXE" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"EXE" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/EX2ID/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/aluout\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/alu1\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/alu2\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/clk} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_data\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_pc_o\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_retpc_o\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_stall_o} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/int_taken_i} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mepc_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mie_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mip_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mstatus_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mtvec_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mcycle_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mcycleh_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/minstret_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/minstreth_r\[31:0\]} \
}
wvCollapseGroup -win $_nWave1 "G2"
wvAddSignal -win $_nWave1 -group {"ID" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_ctrl\[6:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_src} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/rs1_addr_o\[4:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/rs1_data_i\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_IF_ID/inst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_IF_ID/pc\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"EX2CSR" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
}
wvCollapseGroup -win $_nWave1 "EX2CSR"
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
}
wvSelectSignal -win $_nWave1 {( "EXE" 7 )} 
wvSetPosition -win $_nWave1 {("EXE" 7)}
wvSelectGroup -win $_nWave1 {G6}
wvRenameGroup -win $_nWave1 {G6} {CSR}
wvSelectGroup -win $_nWave1 {G2}
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("EXE" 7)}
wvSelectGroup -win $_nWave1 {CSR}
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU/i_csr"
wvSelectGroup -win $_nWave1 {ID}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU/i_csr"
wvSelectGroup -win $_nWave1 {CSR}
wvSetPosition -win $_nWave1 {("CSR" 2)}
wvSetPosition -win $_nWave1 {("CSR" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"EXE" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/EX2ID/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/aluout\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/alu1\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/alu2\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
}
wvAddSignal -win $_nWave1 -group {"ID" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_ctrl\[6:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_src} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/rs1_addr_o\[4:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/rs1_data_i\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_IF_ID/inst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_IF_ID/pc\[31:0\]} \
}
wvCollapseGroup -win $_nWave1 "ID"
wvAddSignal -win $_nWave1 -group {"EX2CSR" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
}
wvCollapseGroup -win $_nWave1 "EX2CSR"
wvAddSignal -win $_nWave1 -group {"CSR" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_data\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mstatus_r\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G7" \
}
wvSelectSignal -win $_nWave1 {( "CSR" 2 )} 
wvSetPosition -win $_nWave1 {("CSR" 2)}
wvGetSignalSetScope -win $_nWave1 \
           "/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX"
wvGetSignalSetScope -win $_nWave1 \
           "/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR"
wvSetPosition -win $_nWave1 {("CSR" 3)}
wvSetPosition -win $_nWave1 {("CSR" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"EXE" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/EX2ID/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/aluout\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/alu1\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/alu2\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
}
wvAddSignal -win $_nWave1 -group {"ID" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_ctrl\[6:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_src} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/rs1_addr_o\[4:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/rs1_data_i\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_IF_ID/inst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_IF_ID/pc\[31:0\]} \
}
wvCollapseGroup -win $_nWave1 "ID"
wvAddSignal -win $_nWave1 -group {"EX2CSR" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
}
wvCollapseGroup -win $_nWave1 "EX2CSR"
wvAddSignal -win $_nWave1 -group {"CSR" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_data\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mstatus_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/reg_wr} \
}
wvAddSignal -win $_nWave1 -group {"G7" \
}
wvSelectSignal -win $_nWave1 {( "CSR" 3 )} 
wvSetPosition -win $_nWave1 {("CSR" 3)}
wvSelectSignal -win $_nWave1 {( "CSR" 3 )} 
wvSetPosition -win $_nWave1 {("CSR" 2)}
wvSetPosition -win $_nWave1 {("CSR" 1)}
wvSetPosition -win $_nWave1 {("CSR" 0)}
wvSetPosition -win $_nWave1 {("EX2CSR" 0)}
wvSetPosition -win $_nWave1 {("ID" 0)}
wvSetPosition -win $_nWave1 {("EXE" 7)}
wvSetPosition -win $_nWave1 {("EXE" 6)}
wvSetPosition -win $_nWave1 {("EXE" 7)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("EXE" 7)}
wvSetPosition -win $_nWave1 {("EXE" 8)}
wvSetCursor -win $_nWave1 224692179.118535 -snap {("G7" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalSetScope -win $_nWave1 \
           "/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR"
wvGetSignalSetScope -win $_nWave1 \
           "/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX"
wvSetPosition -win $_nWave1 {("G7" 1)}
wvSetPosition -win $_nWave1 {("G7" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"EXE" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/EX2ID/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/aluout\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/alu1\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/alu2\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/reg_wr} \
}
wvAddSignal -win $_nWave1 -group {"ID" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_ctrl\[6:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_src} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/rs1_addr_o\[4:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/rs1_data_i\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_IF_ID/inst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_IF_ID/pc\[31:0\]} \
}
wvCollapseGroup -win $_nWave1 "ID"
wvAddSignal -win $_nWave1 -group {"EX2CSR" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
}
wvCollapseGroup -win $_nWave1 "EX2CSR"
wvAddSignal -win $_nWave1 -group {"CSR" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_data\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mstatus_r\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX/reg_wr} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvSelectSignal -win $_nWave1 {( "G7" 1 )} 
wvSetPosition -win $_nWave1 {("G7" 1)}
wvSetPosition -win $_nWave1 {("G6" 0)}
wvSetPosition -win $_nWave1 {("CSR" 2)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("CSR" 2)}
wvSetPosition -win $_nWave1 {("CSR" 3)}
wvSetPosition -win $_nWave1 {("CSR" 4)}
wvSetPosition -win $_nWave1 {("CSR" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"EXE" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/EX2ID/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/aluout\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/alu1\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/alu2\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/reg_wr} \
}
wvAddSignal -win $_nWave1 -group {"ID" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_ctrl\[6:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_src} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/rs1_addr_o\[4:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/rs1_data_i\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_IF_ID/inst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_IF_ID/pc\[31:0\]} \
}
wvCollapseGroup -win $_nWave1 "ID"
wvAddSignal -win $_nWave1 -group {"EX2CSR" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
}
wvCollapseGroup -win $_nWave1 "EX2CSR"
wvAddSignal -win $_nWave1 -group {"CSR" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_data\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mstatus_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX/csr_addr\[11:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G7" \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvSelectSignal -win $_nWave1 {( "CSR" 4 )} 
wvSetPosition -win $_nWave1 {("CSR" 4)}
wvSetCursor -win $_nWave1 224673683.605911 -snap {("G6" 0)}
wvSetCursor -win $_nWave1 224695707.867655 -snap {("G6" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 224707754.287061 -snap {("G6" 0)}
wvSetCursor -win $_nWave1 224649469.086093 -snap {("G6" 0)}
wvSetCursor -win $_nWave1 224671128.304825 -snap {("CSR" 1)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 \
           "/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX"
wvSetPosition -win $_nWave1 {("CSR" 5)}
wvSetPosition -win $_nWave1 {("CSR" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"EXE" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/EX2ID/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/aluout\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/alu1\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/alu2\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/reg_wr} \
}
wvAddSignal -win $_nWave1 -group {"ID" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_ctrl\[6:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_src} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/rs1_addr_o\[4:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/rs1_data_i\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_IF_ID/inst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_IF_ID/pc\[31:0\]} \
}
wvCollapseGroup -win $_nWave1 "ID"
wvAddSignal -win $_nWave1 -group {"EX2CSR" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
}
wvCollapseGroup -win $_nWave1 "EX2CSR"
wvAddSignal -win $_nWave1 -group {"CSR" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_data\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mstatus_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX/rd_wdata\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G7" \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvSelectSignal -win $_nWave1 {( "CSR" 5 )} 
wvSetPosition -win $_nWave1 {("CSR" 5)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU/i_csr"
wvSetPosition -win $_nWave1 {("G6" 1)}
wvSetPosition -win $_nWave1 {("G6" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"EXE" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/EX2ID/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/aluout\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/alu1\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/alu2\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/reg_wr} \
}
wvAddSignal -win $_nWave1 -group {"ID" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_ctrl\[6:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_src} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/rs1_addr_o\[4:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/rs1_data_i\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_IF_ID/inst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_IF_ID/pc\[31:0\]} \
}
wvCollapseGroup -win $_nWave1 "ID"
wvAddSignal -win $_nWave1 -group {"EX2CSR" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
}
wvCollapseGroup -win $_nWave1 "EX2CSR"
wvAddSignal -win $_nWave1 -group {"CSR" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_data\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mstatus_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX/rd_wdata\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G7" \
}
wvAddSignal -win $_nWave1 -group {"G6" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/clk} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
}
wvSelectSignal -win $_nWave1 {( "G6" 1 )} 
wvSetPosition -win $_nWave1 {("G6" 1)}
wvSetPosition -win $_nWave1 {("CSR" 3)}
wvSetPosition -win $_nWave1 {("CSR" 4)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("CSR" 4)}
wvSetPosition -win $_nWave1 {("CSR" 5)}
wvSelectSignal -win $_nWave1 {( "CSR" 6 )} 
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectGroup -win $_nWave1 {EX2CSR}
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU/i_mem"
wvSelectGroup -win $_nWave1 {G7}
wvSelectGroup -win $_nWave1 {G6}
wvSelectSignal -win $_nWave1 {( "CSR" 6 )} 
wvSelectGroup -win $_nWave1 {G7}
wvSelectGroup -win $_nWave1 {G7}
wvSelectGroup -win $_nWave1 {G7}
wvRenameGroup -win $_nWave1 {G7} {MEM}
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_MEM"
wvSetPosition -win $_nWave1 {("MEM" 1)}
wvSetPosition -win $_nWave1 {("MEM" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"EXE" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/EX2ID/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/aluout\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/alu1\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/alu2\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/reg_wr} \
}
wvAddSignal -win $_nWave1 -group {"ID" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_ctrl\[6:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_src} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/rs1_addr_o\[4:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/rs1_data_i\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_IF_ID/inst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_IF_ID/pc\[31:0\]} \
}
wvCollapseGroup -win $_nWave1 "ID"
wvAddSignal -win $_nWave1 -group {"EX2CSR" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
}
wvCollapseGroup -win $_nWave1 "EX2CSR"
wvAddSignal -win $_nWave1 -group {"CSR" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_data\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mstatus_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/clk} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX/rd_wdata\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"MEM" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_MEM/aluout\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G8" \
}
wvSelectSignal -win $_nWave1 {( "MEM" 1 )} 
wvSetPosition -win $_nWave1 {("MEM" 1)}
wvSelectSignal -win $_nWave1 {( "EXE" 1 )} 
wvSelectSignal -win $_nWave1 {( "EXE" 3 )} 
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/EX2ID"
wvSetCursor -win $_nWave1 224717853.810402 -snap {("G8" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU/i_exe"
wvSetPosition -win $_nWave1 {("G8" 2)}
wvSetPosition -win $_nWave1 {("G8" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"EXE" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/EX2ID/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/aluout\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/alu1\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/alu2\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/reg_wr} \
}
wvAddSignal -win $_nWave1 -group {"ID" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_ctrl\[6:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_src} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/rs1_addr_o\[4:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/rs1_data_i\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_IF_ID/inst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_IF_ID/pc\[31:0\]} \
}
wvCollapseGroup -win $_nWave1 "ID"
wvAddSignal -win $_nWave1 -group {"EX2CSR" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
}
wvCollapseGroup -win $_nWave1 "EX2CSR"
wvAddSignal -win $_nWave1 -group {"CSR" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_data\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mstatus_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/clk} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX/rd_wdata\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"MEM" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_MEM/aluout\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G8" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/a} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/test\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G9" \
}
wvSelectSignal -win $_nWave1 {( "G8" 1 2 )} 
wvSetPosition -win $_nWave1 {("G8" 2)}
wvSetCursor -win $_nWave1 224662245.591525 -snap {("G9" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 224661880.548512 -snap {("G9" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "MEM" 1 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G9" 0)}
wvSetPosition -win $_nWave1 {("G8" 2)}
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU/i_exe"
wvSetPosition -win $_nWave1 {("G8" 3)}
wvSetPosition -win $_nWave1 {("G8" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"EXE" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/EX2ID/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/aluout\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/alu1\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/alu2\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/reg_wr} \
}
wvAddSignal -win $_nWave1 -group {"ID" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_ctrl\[6:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_src} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/rs1_addr_o\[4:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/rs1_data_i\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_IF_ID/inst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_IF_ID/pc\[31:0\]} \
}
wvCollapseGroup -win $_nWave1 "ID"
wvAddSignal -win $_nWave1 -group {"EX2CSR" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
}
wvCollapseGroup -win $_nWave1 "EX2CSR"
wvAddSignal -win $_nWave1 -group {"CSR" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_data\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mstatus_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/clk} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX/rd_wdata\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"MEM" \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G8" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/a} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/test\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/cpuwait_i} \
}
wvAddSignal -win $_nWave1 -group {"G9" \
}
wvSelectSignal -win $_nWave1 {( "G8" 3 )} 
wvSetPosition -win $_nWave1 {("G8" 3)}
wvSetCursor -win $_nWave1 224709336.140115 -snap {("G9" 0)}
wvSetCursor -win $_nWave1 224706294.115012 -snap {("G9" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvUnknownSaveResult -win $_nWave1 -clear
wvSelectGroup -win $_nWave1 {G8}
wvSetPosition -win $_nWave1 {("MEM" 1)}
wvSetPosition -win $_nWave1 {("MEM" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"EXE" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/EX2ID/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/aluout\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/alu1\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/alu2\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/reg_wr} \
}
wvAddSignal -win $_nWave1 -group {"ID" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_ctrl\[6:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_src} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/csr_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/rs1_addr_o\[4:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_id/rs1_data_i\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_IF_ID/inst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_IF_ID/pc\[31:0\]} \
}
wvCollapseGroup -win $_nWave1 "ID"
wvAddSignal -win $_nWave1 -group {"EX2CSR" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
}
wvCollapseGroup -win $_nWave1 "EX2CSR"
wvAddSignal -win $_nWave1 -group {"CSR" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/csr_data\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/mstatus_r\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_csr/clk} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX/rd_wdata\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"MEM" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_MEM/aluout\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G8" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_exe/cpuwait_i} \
}
wvAddSignal -win $_nWave1 -group {"G9" \
}
wvSelectSignal -win $_nWave1 {( "MEM" 1 )} 
wvSetPosition -win $_nWave1 {("MEM" 1)}
wvZoom -win $_nWave1 985160422.968750 994542903.187500
wvZoom -win $_nWave1 960765974.400000 996419399.231250
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
wvSetCursor -win $_nWave1 614239704.987500
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoom -win $_nWave1 211183218.125000 256392528.750000
wvZoom -win $_nWave1 224052205.060334 227996829.316600
wvZoom -win $_nWave1 224642922.306597 225221434.651111
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoom -win $_nWave1 225504962.978276 225797083.073030
wvZoom -win $_nWave1 225571485.376015 225585946.766845
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectGroup -win $_nWave1 {ID}
wvSelectGroup -win $_nWave1 {ID}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoom -win $_nWave1 224140022.456977 225340461.077908
wvZoom -win $_nWave1 224654071.668338 224718699.242609
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvSelectGroup -win $_nWave1 {ID}
wvSelectGroup -win $_nWave1 {ID}
wvSelectSignal -win $_nWave1 {( "ID" 1 )} 
wvSelectSignal -win $_nWave1 {( "ID" 1 2 3 4 5 6 7 8 9 10 11 12 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("MEM" 1)}
wvZoom -win $_nWave1 978279937.475000 986411420.331250
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoom -win $_nWave1 100946816.875000 161638768.125000
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoom -win $_nWave1 131912098.125000 335044343.125000
wvZoom -win $_nWave1 203310065.426980 242151565.244431
wvZoom -win $_nWave1 221216573.696702 226672650.713139
wvZoom -win $_nWave1 224309251.015423 224971002.930783
wvZoom -win $_nWave1 224622927.975280 224721207.962709
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
wvZoom -win $_nWave1 242607679.140317 286948495.647204
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoom -win $_nWave1 205609467.500000 253296000.625000
wvZoom -win $_nWave1 224495223.193069 225734600.910427
wvZoom -win $_nWave1 224647844.582699 224732208.164945
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "ID" 2 )} 
wvSetSearchMode -win $_nWave1 -value 
wvSetCursor -win $_nWave1 224712934.009819 -snap {("ID" 2)}
wvSetSearchMode -win $_nWave1 -value 10aa8
wvSearchNext -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSetCursor -win $_nWave1 224977523.868697 -snap {("G9" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectGroup -win $_nWave1 {EXE}
wvSelectGroup -win $_nWave1 {EXE} {ID} {EX2CSR} {CSR} {MEM} {G6} {G8} {G9}
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvGetSignalOpen -win $_nWave1
wvSelectGroup -win $_nWave1 {G1}
wvRenameGroup -win $_nWave1 {G1} {IF}
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU/i_if"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU"
wvRenameGroup -win $_nWave1 {IF} {ID}
wvSelectGroup -win $_nWave1 {ID}
wvSetCursor -win $_nWave1 224895248.493932
wvSetCursor -win $_nWave1 224920933.445952
wvSetCursor -win $_nWave1 224903914.554980
wvGetSignalOpen -win $_nWave1
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU/i_csr"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU"
wvRenameGroup -win $_nWave1 {ID} {PC}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU/i_csr"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU"
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU"
wvSetPosition -win $_nWave1 {("PC" 1)}
wvSetPosition -win $_nWave1 {("PC" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"PC" \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_idpc\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "PC" 1 )} 
wvSetPosition -win $_nWave1 {("PC" 1)}
wvSetPosition -win $_nWave1 {("PC" 2)}
wvSetPosition -win $_nWave1 {("PC" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"PC" \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_idpc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_idinst\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "PC" 2 )} 
wvSetPosition -win $_nWave1 {("PC" 2)}
wvSetPosition -win $_nWave1 {("PC" 3)}
wvSetPosition -win $_nWave1 {("PC" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"PC" \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_idpc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_idinst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_exepc\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "PC" 3 )} 
wvSetPosition -win $_nWave1 {("PC" 3)}
wvSetPosition -win $_nWave1 {("PC" 4)}
wvSetPosition -win $_nWave1 {("PC" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"PC" \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_idpc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_idinst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_exepc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_exeinst\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "PC" 4 )} 
wvSetPosition -win $_nWave1 {("PC" 4)}
wvSetPosition -win $_nWave1 {("PC" 5)}
wvSetPosition -win $_nWave1 {("PC" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"PC" \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_idpc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_idinst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_exepc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_exeinst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_mempc\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "PC" 5 )} 
wvSetPosition -win $_nWave1 {("PC" 5)}
wvSetPosition -win $_nWave1 {("PC" 6)}
wvSetPosition -win $_nWave1 {("PC" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"PC" \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_idpc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_idinst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_exepc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_exeinst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_mempc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_meminst\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "PC" 6 )} 
wvSetPosition -win $_nWave1 {("PC" 6)}
wvSetPosition -win $_nWave1 {("PC" 7)}
wvSetPosition -win $_nWave1 {("PC" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"PC" \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_idpc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_idinst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_exepc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_exeinst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_mempc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_meminst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_wbpc\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "PC" 7 )} 
wvSetPosition -win $_nWave1 {("PC" 7)}
wvSetPosition -win $_nWave1 {("PC" 8)}
wvSetPosition -win $_nWave1 {("PC" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"PC" \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_idpc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_idinst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_exepc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_exeinst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_mempc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_meminst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_wbpc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_wbinst\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "PC" 8 )} 
wvSetPosition -win $_nWave1 {("PC" 8)}
wvSelectSignal -win $_nWave1 {( "PC" 1 )} 
wvSetPosition -win $_nWave1 {("PC" 1)}
wvSetPosition -win $_nWave1 {("PC" 3)}
wvSetPosition -win $_nWave1 {("PC" 4)}
wvSetPosition -win $_nWave1 {("PC" 5)}
wvSetPosition -win $_nWave1 {("PC" 6)}
wvSetPosition -win $_nWave1 {("PC" 5)}
wvSetPosition -win $_nWave1 {("PC" 4)}
wvSetPosition -win $_nWave1 {("PC" 3)}
wvSetPosition -win $_nWave1 {("PC" 2)}
wvSetPosition -win $_nWave1 {("PC" 1)}
wvSetPosition -win $_nWave1 {("PC" 0)}
wvSetPosition -win $_nWave1 {("PC" 1)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("PC" 1)}
wvSelectGroup -win $_nWave1 {PC}
wvSelectGroup -win $_nWave1 {G2}
wvSelectGroup -win $_nWave1 {G2}
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU/i_mem"
wvRenameGroup -win $_nWave1 {G2} {MEM}
wvSetPosition -win $_nWave1 {("PC" 2)}
wvSetPosition -win $_nWave1 {("PC" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"PC" \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_idpc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_mem/sw_data\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_idinst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_exepc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_exeinst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_mempc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_meminst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_wbpc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_wbinst\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"MEM" \
}
wvSelectSignal -win $_nWave1 {( "PC" 2 )} 
wvSetPosition -win $_nWave1 {("PC" 2)}
wvSelectSignal -win $_nWave1 {( "PC" 2 )} 
wvSetPosition -win $_nWave1 {("PC" 3)}
wvSetPosition -win $_nWave1 {("PC" 8)}
wvSetPosition -win $_nWave1 {("PC" 9)}
wvSetPosition -win $_nWave1 {("MEM" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("MEM" 1)}
wvSetPosition -win $_nWave1 {("MEM" 1)}
wvSelectGroup -win $_nWave1 {G3}
wvGetSignalSetScope -win $_nWave1 \
           "/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/CSR2EX"
wvGetSignalSetScope -win $_nWave1 \
           "/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR"
wvRenameGroup -win $_nWave1 {G3} {EXE}
wvSetPosition -win $_nWave1 {("G3" 10)}
wvSetPosition -win $_nWave1 {("G3" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"PC" \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_idpc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_idinst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_exepc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_exeinst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_mempc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_meminst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_wbpc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_wbinst\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"MEM" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_mem/sw_data\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 5 6 7 8 9 10 )} 
wvSetPosition -win $_nWave1 {("G3" 10)}
wvSelectGroup -win $_nWave1 {G3}
wvRenameGroup -win $_nWave1 {G3} {EXE}
wvSelectGroup -win $_nWave1 {G4}
wvRenameGroup -win $_nWave1 {G4} {ID}
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/ID2EX"
wvSetPosition -win $_nWave1 {("EXE" 11)}
wvSetPosition -win $_nWave1 {("EXE" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"PC" \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_idpc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_idinst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_exepc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_exeinst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_mempc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_meminst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_wbpc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_wbinst\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"MEM" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_mem/sw_data\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"EXE" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/ID2EX/csr} \
}
wvAddSignal -win $_nWave1 -group {"ID" \
}
wvSelectSignal -win $_nWave1 {( "EXE" 11 )} 
wvSetPosition -win $_nWave1 {("EXE" 11)}
wvSelectSignal -win $_nWave1 {( "EXE" 11 )} 
wvSetPosition -win $_nWave1 {("EXE" 10)}
wvSetPosition -win $_nWave1 {("EXE" 9)}
wvSetPosition -win $_nWave1 {("EXE" 8)}
wvSetPosition -win $_nWave1 {("EXE" 7)}
wvSetPosition -win $_nWave1 {("EXE" 6)}
wvSetPosition -win $_nWave1 {("EXE" 5)}
wvSetPosition -win $_nWave1 {("EXE" 4)}
wvSetPosition -win $_nWave1 {("EXE" 3)}
wvSetPosition -win $_nWave1 {("EXE" 2)}
wvSetPosition -win $_nWave1 {("EXE" 1)}
wvSetPosition -win $_nWave1 {("EXE" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("EXE" 0)}
wvSetPosition -win $_nWave1 {("EXE" 1)}
wvSelectSignal -win $_nWave1 {( "EXE" 5 )} 
wvSetPosition -win $_nWave1 {("EXE" 5)}
wvSetPosition -win $_nWave1 {("EXE" 4)}
wvSetPosition -win $_nWave1 {("EXE" 3)}
wvSetPosition -win $_nWave1 {("EXE" 2)}
wvSetPosition -win $_nWave1 {("EXE" 1)}
wvSetPosition -win $_nWave1 {("EXE" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("EXE" 0)}
wvSetPosition -win $_nWave1 {("EXE" 1)}
wvSearchPrev -win $_nWave1
wvSetSearchMode -win $_nWave1 -value 10aa8
wvSearchNext -win $_nWave1
wvSelectSignal -win $_nWave1 {( "PC" 7 )} 
wvSelectGroup -win $_nWave1 {ID}
wvSelectGroup -win $_nWave1 {EXE}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU/i_regfile"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU_wrapper/i_CPU/i_wb"
wvSetPosition -win $_nWave1 {("ID" 0)}
wvSelectGroup -win $_nWave1 {ID}
wvRenameGroup -win $_nWave1 {ID} {WB}
wvSetPosition -win $_nWave1 {("WB" 2)}
wvSetPosition -win $_nWave1 {("WB" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"PC" \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_idpc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_idinst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_exepc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_exeinst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_mempc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_meminst\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_wbpc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/d_wbinst\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"MEM" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_mem/sw_data\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"EXE" \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/pc\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_ID_EX/ID2EX/csr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/clr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/csr_addr\[11:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/mret} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rd_wdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/reg_wr} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/rs1_rdata\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/set} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wfi} \
{/top_tb/TOP/CPU_wrapper/i_CPU/inf_EX_CSR/EX2CSR/wr} \
}
wvAddSignal -win $_nWave1 -group {"WB" \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_wb/data_o\[31:0\]} \
{/top_tb/TOP/CPU_wrapper/i_CPU/i_wb/reg_wr_o} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "WB" 1 2 )} 
wvSetPosition -win $_nWave1 {("WB" 2)}
wvSetCursor -win $_nWave1 224898902.857024 -snap {("WB" 1)}
wvSelectGroup -win $_nWave1 {G5}
wvSetCursor -win $_nWave1 224952883.020417 -snap {("G5" 0)}
wvSelectSignal -win $_nWave1 {( "PC" 7 )} 
