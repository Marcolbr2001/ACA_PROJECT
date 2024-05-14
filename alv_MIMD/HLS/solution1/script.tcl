############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project HLS
set_top alv_MIMD
add_files HLS/core.cpp
add_files -tb HLS/test_bench.cpp -cflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 10 -name default
config_cosim -rtl vhdl -tool xsim
config_export -format ip_catalog -output C:/Users/marco/Desktop/NECST/NL2/AXI_M/alv_MIMD -rtl verilog
source "./HLS/solution1/directives.tcl"
csim_design -clean
csynth_design
cosim_design -rtl vhdl
export_design -rtl verilog -format ip_catalog -output C:/Users/marco/Desktop/NECST/NL2/AXI_M/alv_MIMD
