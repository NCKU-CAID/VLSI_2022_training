module CSR(clk, rst, CSR_addr, CSR_write, CSR_wdata, funct3, EXE_PC, interrupt, IM_STALL, DM_STALL, CSR_rdata, CSR_retPC, CSR_PC, CSR_control, CSR_STALL);

input       	        clk;
input       	        rst;
input       	[11:0]  CSR_addr;
input                   CSR_write;
input       	[31:0]  CSR_wdata;
input           [ 2:0]  funct3;
input           [31:0]  EXE_PC;
input                   interrupt;
input                   IM_STALL;
input                   DM_STALL;
output  logic	[31:0]  CSR_rdata;
output  logic   [31:0]  CSR_retPC;
output  logic   [31:0]  CSR_PC;
output  logic           CSR_control;
output  logic           CSR_STALL;

logic   [31:0]  mstatus;
logic   [31:0]  mie;
logic   [31:0]  mtvec;
logic   [31:0]  mepc;
logic   [31:0]  mip;
logic   [31:0]  mcycle;
logic   [31:0]  minstret;
logic   [31:0]  mcycleh;
logic   [31:0]  minstreth;
logic           STALL;

assign  mtvec = 32'h10000;
assign  CSR_retPC = mepc;
assign  CSR_PC = mtvec;
assign  CSR_control = mstatus[3] & interrupt & mip[11] & mie[11];
assign  STALL = CSR_write & (CSR_addr == 12'h105) & mie[11];

always_ff@(posedge clk or posedge  rst) begin
    if(rst) begin
        {mcycleh,mcycle} <= 64'b0;
        {minstreth,minstret} <= 64'b0;
    end
    else begin
        {mcycleh,mcycle} <= {mcycleh,mcycle} + 64'b1;
        {minstreth,minstret} <= {minstreth,minstret} + 64'b1;
    end
end

always_ff@(posedge clk or posedge rst) begin
    if(rst) begin
        mstatus <= 32'b0;
        mie <= 32'b0;
        mip <= 32'b0;
        mepc <= 32'b0;
    end
    else begin
        if(CSR_write & ~IM_STALL & ~DM_STALL & CSR_addr == 12'h105)begin
            mepc <= EXE_PC + 32'b100;
            mip[11] <= mie[11] ? 1'b1 : mip[11];
        end
        else if(CSR_write & ~IM_STALL & ~DM_STALL & CSR_addr == 12'h302)begin
            mstatus[12:11] <= 2'b11;
            mstatus[7] <= 1'b1;
            mstatus[3] <= mstatus[7];
        end
        else if (interrupt & ~IM_STALL & ~DM_STALL) begin
            mstatus[7] <= mip[11] ? mstatus[3] : mstatus[7];
            mstatus[3]  <= mip[11] ? 1'b0 : mstatus[3];
            mstatus[12:11]  <= mip[11] ? 2'b11 : mstatus[12:11];
            mip[11] <= 1'b0;
        end
        else if(CSR_write & ~IM_STALL & ~DM_STALL)begin
            case(CSR_addr)
                12'h300:begin
                    case(funct3[1:0])
                        2'b01:begin
                            mstatus[12:11] <= CSR_wdata[12:11];
                            mstatus[7] <= CSR_wdata[7];
                            mstatus[3] <= CSR_wdata[3];
                        end
                        2'b10:begin
                            if(CSR_wdata != 32'b0)begin
                                mstatus[12:11] <= mstatus[12:11] | CSR_wdata[12:11];
                                mstatus[7] <= mstatus[7] | CSR_wdata[7];
                                mstatus[3] <= mstatus[3] | CSR_wdata[3];
                            end
                        end
                        2'b11:begin
                            if(CSR_wdata != 32'b0)begin
                                mstatus[12:11] <= mstatus[12:11] & ~CSR_wdata[12:11];
                                mstatus[7] <= mstatus[7] & ~CSR_wdata[7];
                                mstatus[3] <= mstatus[3] & ~CSR_wdata[3];
                            end
                        end
                    endcase
                end
                12'h304:begin
                    case(funct3[1:0])
                        2'b01:begin
                            mie[11] <= CSR_wdata[11];
                        end
                        2'b10:begin
                            if(CSR_wdata != 32'b0)
                                mie[11] <= mie[11] | CSR_wdata[11];
                        end
                        2'b11:begin
                            if(CSR_wdata != 32'b0)
                                mie[11] <= mie[11] & ~CSR_wdata[11];
                        end
                    endcase
                end
                12'h341:begin
                    case(funct3[1:0])
                        2'b01:begin
                            mepc[31:2] <= CSR_wdata[31:2];
                        end
                        2'b10:begin
                            if(CSR_wdata != 32'b0)
                                mepc[31:2] <= mepc[31:2] | CSR_wdata[31:2];
                        end
                        2'b11:begin
                            if(CSR_wdata != 32'b0)
                                mepc[31:2] <= mepc[31:2] & ~CSR_wdata[31:2];
                        end
                    endcase
                end
            endcase
        end
    end
end

always_comb begin
    case(CSR_addr)
        12'h300:CSR_rdata = mstatus;
        12'h304:CSR_rdata = mie;
        12'h305:CSR_rdata = mtvec;
        12'h341:CSR_rdata = mepc;
        12'h344:CSR_rdata = mip;
        12'hB00:CSR_rdata = mcycle;
        12'hB02:CSR_rdata = minstret;
        12'hB80:CSR_rdata = mcycleh;
        12'hB82:CSR_rdata = minstreth;
        default:CSR_rdata = 32'b0;
    endcase
end

always_ff@(posedge clk or posedge rst) begin
    if(rst) 
        CSR_STALL <= 1'b0;
    else if (CSR_control)
        CSR_STALL <= 1'b0;
    else if(CSR_write)
        CSR_STALL <= (STALL & ~IM_STALL & ~DM_STALL) ? 1'b1 : CSR_STALL;
end

endmodule