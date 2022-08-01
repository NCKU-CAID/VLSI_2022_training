`include "./Def.sv"

module MEM_S (
    input                                     clk,
    rst,
           inf_EX_MEM.MEM2EX                  mem2ex_i,
           inf_MEM_WB.MEM2WB                  mem2wb_o,
    // Forward
    output                   [`DATA_BITS-1:0] rd_data_o,
    output                   [`REG_BITS -1:0] rd_addr_o,
    output                                    reg_wr_o,
    // lw, sw
    input                    [`DATA_BITS-1:0] data_i,
    output                   [`ADDR_BITS-1:0] dm_addr_o,
    output                   [`DATA_BITS-1:0] dm_sw_o,
    output                   [`WEB_BITS -1:0] dm_web_o
);
  assign rd_data_o = mem2ex_i.rd_src ? mem2ex_i.pc2reg : mem2ex_i.alu_out;
  assign rd_addr_o = mem2ex_i.rd_addr;
  assign reg_wr_o = mem2ex_i.reg_wr;
  assign dm_addr_o = (mem2ex_i.dm_rd | mem2ex_i.dm_wr) ? mem2ex_i.alu_out : `ADDR_BITS'h0;
  // 
  logic [`WEB_BITS-1 : 0] web, bweb, hweb;
  assign dm_web_o = mem2ex_i.dm_wr ? web : 4'hf;
  always_comb begin
    case (dm_addr_o[1:0])
      2'h0: {bweb, hweb} = {4'b1110, 4'b1100};
      2'h1: {bweb, hweb} = {4'b1101, 4'b1001};  //{4'b1101, 4'b1100};
      2'h2: {bweb, hweb} = {4'b1011, 4'b0011};
      2'h3: {bweb, hweb} = {4'b0111, 4'b0111};  //{4'b0111, 4'b0011};
    endcase
  end
  always_comb begin
    case (mem2ex_i.datatype)
      `BYTE:    web = bweb;
      `BYTE_U:  web = bweb;
      `HWORD:   web = hweb;
      `HWORD_U: web = hweb;
      `WORD:    web = 4'h0;
      default:  web = 4'hf;
    endcase
  end
  // lw
  logic [`DATA_BITS-1:0] dm2wb;
  logic sign;
  assign sign = ~mem2ex_i.datatype[2];
  always_comb begin
    case (web)
      4'b0000: dm2wb = data_i;
      4'b1110:
      dm2wb = sign ? {{24{data_i[7]}}, data_i[7:0]} : {24'h0, data_i[7:0]};
      4'b1101:
      dm2wb = sign ? {{24{data_i[15]}}, data_i[15:8]} : {24'h0, data_i[15:8]};
      4'b1011:
      dm2wb = sign ? {{24{data_i[23]}}, data_i[23:16]} : {24'h0, data_i[23:16]};
      4'b0111:
      dm2wb = sign ? {{24{data_i[31]}}, data_i[31:24]} : {24'h0, data_i[31:24]};
      4'b1100:
      dm2wb = sign ? {{16{data_i[15]}}, data_i[15:0]} : {16'h0, data_i[15:0]};
      4'b1001:
      dm2wb = sign ? {{16{data_i[23]}}, data_i[23: 8]} : {16'h0, data_i[23: 8]}; // 
      4'b0011:
      dm2wb = sign ? {{16{data_i[31]}}, data_i[31:16]} : {16'h0, data_i[31:16]};
      default: dm2wb = data_i;
    endcase
  end
  // sw
  logic [`DATA_BITS-1:0] sw_data;
  assign dm_sw_o = sw_data;
  always_comb begin
    case (web)
      4'b0000: sw_data = mem2ex_i.dm_data;
      4'b1110: sw_data = {24'h0, mem2ex_i.dm_data[7:0]};
      4'b1101: sw_data = {16'h0, mem2ex_i.dm_data[7:0], 8'h0};
      4'b1011: sw_data = {8'h0, mem2ex_i.dm_data[7:0], 16'h0};
      4'b0111: sw_data = {mem2ex_i.dm_data[7:0], 24'h0};
      4'b1100: sw_data = {16'h0, mem2ex_i.dm_data[15:0]};
      4'b0011: sw_data = {mem2ex_i.dm_data[15:0], 16'h0};
      default: sw_data = mem2ex_i.dm_data;
    endcase
  end
  // 
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      mem2wb_o.rd_data <= `DATA_BITS'h0;
      mem2wb_o.rd_addr <= `REG_BITS'h0;
      mem2wb_o.reg_wr  <= 1'b0;
      mem2wb_o.dm_out  <= `DATA_BITS'h0;
      mem2wb_o.dm2reg  <= 1'b0;
    end else begin
      mem2wb_o.rd_data <= rd_data_o;
      mem2wb_o.rd_addr <= mem2ex_i.rd_addr;
      mem2wb_o.reg_wr  <= mem2ex_i.reg_wr;
      mem2wb_o.dm_out  <= dm2wb;
      mem2wb_o.dm2reg  <= mem2ex_i.dm2reg;
    end
  end
endmodule
