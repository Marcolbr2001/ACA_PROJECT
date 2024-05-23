vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_vip_v1_1_15
vlib modelsim_lib/msim/processing_system7_vip_v1_0_17
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/lib_cdc_v1_0_2
vlib modelsim_lib/msim/proc_sys_reset_v5_0_14
vlib modelsim_lib/msim/generic_baseblocks_v2_1_1
vlib modelsim_lib/msim/fifo_generator_v13_2_9
vlib modelsim_lib/msim/axi_data_fifo_v2_1_28
vlib modelsim_lib/msim/axi_register_slice_v2_1_29
vlib modelsim_lib/msim/axi_protocol_converter_v2_1_29
vlib modelsim_lib/msim/axi_clock_converter_v2_1_28
vlib modelsim_lib/msim/blk_mem_gen_v8_4_7
vlib modelsim_lib/msim/axi_dwidth_converter_v2_1_29

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_15 modelsim_lib/msim/axi_vip_v1_1_15
vmap processing_system7_vip_v1_0_17 modelsim_lib/msim/processing_system7_vip_v1_0_17
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap lib_cdc_v1_0_2 modelsim_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_14 modelsim_lib/msim/proc_sys_reset_v5_0_14
vmap generic_baseblocks_v2_1_1 modelsim_lib/msim/generic_baseblocks_v2_1_1
vmap fifo_generator_v13_2_9 modelsim_lib/msim/fifo_generator_v13_2_9
vmap axi_data_fifo_v2_1_28 modelsim_lib/msim/axi_data_fifo_v2_1_28
vmap axi_register_slice_v2_1_29 modelsim_lib/msim/axi_register_slice_v2_1_29
vmap axi_protocol_converter_v2_1_29 modelsim_lib/msim/axi_protocol_converter_v2_1_29
vmap axi_clock_converter_v2_1_28 modelsim_lib/msim/axi_clock_converter_v2_1_28
vmap blk_mem_gen_v8_4_7 modelsim_lib/msim/blk_mem_gen_v8_4_7
vmap axi_dwidth_converter_v2_1_29 modelsim_lib/msim/axi_dwidth_converter_v2_1_29

vlog -work xilinx_vip  -incr -mfcu  -sv -L axi_vip_v1_1_15 -L processing_system7_vip_v1_0_17 -L xilinx_vip "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work axi_infrastructure_v1_1_0  -incr -mfcu  "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ip/design_1_alv_MIMD_0_1/drivers/alv_MIMD_v1_0/src" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_15  -incr -mfcu  -sv -L axi_vip_v1_1_15 -L processing_system7_vip_v1_0_17 -L xilinx_vip "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ip/design_1_alv_MIMD_0_1/drivers/alv_MIMD_v1_0/src" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/5753/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_17  -incr -mfcu  -sv -L axi_vip_v1_1_15 -L processing_system7_vip_v1_0_17 -L xilinx_vip "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ip/design_1_alv_MIMD_0_1/drivers/alv_MIMD_v1_0/src" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/6b2b/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ip/design_1_alv_MIMD_0_1/drivers/alv_MIMD_v1_0/src" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_processing_system7_0_0/sim/design_1_processing_system7_0_0.v" \

vcom -work lib_cdc_v1_0_2  -93  \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_14  -93  \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/408c/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/design_1/ip/design_1_rst_ps7_0_100M_0/sim/design_1_rst_ps7_0_100M_0.vhd" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/5b0e/hdl/vhdl/alv_MIMD_Block_entry2_proc1.vhd" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/5b0e/hdl/vhdl/alv_MIMD_Block_entry2_proc1_ALU_operation_MEM_RAM_AUTO_1R1W.vhd" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/5b0e/hdl/vhdl/alv_MIMD_Block_entry2_proc1_Pipeline_clear_FIFO_a.vhd" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/5b0e/hdl/vhdl/alv_MIMD_Block_entry2_proc1_Pipeline_clear_FIFO_b.vhd" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/5b0e/hdl/vhdl/alv_MIMD_Block_entry2_proc1_Pipeline_clear_FIFO_op.vhd" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/5b0e/hdl/vhdl/alv_MIMD_Block_entry2_proc1_Pipeline_clear_RAM_op.vhd" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/5b0e/hdl/vhdl/alv_MIMD_control_s_axi.vhd" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/5b0e/hdl/vhdl/alv_MIMD_data_exe_wb.vhd" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/5b0e/hdl/vhdl/alv_MIMD_data_exe_wb_Pipeline_exe.vhd" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/5b0e/hdl/vhdl/alv_MIMD_data_exe_wb_Pipeline_l_data_a.vhd" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/5b0e/hdl/vhdl/alv_MIMD_data_exe_wb_Pipeline_l_data_b.vhd" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/5b0e/hdl/vhdl/alv_MIMD_data_exe_wb_Pipeline_write_back.vhd" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/5b0e/hdl/vhdl/alv_MIMD_fifo_w32_d50_A.vhd" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/5b0e/hdl/vhdl/alv_MIMD_flow_control_loop_pipe_sequential_init.vhd" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/5b0e/hdl/vhdl/alv_MIMD_gmem0_m_axi.vhd" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/5b0e/hdl/vhdl/alv_MIMD_gmem1_m_axi.vhd" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/5b0e/hdl/vhdl/alv_MIMD_gmem2_m_axi.vhd" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/5b0e/hdl/vhdl/alv_MIMD_gmem3_m_axi.vhd" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/5b0e/hdl/vhdl/alv_MIMD_mul_32s_32s_32_2_1.vhd" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/5b0e/hdl/vhdl/alv_MIMD_op_data_exe_wb.vhd" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/5b0e/hdl/vhdl/alv_MIMD_op_data_exe_wb_Pipeline_exe.vhd" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/5b0e/hdl/vhdl/alv_MIMD_op_data_exe_wb_Pipeline_l_data_a.vhd" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/5b0e/hdl/vhdl/alv_MIMD_op_data_exe_wb_Pipeline_l_data_b.vhd" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/5b0e/hdl/vhdl/alv_MIMD_op_data_exe_wb_Pipeline_l_operation.vhd" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/5b0e/hdl/vhdl/alv_MIMD_op_data_exe_wb_Pipeline_s_operation_data_op.vhd" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/5b0e/hdl/vhdl/alv_MIMD_op_data_exe_wb_Pipeline_write_back.vhd" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/5b0e/hdl/vhdl/alv_MIMD_operation.vhd" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/5b0e/hdl/vhdl/alv_MIMD_operation_Pipeline_l_operation.vhd" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/5b0e/hdl/vhdl/alv_MIMD_operation_Pipeline_s_operation_data_op.vhd" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/5b0e/hdl/vhdl/alv_MIMD_sdiv_32s_32s_32_36_1.vhd" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/5b0e/hdl/vhdl/alv_MIMD.vhd" \
"../../../bd/design_1/ip/design_1_alv_MIMD_0_1/sim/design_1_alv_MIMD_0_1.vhd" \

vlog -work generic_baseblocks_v2_1_1  -incr -mfcu  "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ip/design_1_alv_MIMD_0_1/drivers/alv_MIMD_v1_0/src" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/10ab/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_9  -incr -mfcu  "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ip/design_1_alv_MIMD_0_1/drivers/alv_MIMD_v1_0/src" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/ac72/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_9  -93  \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/ac72/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_9  -incr -mfcu  "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ip/design_1_alv_MIMD_0_1/drivers/alv_MIMD_v1_0/src" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/ac72/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_28  -incr -mfcu  "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ip/design_1_alv_MIMD_0_1/drivers/alv_MIMD_v1_0/src" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/279e/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_29  -incr -mfcu  "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ip/design_1_alv_MIMD_0_1/drivers/alv_MIMD_v1_0/src" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/ff9f/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_protocol_converter_v2_1_29  -incr -mfcu  "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ip/design_1_alv_MIMD_0_1/drivers/alv_MIMD_v1_0/src" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/a63f/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ip/design_1_alv_MIMD_0_1/drivers/alv_MIMD_v1_0/src" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_auto_pc_0/sim/design_1_auto_pc_0.v" \
"../../../bd/design_1/ip/design_1_auto_pc_1/sim/design_1_auto_pc_1.v" \

vlog -work axi_clock_converter_v2_1_28  -incr -mfcu  "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ip/design_1_alv_MIMD_0_1/drivers/alv_MIMD_v1_0/src" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/769c/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work blk_mem_gen_v8_4_7  -incr -mfcu  "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ip/design_1_alv_MIMD_0_1/drivers/alv_MIMD_v1_0/src" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/3c0c/simulation/blk_mem_gen_v8_4.v" \

vlog -work axi_dwidth_converter_v2_1_29  -incr -mfcu  "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ip/design_1_alv_MIMD_0_1/drivers/alv_MIMD_v1_0/src" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/670d/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../alv_MIMD.gen/sources_1/bd/design_1/ip/design_1_alv_MIMD_0_1/drivers/alv_MIMD_v1_0/src" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_auto_us_0/sim/design_1_auto_us_0.v" \
"../../../bd/design_1/ip/design_1_auto_pc_2/sim/design_1_auto_pc_2.v" \
"../../../bd/design_1/ip/design_1_auto_us_1/sim/design_1_auto_us_1.v" \
"../../../bd/design_1/ip/design_1_auto_pc_3/sim/design_1_auto_pc_3.v" \
"../../../bd/design_1/ip/design_1_auto_us_2/sim/design_1_auto_us_2.v" \
"../../../bd/design_1/ip/design_1_auto_pc_4/sim/design_1_auto_pc_4.v" \
"../../../bd/design_1/ip/design_1_auto_us_3/sim/design_1_auto_us_3.v" \

vcom -work xil_defaultlib  -93  \
"../../../bd/design_1/sim/design_1.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

