`include "ALU_Control.sv"
`include "ALU.sv"
`include "Branch_Conctrl.sv"
`include "Control_Unit.sv"
`include "EXE_MEM_reg.sv"
`include "Forward_Unit.sv"
`include "Hazard_Control.sv"
`include "ID_EXE_reg.sv"
`include "IF_ID_reg.sv"
`include "Immediate_Generator.sv"
`include "MEM_WB_reg.sv"
`include "Program_Counter.sv"
`include "Register_File.sv"
`include "CSR.sv"

module CPU(clk, rst, Instr_read, PC_out, Instr_out, IM_STALL, MEM_MemRead, MEM_MemWrite, MEM_ALU_out, data_in, data_out, DM_STALL, interrupt);

input           clk;
input           rst;
logic	[31:0]	PC_in;
output	logic	[31:0]	PC_out;
logic	[31:0]	PC_plus_4;
input	[31:0]	Instr_out;
output	logic	Instr_read;
input			IM_STALL;
logic 			PCWrite;
logic 	[ 1:0]	IF_ID_RegWrite;
logic			ID_EXE_RegWrite;
logic	[ 1:0]	BranchCtrl;

logic	[31:0]	ID_PC;
logic	[31:0]	ID_Instr;
logic   [31:0]  ID_rs1_data;
logic   [31:0]  ID_rs2_data;
logic	[31:0]	ID_Imm;
logic	[ 2:0]	ID_ALUOP;
logic			ID_ALUSrc;
logic			ID_PCtoRegSrc;
logic			ID_RDSrc;
logic			ID_MemRead;
logic	[ 3:0]	ID_MemWrite;
logic			ID_MemtoReg;
logic	[ 2:0]	ID_RegWrite;
logic	[ 2:0]	ImmType;
logic 			ID_CSRSrc;

logic	[31:0]	EXE_PC;
logic	[31:0]	EXE_rs1_data;
logic	[31:0]	EXE_rs2_data;
logic	[31:0]	EXE_Imm;
logic	[31:0]	EXE_PC_plus_Imm;
logic	[31:0]	EXE_PC_plus_4;
logic	[31:0]	EXE_Forward_rs1_data;
logic	[31:0]	EXE_Forward_rs2_data;
logic	[31:0]	EXE_rs2_data_ALU;
logic	[31:0]	EXE_PC_to_Reg;
logic	[31:0]	EXE_ALU_out;
logic	[31:0]	EXE_ALU_out_reg;
logic			ZeroFlag;
logic	[ 2:0]	EXE_funct3;
logic	[ 6:0]	EXE_funct7;
logic	[ 4:0]	EXE_rd_addr;
logic	[ 4:0]	EXE_rs1_addr;
logic	[ 4:0]	EXE_rs2_addr;
logic	[ 2:0]	EXE_ALUOP;
logic			EXE_ALUSrc;
logic			EXE_PCtoRegSrc;
logic			EXE_RDSrc;
logic			EXE_MemRead;
logic	[ 3:0]	EXE_MemWrite;
logic			EXE_MemtoReg;
logic	[ 2:0]	EXE_RegWrite;
logic 	[ 3:0]	ALUCtrl;
logic	[ 1:0]	ForwardRS1Src;
logic	[ 1:0]	ForwardRS2Src;
logic 			EXE_CSRSrc;

logic	[31:0]	MEM_PC_to_Reg;
output	logic	[31:0]	MEM_ALU_out;
logic	[31:0]	MEM_rd_data;
logic	[ 2:0]	MEM_funct3;
output	logic	[31:0]	data_in;
logic	[31:0]	data_in_pre;
input	[31:0]	data_out;
logic	[ 4:0]	MEM_rd_addr;
logic			MEM_RDSrc;
output	logic	MEM_MemRead;
output	logic	[ 3:0]	MEM_MemWrite;
logic	[ 3:0]	MEM_MemWrite_pre;
logic			MEM_MemtoReg;
logic	[ 2:0]	MEM_RegWrite;
input			DM_STALL;

logic	[31:0]	WB_rd_data;
logic	[31:0]	WB_rd_data_temp;
logic	[31:0]	WB_data_out;
logic	[ 4:0]	WB_rd_addr;
logic			WB_MemtoReg;
logic	[ 2:0]	WB_RegWrite;
logic	[31:0]	data_out_reg;

logic 	[11:0]	CSR_addr;
logic	[31:0]	CSR_wdata;
logic	[31:0]	CSR_rdata;
logic   [31:0]  CSR_retPC;
logic   [31:0]  CSR_PC;
logic           CSR_control;
logic           CSR_STALL;

input			interrupt;

assign	PC_plus_4 = PC_out + 32'h4;
assign	PC_in = (EXE_CSRSrc & (CSR_addr == 12'h302)) ? CSR_retPC : (EXE_CSRSrc & (CSR_addr == 12'h105)) ? CSR_PC : (BranchCtrl == 2'h0) ? PC_plus_4 : ((BranchCtrl == 2'h1) ? EXE_PC_plus_Imm : EXE_ALU_out);
assign	EXE_PC_plus_4 = EXE_PC + 32'h4;
assign	EXE_PC_plus_Imm = EXE_PC + EXE_Imm;
assign	EXE_PC_to_Reg = (EXE_PCtoRegSrc) ? EXE_PC_plus_Imm : EXE_PC_plus_4;
assign	EXE_Forward_rs1_data = (ForwardRS1Src == 2'h0) ? EXE_rs1_data : ((ForwardRS1Src == 2'h1) ? MEM_rd_data : WB_rd_data);
assign	EXE_Forward_rs2_data = (ForwardRS2Src == 2'h0) ? EXE_rs2_data : ((ForwardRS2Src == 2'h1) ? MEM_rd_data : WB_rd_data);
assign	EXE_rs2_data_ALU = (EXE_ALUSrc) ? EXE_Forward_rs2_data : EXE_Imm;
assign	EXE_ALU_out = (EXE_CSRSrc) ? CSR_rdata : EXE_ALU_out_reg;
assign	MEM_rd_data = (MEM_RDSrc) ? MEM_PC_to_Reg : MEM_ALU_out;
assign	WB_rd_data = (WB_MemtoReg) ? WB_data_out : WB_rd_data_temp;
assign 	CSR_addr = {EXE_funct7, EXE_rs2_addr};
assign	CSR_wdata = (EXE_funct3[2]) ? {27'b0, EXE_rs1_addr} : EXE_Forward_rs1_data;

assign	data_in = (MEM_ALU_out[1:0] == 2'h0) ? data_in_pre : ((MEM_ALU_out[1:0] == 2'h1) ? {data_in_pre[23:0], 8'h0} : ((MEM_ALU_out[1:0] == 2'h2) ? {data_in_pre[15:0], 16'h0} : {data_in_pre[7:0], 24'h0}));

always_comb begin
	case(MEM_funct3)
		3'b000:begin//LB
			case(MEM_ALU_out[1:0])
				2'h0:begin
					if(data_out[7])
						data_out_reg = {24'hffffff, data_out[7:0]};
					else 
						data_out_reg = {24'h0, data_out[7:0]};
				end
				2'h1:begin
					if(data_out[15])
						data_out_reg = {24'hffffff, data_out[15:8]};
					else 
						data_out_reg = {24'h0, data_out[15:8]};
				end
				2'h2:begin
					if(data_out[23])
						data_out_reg = {24'hffffff, data_out[23:16]};
					else 
						data_out_reg = {24'h0, data_out[23:16]};
				end
				2'h3:begin
					if(data_out[31])
						data_out_reg = {24'hffffff, data_out[31:24]};
					else 
						data_out_reg = {24'h0, data_out[31:24]};
				end
			endcase
		end
		3'b001:begin//LH
			if(MEM_ALU_out[1:0] == 2'h2)begin
				if(data_out[31])
					data_out_reg = {16'hffff, data_out[31:16]};
				else
					data_out_reg = {16'h0, data_out[31:16]};
			end
			else begin
				if(data_out[15])
					data_out_reg = {16'hffff, data_out[15:0]};
				else
					data_out_reg = {16'h0, data_out[15:0]};
			end
		end
		3'b100:begin//LBU
			case(MEM_ALU_out[1:0])
				2'h0:
					data_out_reg = {24'h0, data_out[7:0]};
				2'h1:
					data_out_reg = {24'h0, data_out[15:8]};
				2'h2:
					data_out_reg = {24'h0, data_out[23:16]};
				2'h3:
					data_out_reg = {24'h0, data_out[31:24]};
			endcase
		end
		3'b101:begin//LHU
			if(MEM_ALU_out[1:0] == 2'h2)
				data_out_reg = {16'h0, data_out[31:16]};
			else
				data_out_reg = {16'h0, data_out[15:0]};
		end
		default:
			data_out_reg = data_out;
	endcase
end

always_comb begin
	case(MEM_ALU_out[1:0])
		2'h1:begin
			if(MEM_MemWrite_pre == 4'he)
				MEM_MemWrite = 4'hd;
			else
				MEM_MemWrite = MEM_MemWrite_pre;
		end
		2'h2:begin
			if(MEM_MemWrite_pre == 4'he)
				MEM_MemWrite = 4'hb;
			else if(MEM_MemWrite_pre == 4'hc)
				MEM_MemWrite = 4'h3;
			else
				MEM_MemWrite = MEM_MemWrite_pre;
		end
		2'h3:begin
			if(MEM_MemWrite_pre == 4'he)
				MEM_MemWrite = 4'h7;
			else
				MEM_MemWrite = MEM_MemWrite_pre;
		end
		default:
			MEM_MemWrite = MEM_MemWrite_pre;
	endcase
end

//////////Program Counter//////////
Program_Counter PC(
	.clk				(clk				),
	.rst				(rst				),
	.PC_in				(PC_in				),
	.Instr_read			(Instr_read			),
	.PCWrite			(PCWrite			),
	.PC_out				(PC_out				),
	.IM_STALL			(IM_STALL			),
	.DM_STALL			(DM_STALL			),
	.CSR_STALL			(CSR_STALL			)
);
//////////Program Counter//////////

//////////Control Unit//////////
Branch_Conctrl Branch_Ctrl(
	.ZeroFlag			(ZeroFlag			),
	.PCtoRegSrc			(EXE_PCtoRegSrc		),
	.RDSrc				(EXE_RDSrc			),
	.ALUOP				(EXE_ALUOP			),
	.BranchCtrl			(BranchCtrl			)
);

Hazard_Control Hazard_Ctrl(
	.BranchCtrl			(BranchCtrl			),
	.MemRead			(EXE_MemRead		),
	.EXE_rd_addr		(EXE_rd_addr		),
	.rs1_addr			(ID_Instr[19:15]	),
	.rs2_addr			(ID_Instr[24:20]	),
	.CSRSrc				(EXE_CSRSrc			),
	.CSR_addr			(CSR_addr			),
	.IF_ID_RegWrite		(IF_ID_RegWrite		),
	.ID_EXE_RegWrite	(ID_EXE_RegWrite	),
	.PCWrite			(PCWrite			)
);

Forward_Unit Forward_Unit(
	.rs1_addr			(EXE_rs1_addr		),
	.rs2_addr			(EXE_rs2_addr		),
	.MEM_rd_addr		(MEM_rd_addr		),
	.MEM_RegWrite		(MEM_RegWrite		),
	.WB_rd_addr			(WB_rd_addr			),
	.WB_RegWrite		(WB_RegWrite		),
	.ForwardRS1Src		(ForwardRS1Src		),
	.ForwardRS2Src		(ForwardRS2Src		)
);

Control_Unit CrtlUnit(
	.OPcode				(ID_Instr[6:0]		),
	.funct3				(ID_Instr[14:12]	),
	.ALUOP				(ID_ALUOP			),
	.ALUSrc				(ID_ALUSrc			),
	.PCtoRegSrc			(ID_PCtoRegSrc		),
	.RDSrc				(ID_RDSrc			),
	.MemRead			(ID_MemRead			),
	.MemWrite			(ID_MemWrite		),
	.MemtoReg			(ID_MemtoReg		),
	.RegWrite			(ID_RegWrite		),
	.ImmType			(ImmType			),
	.CSRSrc				(ID_CSRSrc			)
);

ALU_Control ALU_Ctrl(
	.ALUOP				(EXE_ALUOP			),
	.funct3				(EXE_funct3			),
	.funct7				(EXE_funct7			),
	.ALUCtrl			(ALUCtrl			)
);
//////////Control Unit//////////

//////////5-stage register//////////
IF_ID_reg IF_ID_reg(
	.clk				(clk				),
	.rst				(rst				),
	.IF_Instr			(Instr_out			),
	.IF_PC				(PC_out				),
	.RegWrite			(IF_ID_RegWrite		),
	.ID_Instr			(ID_Instr			),
	.ID_PC				(ID_PC				),
	.IM_STALL			(IM_STALL			),
	.DM_STALL			(DM_STALL			),
	.CSR_STALL			(CSR_STALL			)
);

ID_EXE_reg ID_EXE_reg(
	.clk				(clk				),
	.rst				(rst				),
	.ID_PC				(ID_PC				),
	.ID_rs1_data		(ID_rs1_data		),
	.ID_rs2_data        (ID_rs2_data        ),
	.ID_Imm				(ID_Imm				),
	.ID_funct3			(ID_Instr[14:12]	),
	.ID_funct7			(ID_Instr[31:25]	),
	.ID_rd_addr			(ID_Instr[11:7]		),
	.ID_rs1_addr		(ID_Instr[19:15]	),
	.ID_rs2_addr		(ID_Instr[24:20]	),
	.ID_ALUOP			(ID_ALUOP			),
	.ID_ALUSrc			(ID_ALUSrc			),
	.ID_PCtoRegSrc		(ID_PCtoRegSrc		),
	.ID_RDSrc			(ID_RDSrc			),
	.ID_MemRead			(ID_MemRead			),
	.ID_MemWrite		(ID_MemWrite		),
	.ID_MemtoReg		(ID_MemtoReg		),
	.ID_RegWrite		(ID_RegWrite		),
	.ID_EXE_RegWrite	(ID_EXE_RegWrite	),
	.ID_CSRSrc			(ID_CSRSrc			),
	.EXE_PC				(EXE_PC				),
	.EXE_rs1_data       (EXE_rs1_data       ),
	.EXE_rs2_data       (EXE_rs2_data       ),
	.EXE_Imm			(EXE_Imm			),
	.EXE_funct3			(EXE_funct3			),
	.EXE_funct7			(EXE_funct7			),
	.EXE_rd_addr		(EXE_rd_addr		),
	.EXE_rs1_addr		(EXE_rs1_addr		),
	.EXE_rs2_addr		(EXE_rs2_addr		),
	.EXE_ALUOP			(EXE_ALUOP			),
	.EXE_ALUSrc			(EXE_ALUSrc			),
	.EXE_PCtoRegSrc		(EXE_PCtoRegSrc		),
	.EXE_RDSrc			(EXE_RDSrc			),
	.EXE_MemRead		(EXE_MemRead		),
	.EXE_MemWrite		(EXE_MemWrite		),
	.EXE_MemtoReg		(EXE_MemtoReg		),
	.EXE_RegWrite		(EXE_RegWrite		),
	.EXE_CSRSrc			(EXE_CSRSrc			),
	.IM_STALL			(IM_STALL			),
	.DM_STALL			(DM_STALL			),
	.CSR_STALL			(CSR_STALL			)
);

EXE_MEM_reg EXE_MEM_reg(
	.clk				(clk				),
	.rst				(rst				),
	.EXE_PC_to_Reg		(EXE_PC_to_Reg		),
	.EXE_ALU_out		(EXE_ALU_out		),
	.EXE_Forward_rs2_data(EXE_Forward_rs2_data),
	.EXE_rd_addr		(EXE_rd_addr		),
	.EXE_funct3			(EXE_funct3			),
	.EXE_RDSrc			(EXE_RDSrc			),
	.EXE_MemRead		(EXE_MemRead		),
	.EXE_MemWrite		(EXE_MemWrite		),
	.EXE_MemtoReg		(EXE_MemtoReg		),
	.EXE_RegWrite		(EXE_RegWrite		),
	.MEM_PC_to_Reg		(MEM_PC_to_Reg		),
	.MEM_ALU_out		(MEM_ALU_out		),
	.MEM_Forward_rs2_data(data_in_pre		),
	.MEM_rd_addr		(MEM_rd_addr		),
	.MEM_funct3			(MEM_funct3			),
	.MEM_RDSrc			(MEM_RDSrc			),
	.MEM_MemRead		(MEM_MemRead		),
	.MEM_MemWrite		(MEM_MemWrite_pre	),
	.MEM_MemtoReg		(MEM_MemtoReg		),
	.MEM_RegWrite		(MEM_RegWrite		),
	.IM_STALL			(IM_STALL			),
	.DM_STALL			(DM_STALL			),
	.CSR_STALL			(CSR_STALL			)
);

MEM_WB_reg MEM_WB_reg(
	.clk				(clk				),
	.rst				(rst				),
	.MEM_rd_data		(MEM_rd_data		),
	.MEM_data_out		(data_out_reg		),
	.MEM_rd_addr		(MEM_rd_addr		),
	.MEM_MemtoReg		(MEM_MemtoReg		),
	.MEM_RegWrite		(MEM_RegWrite		),
	.WB_rd_data			(WB_rd_data_temp	),
	.WB_data_out		(WB_data_out		),
	.WB_rd_addr			(WB_rd_addr			),
	.WB_MemtoReg		(WB_MemtoReg		),
	.WB_RegWrite		(WB_RegWrite		),
	.IM_STALL			(IM_STALL			),
	.DM_STALL			(DM_STALL			),
	.CSR_STALL			(CSR_STALL			)
);
//////////5-stage register//////////

//////////Arithmetic Logic Unit//////////
ALU ALU(
	.ALU_in1		(EXE_Forward_rs1_data),
	.ALU_in2		(EXE_rs2_data_ALU	),
	.ALUCtrl		(ALUCtrl			),
	.ALU_out		(EXE_ALU_out_reg	),
	.ZeroFlag		(ZeroFlag			)
);

Immediate_Generator	ImmGen(
	.ImmType		(ImmType			),
	.Imm_in			(ID_Instr[31:7]		),
	.Imm_out		(ID_Imm				)
);
//////////Arithmetic Logic Unit//////////

//////////Register//////////
Register_File RegFile(
	.clk			(clk				),
	.rst			(rst				),
	.rs1_addr		(ID_Instr[19:15]	),
	.rs2_addr		(ID_Instr[24:20]	),
	.rd_addr		(WB_rd_addr			),
	.data_in		(WB_rd_data			),
	.RegWrite		(WB_RegWrite		),
	.rs1_data		(ID_rs1_data		),
	.rs2_data		(ID_rs2_data		)
);

CSR CSR(
	.clk			(clk				),
	.rst			(rst				),
	.CSR_addr		(CSR_addr			),
	.CSR_write		(EXE_CSRSrc			),
	.CSR_wdata		(CSR_wdata			),
	.funct3			(EXE_funct3			),
	.EXE_PC			(EXE_PC				),
	.interrupt		(interrupt			),
	.IM_STALL		(IM_STALL			),
	.DM_STALL		(DM_STALL			),
	.CSR_rdata		(CSR_rdata			),
	.CSR_retPC		(CSR_retPC			),
	.CSR_PC			(CSR_PC				),
	.CSR_control	(CSR_control		),
	.CSR_STALL		(CSR_STALL			)
);

endmodule
