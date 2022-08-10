//================================================
// Auther:      Chen Yun-Ru (May)
// Filename:    L1C_inst.sv
// Description: L1 Cache for instruction
// Version:     0.1
//================================================
`include "../include/def.svh"
`include "./tag_array_wrapper.sv"
`include "./data_array_wrapper.sv"

module L1C_inst(
	input clk,
	input rst,

	// Core to CPU wrapper
	input [`DATA_BITS-1:0] core_addr,
	input core_req,
	input core_write,
	input [`DATA_BITS-1:0] core_in,
	input [`CACHE_TYPE_BITS-1:0] core_type,

	// Mem to CPU wrapper
	input [`DATA_BITS-1:0] I_out,
	input I_valid,
	input I_wait,

	// CPU wrapper to core
	output logic [`DATA_BITS-1:0] core_out,
	output logic core_wait,

	// CPU wrapper to Mem
	output logic I_req,
	output logic [`DATA_BITS-1:0] I_addr,
	output logic I_write,
	output logic [`DATA_BITS-1:0] I_in,
	output logic [`CACHE_TYPE_BITS-1:0] I_type
);

	logic [`CACHE_INDEX_BITS-1:0] index;

	logic [`CACHE_DATA_BITS-1:0] DA_out;
	logic [`CACHE_DATA_BITS-1:0] DA_in;
	logic [`CACHE_WRITE_BITS-1:0] DA_write;
	logic DA_read;

	logic [`CACHE_TAG_BITS-1:0] TA_out;
	logic [`CACHE_TAG_BITS-1:0] TA_in;
	logic TA_write;
	logic TA_read;

	logic [`CACHE_LINES-1:0] valid;

  //--------------- complete this part by yourself -----------------//

    logic [2:0] CurrentState;
	logic [2:0] NextState;

	logic [`DATA_BITS-1:0] 			core_addr_reg;
	logic 							core_write_reg;
	logic [`DATA_BITS-1:0]			core_in_reg;
	logic [`CACHE_TYPE_BITS-1:0]	core_type_reg;
	logic [`DATA_BITS-1:0]			I_out_reg;
	logic [1:0]						DA_counter;

	logic		IDLE_state;
	logic		check_state;
	logic		read_miss_state;
	logic		write_hit_state;
	logic		write_miss_state;

	logic 		I_wait_reg;
	
	// logic	[31:0]	hit_counter;
	// logic	[31:0]	miss_counter;

	parameter	IDLE = 3'h0,
  				Check = 3'h1,
  				Read_Miss = 3'h2,
  				Write_Hit = 3'h3,
  				Write_Miss = 3'h4;

	assign I_addr = (core_req) ? ((core_write) ? core_addr[31:0] : {core_addr[31:4], 4'h0}) : ((core_write) ? core_addr_reg[31:0] : {core_addr_reg[31:4], 4'h0});
	assign I_in = (core_req) ? core_in : core_in_reg;
	assign I_type = (core_req) ? core_type : core_type_reg;

	assign index = (core_req) ? core_addr[9:4] : core_addr_reg[9:4];

	// always@(posedge clk or posedge rst)begin
  	// 	if(rst)
	// 		hit_counter <= 32'b0;
  	//   	else if(check_state & ~core_write_reg & core_addr_reg[31:10] == TA_out)
	// 		hit_counter <= hit_counter + 1'b1;
  	// end

	// always@(posedge clk or posedge rst)begin
  	// 	if(rst)
	// 		miss_counter <= 32'b0;
  	//   	else if(IDLE_state & core_req & ~valid[core_addr[9:4]])
	// 		miss_counter <= miss_counter + 1'b1;
	// 	else if(check_state & core_addr_reg[31:10] != TA_out)
	// 		miss_counter <= miss_counter + 1'b1;
  	// end

	always@(posedge clk or posedge rst)begin
  		if(rst)
			I_wait_reg <= 1'b0;
  	  	else
			I_wait_reg <= (read_miss_state | write_hit_state | write_miss_state) ? I_wait : 1'b1;
  	end

	always@(posedge clk or posedge rst)begin
  		if(rst)begin
			TA_read <= 1'b0;
			DA_read <= 1'b0;
		end
  	  	else begin
			if(IDLE_state & core_req & valid[core_addr[9:4]])begin
				TA_read <= 1'b1;
				DA_read <= 1'b1;
			end
			else begin
				TA_read <= 1'b0;
				DA_read <= 1'b0;
			end
		end
  	end

	always@(posedge clk or posedge rst)begin
  		if(rst)begin
			DA_write <= `CACHE_WRITE_BITS'hffff;
			DA_in <= `CACHE_DATA_BITS'b0;
			DA_counter <= 2'b0;
			I_out_reg <= `DATA_BITS'b0;
		end
		else begin
			if(check_state & ~core_write_reg & core_addr_reg[31:10] == TA_out)begin
				case(core_addr_reg[3:2])
					2'b00:
						I_out_reg <= DA_out[31:0];
					2'b01:
						I_out_reg <= DA_out[63:32];
					2'b10:
						I_out_reg <= DA_out[95:64];
					2'b11:
						I_out_reg <= DA_out[127:96];
				endcase
			end
			else if(read_miss_state & I_valid)begin
				DA_counter <= DA_counter + 2'b1;
				case(DA_counter)
					2'b00:begin
						DA_write <= `CACHE_WRITE_BITS'hfff0;
						DA_in <= {96'h0, I_out};
					end
					2'b01:begin
						DA_write <= `CACHE_WRITE_BITS'hff0f;
						DA_in <= {64'h0, I_out, 32'h0};
					end
					2'b10:begin
						DA_write <= `CACHE_WRITE_BITS'hf0ff;
						DA_in <= {32'h0, I_out, 64'h0};
					end
					2'b11:begin
						DA_write <= `CACHE_WRITE_BITS'h0fff;
						DA_in <= {I_out, 96'h0};
					end
				endcase
				if(core_addr_reg[3:2] == DA_counter)
					I_out_reg <= I_out;
			end
			else if(write_hit_state & ~I_wait)begin
				case(core_addr_reg[3:2])
					2'b00:begin
						DA_write <= {12'hfff, core_type};
						DA_in <= {96'h0, core_in_reg};
					end
					2'b01:begin
						DA_write <= {8'hff, core_type, 4'hf};
						DA_in <= {64'h0, core_in_reg, 32'h0};
					end
					2'b10:begin
						DA_write <= {4'hf, core_type, 8'hff};
						DA_in <= {32'h0, core_in_reg, 64'h0};
					end
					2'b11:begin
						DA_write <= {core_type, 12'hfff};
						DA_in <= {core_in_reg, 96'h0};
					end
				endcase
			end
			else begin
				DA_write <= `CACHE_WRITE_BITS'hffff;
				DA_in <= `CACHE_DATA_BITS'b0;
			end
		end
  	end

	always@(posedge clk or posedge rst)begin
  		if(rst)begin
			TA_write <= 1'b1;
			TA_in <= `CACHE_TAG_BITS'b0;
		end
  	  	else begin
			if(read_miss_state & I_valid)begin
				TA_write <= 1'b0;
				TA_in <= core_addr_reg[31:10];
			end
			else begin
				TA_write <= 1'b1;
				TA_in <= `CACHE_TAG_BITS'b0;
			end
		end
  	end

	always@(posedge clk or posedge rst)begin
  		if(rst)
			valid <= 64'b0;
  	  	else if(IDLE_state & core_req & ~valid[core_addr[9:4]] & ~core_write)
			valid[core_addr[9:4]] <= 1'b1;
  	end

	always@(posedge clk or posedge rst)begin
  		if(rst)begin
			core_addr_reg <= `DATA_BITS'b0;
  	    	core_write_reg <= 1'b0;
			core_in_reg <= `DATA_BITS'b0;
			core_type_reg <= `CACHE_TYPE_BITS'hf;
		end
  	  	else begin
			if(core_req & IDLE_state)begin
				core_addr_reg <= core_addr;
  	    		core_write_reg <= core_write;
				core_in_reg <= core_in;
				core_type_reg <= core_type;
			end
			else if(I_wait)
				core_type_reg <= `CACHE_TYPE_BITS'hf;
		end
  	end

  	always@(posedge clk or posedge rst)begin
  		if(rst)
  	    	CurrentState <= IDLE;
  	  	else
  	    	CurrentState <= NextState;
  	end

	always@(*)begin
		case(CurrentState)
			IDLE:begin
	      		if(core_req & valid[core_addr[9:4]])
	      			NextState = Check;
	      		else if(core_req & ~valid[core_addr[9:4]] & ~core_write)
	      			NextState = Read_Miss;
	      		else if(core_req & ~valid[core_addr[9:4]] & core_write)
	      			NextState = Write_Miss;
	      		else
	      			NextState = IDLE;
	    	end
	    	Check:begin
	    		if(~core_write_reg & core_addr_reg[31:10] == TA_out)
	    	  		NextState = IDLE;
	    	  	else if(~core_write_reg & core_addr_reg[31:10] != TA_out)
	    	  		NextState = Read_Miss;
	    	  	else if(core_write_reg & core_addr_reg[31:10] == TA_out)
	    	  		NextState = Write_Hit;
	    	  	else if(core_write_reg & core_addr_reg[31:10] != TA_out)
	    	  		NextState = Write_Miss;
	    	  	else
	    	  		NextState = Check;
	    	end
	    	Read_Miss:begin
				if(I_wait_reg == 1'b0)
					NextState = IDLE;
				else
					NextState = Read_Miss;
	    	end
	    	Write_Hit:begin
				if(I_wait_reg == 1'b0)
					NextState = IDLE;
				else 
					NextState = Write_Hit;
	    	end
	    	Write_Miss:begin
				if(I_wait_reg == 1'b0)
					NextState = IDLE;
				else 
					NextState = Write_Miss;
	    	end
			default:
				NextState = IDLE;
	  	endcase
	end

	always@(*)begin
		case(CurrentState)
			IDLE:begin
				I_req = (core_req & ~valid[core_addr[9:4]]) ? core_req : 1'b0;
				I_write = (core_req & ~valid[core_addr[9:4]]) ? core_write : 1'b0;

				core_wait = core_req;
				core_out = (core_req) ? `DATA_BITS'b0 : I_out_reg;

				IDLE_state = 1'b1;
				check_state = 1'h0;
				read_miss_state = 1'h0;
				write_hit_state = 1'h0;
				write_miss_state = 1'h0;
			end
			Check:begin
				I_req = (~core_write_reg & core_addr_reg[31:10] == TA_out) ? 1'h0 : 1'h1;
				I_write = (~core_write_reg & core_addr_reg[31:10] == TA_out) ? 1'h0 : core_write_reg;

			  	core_wait = (~core_write_reg & core_addr_reg[31:10] == TA_out) ? 1'h0 : 1'h1;
				core_out = (~core_write_reg & core_addr_reg[31:10] == TA_out) ? ((core_addr_reg[3:2] == 2'h3) ? DA_out[127:96] : (core_addr_reg[3:2] == 2'h2) ? DA_out[95:64] : (core_addr_reg[3:2] == 2'h1) ? DA_out[63:32] : DA_out[31:0]) : `DATA_BITS'b0;
				//core_out = I_out_reg;

				IDLE_state = 1'b0;
			  	check_state = 1'h1;
			  	read_miss_state = 1'h0;
			  	write_hit_state = 1'h0;
			  	write_miss_state = 1'h0;
			end
			Read_Miss:begin
				I_req = (I_wait) ? 1'b1 : 1'b0;
				I_write = 1'b0;

				core_wait = (I_wait_reg == 1'b0) ? 1'b0 : 1'b1;
				core_out = (core_addr_reg[3:2] == 2'h3) ? I_out : I_out_reg;

				IDLE_state = 1'b0;
				check_state = 1'h0;
				read_miss_state = 1'h1;
				write_hit_state = 1'h0;
				write_miss_state = 1'h0;
			end
			Write_Hit:begin
				I_req = (I_wait) ? 1'b1 : 1'b0;
				I_write = 1'b1;

				core_wait = (I_wait_reg == 1'b0) ? 1'b0 : 1'b1;
				core_out = `DATA_BITS'b0;

				IDLE_state = 1'b0;
				check_state = 1'h0;
				read_miss_state = 1'h0;
				write_hit_state = 1'h1;
				write_miss_state = 1'h0;
			end
			Write_Miss:begin
				I_req = (I_wait) ? 1'b1 : 1'b0;
				I_write = 1'b1;

				core_wait = (I_wait_reg == 1'b0) ? 1'b0 : 1'b1;
				core_out = `DATA_BITS'b0;

				IDLE_state = 1'b0;
				check_state = 1'h0;
				read_miss_state = 1'h0;
				write_hit_state = 1'h0;
				write_miss_state = 1'h1;
			end
			default:begin
				I_req = 1'b0;
				I_write = 1'b0;

				core_wait = 1'h0;
				core_out = `DATA_BITS'b0;

				IDLE_state = 1'b0;
				check_state = 1'h0;
				read_miss_state = 1'h0;
				write_hit_state = 1'h0;
				write_miss_state = 1'h0;
			end
		endcase
	end
  
  data_array_wrapper DA(
    .A(index),
    .DO(DA_out),
    .DI(DA_in),
    .CK(clk),
    .WEB(DA_write),
    .OE(DA_read),
    .CS(1'b1)
  );
   
  tag_array_wrapper  TA(
    .A(index),
    .DO(TA_out),
    .DI(TA_in),
    .CK(clk),
    .WEB(TA_write),
    .OE(TA_read),
    .CS(1'b1)
  );

endmodule

