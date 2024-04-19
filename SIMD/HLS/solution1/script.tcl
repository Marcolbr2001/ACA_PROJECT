############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project SIMD_HLS
set_top setMem
add_files SIMD_HLS/core.c
add_files -tb SIMD_HLS/test.c
open_solution "solution1" -flow_target vivado
set_part {xc7z020clg400-1}
create_clock -period 10 -name default
config_cosim -tool xsim
config_export -display_name SIMD_ALU -output C:/Users/lotto/Desktop/SIMD
#source "./SIMD_HLS/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog -output C:/Users/lotto/Desktop/SIMD
