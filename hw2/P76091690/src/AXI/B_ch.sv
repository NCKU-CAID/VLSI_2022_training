`include "../../include/AXI_define.svh"

module B_ch (
	input clk, rst,
	output       [`AXI_ID_BITS  -1:0] id_m1_o,
	output       [`AXI_RESP_BITS-1:0] resp_m1_o,
	output logic                      valid_m1_o,
	input                             ready_m1_i,

	input        [`AXI_IDS_BITS -1:0] ids_s0_i,
	input        [`AXI_RESP_BITS-1:0] resp_s0_i,
	input                             valid_s0_i,
	output logic                      ready_s0_o,
	input        [`AXI_IDS_BITS -1:0] ids_s1_i,
	input        [`AXI_RESP_BITS-1:0] resp_s1_i,
	input                             valid_s1_i,
	output logic                      ready_s1_o,
	input        [`AXI_IDS_BITS -1:0] ids_sd_i,
	input        [`AXI_RESP_BITS-1:0] resp_sd_i,
	input                             valid_sd_i,
	output logic                      ready_sd_o

);
	// M
	logic [`AXI_MASTER_BITS-1:0] master;
	logic ready_m;
	// S
	logic [`AXI_SLAVE_BITS -1:0] slave;
	logic [`AXI_IDS_BITS   -1:0] ids_s;
	logic [`AXI_RESP_BITS  -1:0] resp_s;
	logic valid_s;
	logic [2:0] readyout;

// Master
	always_comb begin
		case(master)
			`AXI_MASTER1 : ready_m = ready_m1_i;
			default      : ready_m = 1'b1;
		endcase
	end
	// M1
	assign id_m1_o   = ids_s[`AXI_ID_BITS-1:0];
	assign resp_m1_o = resp_s;
	assign master    = ids_s[`AXI_IDS_BITS-1:`AXI_ID_BITS];
	always_comb begin
		case(master)
			`AXI_MASTER1 : valid_m1_o = valid_s;
			default      : valid_m1_o = 1'b0;
		endcase
	end
// Slave
	always_comb begin
		case ({valid_sd_i, valid_s1_i, valid_s0_i})
			3'b100  : slave = `AXI_SLAVE2;
			3'b010  : slave = `AXI_SLAVE1; 
			3'b001  : slave = `AXI_SLAVE0;
			default : slave = `AXI_SLAVE2;
		endcase
	end
	always_comb begin
		case(slave)
			`AXI_SLAVE0 : begin
				ids_s   = ids_s0_i;
				resp_s  = resp_s0_i;
				valid_s = valid_s0_i;
			end
			`AXI_SLAVE1 : begin
				ids_s   = ids_s1_i;
				resp_s  = resp_s1_i;
				valid_s = valid_s1_i;
			end
			`AXI_SLAVE2 : begin
				ids_s   = ids_sd_i;
				resp_s  = resp_sd_i;
				valid_s = valid_sd_i;
			end
			default     : begin
				ids_s   = `AXI_IDS_BITS'b0;
				resp_s  = 2'b0;
				valid_s = 1'b0;
			end
		endcase
	end
	assign {ready_sd_o, ready_s1_o, ready_s0_o} = readyout;
	always_comb begin
		case (slave)
			`AXI_SLAVE0 : readyout = {2'b0, ready_m & valid_s0_i};
			`AXI_SLAVE1 : readyout = {1'b0, ready_m & valid_s1_i, 1'b0};
			`AXI_SLAVE2 : readyout = {ready_m & valid_sd_i, 2'b0};
			default     : readyout = 3'b0;
		endcase
	end

endmodule
