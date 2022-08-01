`include "../../include/AXI_define.svh"

module R_ch (
	input clk, rst,
	output       [`AXI_ID_BITS  -1:0] id_m0_o,
	output       [`AXI_DATA_BITS-1:0] data_m0_o,
	output       [`AXI_RESP_BITS-1:0] resp_m0_o,
	output logic                      last_m0_o,
	output logic                      valid_m0_o,
	input                             ready_m0_i,
	output       [`AXI_ID_BITS  -1:0] id_m1_o,
	output       [`AXI_DATA_BITS-1:0] data_m1_o,
	output       [`AXI_RESP_BITS-1:0] resp_m1_o,
	output logic                      last_m1_o,
	output logic                      valid_m1_o,
	input                             ready_m1_i,
	input        [`AXI_IDS_BITS -1:0] id_s0_i,
	input        [`AXI_DATA_BITS-1:0] data_s0_i,
	input        [`AXI_RESP_BITS-1:0] resp_s0_i,
	input                             last_s0_i,
	input                             valid_s0_i,
	output logic                      ready_s0_o,

	input        [`AXI_IDS_BITS -1:0] id_s1_i,
	input        [`AXI_DATA_BITS-1:0] data_s1_i,
	input        [`AXI_RESP_BITS-1:0] resp_s1_i,
	input                             last_s1_i,
	input                             valid_s1_i,
	output logic                      ready_s1_o,

	input        [`AXI_IDS_BITS -1:0] id_sd_i,
	input        [`AXI_DATA_BITS-1:0] data_sd_i,
	input        [`AXI_RESP_BITS-1:0] resp_sd_i,
	input                             last_sd_i,
	input                             valid_sd_i,
	output logic                      ready_sd_o
);

	logic [`AXI_SLAVE_BITS-1:0] slave;
	logic [`AXI_MASTER_BITS-1:0] master;

	// S
	logic [`AXI_IDS_BITS -1:0] ids_s;
	logic [`AXI_DATA_BITS-1:0] data_s;
	logic [`AXI_RESP_BITS-1:0] resp_s;
	logic last_s;
	logic valid_s;
	logic [2:0] readyout;
	// M
	logic [1:0] validout;
	logic ready_m;


	logic [2:0] sel;
	logic [2:0] grant;

	always_ff@(posedge clk or negedge rst) begin
		if(~rst) begin
			sel <= 3'b0;
		end
		else begin
			 sel[0] <= (sel[0] & ready_m & last_s0_i) ? 1'b0 : (valid_s0_i & ~valid_s1_i & ~valid_sd_i & ~ready_m) ? 1'b1 : sel[0];
			 sel[1] <= (sel[1] & ready_m & last_s1_i) ? 1'b0 : (~sel[0]    & valid_s1_i  & ~valid_sd_i & ~ready_m) ? 1'b1 : sel[1];
			 sel[2] <= (sel[2] & ready_m & last_sd_i) ? 1'b0 : (~|sel[1:0] & valid_sd_i   & ~ready_m             ) ? 1'b1 : sel[2];
		end
	end
	assign grant[0] = valid_s0_i | sel[0];
	assign grant[1] = valid_s1_i & ~sel[0] | sel[1];
	assign grant[2] = valid_sd_i & (~|sel[1:0]) | sel[2];

	always_comb begin
		 if (grant[2])      slave = `AXI_SLAVE2;
		 else if (grant[1]) slave = `AXI_SLAVE1;
		 else if (grant[0]) slave = `AXI_SLAVE0;
		 else               slave = `AXI_SLAVE_BITS'b0;
	end


// Master
	assign master = ids_s[`AXI_IDS_BITS-1:`AXI_ID_BITS];
	always_comb begin
		case(master)
			`AXI_MASTER0 : ready_m = ready_m0_i; 
			`AXI_MASTER1 : ready_m = ready_m1_i;
			default      : ready_m = 1'b1;
		endcase
	end
	// M0
	assign id_m0_o   = ids_s[`AXI_ID_BITS-1:0];
	assign data_m0_o = data_s;
	assign resp_m0_o = resp_s;
	assign last_m0_o = last_s;
	// M1
	assign id_m1_o   = ids_s[`AXI_ID_BITS-1:0];
	assign data_m1_o = data_s;
	assign resp_m1_o = resp_s;
	assign last_m1_o = last_s;
	// valid
	assign {valid_m1_o, valid_m0_o} = validout;
	always_comb begin
		case(master)
			`AXI_MASTER0 : validout = {1'b0,    valid_s}; 
			`AXI_MASTER1 : validout = {valid_s, 1'b0};
			default      : validout = 2'b0;
		endcase
	end
// Slave
	// input
	always_comb begin
		case (slave)
			`AXI_SLAVE0 : begin
				ids_s   = id_s0_i;
				data_s  = data_s0_i;
				resp_s  = resp_s0_i;
				last_s  = last_s0_i;
				valid_s = valid_s0_i;
			end
			`AXI_SLAVE1 : begin
				ids_s   = id_s1_i;
				data_s  = data_s1_i;
				resp_s  = resp_s1_i;
				last_s  = last_s1_i;
				valid_s = valid_s1_i;
			end
			`AXI_SLAVE2 : begin
				ids_s   = id_sd_i;
				data_s  = data_sd_i;
				resp_s  = resp_sd_i;
				last_s  = last_sd_i;
				valid_s = valid_sd_i;
			end
			default    : begin
				ids_s   = `AXI_IDS_BITS'b0;
				data_s  = `AXI_DATA_BITS'b0;
				resp_s  = 2'b0;
				last_s  = 1'b0;
				valid_s = 1'b0;
			end
		endcase
	end
	// output
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
