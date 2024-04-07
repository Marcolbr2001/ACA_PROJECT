############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project AXI_M
set_top setMem
add_files AXI_M/core.cpp
add_files AXI_M/core.h
add_files -tb AXI_M/test_core.cpp
open_solution "solution1" -flow_target vivado
set_part {xc7z020clg400-1}
create_clock -period 10 -name default
config_cosim -rtl vhdl -tool xsim -trace_level all
config_export -display_name AXI_ALU -output C:/Users/marco/Desktop/NECST/NL2/AXI_M/AXI_M -version 1.0
source "./AXI_M/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -trace_level all -rtl vhdl
export_design -rtl verilog -format ip_catalog -output C:/Users/marco/Desktop/NECST/NL2/AXI_M/AXI_M
