`ifndef __CPUBITS_DEF
`define _CPUBITS_DEF

	`define DATA_BITS     32
	`define ADDR_BITS     32
	// Instruction type
	`define OPCODE_BITS   7
	`define ROP           `OPCODE_BITS'b0110011 
	`define IOP_LOAD      `OPCODE_BITS'b0000011
	`define IOP_ALU       `OPCODE_BITS'b0010011
	`define IOP_JALR      `OPCODE_BITS'b1100111
	`define SOP           `OPCODE_BITS'b0100011
	`define BOP           `OPCODE_BITS'b1100011
	`define UOP_AUPIC     `OPCODE_BITS'b0010111
	`define UOP_LUI       `OPCODE_BITS'b0110111
	`define JOP_JAL       `OPCODE_BITS'b1101111
	// Decoder
	`define FUNC7_BITS    7
	`define FUNC3_BITS    3
	`define IMM_BITS      32
	`define WEB_BITS      4
	// Register file
	`define REG_NUMS      32
	`define REG_BITS      5
	// Branch
	`define BRANCH_BITS   2
	`define BRANCH_NEXT   `BRANCH_BITS'h0
	`define BRANCH_BEQ    `BRANCH_BITS'h1
	`define BRANCH_JAL    `BRANCH_BITS'h2
	`define BRANCH_JALR   `BRANCH_BITS'h3
	// Forward
	`define FORWARD_BITS  2 
	`define FORWARD_IDRS  `FORWARD_BITS'h0
	`define FORWARD_MEMRD `FORWARD_BITS'h1
	`define FORWARD_WBRD  `FORWARD_BITS'h2
	// Data type
	`define TYPE_BITS     3
	`define CPU_BYTE      `TYPE_BITS'b000
	`define CPU_HWORD     `TYPE_BITS'b001
	`define CPU_WORD      `TYPE_BITS'b010
	`define CPU_BYTE_U    `TYPE_BITS'b100
	`define CPU_HWORD_U   `TYPE_BITS'b101
	// ALUOP
	`define ALUOP_BITS    3
	`define	NO_ALUOP      `ALUOP_BITS'h0 // jal, auipc
	`define R_ALUOP       `ALUOP_BITS'h1
	`define I_ALUOP       `ALUOP_BITS'h2
	`define ADD_ALUOP     `ALUOP_BITS'h3 // Load, Jalr, store
	`define BEQ_ALUOP     `ALUOP_BITS'h4
	`define LUI_ALUOP     `ALUOP_BITS'h5
	// ALU CTRL
	`define ALUCTRL_BITS  5
	`define	IDLE  		  `ALUCTRL_BITS'h0
	`define ADD   		  `ALUCTRL_BITS'h1
	`define SUB   		  `ALUCTRL_BITS'h2
	`define SLL   		  `ALUCTRL_BITS'h3
	`define SLT   		  `ALUCTRL_BITS'h4
	`define SLTU  		  `ALUCTRL_BITS'h5
	`define XOR   		  `ALUCTRL_BITS'h6
	`define SRL   		  `ALUCTRL_BITS'h7
	`define SRA   		  `ALUCTRL_BITS'h8
	`define OR    		  `ALUCTRL_BITS'h9
	`define AND   		  `ALUCTRL_BITS'ha
	`define SLLI  		  `ALUCTRL_BITS'hb
	`define SRLI  		  `ALUCTRL_BITS'hc
	`define SRAI  		  `ALUCTRL_BITS'hd
	`define IMM   		  `ALUCTRL_BITS'he
	`define BEQ   		  `ALUCTRL_BITS'hf
	`define BNE   		  `ALUCTRL_BITS'h10
	`define BGE   		  `ALUCTRL_BITS'h11
	`define BGEU  		  `ALUCTRL_BITS'h12

`endif 
