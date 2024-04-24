############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project HLS
set_top setMem
add_files HLS/core.cpp
add_files -tb HLS/test_core.cpp -cflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 10 -name default
config_cosim -rtl vhdl -tool xsim -trace_level all
config_export -display_name AXI_ALU -format ip_catalog -output C:/Users/marco/Desktop/NECST/NL2/AXI_M/ip_repo -rtl verilog -version 1.0
source "./HLS/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -trace_level all -rtl vhdl
export_design -rtl verilog -format ip_catalog -output C:/Users/marco/Desktop/NECST/NL2/AXI_M/ip_repo
