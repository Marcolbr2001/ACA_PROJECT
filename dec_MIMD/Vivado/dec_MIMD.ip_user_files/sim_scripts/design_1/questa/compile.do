vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/xpm
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/axi_vip_v1_1_15
vlib questa_lib/msim/processing_system7_vip_v1_0_17
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/lib_cdc_v1_0_2
vlib questa_lib/msim/proc_sys_reset_v5_0_14
vlib questa_lib/msim/generic_baseblocks_v2_1_1
vlib questa_lib/msim/fifo_generator_v13_2_9
vlib questa_lib/msim/axi_data_fifo_v2_1_28
vlib questa_lib/msim/axi_register_slice_v2_1_29
vlib questa_lib/msim/axi_protocol_converter_v2_1_29
vlib questa_lib/msim/axi_clock_converter_v2_1_28
vlib questa_lib/msim/blk_mem_gen_v8_4_7
vlib questa_lib/msim/axi_dwidth_converter_v2_1_29

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap xpm questa_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_15 questa_lib/msim/axi_vip_v1_1_15
vmap processing_system7_vip_v1_0_17 questa_lib/msim/processing_system7_vip_v1_0_17
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap lib_cdc_v1_0_2 questa_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_14 questa_lib/msim/proc_sys_reset_v5_0_14
vmap generic_baseblocks_v2_1_1 questa_lib/msim/generic_baseblocks_v2_1_1
vmap fifo_generator_v13_2_9 questa_lib/msim/fifo_generator_v13_2_9
vmap axi_data_fifo_v2_1_28 questa_lib/msim/axi_data_fifo_v2_1_28
vmap axi_register_slice_v2_1_29 questa_lib/msim/axi_register_slice_v2_1_29
vmap axi_protocol_converter_v2_1_29 questa_lib/msim/axi_protocol_converter_v2_1_29
vmap axi_clock_converter_v2_1_28 questa_lib/msim/axi_clock_converter_v2_1_28
vmap blk_mem_gen_v8_4_7 questa_lib/msim/blk_mem_gen_v8_4_7
vmap axi_dwidth_converter_v2_1_29 questa_lib/msim/axi_dwidth_converter_v2_1_29

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

vlog -work xpm  -incr -mfcu  -sv -L axi_vip_v1_1_15 -L processing_system7_vip_v1_0_17 -L xilinx_vip "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ip/design_1_dec_MIMD_0_3/drivers/dec_MIMD_v1_0/src" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93  \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -incr -mfcu  "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ip/design_1_dec_MIMD_0_3/drivers/dec_MIMD_v1_0/src" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_15  -incr -mfcu  -sv -L axi_vip_v1_1_15 -L processing_system7_vip_v1_0_17 -L xilinx_vip "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ip/design_1_dec_MIMD_0_3/drivers/dec_MIMD_v1_0/src" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/5753/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_17  -incr -mfcu  -sv -L axi_vip_v1_1_15 -L processing_system7_vip_v1_0_17 -L xilinx_vip "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ip/design_1_dec_MIMD_0_3/drivers/dec_MIMD_v1_0/src" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/6b2b/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ip/design_1_dec_MIMD_0_3/drivers/dec_MIMD_v1_0/src" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_processing_system7_0_1/sim/design_1_processing_system7_0_1.v" \

vcom -work lib_cdc_v1_0_2  -93  \
"../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_14  -93  \
"../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/408c/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/design_1/ip/design_1_rst_ps7_0_100M_0/sim/design_1_rst_ps7_0_100M_0.vhd" \
"../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/3608/hdl/vhdl/dec_MIMD_control_s_axi.vhd" \
"../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/3608/hdl/vhdl/dec_MIMD_data_a_RAM_AUTO_1R1W.vhd" \
"../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/3608/hdl/vhdl/dec_MIMD_data_result_RAM_AUTO_1R1W.vhd" \
"../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/3608/hdl/vhdl/dec_MIMD_dec_MIMD_Pipeline_VITIS_LOOP_11_1.vhd" \
"../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/3608/hdl/vhdl/dec_MIMD_dec_MIMD_Pipeline_VITIS_LOOP_20_1.vhd" \
"../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/3608/hdl/vhdl/dec_MIMD_dec_MIMD_Pipeline_VITIS_LOOP_34_1.vhd" \
"../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/3608/hdl/vhdl/dec_MIMD_dec_MIMD_Pipeline_VITIS_LOOP_46_1.vhd" \
"../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/3608/hdl/vhdl/dec_MIMD_dec_MIMD_Pipeline_VITIS_LOOP_61_1.vhd" \
"../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/3608/hdl/vhdl/dec_MIMD_dec_MIMD_Pipeline_VITIS_LOOP_119_1.vhd" \
"../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/3608/hdl/vhdl/dec_MIMD_flow_control_loop_pipe_sequential_init.vhd" \
"../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/3608/hdl/vhdl/dec_MIMD_gmem0_m_axi.vhd" \
"../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/3608/hdl/vhdl/dec_MIMD_gmem1_m_axi.vhd" \
"../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/3608/hdl/vhdl/dec_MIMD_gmem2_m_axi.vhd" \
"../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/3608/hdl/vhdl/dec_MIMD_gmem3_m_axi.vhd" \
"../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/3608/hdl/vhdl/dec_MIMD_mul_32s_32s_32_2_1.vhd" \
"../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/3608/hdl/vhdl/dec_MIMD_sdiv_32ns_32ns_32_36_1.vhd" \
"../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/3608/hdl/vhdl/dec_MIMD.vhd" \
"../../../bd/design_1/ip/design_1_dec_MIMD_0_3/sim/design_1_dec_MIMD_0_3.vhd" \

vlog -work generic_baseblocks_v2_1_1  -incr -mfcu  "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ip/design_1_dec_MIMD_0_3/drivers/dec_MIMD_v1_0/src" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/10ab/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_9  -incr -mfcu  "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ip/design_1_dec_MIMD_0_3/drivers/dec_MIMD_v1_0/src" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/ac72/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_9  -93  \
"../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/ac72/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_9  -incr -mfcu  "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ip/design_1_dec_MIMD_0_3/drivers/dec_MIMD_v1_0/src" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/ac72/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_28  -incr -mfcu  "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ip/design_1_dec_MIMD_0_3/drivers/dec_MIMD_v1_0/src" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/279e/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_29  -incr -mfcu  "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ip/design_1_dec_MIMD_0_3/drivers/dec_MIMD_v1_0/src" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/ff9f/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_protocol_converter_v2_1_29  -incr -mfcu  "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ip/design_1_dec_MIMD_0_3/drivers/dec_MIMD_v1_0/src" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/a63f/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ip/design_1_dec_MIMD_0_3/drivers/dec_MIMD_v1_0/src" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_auto_pc_0/sim/design_1_auto_pc_0.v" \
"../../../bd/design_1/ip/design_1_auto_pc_1/sim/design_1_auto_pc_1.v" \

vlog -work axi_clock_converter_v2_1_28  -incr -mfcu  "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ip/design_1_dec_MIMD_0_3/drivers/dec_MIMD_v1_0/src" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/769c/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work blk_mem_gen_v8_4_7  -incr -mfcu  "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ip/design_1_dec_MIMD_0_3/drivers/dec_MIMD_v1_0/src" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/3c0c/simulation/blk_mem_gen_v8_4.v" \

vlog -work axi_dwidth_converter_v2_1_29  -incr -mfcu  "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ip/design_1_dec_MIMD_0_3/drivers/dec_MIMD_v1_0/src" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/670d/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../dec_MIMD.gen/sources_1/bd/design_1/ip/design_1_dec_MIMD_0_3/drivers/dec_MIMD_v1_0/src" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
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

