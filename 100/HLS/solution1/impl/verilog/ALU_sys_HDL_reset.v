// ==============================================================
// Generated by Vitis HLS v2023.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

module ALU_sys_HDL_reset (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        data_a_dout,
        data_a_empty_n,
        data_a_read,
        data_b_dout,
        data_b_empty_n,
        data_b_read,
        ALU_operation_dout,
        ALU_operation_empty_n,
        ALU_operation_read,
        ALU_operation_MEM_address0,
        ALU_operation_MEM_ce0,
        ALU_operation_MEM_we0,
        ALU_operation_MEM_d0
);

parameter    ap_ST_fsm_state1 = 8'd1;
parameter    ap_ST_fsm_state2 = 8'd2;
parameter    ap_ST_fsm_state3 = 8'd4;
parameter    ap_ST_fsm_state4 = 8'd8;
parameter    ap_ST_fsm_state5 = 8'd16;
parameter    ap_ST_fsm_state6 = 8'd32;
parameter    ap_ST_fsm_state7 = 8'd64;
parameter    ap_ST_fsm_state8 = 8'd128;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] data_a_dout;
input   data_a_empty_n;
output   data_a_read;
input  [31:0] data_b_dout;
input   data_b_empty_n;
output   data_b_read;
input  [31:0] ALU_operation_dout;
input   ALU_operation_empty_n;
output   ALU_operation_read;
output  [6:0] ALU_operation_MEM_address0;
output   ALU_operation_MEM_ce0;
output   ALU_operation_MEM_we0;
output  [31:0] ALU_operation_MEM_d0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg data_a_read;
reg data_b_read;
reg ALU_operation_read;

(* fsm_encoding = "none" *) reg   [7:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire    grp_reset_Pipeline_clear_FIFO_a_fu_28_ap_start;
wire    grp_reset_Pipeline_clear_FIFO_a_fu_28_ap_done;
wire    grp_reset_Pipeline_clear_FIFO_a_fu_28_ap_idle;
wire    grp_reset_Pipeline_clear_FIFO_a_fu_28_ap_ready;
wire    grp_reset_Pipeline_clear_FIFO_a_fu_28_data_a_read;
wire    grp_reset_Pipeline_clear_FIFO_b_fu_34_ap_start;
wire    grp_reset_Pipeline_clear_FIFO_b_fu_34_ap_done;
wire    grp_reset_Pipeline_clear_FIFO_b_fu_34_ap_idle;
wire    grp_reset_Pipeline_clear_FIFO_b_fu_34_ap_ready;
wire    grp_reset_Pipeline_clear_FIFO_b_fu_34_data_b_read;
wire    grp_reset_Pipeline_clear_ALU_op_fu_40_ap_start;
wire    grp_reset_Pipeline_clear_ALU_op_fu_40_ap_done;
wire    grp_reset_Pipeline_clear_ALU_op_fu_40_ap_idle;
wire    grp_reset_Pipeline_clear_ALU_op_fu_40_ap_ready;
wire    grp_reset_Pipeline_clear_ALU_op_fu_40_ALU_operation_read;
wire    grp_reset_Pipeline_clear_RAM_op_fu_46_ap_start;
wire    grp_reset_Pipeline_clear_RAM_op_fu_46_ap_done;
wire    grp_reset_Pipeline_clear_RAM_op_fu_46_ap_idle;
wire    grp_reset_Pipeline_clear_RAM_op_fu_46_ap_ready;
wire   [6:0] grp_reset_Pipeline_clear_RAM_op_fu_46_ALU_operation_MEM_address0;
wire    grp_reset_Pipeline_clear_RAM_op_fu_46_ALU_operation_MEM_ce0;
wire    grp_reset_Pipeline_clear_RAM_op_fu_46_ALU_operation_MEM_we0;
wire   [31:0] grp_reset_Pipeline_clear_RAM_op_fu_46_ALU_operation_MEM_d0;
reg    grp_reset_Pipeline_clear_FIFO_a_fu_28_ap_start_reg;
wire    ap_CS_fsm_state2;
reg    grp_reset_Pipeline_clear_FIFO_b_fu_34_ap_start_reg;
wire    ap_CS_fsm_state4;
wire    ap_CS_fsm_state5;
reg    grp_reset_Pipeline_clear_ALU_op_fu_40_ap_start_reg;
wire    ap_CS_fsm_state7;
wire    ap_CS_fsm_state8;
reg    grp_reset_Pipeline_clear_RAM_op_fu_46_ap_start_reg;
reg    ap_block_state8_on_subcall_done;
reg   [7:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
reg    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
reg    ap_ST_fsm_state8_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 8'd1;
#0 grp_reset_Pipeline_clear_FIFO_a_fu_28_ap_start_reg = 1'b0;
#0 grp_reset_Pipeline_clear_FIFO_b_fu_34_ap_start_reg = 1'b0;
#0 grp_reset_Pipeline_clear_ALU_op_fu_40_ap_start_reg = 1'b0;
#0 grp_reset_Pipeline_clear_RAM_op_fu_46_ap_start_reg = 1'b0;
end

ALU_sys_HDL_reset_Pipeline_clear_FIFO_a grp_reset_Pipeline_clear_FIFO_a_fu_28(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_reset_Pipeline_clear_FIFO_a_fu_28_ap_start),
    .ap_done(grp_reset_Pipeline_clear_FIFO_a_fu_28_ap_done),
    .ap_idle(grp_reset_Pipeline_clear_FIFO_a_fu_28_ap_idle),
    .ap_ready(grp_reset_Pipeline_clear_FIFO_a_fu_28_ap_ready),
    .data_a_dout(data_a_dout),
    .data_a_empty_n(data_a_empty_n),
    .data_a_read(grp_reset_Pipeline_clear_FIFO_a_fu_28_data_a_read)
);

ALU_sys_HDL_reset_Pipeline_clear_FIFO_b grp_reset_Pipeline_clear_FIFO_b_fu_34(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_reset_Pipeline_clear_FIFO_b_fu_34_ap_start),
    .ap_done(grp_reset_Pipeline_clear_FIFO_b_fu_34_ap_done),
    .ap_idle(grp_reset_Pipeline_clear_FIFO_b_fu_34_ap_idle),
    .ap_ready(grp_reset_Pipeline_clear_FIFO_b_fu_34_ap_ready),
    .data_b_dout(data_b_dout),
    .data_b_empty_n(data_b_empty_n),
    .data_b_read(grp_reset_Pipeline_clear_FIFO_b_fu_34_data_b_read)
);

ALU_sys_HDL_reset_Pipeline_clear_ALU_op grp_reset_Pipeline_clear_ALU_op_fu_40(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_reset_Pipeline_clear_ALU_op_fu_40_ap_start),
    .ap_done(grp_reset_Pipeline_clear_ALU_op_fu_40_ap_done),
    .ap_idle(grp_reset_Pipeline_clear_ALU_op_fu_40_ap_idle),
    .ap_ready(grp_reset_Pipeline_clear_ALU_op_fu_40_ap_ready),
    .ALU_operation_dout(ALU_operation_dout),
    .ALU_operation_empty_n(ALU_operation_empty_n),
    .ALU_operation_read(grp_reset_Pipeline_clear_ALU_op_fu_40_ALU_operation_read)
);

ALU_sys_HDL_reset_Pipeline_clear_RAM_op grp_reset_Pipeline_clear_RAM_op_fu_46(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_reset_Pipeline_clear_RAM_op_fu_46_ap_start),
    .ap_done(grp_reset_Pipeline_clear_RAM_op_fu_46_ap_done),
    .ap_idle(grp_reset_Pipeline_clear_RAM_op_fu_46_ap_idle),
    .ap_ready(grp_reset_Pipeline_clear_RAM_op_fu_46_ap_ready),
    .ALU_operation_MEM_address0(grp_reset_Pipeline_clear_RAM_op_fu_46_ALU_operation_MEM_address0),
    .ALU_operation_MEM_ce0(grp_reset_Pipeline_clear_RAM_op_fu_46_ALU_operation_MEM_ce0),
    .ALU_operation_MEM_we0(grp_reset_Pipeline_clear_RAM_op_fu_46_ALU_operation_MEM_we0),
    .ALU_operation_MEM_d0(grp_reset_Pipeline_clear_RAM_op_fu_46_ALU_operation_MEM_d0)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_reset_Pipeline_clear_ALU_op_fu_40_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state7)) begin
            grp_reset_Pipeline_clear_ALU_op_fu_40_ap_start_reg <= 1'b1;
        end else if ((grp_reset_Pipeline_clear_ALU_op_fu_40_ap_ready == 1'b1)) begin
            grp_reset_Pipeline_clear_ALU_op_fu_40_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_reset_Pipeline_clear_FIFO_a_fu_28_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            grp_reset_Pipeline_clear_FIFO_a_fu_28_ap_start_reg <= 1'b1;
        end else if ((grp_reset_Pipeline_clear_FIFO_a_fu_28_ap_ready == 1'b1)) begin
            grp_reset_Pipeline_clear_FIFO_a_fu_28_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_reset_Pipeline_clear_FIFO_b_fu_34_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
            grp_reset_Pipeline_clear_FIFO_b_fu_34_ap_start_reg <= 1'b1;
        end else if ((grp_reset_Pipeline_clear_FIFO_b_fu_34_ap_ready == 1'b1)) begin
            grp_reset_Pipeline_clear_FIFO_b_fu_34_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_reset_Pipeline_clear_RAM_op_fu_46_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state7)) begin
            grp_reset_Pipeline_clear_RAM_op_fu_46_ap_start_reg <= 1'b1;
        end else if ((grp_reset_Pipeline_clear_RAM_op_fu_46_ap_ready == 1'b1)) begin
            grp_reset_Pipeline_clear_RAM_op_fu_46_ap_start_reg <= 1'b0;
        end
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        ALU_operation_read = grp_reset_Pipeline_clear_ALU_op_fu_40_ALU_operation_read;
    end else begin
        ALU_operation_read = 1'b0;
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((grp_reset_Pipeline_clear_FIFO_a_fu_28_ap_done == 1'b0)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

assign ap_ST_fsm_state3_blk = 1'b0;

assign ap_ST_fsm_state4_blk = 1'b0;

always @ (*) begin
    if ((grp_reset_Pipeline_clear_FIFO_b_fu_34_ap_done == 1'b0)) begin
        ap_ST_fsm_state5_blk = 1'b1;
    end else begin
        ap_ST_fsm_state5_blk = 1'b0;
    end
end

assign ap_ST_fsm_state6_blk = 1'b0;

assign ap_ST_fsm_state7_blk = 1'b0;

always @ (*) begin
    if ((1'b1 == ap_block_state8_on_subcall_done)) begin
        ap_ST_fsm_state8_blk = 1'b1;
    end else begin
        ap_ST_fsm_state8_blk = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0)) | ((1'b1 == ap_CS_fsm_state8) & (1'b0 == ap_block_state8_on_subcall_done)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state8) & (1'b0 == ap_block_state8_on_subcall_done))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        data_a_read = grp_reset_Pipeline_clear_FIFO_a_fu_28_data_a_read;
    end else begin
        data_a_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        data_b_read = grp_reset_Pipeline_clear_FIFO_b_fu_34_data_b_read;
    end else begin
        data_b_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((grp_reset_Pipeline_clear_FIFO_a_fu_28_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            if (((grp_reset_Pipeline_clear_FIFO_b_fu_34_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            if (((1'b1 == ap_CS_fsm_state8) & (1'b0 == ap_block_state8_on_subcall_done))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ALU_operation_MEM_address0 = grp_reset_Pipeline_clear_RAM_op_fu_46_ALU_operation_MEM_address0;

assign ALU_operation_MEM_ce0 = grp_reset_Pipeline_clear_RAM_op_fu_46_ALU_operation_MEM_ce0;

assign ALU_operation_MEM_d0 = grp_reset_Pipeline_clear_RAM_op_fu_46_ALU_operation_MEM_d0;

assign ALU_operation_MEM_we0 = grp_reset_Pipeline_clear_RAM_op_fu_46_ALU_operation_MEM_we0;

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

always @ (*) begin
    ap_block_state8_on_subcall_done = ((grp_reset_Pipeline_clear_RAM_op_fu_46_ap_done == 1'b0) | (grp_reset_Pipeline_clear_ALU_op_fu_40_ap_done == 1'b0));
end

assign grp_reset_Pipeline_clear_ALU_op_fu_40_ap_start = grp_reset_Pipeline_clear_ALU_op_fu_40_ap_start_reg;

assign grp_reset_Pipeline_clear_FIFO_a_fu_28_ap_start = grp_reset_Pipeline_clear_FIFO_a_fu_28_ap_start_reg;

assign grp_reset_Pipeline_clear_FIFO_b_fu_34_ap_start = grp_reset_Pipeline_clear_FIFO_b_fu_34_ap_start_reg;

assign grp_reset_Pipeline_clear_RAM_op_fu_46_ap_start = grp_reset_Pipeline_clear_RAM_op_fu_46_ap_start_reg;

endmodule //ALU_sys_HDL_reset
