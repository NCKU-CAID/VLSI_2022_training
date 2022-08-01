wvResizeWindow -win $_nWave1 0 23 1920 1137
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/sam2468sam/VLSI_2021/hw1/NE6091124/build/top.fsdb}
wvResizeWindow -win $_nWave1 0 23 1920 1137
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvSetPosition -win $_nWave1 {("G1" 84)}
wvSetPosition -win $_nWave1 {("G1" 84)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU/ADDR_data\[31:0\]} \
{/top_tb/TOP/CPU/ADDR_instr\[31:0\]} \
{/top_tb/TOP/CPU/ALUCtrl\[3:0\]} \
{/top_tb/TOP/CPU/BranchCtrl\[1:0\]} \
{/top_tb/TOP/CPU/DM_stall} \
{/top_tb/TOP/CPU/EXE_ALUOP\[2:0\]} \
{/top_tb/TOP/CPU/EXE_ALUSrc} \
{/top_tb/TOP/CPU/EXE_ALU_out\[31:0\]} \
{/top_tb/TOP/CPU/EXE_Forward_rs1_data\[31:0\]} \
{/top_tb/TOP/CPU/EXE_Forward_rs2_data\[31:0\]} \
{/top_tb/TOP/CPU/EXE_Imm\[31:0\]} \
{/top_tb/TOP/CPU/EXE_MemRead} \
{/top_tb/TOP/CPU/EXE_MemWrite\[3:0\]} \
{/top_tb/TOP/CPU/EXE_MemtoReg} \
{/top_tb/TOP/CPU/EXE_PC\[31:0\]} \
{/top_tb/TOP/CPU/EXE_PC_plus_4\[31:0\]} \
{/top_tb/TOP/CPU/EXE_PC_plus_Imm\[31:0\]} \
{/top_tb/TOP/CPU/EXE_PC_to_Reg\[31:0\]} \
{/top_tb/TOP/CPU/EXE_PCtoRegSrc} \
{/top_tb/TOP/CPU/EXE_RDSrc} \
{/top_tb/TOP/CPU/EXE_RegWrite\[2:0\]} \
{/top_tb/TOP/CPU/EXE_funct3\[2:0\]} \
{/top_tb/TOP/CPU/EXE_funct7\[6:0\]} \
{/top_tb/TOP/CPU/EXE_rd_addr\[4:0\]} \
{/top_tb/TOP/CPU/EXE_rs1_addr\[4:0\]} \
{/top_tb/TOP/CPU/EXE_rs1_data\[31:0\]} \
{/top_tb/TOP/CPU/EXE_rs2_addr\[4:0\]} \
{/top_tb/TOP/CPU/EXE_rs2_data\[31:0\]} \
{/top_tb/TOP/CPU/EXE_rs2_data_ALU\[31:0\]} \
{/top_tb/TOP/CPU/ForwardRS1Src\[1:0\]} \
{/top_tb/TOP/CPU/ForwardRS2Src\[1:0\]} \
{/top_tb/TOP/CPU/ID_ALUOP\[2:0\]} \
{/top_tb/TOP/CPU/ID_ALUSrc} \
{/top_tb/TOP/CPU/ID_EXE_RegWrite} \
{/top_tb/TOP/CPU/ID_Imm\[31:0\]} \
{/top_tb/TOP/CPU/ID_Instr\[31:0\]} \
{/top_tb/TOP/CPU/ID_MemRead} \
{/top_tb/TOP/CPU/ID_MemWrite\[3:0\]} \
{/top_tb/TOP/CPU/ID_MemtoReg} \
{/top_tb/TOP/CPU/ID_PC\[31:0\]} \
{/top_tb/TOP/CPU/ID_PCtoRegSrc} \
{/top_tb/TOP/CPU/ID_RDSrc} \
{/top_tb/TOP/CPU/ID_RegWrite\[2:0\]} \
{/top_tb/TOP/CPU/ID_rs1_data\[31:0\]} \
{/top_tb/TOP/CPU/ID_rs2_data\[31:0\]} \
{/top_tb/TOP/CPU/IF_ID_RegWrite\[1:0\]} \
{/top_tb/TOP/CPU/IM_stall} \
{/top_tb/TOP/CPU/ImmType\[2:0\]} \
{/top_tb/TOP/CPU/InstrRead} \
{/top_tb/TOP/CPU/Instr_out\[31:0\]} \
{/top_tb/TOP/CPU/MEM_ALU_out\[31:0\]} \
{/top_tb/TOP/CPU/MEM_MemRead} \
{/top_tb/TOP/CPU/MEM_MemWrite\[3:0\]} \
{/top_tb/TOP/CPU/MEM_MemWrite_pre\[3:0\]} \
{/top_tb/TOP/CPU/MEM_MemtoReg} \
{/top_tb/TOP/CPU/MEM_PC_to_Reg\[31:0\]} \
{/top_tb/TOP/CPU/MEM_RDSrc} \
{/top_tb/TOP/CPU/MEM_RegWrite\[2:0\]} \
{/top_tb/TOP/CPU/MEM_rd_addr\[4:0\]} \
{/top_tb/TOP/CPU/MEM_rd_data\[31:0\]} \
{/top_tb/TOP/CPU/PCWrite} \
{/top_tb/TOP/CPU/PC_in\[31:0\]} \
{/top_tb/TOP/CPU/PC_out\[31:0\]} \
{/top_tb/TOP/CPU/PC_plus_4\[31:0\]} \
{/top_tb/TOP/CPU/RDATA_data\[31:0\]} \
{/top_tb/TOP/CPU/RDATA_instr\[31:0\]} \
{/top_tb/TOP/CPU/READ_data} \
{/top_tb/TOP/CPU/READ_instr} \
{/top_tb/TOP/CPU/WB_MemtoReg} \
{/top_tb/TOP/CPU/WB_RegWrite\[2:0\]} \
{/top_tb/TOP/CPU/WB_data_out\[31:0\]} \
{/top_tb/TOP/CPU/WB_rd_addr\[4:0\]} \
{/top_tb/TOP/CPU/WB_rd_data\[31:0\]} \
{/top_tb/TOP/CPU/WB_rd_data_temp\[31:0\]} \
{/top_tb/TOP/CPU/WDATA_data\[31:0\]} \
{/top_tb/TOP/CPU/WDATA_instr\[31:0\]} \
{/top_tb/TOP/CPU/WRITE_data\[3:0\]} \
{/top_tb/TOP/CPU/WRITE_instr\[3:0\]} \
{/top_tb/TOP/CPU/ZeroFlag} \
{/top_tb/TOP/CPU/clk} \
{/top_tb/TOP/CPU/data_in\[31:0\]} \
{/top_tb/TOP/CPU/data_in_pre\[31:0\]} \
{/top_tb/TOP/CPU/data_out\[31:0\]} \
{/top_tb/TOP/CPU/rst} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 \
           40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 \
           62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 \
           84 )} 
wvSetPosition -win $_nWave1 {("G1" 84)}
wvGetSignalClose -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvScrollUp -win $_nWave1 36
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvScrollDown -win $_nWave1 36
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 \
           40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 \
           62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 \
           84 )} 
wvSetPosition -win $_nWave1 {("G2" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 84)}
wvSetPosition -win $_nWave1 {("G2" 84)}
wvScrollUp -win $_nWave1 36
wvSelectSignal -win $_nWave1 {( "G2" 15 )} 
wvSetPosition -win $_nWave1 {("G2" 15)}
wvSetPosition -win $_nWave1 {("G2" 10)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSelectSignal -win $_nWave1 {( "G2" 21 )} 
wvSetPosition -win $_nWave1 {("G2" 21)}
wvSetPosition -win $_nWave1 {("G2" 18)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSelectSignal -win $_nWave1 {( "G2" 9 )} 
wvSetPosition -win $_nWave1 {("G2" 9)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSelectSignal -win $_nWave1 {( "G2" 26 )} 
wvSetPosition -win $_nWave1 {("G2" 26)}
wvSetPosition -win $_nWave1 {("G2" 21)}
wvSetPosition -win $_nWave1 {("G2" 10)}
wvSetPosition -win $_nWave1 {("G2" 9)}
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSelectSignal -win $_nWave1 {( "G2" 8 )} 
wvSetPosition -win $_nWave1 {("G2" 8)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvScrollDown -win $_nWave1 7
wvScrollDown -win $_nWave1 7
wvScrollUp -win $_nWave1 6
wvScrollDown -win $_nWave1 29
wvSelectSignal -win $_nWave1 {( "G2" 78 )} 
wvSetPosition -win $_nWave1 {("G2" 78)}
wvSetPosition -win $_nWave1 {("G2" 71)}
wvSetPosition -win $_nWave1 {("G2" 59)}
wvSetPosition -win $_nWave1 {("G2" 55)}
wvSetPosition -win $_nWave1 {("G2" 53)}
wvSetPosition -win $_nWave1 {("G2" 52)}
wvSetPosition -win $_nWave1 {("G2" 51)}
wvSetPosition -win $_nWave1 {("G2" 49)}
wvSetPosition -win $_nWave1 {("G2" 48)}
wvSetPosition -win $_nWave1 {("G2" 47)}
wvSetPosition -win $_nWave1 {("G2" 46)}
wvSetPosition -win $_nWave1 {("G2" 45)}
wvSetPosition -win $_nWave1 {("G2" 44)}
wvSetPosition -win $_nWave1 {("G2" 43)}
wvSetPosition -win $_nWave1 {("G2" 42)}
wvSetPosition -win $_nWave1 {("G2" 41)}
wvSetPosition -win $_nWave1 {("G2" 40)}
wvSetPosition -win $_nWave1 {("G2" 39)}
wvSetPosition -win $_nWave1 {("G2" 37)}
wvSetPosition -win $_nWave1 {("G2" 36)}
wvSetPosition -win $_nWave1 {("G2" 35)}
wvSetPosition -win $_nWave1 {("G2" 34)}
wvSetPosition -win $_nWave1 {("G2" 33)}
wvSetPosition -win $_nWave1 {("G2" 32)}
wvSetPosition -win $_nWave1 {("G2" 31)}
wvSetPosition -win $_nWave1 {("G2" 30)}
wvSetPosition -win $_nWave1 {("G2" 29)}
wvSetPosition -win $_nWave1 {("G2" 28)}
wvSetPosition -win $_nWave1 {("G2" 27)}
wvSetPosition -win $_nWave1 {("G2" 26)}
wvSetPosition -win $_nWave1 {("G2" 25)}
wvSetPosition -win $_nWave1 {("G2" 24)}
wvSetPosition -win $_nWave1 {("G2" 23)}
wvSetPosition -win $_nWave1 {("G2" 22)}
wvSetPosition -win $_nWave1 {("G2" 21)}
wvSetPosition -win $_nWave1 {("G2" 20)}
wvSetPosition -win $_nWave1 {("G2" 19)}
wvSetPosition -win $_nWave1 {("G2" 18)}
wvSetPosition -win $_nWave1 {("G2" 17)}
wvSetPosition -win $_nWave1 {("G2" 16)}
wvSetPosition -win $_nWave1 {("G2" 15)}
wvSetPosition -win $_nWave1 {("G2" 14)}
wvSetPosition -win $_nWave1 {("G2" 13)}
wvSetPosition -win $_nWave1 {("G2" 12)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSetPosition -win $_nWave1 {("G2" 10)}
wvSetPosition -win $_nWave1 {("G2" 9)}
wvSetPosition -win $_nWave1 {("G2" 8)}
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvScrollDown -win $_nWave1 37
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G2" 65 )} 
wvSelectSignal -win $_nWave1 {( "G2" 65 67 )} 
wvSelectSignal -win $_nWave1 {( "G2" 65 67 68 )} 
wvSetPosition -win $_nWave1 {("G2" 65)}
wvSetPosition -win $_nWave1 {("G2" 58)}
wvSetPosition -win $_nWave1 {("G2" 46)}
wvSetPosition -win $_nWave1 {("G2" 44)}
wvSetPosition -win $_nWave1 {("G2" 43)}
wvSetPosition -win $_nWave1 {("G2" 42)}
wvSetPosition -win $_nWave1 {("G2" 41)}
wvSetPosition -win $_nWave1 {("G2" 40)}
wvSetPosition -win $_nWave1 {("G2" 39)}
wvSetPosition -win $_nWave1 {("G2" 38)}
wvSetPosition -win $_nWave1 {("G2" 37)}
wvSetPosition -win $_nWave1 {("G2" 36)}
wvSetPosition -win $_nWave1 {("G2" 35)}
wvSetPosition -win $_nWave1 {("G2" 34)}
wvSetPosition -win $_nWave1 {("G2" 33)}
wvSetPosition -win $_nWave1 {("G2" 32)}
wvSetPosition -win $_nWave1 {("G2" 31)}
wvSetPosition -win $_nWave1 {("G2" 30)}
wvSetPosition -win $_nWave1 {("G2" 29)}
wvSetPosition -win $_nWave1 {("G2" 28)}
wvSetPosition -win $_nWave1 {("G2" 27)}
wvSetPosition -win $_nWave1 {("G2" 26)}
wvSetPosition -win $_nWave1 {("G2" 25)}
wvSetPosition -win $_nWave1 {("G2" 24)}
wvSetPosition -win $_nWave1 {("G2" 23)}
wvSetPosition -win $_nWave1 {("G2" 22)}
wvSetPosition -win $_nWave1 {("G2" 21)}
wvSetPosition -win $_nWave1 {("G2" 20)}
wvSetPosition -win $_nWave1 {("G2" 19)}
wvSetPosition -win $_nWave1 {("G2" 18)}
wvSetPosition -win $_nWave1 {("G2" 17)}
wvSetPosition -win $_nWave1 {("G2" 16)}
wvSetPosition -win $_nWave1 {("G2" 15)}
wvSetPosition -win $_nWave1 {("G2" 14)}
wvSetPosition -win $_nWave1 {("G2" 13)}
wvSetPosition -win $_nWave1 {("G2" 12)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSetPosition -win $_nWave1 {("G2" 12)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSetPosition -win $_nWave1 {("G2" 10)}
wvSetPosition -win $_nWave1 {("G2" 9)}
wvSetPosition -win $_nWave1 {("G2" 8)}
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetCursor -win $_nWave1 6020.880036 -snap {("G1" 1)}
wvSetSearchMode -win $_nWave1 -value 
wvSetSearchMode -win $_nWave1 -value 400
wvSearchNext -win $_nWave1
wvZoomIn -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU/RegFile"
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU/EXE_PC\[31:0\]} \
{/top_tb/TOP/CPU/EXE_funct3\[2:0\]} \
{/top_tb/TOP/CPU/EXE_Forward_rs1_data\[31:0\]} \
{/top_tb/TOP/CPU/EXE_rs2_data_ALU\[31:0\]} \
{/top_tb/TOP/CPU/EXE_ALU_out\[31:0\]} \
{/top_tb/TOP/CPU/data_out\[31:0\]} \
{/top_tb/TOP/CPU/WB_RegWrite\[2:0\]} \
{/top_tb/TOP/CPU/WB_rd_addr\[4:0\]} \
{/top_tb/TOP/CPU/WB_rd_data\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU/ADDR_data\[31:0\]} \
{/top_tb/TOP/CPU/ADDR_instr\[31:0\]} \
{/top_tb/TOP/CPU/ALUCtrl\[3:0\]} \
{/top_tb/TOP/CPU/BranchCtrl\[1:0\]} \
{/top_tb/TOP/CPU/DM_stall} \
{/top_tb/TOP/CPU/EXE_ALUOP\[2:0\]} \
{/top_tb/TOP/CPU/EXE_ALUSrc} \
{/top_tb/TOP/CPU/EXE_Forward_rs2_data\[31:0\]} \
{/top_tb/TOP/CPU/EXE_Imm\[31:0\]} \
{/top_tb/TOP/CPU/EXE_MemRead} \
{/top_tb/TOP/CPU/EXE_MemWrite\[3:0\]} \
{/top_tb/TOP/CPU/EXE_MemtoReg} \
{/top_tb/TOP/CPU/EXE_PC_plus_4\[31:0\]} \
{/top_tb/TOP/CPU/EXE_PC_plus_Imm\[31:0\]} \
{/top_tb/TOP/CPU/EXE_PC_to_Reg\[31:0\]} \
{/top_tb/TOP/CPU/EXE_PCtoRegSrc} \
{/top_tb/TOP/CPU/EXE_RDSrc} \
{/top_tb/TOP/CPU/EXE_RegWrite\[2:0\]} \
{/top_tb/TOP/CPU/EXE_funct7\[6:0\]} \
{/top_tb/TOP/CPU/EXE_rd_addr\[4:0\]} \
{/top_tb/TOP/CPU/EXE_rs1_addr\[4:0\]} \
{/top_tb/TOP/CPU/EXE_rs1_data\[31:0\]} \
{/top_tb/TOP/CPU/EXE_rs2_addr\[4:0\]} \
{/top_tb/TOP/CPU/EXE_rs2_data\[31:0\]} \
{/top_tb/TOP/CPU/ForwardRS1Src\[1:0\]} \
{/top_tb/TOP/CPU/ForwardRS2Src\[1:0\]} \
{/top_tb/TOP/CPU/ID_ALUOP\[2:0\]} \
{/top_tb/TOP/CPU/ID_ALUSrc} \
{/top_tb/TOP/CPU/ID_EXE_RegWrite} \
{/top_tb/TOP/CPU/ID_Imm\[31:0\]} \
{/top_tb/TOP/CPU/ID_Instr\[31:0\]} \
{/top_tb/TOP/CPU/ID_MemRead} \
{/top_tb/TOP/CPU/ID_MemWrite\[3:0\]} \
{/top_tb/TOP/CPU/ID_MemtoReg} \
{/top_tb/TOP/CPU/ID_PC\[31:0\]} \
{/top_tb/TOP/CPU/ID_PCtoRegSrc} \
{/top_tb/TOP/CPU/ID_RDSrc} \
{/top_tb/TOP/CPU/ID_RegWrite\[2:0\]} \
{/top_tb/TOP/CPU/ID_rs1_data\[31:0\]} \
{/top_tb/TOP/CPU/ID_rs2_data\[31:0\]} \
{/top_tb/TOP/CPU/IF_ID_RegWrite\[1:0\]} \
{/top_tb/TOP/CPU/IM_stall} \
{/top_tb/TOP/CPU/ImmType\[2:0\]} \
{/top_tb/TOP/CPU/InstrRead} \
{/top_tb/TOP/CPU/Instr_out\[31:0\]} \
{/top_tb/TOP/CPU/MEM_ALU_out\[31:0\]} \
{/top_tb/TOP/CPU/MEM_MemRead} \
{/top_tb/TOP/CPU/MEM_MemWrite\[3:0\]} \
{/top_tb/TOP/CPU/MEM_MemWrite_pre\[3:0\]} \
{/top_tb/TOP/CPU/MEM_MemtoReg} \
{/top_tb/TOP/CPU/MEM_PC_to_Reg\[31:0\]} \
{/top_tb/TOP/CPU/MEM_RDSrc} \
{/top_tb/TOP/CPU/MEM_RegWrite\[2:0\]} \
{/top_tb/TOP/CPU/MEM_rd_addr\[4:0\]} \
{/top_tb/TOP/CPU/MEM_rd_data\[31:0\]} \
{/top_tb/TOP/CPU/PCWrite} \
{/top_tb/TOP/CPU/PC_in\[31:0\]} \
{/top_tb/TOP/CPU/PC_out\[31:0\]} \
{/top_tb/TOP/CPU/PC_plus_4\[31:0\]} \
{/top_tb/TOP/CPU/RDATA_data\[31:0\]} \
{/top_tb/TOP/CPU/RDATA_instr\[31:0\]} \
{/top_tb/TOP/CPU/READ_data} \
{/top_tb/TOP/CPU/READ_instr} \
{/top_tb/TOP/CPU/WB_MemtoReg} \
{/top_tb/TOP/CPU/WB_data_out\[31:0\]} \
{/top_tb/TOP/CPU/WB_rd_data_temp\[31:0\]} \
{/top_tb/TOP/CPU/WDATA_data\[31:0\]} \
{/top_tb/TOP/CPU/WDATA_instr\[31:0\]} \
{/top_tb/TOP/CPU/WRITE_data\[3:0\]} \
{/top_tb/TOP/CPU/WRITE_instr\[3:0\]} \
{/top_tb/TOP/CPU/ZeroFlag} \
{/top_tb/TOP/CPU/clk} \
{/top_tb/TOP/CPU/data_in\[31:0\]} \
{/top_tb/TOP/CPU/data_in_pre\[31:0\]} \
{/top_tb/TOP/CPU/rst} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvExpandBus -win $_nWave1 {("G2" 1)}
wvSelectSignal -win $_nWave1 {( "G2" 27 )} 
wvSetPosition -win $_nWave1 {("G2" 27)}
wvSetPosition -win $_nWave1 {("G2" 22)}
wvSetPosition -win $_nWave1 {("G2" 15)}
wvSetPosition -win $_nWave1 {("G2" 14)}
wvSetPosition -win $_nWave1 {("G2" 12)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSetPosition -win $_nWave1 {("G2" 10)}
wvSetPosition -win $_nWave1 {("G2" 9)}
wvSetPosition -win $_nWave1 {("G2" 8)}
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvScrollDown -win $_nWave1 70
wvSelectSignal -win $_nWave1 {( "G2" 104 )} 
wvSetPosition -win $_nWave1 {("G2" 104)}
wvSetPosition -win $_nWave1 {("G2" 102)}
wvSetPosition -win $_nWave1 {("G2" 92)}
wvSetPosition -win $_nWave1 {("G2" 90)}
wvSetPosition -win $_nWave1 {("G2" 85)}
wvSetPosition -win $_nWave1 {("G2" 82)}
wvSetPosition -win $_nWave1 {("G2" 80)}
wvSetPosition -win $_nWave1 {("G2" 76)}
wvSetPosition -win $_nWave1 {("G2" 74)}
wvSetPosition -win $_nWave1 {("G2" 72)}
wvSetPosition -win $_nWave1 {("G2" 67)}
wvSetPosition -win $_nWave1 {("G2" 65)}
wvSetPosition -win $_nWave1 {("G2" 63)}
wvSetPosition -win $_nWave1 {("G2" 62)}
wvSetPosition -win $_nWave1 {("G2" 60)}
wvSetPosition -win $_nWave1 {("G2" 58)}
wvSetPosition -win $_nWave1 {("G2" 57)}
wvSetPosition -win $_nWave1 {("G2" 56)}
wvSetPosition -win $_nWave1 {("G2" 55)}
wvSetPosition -win $_nWave1 {("G2" 54)}
wvSetPosition -win $_nWave1 {("G2" 53)}
wvSetPosition -win $_nWave1 {("G2" 52)}
wvSetPosition -win $_nWave1 {("G2" 51)}
wvSetPosition -win $_nWave1 {("G2" 50)}
wvSetPosition -win $_nWave1 {("G2" 49)}
wvSetPosition -win $_nWave1 {("G2" 48)}
wvSetPosition -win $_nWave1 {("G2" 47)}
wvSetPosition -win $_nWave1 {("G2" 46)}
wvSetPosition -win $_nWave1 {("G2" 45)}
wvSetPosition -win $_nWave1 {("G2" 44)}
wvSetPosition -win $_nWave1 {("G2" 43)}
wvSetPosition -win $_nWave1 {("G2" 42)}
wvSetPosition -win $_nWave1 {("G2" 41)}
wvSetPosition -win $_nWave1 {("G2" 40)}
wvSetPosition -win $_nWave1 {("G2" 39)}
wvSetPosition -win $_nWave1 {("G2" 38)}
wvSetPosition -win $_nWave1 {("G2" 37)}
wvSetPosition -win $_nWave1 {("G2" 36)}
wvSetPosition -win $_nWave1 {("G2" 35)}
wvSetPosition -win $_nWave1 {("G2" 34)}
wvSetPosition -win $_nWave1 {("G2" 33)}
wvSetPosition -win $_nWave1 {("G2" 32)}
wvSetPosition -win $_nWave1 {("G2" 31)}
wvSetPosition -win $_nWave1 {("G2" 30)}
wvSetPosition -win $_nWave1 {("G2" 29)}
wvSetPosition -win $_nWave1 {("G2" 28)}
wvSetPosition -win $_nWave1 {("G2" 27)}
wvSetPosition -win $_nWave1 {("G2" 26)}
wvSetPosition -win $_nWave1 {("G2" 25)}
wvSetPosition -win $_nWave1 {("G2" 24)}
wvSetPosition -win $_nWave1 {("G2" 23)}
wvSetPosition -win $_nWave1 {("G2" 22)}
wvSetPosition -win $_nWave1 {("G2" 21)}
wvSetPosition -win $_nWave1 {("G2" 20)}
wvSetPosition -win $_nWave1 {("G2" 19)}
wvSetPosition -win $_nWave1 {("G2" 18)}
wvSetPosition -win $_nWave1 {("G2" 17)}
wvSetPosition -win $_nWave1 {("G2" 16)}
wvSetPosition -win $_nWave1 {("G2" 15)}
wvSetPosition -win $_nWave1 {("G2" 14)}
wvSetPosition -win $_nWave1 {("G2" 13)}
wvSetPosition -win $_nWave1 {("G2" 12)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSetPosition -win $_nWave1 {("G2" 10)}
wvSetPosition -win $_nWave1 {("G2" 9)}
wvSetPosition -win $_nWave1 {("G2" 8)}
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvScrollDown -win $_nWave1 70
wvSelectSignal -win $_nWave1 {( "G2" 79 )} 
wvSelectSignal -win $_nWave1 {( "G2" 78 79 )} 
wvSelectSignal -win $_nWave1 {( "G2" 78 79 80 )} 
wvSelectSignal -win $_nWave1 {( "G2" 78 79 )} 
wvSetPosition -win $_nWave1 {("G2" 79)}
wvSetPosition -win $_nWave1 {("G2" 72)}
wvSetPosition -win $_nWave1 {("G2" 66)}
wvSetPosition -win $_nWave1 {("G2" 65)}
wvSetPosition -win $_nWave1 {("G2" 64)}
wvSetPosition -win $_nWave1 {("G2" 63)}
wvSetPosition -win $_nWave1 {("G2" 62)}
wvSetPosition -win $_nWave1 {("G2" 61)}
wvSetPosition -win $_nWave1 {("G2" 60)}
wvSetPosition -win $_nWave1 {("G2" 59)}
wvSetPosition -win $_nWave1 {("G2" 58)}
wvSetPosition -win $_nWave1 {("G2" 57)}
wvSetPosition -win $_nWave1 {("G2" 56)}
wvSetPosition -win $_nWave1 {("G2" 55)}
wvSetPosition -win $_nWave1 {("G2" 54)}
wvSetPosition -win $_nWave1 {("G2" 53)}
wvSetPosition -win $_nWave1 {("G2" 52)}
wvSetPosition -win $_nWave1 {("G2" 51)}
wvSetPosition -win $_nWave1 {("G2" 50)}
wvSetPosition -win $_nWave1 {("G2" 49)}
wvSetPosition -win $_nWave1 {("G2" 48)}
wvSetPosition -win $_nWave1 {("G2" 47)}
wvSetPosition -win $_nWave1 {("G2" 46)}
wvSetPosition -win $_nWave1 {("G2" 45)}
wvSetPosition -win $_nWave1 {("G2" 44)}
wvSetPosition -win $_nWave1 {("G2" 43)}
wvSetPosition -win $_nWave1 {("G2" 42)}
wvSetPosition -win $_nWave1 {("G2" 41)}
wvSetPosition -win $_nWave1 {("G2" 40)}
wvSetPosition -win $_nWave1 {("G2" 39)}
wvSetPosition -win $_nWave1 {("G2" 38)}
wvSetPosition -win $_nWave1 {("G2" 37)}
wvSetPosition -win $_nWave1 {("G2" 36)}
wvSetPosition -win $_nWave1 {("G2" 35)}
wvSetPosition -win $_nWave1 {("G2" 34)}
wvSetPosition -win $_nWave1 {("G2" 33)}
wvSetPosition -win $_nWave1 {("G2" 32)}
wvSetPosition -win $_nWave1 {("G2" 31)}
wvSetPosition -win $_nWave1 {("G2" 30)}
wvSetPosition -win $_nWave1 {("G2" 29)}
wvSetPosition -win $_nWave1 {("G2" 28)}
wvSetPosition -win $_nWave1 {("G2" 27)}
wvSetPosition -win $_nWave1 {("G2" 26)}
wvSetPosition -win $_nWave1 {("G2" 25)}
wvSetPosition -win $_nWave1 {("G2" 24)}
wvSetPosition -win $_nWave1 {("G2" 23)}
wvSetPosition -win $_nWave1 {("G2" 22)}
wvSetPosition -win $_nWave1 {("G2" 21)}
wvSetPosition -win $_nWave1 {("G2" 20)}
wvSetPosition -win $_nWave1 {("G2" 19)}
wvSetPosition -win $_nWave1 {("G2" 18)}
wvSetPosition -win $_nWave1 {("G2" 17)}
wvSetPosition -win $_nWave1 {("G2" 16)}
wvSetPosition -win $_nWave1 {("G2" 15)}
wvSetPosition -win $_nWave1 {("G2" 14)}
wvSetPosition -win $_nWave1 {("G2" 13)}
wvSetPosition -win $_nWave1 {("G2" 12)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSetPosition -win $_nWave1 {("G2" 10)}
wvSetPosition -win $_nWave1 {("G2" 9)}
wvSetPosition -win $_nWave1 {("G2" 8)}
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU/RegFile"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU/clk} \
{/top_tb/TOP/CPU/EXE_PC\[31:0\]} \
{/top_tb/TOP/CPU/EXE_funct3\[2:0\]} \
{/top_tb/TOP/CPU/EXE_Forward_rs1_data\[31:0\]} \
{/top_tb/TOP/CPU/EXE_rs2_data_ALU\[31:0\]} \
{/top_tb/TOP/CPU/EXE_ALU_out\[31:0\]} \
{/top_tb/TOP/CPU/MEM_MemRead} \
{/top_tb/TOP/CPU/MEM_ALU_out\[31:0\]} \
{/top_tb/TOP/CPU/data_out\[31:0\]} \
{/top_tb/TOP/CPU/WB_RegWrite\[2:0\]} \
{/top_tb/TOP/CPU/WB_rd_addr\[4:0\]} \
{/top_tb/TOP/CPU/WB_rd_data\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[6\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU/RegFile/Register\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[31\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[30\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[29\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[28\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[27\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[26\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[25\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[24\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[23\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[22\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[21\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[20\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[19\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[18\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[17\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[16\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[15\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[14\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[13\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[12\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[11\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[10\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[9\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[8\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[7\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[5\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[4\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[3\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[2\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[1\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[0\]\[31:0\]} \
{/top_tb/TOP/CPU/ADDR_data\[31:0\]} \
{/top_tb/TOP/CPU/ADDR_instr\[31:0\]} \
{/top_tb/TOP/CPU/ALUCtrl\[3:0\]} \
{/top_tb/TOP/CPU/BranchCtrl\[1:0\]} \
{/top_tb/TOP/CPU/DM_stall} \
{/top_tb/TOP/CPU/EXE_ALUOP\[2:0\]} \
{/top_tb/TOP/CPU/EXE_ALUSrc} \
{/top_tb/TOP/CPU/EXE_Forward_rs2_data\[31:0\]} \
{/top_tb/TOP/CPU/EXE_Imm\[31:0\]} \
{/top_tb/TOP/CPU/EXE_MemRead} \
{/top_tb/TOP/CPU/EXE_MemWrite\[3:0\]} \
{/top_tb/TOP/CPU/EXE_MemtoReg} \
{/top_tb/TOP/CPU/EXE_PC_plus_4\[31:0\]} \
{/top_tb/TOP/CPU/EXE_PC_plus_Imm\[31:0\]} \
{/top_tb/TOP/CPU/EXE_PC_to_Reg\[31:0\]} \
{/top_tb/TOP/CPU/EXE_PCtoRegSrc} \
{/top_tb/TOP/CPU/EXE_RDSrc} \
{/top_tb/TOP/CPU/EXE_RegWrite\[2:0\]} \
{/top_tb/TOP/CPU/EXE_funct7\[6:0\]} \
{/top_tb/TOP/CPU/EXE_rd_addr\[4:0\]} \
{/top_tb/TOP/CPU/EXE_rs1_addr\[4:0\]} \
{/top_tb/TOP/CPU/EXE_rs1_data\[31:0\]} \
{/top_tb/TOP/CPU/EXE_rs2_addr\[4:0\]} \
{/top_tb/TOP/CPU/EXE_rs2_data\[31:0\]} \
{/top_tb/TOP/CPU/ForwardRS1Src\[1:0\]} \
{/top_tb/TOP/CPU/ForwardRS2Src\[1:0\]} \
{/top_tb/TOP/CPU/ID_ALUOP\[2:0\]} \
{/top_tb/TOP/CPU/ID_ALUSrc} \
{/top_tb/TOP/CPU/ID_EXE_RegWrite} \
{/top_tb/TOP/CPU/ID_Imm\[31:0\]} \
{/top_tb/TOP/CPU/ID_Instr\[31:0\]} \
{/top_tb/TOP/CPU/ID_MemRead} \
{/top_tb/TOP/CPU/ID_MemWrite\[3:0\]} \
{/top_tb/TOP/CPU/ID_MemtoReg} \
{/top_tb/TOP/CPU/ID_PC\[31:0\]} \
{/top_tb/TOP/CPU/ID_PCtoRegSrc} \
{/top_tb/TOP/CPU/ID_RDSrc} \
{/top_tb/TOP/CPU/ID_RegWrite\[2:0\]} \
{/top_tb/TOP/CPU/ID_rs1_data\[31:0\]} \
{/top_tb/TOP/CPU/ID_rs2_data\[31:0\]} \
{/top_tb/TOP/CPU/IF_ID_RegWrite\[1:0\]} \
{/top_tb/TOP/CPU/IM_stall} \
{/top_tb/TOP/CPU/ImmType\[2:0\]} \
{/top_tb/TOP/CPU/InstrRead} \
{/top_tb/TOP/CPU/Instr_out\[31:0\]} \
{/top_tb/TOP/CPU/MEM_MemWrite\[3:0\]} \
{/top_tb/TOP/CPU/MEM_MemWrite_pre\[3:0\]} \
{/top_tb/TOP/CPU/MEM_MemtoReg} \
{/top_tb/TOP/CPU/MEM_PC_to_Reg\[31:0\]} \
{/top_tb/TOP/CPU/MEM_RDSrc} \
{/top_tb/TOP/CPU/MEM_RegWrite\[2:0\]} \
{/top_tb/TOP/CPU/MEM_rd_addr\[4:0\]} \
{/top_tb/TOP/CPU/MEM_rd_data\[31:0\]} \
{/top_tb/TOP/CPU/PCWrite} \
{/top_tb/TOP/CPU/PC_in\[31:0\]} \
{/top_tb/TOP/CPU/PC_out\[31:0\]} \
{/top_tb/TOP/CPU/PC_plus_4\[31:0\]} \
{/top_tb/TOP/CPU/RDATA_data\[31:0\]} \
{/top_tb/TOP/CPU/RDATA_instr\[31:0\]} \
{/top_tb/TOP/CPU/READ_data} \
{/top_tb/TOP/CPU/READ_instr} \
{/top_tb/TOP/CPU/WB_MemtoReg} \
{/top_tb/TOP/CPU/WB_data_out\[31:0\]} \
{/top_tb/TOP/CPU/WB_rd_data_temp\[31:0\]} \
{/top_tb/TOP/CPU/WDATA_data\[31:0\]} \
{/top_tb/TOP/CPU/WDATA_instr\[31:0\]} \
{/top_tb/TOP/CPU/WRITE_data\[3:0\]} \
{/top_tb/TOP/CPU/WRITE_instr\[3:0\]} \
{/top_tb/TOP/CPU/ZeroFlag} \
{/top_tb/TOP/CPU/data_in\[31:0\]} \
{/top_tb/TOP/CPU/data_in_pre\[31:0\]} \
{/top_tb/TOP/CPU/rst} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSetPosition -win $_nWave1 {("G1" 9)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSetSearchMode -win $_nWave1 -value 540
wvSearchNext -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 8)}
wvSetPosition -win $_nWave1 {("G2" 9)}
wvSetPosition -win $_nWave1 {("G2" 10)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSetPosition -win $_nWave1 {("G2" 12)}
wvSetPosition -win $_nWave1 {("G2" 13)}
wvSetPosition -win $_nWave1 {("G2" 14)}
wvSetPosition -win $_nWave1 {("G2" 15)}
wvSetPosition -win $_nWave1 {("G2" 16)}
wvSetPosition -win $_nWave1 {("G2" 17)}
wvSetPosition -win $_nWave1 {("G2" 18)}
wvSetPosition -win $_nWave1 {("G2" 19)}
wvSetPosition -win $_nWave1 {("G2" 20)}
wvSetPosition -win $_nWave1 {("G2" 21)}
wvSetPosition -win $_nWave1 {("G2" 22)}
wvSetPosition -win $_nWave1 {("G2" 23)}
wvSetPosition -win $_nWave1 {("G2" 24)}
wvSetPosition -win $_nWave1 {("G2" 25)}
wvSetPosition -win $_nWave1 {("G2" 26)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 27)}
wvSelectSignal -win $_nWave1 {( "G2" 28 )} 
wvSetPosition -win $_nWave1 {("G2" 28)}
wvSetPosition -win $_nWave1 {("G2" 25)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSetPosition -win $_nWave1 {("G2" 9)}
wvSetPosition -win $_nWave1 {("G2" 8)}
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU/RegFile"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvGetSignalClose -win $_nWave1
wvScrollDown -win $_nWave1 33
wvSelectSignal -win $_nWave1 {( "G2" 33 )} 
wvScrollDown -win $_nWave1 34
wvSelectSignal -win $_nWave1 {( "G2" 33 34 35 36 37 38 39 40 41 42 43 44 45 46 \
           47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 \
           69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 \
           91 92 93 94 95 96 97 98 99 100 101 102 103 104 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 10)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU/RegFile"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU/clk} \
{/top_tb/TOP/CPU/EXE_PC\[31:0\]} \
{/top_tb/TOP/CPU/EXE_funct3\[2:0\]} \
{/top_tb/TOP/CPU/EXE_Forward_rs1_data\[31:0\]} \
{/top_tb/TOP/CPU/EXE_rs2_data_ALU\[31:0\]} \
{/top_tb/TOP/CPU/EXE_ALU_out\[31:0\]} \
{/top_tb/TOP/CPU/WB_RegWrite\[2:0\]} \
{/top_tb/TOP/CPU/WB_rd_addr\[4:0\]} \
{/top_tb/TOP/CPU/WB_rd_data\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[5\]\[31:0\]} \
{/top_tb/TOP/CPU/BranchCtrl\[1:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU/RegFile/Register\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[31\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[30\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[29\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[28\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[27\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[26\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[25\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[24\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[23\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[22\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[21\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[20\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[19\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[18\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[17\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[16\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[15\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[14\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[13\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[12\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[11\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[10\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[9\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[8\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[7\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[6\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[4\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[3\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[2\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[1\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[0\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 3)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU/RegFile"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU/clk} \
{/top_tb/TOP/CPU/EXE_PC\[31:0\]} \
{/top_tb/TOP/CPU/BranchCtrl\[1:0\]} \
{/top_tb/TOP/CPU/PC_in\[31:0\]} \
{/top_tb/TOP/CPU/PC_out\[31:0\]} \
{/top_tb/TOP/CPU/EXE_Forward_rs1_data\[31:0\]} \
{/top_tb/TOP/CPU/EXE_rs2_data_ALU\[31:0\]} \
{/top_tb/TOP/CPU/EXE_ALU_out\[31:0\]} \
{/top_tb/TOP/CPU/WB_RegWrite\[2:0\]} \
{/top_tb/TOP/CPU/WB_rd_addr\[4:0\]} \
{/top_tb/TOP/CPU/WB_rd_data\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[5\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU/RegFile/Register\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[31\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[30\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[29\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[28\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[27\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[26\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[25\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[24\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[23\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[22\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[21\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[20\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[19\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[18\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[17\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[16\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[15\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[14\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[13\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[12\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[11\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[10\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[9\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[8\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[7\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[6\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[4\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[3\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[2\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[1\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[0\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU/RegFile"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU/clk} \
{/top_tb/TOP/CPU/EXE_PC\[31:0\]} \
{/top_tb/TOP/CPU/BranchCtrl\[1:0\]} \
{/top_tb/TOP/CPU/PC_in\[31:0\]} \
{/top_tb/TOP/CPU/PC_out\[31:0\]} \
{/top_tb/TOP/CPU/EXE_Imm\[31:0\]} \
{/top_tb/TOP/CPU/EXE_Forward_rs1_data\[31:0\]} \
{/top_tb/TOP/CPU/EXE_rs2_data_ALU\[31:0\]} \
{/top_tb/TOP/CPU/EXE_ALU_out\[31:0\]} \
{/top_tb/TOP/CPU/WB_RegWrite\[2:0\]} \
{/top_tb/TOP/CPU/WB_rd_addr\[4:0\]} \
{/top_tb/TOP/CPU/WB_rd_data\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[5\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU/RegFile/Register\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[31\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[30\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[29\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[28\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[27\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[26\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[25\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[24\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[23\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[22\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[21\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[20\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[19\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[18\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[17\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[16\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[15\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[14\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[13\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[12\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[11\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[10\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[9\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[8\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[7\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[6\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[4\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[3\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[2\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[1\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[0\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU/RegFile"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU/clk} \
{/top_tb/TOP/CPU/EXE_PC\[31:0\]} \
{/top_tb/TOP/CPU/BranchCtrl\[1:0\]} \
{/top_tb/TOP/CPU/PC_in\[31:0\]} \
{/top_tb/TOP/CPU/PC_out\[31:0\]} \
{/top_tb/TOP/CPU/EXE_Imm\[31:0\]} \
{/top_tb/TOP/CPU/EXE_PC_to_Reg\[31:0\]} \
{/top_tb/TOP/CPU/EXE_Forward_rs1_data\[31:0\]} \
{/top_tb/TOP/CPU/EXE_rs2_data_ALU\[31:0\]} \
{/top_tb/TOP/CPU/EXE_ALU_out\[31:0\]} \
{/top_tb/TOP/CPU/WB_RegWrite\[2:0\]} \
{/top_tb/TOP/CPU/WB_rd_addr\[4:0\]} \
{/top_tb/TOP/CPU/WB_rd_data\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[5\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU/RegFile/Register\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[31\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[30\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[29\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[28\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[27\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[26\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[25\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[24\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[23\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[22\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[21\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[20\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[19\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[18\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[17\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[16\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[15\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[14\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[13\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[12\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[11\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[10\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[9\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[8\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[7\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[6\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[4\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[3\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[2\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[1\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[0\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 10)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU/RegFile"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU/clk} \
{/top_tb/TOP/CPU/EXE_PC\[31:0\]} \
{/top_tb/TOP/CPU/BranchCtrl\[1:0\]} \
{/top_tb/TOP/CPU/PC_in\[31:0\]} \
{/top_tb/TOP/CPU/PC_out\[31:0\]} \
{/top_tb/TOP/CPU/EXE_Imm\[31:0\]} \
{/top_tb/TOP/CPU/EXE_Forward_rs1_data\[31:0\]} \
{/top_tb/TOP/CPU/EXE_rs2_data_ALU\[31:0\]} \
{/top_tb/TOP/CPU/EXE_ALU_out\[31:0\]} \
{/top_tb/TOP/CPU/EXE_PC_to_Reg\[31:0\]} \
{/top_tb/TOP/CPU/MEM_rd_data\[31:0\]} \
{/top_tb/TOP/CPU/WB_RegWrite\[2:0\]} \
{/top_tb/TOP/CPU/WB_rd_addr\[4:0\]} \
{/top_tb/TOP/CPU/WB_rd_data\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[5\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU/RegFile/Register\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[31\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[30\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[29\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[28\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[27\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[26\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[25\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[24\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[23\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[22\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[21\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[20\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[19\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[18\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[17\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[16\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[15\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[14\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[13\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[12\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[11\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[10\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[9\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[8\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[7\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[6\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[4\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[3\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[2\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[1\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[0\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSetSearchMode -win $_nWave1 -value 72c
wvSearchNext -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 15 )} 
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 8)}
wvSetPosition -win $_nWave1 {("G2" 9)}
wvSetPosition -win $_nWave1 {("G2" 10)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSetPosition -win $_nWave1 {("G2" 12)}
wvSetPosition -win $_nWave1 {("G2" 13)}
wvSetPosition -win $_nWave1 {("G2" 14)}
wvSetPosition -win $_nWave1 {("G2" 15)}
wvSetPosition -win $_nWave1 {("G2" 16)}
wvSetPosition -win $_nWave1 {("G2" 17)}
wvSetPosition -win $_nWave1 {("G2" 18)}
wvSetPosition -win $_nWave1 {("G2" 19)}
wvSetPosition -win $_nWave1 {("G2" 20)}
wvSetPosition -win $_nWave1 {("G2" 21)}
wvSetPosition -win $_nWave1 {("G2" 22)}
wvSetPosition -win $_nWave1 {("G2" 23)}
wvSetPosition -win $_nWave1 {("G2" 24)}
wvSetPosition -win $_nWave1 {("G2" 25)}
wvSetPosition -win $_nWave1 {("G2" 26)}
wvSetPosition -win $_nWave1 {("G2" 27)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 28)}
wvSelectSignal -win $_nWave1 {( "G2" 27 )} 
wvSetPosition -win $_nWave1 {("G2" 27)}
wvSetPosition -win $_nWave1 {("G2" 21)}
wvSetPosition -win $_nWave1 {("G2" 14)}
wvSetPosition -win $_nWave1 {("G2" 13)}
wvSetPosition -win $_nWave1 {("G2" 12)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSetPosition -win $_nWave1 {("G2" 10)}
wvSetPosition -win $_nWave1 {("G2" 9)}
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 14)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 14)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSetSearchMode -win $_nWave1 -value 7c4
wvSearchNext -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU/RegFile"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvSetPosition -win $_nWave1 {("G1" 16)}
wvSetPosition -win $_nWave1 {("G1" 16)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU/clk} \
{/top_tb/TOP/CPU/EXE_PC\[31:0\]} \
{/top_tb/TOP/CPU/BranchCtrl\[1:0\]} \
{/top_tb/TOP/CPU/PC_in\[31:0\]} \
{/top_tb/TOP/CPU/PC_out\[31:0\]} \
{/top_tb/TOP/CPU/EXE_Imm\[31:0\]} \
{/top_tb/TOP/CPU/EXE_Forward_rs1_data\[31:0\]} \
{/top_tb/TOP/CPU/EXE_rs2_data_ALU\[31:0\]} \
{/top_tb/TOP/CPU/EXE_ALU_out\[31:0\]} \
{/top_tb/TOP/CPU/EXE_PC_to_Reg\[31:0\]} \
{/top_tb/TOP/CPU/MEM_rd_data\[31:0\]} \
{/top_tb/TOP/CPU/WB_RegWrite\[2:0\]} \
{/top_tb/TOP/CPU/WB_rd_addr\[4:0\]} \
{/top_tb/TOP/CPU/WB_rd_data\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[6\]\[31:0\]} \
{/top_tb/TOP/CPU/EXE_funct3\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU/RegFile/Register\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[31\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[30\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[29\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[28\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[27\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[26\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[25\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[24\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[23\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[22\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[21\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[20\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[19\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[18\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[17\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[16\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[15\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[14\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[13\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[12\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[11\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[10\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[9\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[8\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[7\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[5\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[4\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[3\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[2\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[1\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[0\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 16 )} 
wvSetPosition -win $_nWave1 {("G1" 16)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 3)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU/RegFile"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU/clk} \
{/top_tb/TOP/CPU/EXE_PC\[31:0\]} \
{/top_tb/TOP/CPU/EXE_funct3\[2:0\]} \
{/top_tb/TOP/CPU/EXE_Forward_rs2_data\[31:0\]} \
{/top_tb/TOP/CPU/EXE_Forward_rs1_data\[31:0\]} \
{/top_tb/TOP/CPU/EXE_rs2_data_ALU\[31:0\]} \
{/top_tb/TOP/CPU/EXE_ALU_out\[31:0\]} \
{/top_tb/TOP/CPU/EXE_PC_to_Reg\[31:0\]} \
{/top_tb/TOP/CPU/MEM_rd_data\[31:0\]} \
{/top_tb/TOP/CPU/WB_RegWrite\[2:0\]} \
{/top_tb/TOP/CPU/WB_rd_addr\[4:0\]} \
{/top_tb/TOP/CPU/WB_rd_data\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[6\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU/RegFile/Register\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[31\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[30\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[29\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[28\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[27\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[26\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[25\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[24\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[23\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[22\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[21\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[20\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[19\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[18\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[17\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[16\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[15\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[14\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[13\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[12\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[11\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[10\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[9\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[8\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[7\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[5\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[4\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[3\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[2\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[1\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[0\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 5)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 8)}
wvSetPosition -win $_nWave1 {("G2" 9)}
wvSetPosition -win $_nWave1 {("G2" 10)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSetPosition -win $_nWave1 {("G2" 12)}
wvSetPosition -win $_nWave1 {("G2" 13)}
wvSetPosition -win $_nWave1 {("G2" 14)}
wvSetPosition -win $_nWave1 {("G2" 15)}
wvSetPosition -win $_nWave1 {("G2" 16)}
wvSetPosition -win $_nWave1 {("G2" 17)}
wvSetPosition -win $_nWave1 {("G2" 18)}
wvSetPosition -win $_nWave1 {("G2" 19)}
wvSetPosition -win $_nWave1 {("G2" 20)}
wvSetPosition -win $_nWave1 {("G2" 21)}
wvSetPosition -win $_nWave1 {("G2" 22)}
wvSetPosition -win $_nWave1 {("G2" 23)}
wvSetPosition -win $_nWave1 {("G2" 24)}
wvSetPosition -win $_nWave1 {("G2" 25)}
wvSetPosition -win $_nWave1 {("G2" 26)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 27)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU/RegFile"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvSetPosition -win $_nWave1 {("G2" 29)}
wvSetPosition -win $_nWave1 {("G2" 29)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU/clk} \
{/top_tb/TOP/CPU/EXE_PC\[31:0\]} \
{/top_tb/TOP/CPU/EXE_funct3\[2:0\]} \
{/top_tb/TOP/CPU/EXE_Forward_rs1_data\[31:0\]} \
{/top_tb/TOP/CPU/EXE_Forward_rs2_data\[31:0\]} \
{/top_tb/TOP/CPU/EXE_rs2_data_ALU\[31:0\]} \
{/top_tb/TOP/CPU/EXE_ALU_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU/RegFile/Register\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[31\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[30\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[29\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[28\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[27\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[26\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[25\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[24\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[23\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[22\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[21\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[20\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[19\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[18\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[17\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[16\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[15\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[14\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[13\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[12\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[11\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[10\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[9\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[8\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[7\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[6\]\[31:0\]} \
{/top_tb/TOP/CPU/MEM_ALU_out\[31:0\]} \
{/top_tb/TOP/CPU/MEM_MemWrite\[3:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[5\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[4\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[3\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[2\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[1\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[0\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 28 29 )} 
wvSetPosition -win $_nWave1 {("G2" 29)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 28)}
wvSetPosition -win $_nWave1 {("G2" 21)}
wvSetPosition -win $_nWave1 {("G2" 10)}
wvSetPosition -win $_nWave1 {("G2" 9)}
wvSetPosition -win $_nWave1 {("G2" 8)}
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 9)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU/RegFile"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU/clk} \
{/top_tb/TOP/CPU/EXE_PC\[31:0\]} \
{/top_tb/TOP/CPU/EXE_funct3\[2:0\]} \
{/top_tb/TOP/CPU/EXE_Forward_rs1_data\[31:0\]} \
{/top_tb/TOP/CPU/EXE_Forward_rs2_data\[31:0\]} \
{/top_tb/TOP/CPU/EXE_rs2_data_ALU\[31:0\]} \
{/top_tb/TOP/CPU/EXE_ALU_out\[31:0\]} \
{/top_tb/TOP/CPU/MEM_MemWrite\[3:0\]} \
{/top_tb/TOP/CPU/MEM_ALU_out\[31:0\]} \
{/top_tb/TOP/CPU/data_in\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU/RegFile/Register\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[31\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[30\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[29\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[28\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[27\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[26\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[25\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[24\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[23\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[22\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[21\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[20\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[19\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[18\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[17\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[16\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[15\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[14\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[13\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[12\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[11\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[10\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[9\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[8\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[7\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[6\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[5\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[4\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[3\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[2\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[1\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[0\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvGetSignalClose -win $_nWave1
wvSetSearchMode -win $_nWave1 -value 7f0
wvSearchNext -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSearchNext -win $_nWave1
wvSetCursor -win $_nWave1 13000050.613149 -snap {("G1" 2)}
wvSetSearchMode -win $_nWave1 -value 85c
wvSearchNext -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU/RegFile"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU/clk} \
{/top_tb/TOP/CPU/EXE_PC\[31:0\]} \
{/top_tb/TOP/CPU/EXE_funct3\[2:0\]} \
{/top_tb/TOP/CPU/EXE_Forward_rs1_data\[31:0\]} \
{/top_tb/TOP/CPU/EXE_Forward_rs2_data\[31:0\]} \
{/top_tb/TOP/CPU/EXE_rs2_data_ALU\[31:0\]} \
{/top_tb/TOP/CPU/EXE_ALU_out\[31:0\]} \
{/top_tb/TOP/CPU/MEM_MemWrite\[3:0\]} \
{/top_tb/TOP/CPU/MEM_ALU_out\[31:0\]} \
{/top_tb/TOP/CPU/data_in\[31:0\]} \
{/top_tb/TOP/CPU/EXE_ALUOP\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU/RegFile/Register\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[31\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[30\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[29\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[28\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[27\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[26\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[25\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[24\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[23\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[22\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[21\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[20\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[19\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[18\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[17\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[16\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[15\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[14\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[13\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[12\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[11\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[10\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[9\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[8\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[7\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[6\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[5\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[4\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[3\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[2\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[1\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[0\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU/RegFile"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU/clk} \
{/top_tb/TOP/CPU/EXE_PC\[31:0\]} \
{/top_tb/TOP/CPU/EXE_funct3\[2:0\]} \
{/top_tb/TOP/CPU/EXE_ALUOP\[2:0\]} \
{/top_tb/TOP/CPU/ZeroFlag} \
{/top_tb/TOP/CPU/EXE_Forward_rs1_data\[31:0\]} \
{/top_tb/TOP/CPU/EXE_rs2_data_ALU\[31:0\]} \
{/top_tb/TOP/CPU/EXE_ALU_out\[31:0\]} \
{/top_tb/TOP/CPU/MEM_MemWrite\[3:0\]} \
{/top_tb/TOP/CPU/MEM_ALU_out\[31:0\]} \
{/top_tb/TOP/CPU/data_in\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU/RegFile/Register\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[31\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[30\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[29\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[28\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[27\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[26\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[25\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[24\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[23\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[22\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[21\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[20\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[19\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[18\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[17\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[16\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[15\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[14\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[13\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[12\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[11\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[10\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[9\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[8\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[7\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[6\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[5\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[4\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[3\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[2\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[1\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[0\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU/RegFile"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU/clk} \
{/top_tb/TOP/CPU/EXE_PC\[31:0\]} \
{/top_tb/TOP/CPU/EXE_funct3\[2:0\]} \
{/top_tb/TOP/CPU/EXE_ALUOP\[2:0\]} \
{/top_tb/TOP/CPU/EXE_Forward_rs1_data\[31:0\]} \
{/top_tb/TOP/CPU/EXE_rs2_data_ALU\[31:0\]} \
{/top_tb/TOP/CPU/ZeroFlag} \
{/top_tb/TOP/CPU/BranchCtrl\[1:0\]} \
{/top_tb/TOP/CPU/EXE_PC_plus_Imm\[31:0\]} \
{/top_tb/TOP/CPU/ID_EXE_RegWrite} \
{/top_tb/TOP/CPU/IF_ID_RegWrite\[1:0\]} \
{/top_tb/TOP/CPU/PC_in\[31:0\]} \
{/top_tb/TOP/CPU/PC_out\[31:0\]} \
{/top_tb/TOP/CPU/EXE_ALU_out\[31:0\]} \
{/top_tb/TOP/CPU/MEM_MemWrite\[3:0\]} \
{/top_tb/TOP/CPU/MEM_ALU_out\[31:0\]} \
{/top_tb/TOP/CPU/data_in\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU/RegFile/Register\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[31\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[30\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[29\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[28\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[27\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[26\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[25\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[24\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[23\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[22\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[21\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[20\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[19\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[18\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[17\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[16\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[15\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[14\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[13\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[12\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[11\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[10\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[9\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[8\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[7\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[6\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[5\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[4\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[3\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[2\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[1\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[0\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 8 9 10 11 12 13 )} 
wvSetPosition -win $_nWave1 {("G1" 13)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvSelectSignal -win $_nWave1 {( "G1" 14 15 16 17 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSetSearchMode -win $_nWave1 -value 920
wvSearchNext -win $_nWave1
wvSetSearchMode -win $_nWave1 -value aa8
wvSearchNext -win $_nWave1
wvSetSearchMode -win $_nWave1 -value ac8
wvSearchNext -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU/RegFile"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU/clk} \
{/top_tb/TOP/CPU/EXE_PC\[31:0\]} \
{/top_tb/TOP/CPU/EXE_PC_plus_Imm\[31:0\]} \
{/top_tb/TOP/CPU/EXE_PC_to_Reg\[31:0\]} \
{/top_tb/TOP/CPU/EXE_PCtoRegSrc} \
{/top_tb/TOP/CPU/MEM_RDSrc} \
{/top_tb/TOP/CPU/MEM_rd_data\[31:0\]} \
{/top_tb/TOP/CPU/EXE_funct3\[2:0\]} \
{/top_tb/TOP/CPU/EXE_ALUOP\[2:0\]} \
{/top_tb/TOP/CPU/EXE_Forward_rs1_data\[31:0\]} \
{/top_tb/TOP/CPU/EXE_rs2_data_ALU\[31:0\]} \
{/top_tb/TOP/CPU/ZeroFlag} \
{/top_tb/TOP/CPU/BranchCtrl\[1:0\]} \
{/top_tb/TOP/CPU/ID_EXE_RegWrite} \
{/top_tb/TOP/CPU/IF_ID_RegWrite\[1:0\]} \
{/top_tb/TOP/CPU/PC_in\[31:0\]} \
{/top_tb/TOP/CPU/PC_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU/RegFile/Register\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[31\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[30\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[29\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[28\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[27\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[26\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[25\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[24\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[23\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[22\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[21\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[20\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[19\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[18\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[17\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[16\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[15\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[14\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[13\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[12\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[11\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[10\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[9\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[8\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[7\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[6\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[5\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[4\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[3\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[2\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[1\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[0\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 5 6 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSelectSignal -win $_nWave1 {( "G1" 8 9 10 11 12 13 )} 
wvSelectSignal -win $_nWave1 {( "G1" 8 9 10 11 12 13 14 15 )} 
wvSelectSignal -win $_nWave1 {( "G1" 8 9 10 11 12 13 14 15 16 17 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU/RegFile"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU/clk} \
{/top_tb/TOP/CPU/EXE_PC\[31:0\]} \
{/top_tb/TOP/CPU/EXE_PC_plus_Imm\[31:0\]} \
{/top_tb/TOP/CPU/EXE_PC_to_Reg\[31:0\]} \
{/top_tb/TOP/CPU/EXE_PCtoRegSrc} \
{/top_tb/TOP/CPU/MEM_RDSrc} \
{/top_tb/TOP/CPU/MEM_rd_data\[31:0\]} \
{/top_tb/TOP/CPU/WB_RegWrite\[2:0\]} \
{/top_tb/TOP/CPU/WB_rd_addr\[4:0\]} \
{/top_tb/TOP/CPU/WB_rd_data\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU/RegFile/Register\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[31\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[30\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[29\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[28\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[27\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[26\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[25\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[24\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[23\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[22\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[21\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[20\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[19\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[18\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[17\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[16\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[15\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[14\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[13\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[12\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[11\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[10\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[9\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[8\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[7\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[6\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[5\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[4\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[3\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[2\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[1\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[0\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 8 9 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSelectSignal -win $_nWave1 {( "G2" 28 )} 
wvSetPosition -win $_nWave1 {("G2" 28)}
wvSetPosition -win $_nWave1 {("G2" 21)}
wvSetPosition -win $_nWave1 {("G2" 15)}
wvSetPosition -win $_nWave1 {("G2" 14)}
wvSetPosition -win $_nWave1 {("G2" 13)}
wvSetPosition -win $_nWave1 {("G2" 12)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSetPosition -win $_nWave1 {("G2" 10)}
wvSetPosition -win $_nWave1 {("G2" 9)}
wvSetPosition -win $_nWave1 {("G2" 8)}
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSetCursor -win $_nWave1 13386501.324928 -snap {("G1" 2)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU/RegFile"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU/clk} \
{/top_tb/TOP/CPU/EXE_PC\[31:0\]} \
{/top_tb/TOP/CPU/EXE_PC_plus_Imm\[31:0\]} \
{/top_tb/TOP/CPU/EXE_PC_to_Reg\[31:0\]} \
{/top_tb/TOP/CPU/EXE_PCtoRegSrc} \
{/top_tb/TOP/CPU/MEM_RDSrc} \
{/top_tb/TOP/CPU/MEM_rd_data\[31:0\]} \
{/top_tb/TOP/CPU/WB_RegWrite\[2:0\]} \
{/top_tb/TOP/CPU/WB_rd_addr\[4:0\]} \
{/top_tb/TOP/CPU/WB_rd_data\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[5\]\[31:0\]} \
{/top_tb/TOP/CPU/EXE_Imm\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU/RegFile/Register\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[31\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[30\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[29\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[28\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[27\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[26\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[25\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[24\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[23\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[22\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[21\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[20\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[19\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[18\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[17\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[16\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[15\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[14\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[13\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[12\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[11\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[10\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[9\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[8\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[7\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[6\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[4\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[3\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[2\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[1\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[0\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSetPosition -win $_nWave1 {("G1" 12)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU/RegFile"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU/clk} \
{/top_tb/TOP/CPU/EXE_PC\[31:0\]} \
{/top_tb/TOP/CPU/EXE_Imm\[31:0\]} \
{/top_tb/TOP/CPU/EXE_Forward_rs1_data\[31:0\]} \
{/top_tb/TOP/CPU/EXE_rs2_data_ALU\[31:0\]} \
{/top_tb/TOP/CPU/EXE_PC_plus_Imm\[31:0\]} \
{/top_tb/TOP/CPU/EXE_PC_to_Reg\[31:0\]} \
{/top_tb/TOP/CPU/EXE_PCtoRegSrc} \
{/top_tb/TOP/CPU/MEM_RDSrc} \
{/top_tb/TOP/CPU/MEM_rd_data\[31:0\]} \
{/top_tb/TOP/CPU/WB_RegWrite\[2:0\]} \
{/top_tb/TOP/CPU/WB_rd_addr\[4:0\]} \
{/top_tb/TOP/CPU/WB_rd_data\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[5\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU/RegFile/Register\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[31\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[30\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[29\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[28\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[27\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[26\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[25\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[24\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[23\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[22\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[21\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[20\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[19\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[18\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[17\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[16\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[15\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[14\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[13\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[12\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[11\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[10\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[9\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[8\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[7\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[6\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[4\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[3\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[2\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[1\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[0\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 5)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU/RegFile"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU/clk} \
{/top_tb/TOP/CPU/EXE_PC\[31:0\]} \
{/top_tb/TOP/CPU/EXE_Imm\[31:0\]} \
{/top_tb/TOP/CPU/EXE_Forward_rs1_data\[31:0\]} \
{/top_tb/TOP/CPU/EXE_rs2_data_ALU\[31:0\]} \
{/top_tb/TOP/CPU/EXE_ALU_out\[31:0\]} \
{/top_tb/TOP/CPU/MEM_RDSrc} \
{/top_tb/TOP/CPU/MEM_rd_data\[31:0\]} \
{/top_tb/TOP/CPU/WB_RegWrite\[2:0\]} \
{/top_tb/TOP/CPU/WB_rd_addr\[4:0\]} \
{/top_tb/TOP/CPU/WB_rd_data\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[5\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU/RegFile/Register\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[31\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[30\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[29\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[28\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[27\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[26\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[25\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[24\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[23\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[22\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[21\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[20\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[19\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[18\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[17\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[16\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[15\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[14\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[13\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[12\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[11\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[10\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[9\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[8\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[7\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[6\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[4\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[3\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[2\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[1\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[0\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 9)}
wvSetPosition -win $_nWave1 {("G2" 10)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSetPosition -win $_nWave1 {("G2" 12)}
wvSetPosition -win $_nWave1 {("G2" 13)}
wvSetPosition -win $_nWave1 {("G2" 14)}
wvSetPosition -win $_nWave1 {("G2" 16)}
wvSetPosition -win $_nWave1 {("G2" 17)}
wvSetPosition -win $_nWave1 {("G2" 18)}
wvSetPosition -win $_nWave1 {("G2" 19)}
wvSetPosition -win $_nWave1 {("G2" 20)}
wvSetPosition -win $_nWave1 {("G2" 21)}
wvSetPosition -win $_nWave1 {("G2" 22)}
wvSetPosition -win $_nWave1 {("G2" 23)}
wvSetPosition -win $_nWave1 {("G2" 24)}
wvSetPosition -win $_nWave1 {("G2" 25)}
wvSetPosition -win $_nWave1 {("G2" 26)}
wvSetPosition -win $_nWave1 {("G2" 27)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 28)}
wvSelectSignal -win $_nWave1 {( "G2" 27 )} 
wvSetPosition -win $_nWave1 {("G2" 27)}
wvSetPosition -win $_nWave1 {("G2" 17)}
wvSetPosition -win $_nWave1 {("G2" 8)}
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetCursor -win $_nWave1 13399314.879178 -snap {("G1" 2)}
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU/RegFile"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU/clk} \
{/top_tb/TOP/CPU/EXE_PC\[31:0\]} \
{/top_tb/TOP/CPU/EXE_Imm\[31:0\]} \
{/top_tb/TOP/CPU/EXE_Forward_rs1_data\[31:0\]} \
{/top_tb/TOP/CPU/EXE_rs2_data_ALU\[31:0\]} \
{/top_tb/TOP/CPU/EXE_ALU_out\[31:0\]} \
{/top_tb/TOP/CPU/MEM_rd_data\[31:0\]} \
{/top_tb/TOP/CPU/WB_RegWrite\[2:0\]} \
{/top_tb/TOP/CPU/WB_rd_addr\[4:0\]} \
{/top_tb/TOP/CPU/WB_rd_data\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[6\]\[31:0\]} \
{/top_tb/TOP/CPU/BranchCtrl\[1:0\]} \
{/top_tb/TOP/CPU/EXE_PC_plus_4\[31:0\]} \
{/top_tb/TOP/CPU/EXE_PC_plus_Imm\[31:0\]} \
{/top_tb/TOP/CPU/EXE_PC_to_Reg\[31:0\]} \
{/top_tb/TOP/CPU/EXE_PCtoRegSrc} \
{/top_tb/TOP/CPU/PC_in\[31:0\]} \
{/top_tb/TOP/CPU/PC_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU/RegFile/Register\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[31\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[30\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[29\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[28\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[27\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[26\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[25\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[24\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[23\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[22\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[21\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[20\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[19\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[18\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[17\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[16\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[15\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[14\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[13\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[12\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[11\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[10\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[9\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[8\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[7\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[5\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[4\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[3\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[2\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[1\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[0\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 12 13 14 15 16 17 18 )} 
wvSetPosition -win $_nWave1 {("G1" 18)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 14)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 16)}
wvSetPosition -win $_nWave1 {("G1" 17)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 5 6 7 8 9 10 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSelectSignal -win $_nWave1 {( "G1" 8 9 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU/RegFile"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/CPU/clk} \
{/top_tb/TOP/CPU/EXE_PC\[31:0\]} \
{/top_tb/TOP/CPU/BranchCtrl\[1:0\]} \
{/top_tb/TOP/CPU/EXE_PC_plus_Imm\[31:0\]} \
{/top_tb/TOP/CPU/PC_in\[31:0\]} \
{/top_tb/TOP/CPU/PC_out\[31:0\]} \
{/top_tb/TOP/CPU/EXE_PCtoRegSrc} \
{/top_tb/TOP/CPU/MEM_rd_data\[31:0\]} \
{/top_tb/TOP/CPU/WB_RegWrite\[2:0\]} \
{/top_tb/TOP/CPU/WB_rd_addr\[4:0\]} \
{/top_tb/TOP/CPU/WB_rd_data\[31:0\]} \
{/top_tb/TOP/CPU/EXE_PC_plus_4\[31:0\]} \
{/top_tb/TOP/CPU/EXE_PC_to_Reg\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[6\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/CPU/RegFile/Register\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[31\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[30\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[29\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[28\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[27\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[26\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[25\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[24\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[23\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[22\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[21\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[20\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[19\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[18\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[17\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[16\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[15\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[14\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[13\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[12\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[11\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[10\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[9\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[8\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[7\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[5\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[4\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[3\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[2\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[1\]\[31:0\]} \
{/top_tb/TOP/CPU/RegFile/Register\[0\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 8 9 10 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSelectSignal -win $_nWave1 \
           {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 )} {( "G2" \
           1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 \
           26 27 28 29 30 31 32 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSelectGroup -win $_nWave1 {G1}
wvSelectGroup -win $_nWave1 {G2}
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSelectGroup -win $_nWave1 {G3}
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU/RegFile"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/CPU"
wvExit
