`include "../../include/AXI_define.svh"

module W_ch (
    input clk, rst,
	input        [`AXI_DATA_BITS-1:0] data_m1_i,
	input        [`AXI_STRB_BITS-1:0] strb_m1_i,
	input                             last_m1_i,
	input                             valid_m1_i,
	output logic                      ready_m1_o,
	

	
	output logic [`AXI_DATA_BITS-1:0] data_s0_o,
	output logic [`AXI_STRB_BITS-1:0] strb_s0_o,
	output logic                      last_s0_o,
	output logic                      valid_s0_o,
	input                             ready_s0_i,


	output logic [`AXI_DATA_BITS-1:0] data_s1_o,
	output logic [`AXI_STRB_BITS-1:0] strb_s1_o,
	output logic                      last_s1_o,
	output logic                      valid_s1_o,
	input                             ready_s1_i,
        
	output logic [`AXI_DATA_BITS-1:0] data_sd_o,
	output logic [`AXI_STRB_BITS-1:0] strb_sd_o,
	output logic                      last_sd_o,
	output logic                      valid_sd_o,
	input                             ready_sd_i,

    input                             awvalid_s0_i,
	input                             awvalid_s1_i,
   	input                             awvalid_sd_i
);
	// S
	logic [`AXI_SLAVE_BITS-1:0] slave;
	logic [2:0] validout;
	logic sel2, sel1, sel0;
	logic [2:0] wvalid_s;
	logic free;
	// M
	logic [`AXI_DATA_BITS -1:0] data_m;
	logic [`AXI_STRB_BITS -1:0] strb_m;
	logic last_m;
	logic valid_m;
	logic ready_s;

// Master
	always_comb begin
		case (slave)
			`AXI_SLAVE0 : ready_s = ready_s0_i;	
			`AXI_SLAVE1 : ready_s = ready_s1_i;
			`AXI_SLAVE2 : ready_s = ready_sd_i;
			default     : ready_s = 1'b1;
		endcase
	end
	// M1
	assign data_m = data_m1_i;
	assign strb_m = strb_m1_i;
	assign last_m = last_m1_i;
	assign valid_m = valid_m1_i;
	assign ready_m1_o = ready_s & valid_m1_i;
// Slave
	assign free = valid_m & ready_s & last_m;
	assign sel0 = wvalid_s[0] | awvalid_s0_i; 
	assign sel1 = wvalid_s[1] | awvalid_s1_i;
	assign sel2 = wvalid_s[2] | awvalid_sd_i;
	assign slave = {sel2, sel1, sel0};
	always_ff @(posedge clk or negedge rst) begin
		if (~rst) begin
			wvalid_s <= 3'b0;
		end
		else begin
			wvalid_s[0] <= (awvalid_s0_i) ? awvalid_s0_i : free ? 1'b0 : wvalid_s[0];
			wvalid_s[1] <= (awvalid_s1_i) ? awvalid_s1_i : free ? 1'b0 : wvalid_s[1];
			wvalid_s[2] <= (awvalid_sd_i) ? awvalid_sd_i : free ? 1'b0 : wvalid_s[2];
		end
	end
	assign {valid_sd_o, valid_s1_o, valid_s0_o} = validout;
	always_comb begin
		case (slave)
			`AXI_SLAVE0 : validout = {1'b0,    1'b0,    valid_m};	
			`AXI_SLAVE1 : validout = {1'b0,    valid_m, 1'b0};
			`AXI_SLAVE2 : validout = {valid_m, 1'b0,    1'b0};	
			default     : validout = 3'b0; 
		endcase
	end
	// S0
	assign data_s0_o = data_m;
	assign strb_s0_o = (valid_s0_o)?strb_m : `AXI_STRB_BITS'hf;
	assign last_s0_o = last_m;
	// S1
	assign data_s1_o = data_m;
	assign strb_s1_o = (valid_s1_o)?strb_m : `AXI_STRB_BITS'hf;
	assign last_s1_o = last_m;
	// S2
	assign data_sd_o = data_m;
	assign strb_sd_o = (valid_sd_o)?strb_m : `AXI_STRB_BITS'hf;
	assign last_sd_o = last_m;

endmodule
