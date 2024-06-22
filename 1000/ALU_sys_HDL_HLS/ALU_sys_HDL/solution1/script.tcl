############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project ALU_sys_HDL
set_top ALU_sys_HDL
add_files ALU_sys_HDL/core.cpp
add_files -tb ALU_sys_HDL/tb.cpp
open_solution "solution1" -flow_target vivado
set_part {xc7z020clg400-1}
create_clock -period 10 -name default
config_cosim -rtl vhdl -tool xsim
config_export -description ALU_sys_HDL -display_name ALU_sys_HDL -flow syn -format ip_catalog -output C:/Users/marco/Desktop/ALU_sys_HDL -rtl vhdl -vivado_clock 10
#source "./ALU_sys_HDL/solution1/directives.tcl"
csim_design -clean
csynth_design
cosim_design -rtl vhdl
export_design -rtl vhdl -format ip_catalog -output C:/Users/marco/Desktop/ALU_sys_HDL
