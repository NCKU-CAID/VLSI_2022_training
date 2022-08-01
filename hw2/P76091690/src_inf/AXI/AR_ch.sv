`include "../../include/AXI_define.svh"
`include "Arbiter.sv"
`include "Decoder.sv"
module AR_ch (
    input clk, rst,
    // M1
	input [`AXI_ID_BITS   -1:0] id_m0_i,
	input [`AXI_ADDR_BITS -1:0] addr_m0_i,
	input [`AXI_LEN_BITS  -1:0] len_m0_i,
	input [`AXI_SIZE_BITS -1:0] size_m0_i,
	input [`AXI_BURST_BITS-1:0] burst_m0_i,
	input                       valid_m0_i,
	output logic                ready_m0_o,
    // M1
	input [`AXI_ID_BITS   -1:0] id_m1_i,
	input [`AXI_ADDR_BITS -1:0] addr_m1_i,
	input [`AXI_LEN_BITS  -1:0] len_m1_i,
	input [`AXI_SIZE_BITS -1:0] size_m1_i,
	input [`AXI_BURST_BITS-1:0] burst_m1_i,
	input                       valid_m1_i,
	output logic                ready_m1_o,

    // S0
	output logic [`AXI_IDS_BITS  -1:0] id_s0_o,
	output logic [`AXI_ADDR_BITS -1:0] addr_s0_o,
	output logic [`AXI_LEN_BITS  -1:0] len_s0_o,
	output logic [`AXI_SIZE_BITS -1:0] size_s0_o,
	output logic [`AXI_BURST_BITS-1:0] burst_s0_o,
	output logic                       valid_s0_o,
	input                              ready_s0_i,
    // S1
	output logic [`AXI_IDS_BITS  -1:0] id_s1_o,
	output logic [`AXI_ADDR_BITS -1:0] addr_s1_o,
	output logic [`AXI_LEN_BITS  -1:0] len_s1_o,
	output logic [`AXI_SIZE_BITS -1:0] size_s1_o,
	output logic [`AXI_BURST_BITS-1:0] burst_s1_o,
	output logic                       valid_s1_o,
	input                              ready_s1_i,
    // SD
	output logic [`AXI_IDS_BITS  -1:0] id_sd_o,
	output logic [`AXI_ADDR_BITS -1:0] addr_sd_o,
	output logic [`AXI_LEN_BITS  -1:0] len_sd_o,
	output logic [`AXI_SIZE_BITS -1:0] size_sd_o,
	output logic [`AXI_BURST_BITS-1:0] burst_sd_o,
	output logic                       valid_sd_o,
	input                              ready_sd_i
);

	logic [`AXI_IDS_BITS  -1:0] id_m;
	logic [`AXI_ADDR_BITS -1:0] addr_m;
	logic [`AXI_LEN_BITS  -1:0] len_m;
	logic [`AXI_SIZE_BITS -1:0] size_m;
	logic [`AXI_BURST_BITS-1:0] burst_m;
	logic valid_m;
	logic ready_s;

	logic valid_s0;
	logic valid_s1;
	logic valid_sd;

	logic [2:0] start;
	always_ff @(posedge clk or negedge rst) begin
		if (~rst) start <= 3'h0;
		else begin
			start[0] <= ready_s0_i ? 1'b1 : start[0]; 
			start[1] <= ready_s1_i ? 1'b1 : start[1];
			start[2] <= ready_sd_i ? 1'b1 : start[2];
		end
	end
	assign valid_s0_o = ~(start[0] & ~ready_s0_i) & valid_s0; 
	assign valid_s1_o = ~(start[1] & ~ready_s1_i) & valid_s1;
	assign valid_sd_o = ~(start[2] & ~ready_sd_i) & valid_sd;

	// S0
	assign id_s0_o    = id_m;
	assign addr_s0_o  = addr_m;
	assign len_s0_o   = len_m;
	assign size_s0_o  = size_m;
	assign burst_s0_o = burst_m;
	// S1
	assign id_s1_o    = id_m;
	assign addr_s1_o  = addr_m;
	assign len_s1_o   = len_m;
	assign size_s1_o  = size_m;
	assign burst_s1_o = burst_m;
	// SD
	assign id_sd_o    = id_m;
	assign addr_sd_o  = addr_m;
	assign len_sd_o   = len_m;
	assign size_sd_o  = size_m;
	assign burst_sd_o = burst_m;

	Arbiter ar_arbiter(
		.clk        (clk       ),
		.rst        (rst       ),
		.id_m0_i    (id_m0_i   ),
		.addr_m0_i  (addr_m0_i ),
		.len_m0_i   (len_m0_i  ),
		.size_m0_i  (size_m0_i ),
		.burst_m0_i (burst_m0_i),
		.valid_m0_i (valid_m0_i),
		.id_m1_i    (id_m1_i   ),
		.addr_m1_i  (addr_m1_i ),
		.len_m1_i   (len_m1_i  ),
		.size_m1_i  (size_m1_i ),
		.burst_m1_i (burst_m1_i),
		.valid_m1_i (valid_m1_i),
    	.readys_i   (ready_s   ),
		.id_o       (id_m      ),
		.addr_o     (addr_m    ),
		.len_o      (len_m     ),
		.size_o     (size_m    ),
		.burst_o    (burst_m   ),
		.valid_o    (valid_m   ),
		.ready_m0_o (ready_m0_o),
		.ready_m1_o (ready_m1_o)
	);

	Decoder ar_decoder (
		.addr_i     (addr_m    ),
		.valid_i    (valid_m   ), 
		.ready_s0_i (ready_s0_i),
		.ready_s1_i (ready_s1_i),
		.ready_sd_i (ready_sd_i),
		.valid_s0_o (valid_s0  ),
		.valid_s1_o (valid_s1  ),
		.valid_sd_o (valid_sd  ),
		.readys_o   (ready_s   )
	);

endmodule
