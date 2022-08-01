module CSR (
    input clk,    // Clock
    input rst,  // Asynchronous reset active low

    // function
    input [2:0] funct3,
    input [6:0] funct7,

    // source
    input [31:0] rs1,
    input [31:0] imm,
    input [4:0] rs1_addr,

    // CSR addr, enable
    input [11:0] CSR_addr,
    input CSR_write,

    // RegWrite
    input EXEMEM_RegWrite,

    // interrupt
    input interrupt,

    // PC
    input [31:0] EXE_pc,
    output [31:0] CSR_return_pc,
    output [31:0] CSR_ISR_pc,

    // output data
    output reg [31:0] CSR_rdata,

    // stall
    output reg CSR_stall,
    output CSR_control,
    output CSR_ret
);

parameter [4:0] MPP  = 5'd11,
                MPIE = 5'd7,
                MIE  = 5'd3,
                MEIP = 5'd11,
                MEIE = 5'd11;

logic [31:0] mstatus;
logic [31:0] mie;
logic [31:0] mtvec;
logic [31:0] mepc;
logic [31:0] mip;
logic [31:0] mcycle;
logic [31:0] minstret;
logic [31:0] mcycleh;
logic [31:0] minstreth;

assign CSR_return_pc = mepc;
assign CSR_ISR_pc = mtvec;

assign CSR_ret = ((funct3 == 3'b0) & CSR_write & (funct7 == 7'b0011000))? 1'b1:1'b0;

always_ff @(posedge clk or posedge rst) begin
    if(rst) begin
         {mcycleh, mcycle} <= 64'b0;
         {minstret, minstreth} <= 64'b0;
    end else begin
         {mcycleh, mcycle} <= {mcycleh, mcycle} + 64'b1;
         {minstreth, minstret} <= {minstreth, minstret} + 64'b1;
    end
end

assign mtvec = 32'h10000;

logic [31:0] CSR_wdata;
always_comb begin
    if(funct3[2] == 1'b0)
        CSR_wdata = rs1;
    else
        CSR_wdata = imm;
end

always_ff @(posedge clk or posedge rst) begin
    if(rst) begin
        mstatus    <= 32'b0;
        mip        <= 32'b0;
        mie        <= 32'b0;
        mepc       <= 32'b0;
    end
    else if((funct3 == 3'b0) & CSR_write) begin
        if(funct7 == 7'b0011000) begin // Return from trap
            mstatus[MPP+:2] <= 2'b11;
            mstatus[MPIE]   <= 1'b1;
            mstatus[MIE]    <= mstatus[MPIE];
        end
        else begin // Wait for interrupt
            mepc <= EXE_pc + 32'b100;
            mip[MEIP] <= mie[MEIE]? 1'b1:mip[MEIP]; // need check
        end
    end
    else if(interrupt & EXEMEM_RegWrite) begin // external interruptexi
        mstatus[MPP+:2] <= mip[MEIP]? 2'b11:mstatus[MPP+2];
        mstatus[MPIE]   <= mip[MEIP]? mstatus[MIE]:mstatus[MPIE];
        mstatus[MIE]    <= mip[MEIP]? 1'b0:mstatus[MIE];

        mip[MEIP] <= 1'b0;
    end
    else begin
        if(EXEMEM_RegWrite & CSR_write) begin
            case(CSR_addr)
                12'h300: begin // mstatus
                    case(funct3[1:0])
                        2'b01: begin // CSRRW, CSRRWI
                            mstatus[MPP+:2] <= CSR_wdata[MPP+:2];
                            mstatus[MPIE]   <= CSR_wdata[MPIE];
                            mstatus[MIE]    <= CSR_wdata[MIE];
                        end
                        2'b10: begin // CSRRS, CSRRSI
                            if(rs1_addr != 5'b0) // need to check
                                mstatus[MPP+:2] <= mstatus[MPP+:2] | CSR_wdata[MPP+:2];
                                mstatus[MPIE]   <= mstatus[MPIE]   | CSR_wdata[MPIE];
                                mstatus[MIE]    <= mstatus[MIE]    | CSR_wdata[MIE];
                        end
                        2'b11: begin // CSRRC, CSRRCI
                            if(rs1_addr != 5'b0) // need to check
                                mstatus[MPP+:2] <= mstatus[MPP+:2] & ~CSR_wdata[MPP+:2];
                                mstatus[MPIE]   <= mstatus[MPIE]   & ~CSR_wdata[MPIE];
                                mstatus[MIE]    <= mstatus[MIE]    & ~CSR_wdata[MIE];
                        end
                        default: begin
                            mstatus <= mstatus;
                        end
                    endcase
                end
                12'h304: begin // mie
                    case(funct3[1:0])
                        2'b01: begin
                            mie[MEIE] <= CSR_wdata[MEIE];
                        end
                        2'b10: begin
                            if(rs1_addr != 5'b0) // need to check
                                mie[MEIE] <= mie[MEIE] | CSR_wdata[MEIE];
                        end
                        2'b11: begin
                            if(rs1_addr != 5'b0) // need to check
                                mie[MEIE] <= mie[MEIE] & ~CSR_wdata[MEIE];
                        end
                        default: begin
                            mie <= mie;
                        end
                    endcase
                end
                // 12'h305: begin // mtvec, hardwire to 0x10000
                // end
                12'h341: begin // mepc
                    case (funct3[1:0])
                        2'b01: begin
                            mepc[31:2] <= CSR_wdata[31:2];
                        end
                        2'b10: begin
                            if(rs1_addr != 5'b0) // need to check
                                mepc[31:2] <= mepc[31:2] | CSR_wdata[31:2];
                        end
                        2'b11: begin
                            if(rs1_addr != 5'b0) // need to check
                                mepc[31:2] <= mepc[31:2] & ~CSR_wdata[31:2];
                        end
                        default: begin
                            mepc <= mepc;
                        end
                    endcase
                end
            endcase // CSR_addr
        end
    end
end

always_comb begin
    case (CSR_addr)
        12'h300: CSR_rdata = mstatus;
        12'h304: CSR_rdata = mie;
        12'h305: CSR_rdata = mtvec;
        12'h341: CSR_rdata = mepc;
        12'h344: CSR_rdata = mip;
        12'hb00: CSR_rdata = mcycle;
        12'hb02: CSR_rdata = minstret;
        12'hb80: CSR_rdata = mcycleh;
        12'hb82: CSR_rdata = minstreth;
        default: CSR_rdata = 32'b0;
    endcase
end

assign CSR_control = mstatus[MIE] & interrupt & mip[MEIP] & mie[MEIE];

always_ff @(posedge clk or posedge rst) begin
    if(rst) begin
        CSR_stall <= 1'b0;
    end
    else if(EXEMEM_RegWrite) begin
        if((funct7 == 7'b0001000) & (funct3 == 3'b0) & CSR_write) // Wait for interrupt
            CSR_stall <= mie[MEIE];
    end
    else if(CSR_control)
        CSR_stall <= 1'b0;
end

endmodule : CSR