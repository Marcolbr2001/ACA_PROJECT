set SynModuleInfo {
  {SRCNAME op_data_exe_wb_Pipeline_l_operation MODELNAME op_data_exe_wb_Pipeline_l_operation RTLNAME alv_VHDL_op_data_exe_wb_Pipeline_l_operation
    SUBMODULES {
      {MODELNAME alv_VHDL_flow_control_loop_pipe_sequential_init RTLNAME alv_VHDL_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME alv_VHDL_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME op_data_exe_wb_Pipeline_l_data_a MODELNAME op_data_exe_wb_Pipeline_l_data_a RTLNAME alv_VHDL_op_data_exe_wb_Pipeline_l_data_a}
  {SRCNAME op_data_exe_wb_Pipeline_l_data_b MODELNAME op_data_exe_wb_Pipeline_l_data_b RTLNAME alv_VHDL_op_data_exe_wb_Pipeline_l_data_b}
  {SRCNAME op_data_exe_wb_Pipeline_s_operation_data_op MODELNAME op_data_exe_wb_Pipeline_s_operation_data_op RTLNAME alv_VHDL_op_data_exe_wb_Pipeline_s_operation_data_op}
  {SRCNAME op_data_exe_wb_Pipeline_exe MODELNAME op_data_exe_wb_Pipeline_exe RTLNAME alv_VHDL_op_data_exe_wb_Pipeline_exe
    SUBMODULES {
      {MODELNAME alv_VHDL_mul_32s_32s_32_2_1 RTLNAME alv_VHDL_mul_32s_32s_32_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME alv_VHDL_sdiv_32s_32s_32_36_1 RTLNAME alv_VHDL_sdiv_32s_32s_32_36_1 BINDTYPE op TYPE sdiv IMPL auto LATENCY 35 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME op_data_exe_wb_Pipeline_write_back MODELNAME op_data_exe_wb_Pipeline_write_back RTLNAME alv_VHDL_op_data_exe_wb_Pipeline_write_back}
  {SRCNAME op_data_exe_wb MODELNAME op_data_exe_wb RTLNAME alv_VHDL_op_data_exe_wb}
  {SRCNAME data_exe_wb_Pipeline_l_data_a MODELNAME data_exe_wb_Pipeline_l_data_a RTLNAME alv_VHDL_data_exe_wb_Pipeline_l_data_a}
  {SRCNAME data_exe_wb_Pipeline_l_data_b MODELNAME data_exe_wb_Pipeline_l_data_b RTLNAME alv_VHDL_data_exe_wb_Pipeline_l_data_b}
  {SRCNAME data_exe_wb_Pipeline_exe MODELNAME data_exe_wb_Pipeline_exe RTLNAME alv_VHDL_data_exe_wb_Pipeline_exe}
  {SRCNAME data_exe_wb_Pipeline_write_back MODELNAME data_exe_wb_Pipeline_write_back RTLNAME alv_VHDL_data_exe_wb_Pipeline_write_back}
  {SRCNAME data_exe_wb MODELNAME data_exe_wb RTLNAME alv_VHDL_data_exe_wb}
  {SRCNAME operation_Pipeline_l_operation MODELNAME operation_Pipeline_l_operation RTLNAME alv_VHDL_operation_Pipeline_l_operation}
  {SRCNAME operation_Pipeline_s_operation_data_op MODELNAME operation_Pipeline_s_operation_data_op RTLNAME alv_VHDL_operation_Pipeline_s_operation_data_op}
  {SRCNAME operation MODELNAME operation RTLNAME alv_VHDL_operation}
  {SRCNAME reset_Pipeline_clear_FIFO_a MODELNAME reset_Pipeline_clear_FIFO_a RTLNAME alv_VHDL_reset_Pipeline_clear_FIFO_a}
  {SRCNAME reset_Pipeline_clear_FIFO_b MODELNAME reset_Pipeline_clear_FIFO_b RTLNAME alv_VHDL_reset_Pipeline_clear_FIFO_b}
  {SRCNAME reset_Pipeline_clear_ALU_op MODELNAME reset_Pipeline_clear_ALU_op RTLNAME alv_VHDL_reset_Pipeline_clear_ALU_op}
  {SRCNAME reset_Pipeline_clear_RAM_op MODELNAME reset_Pipeline_clear_RAM_op RTLNAME alv_VHDL_reset_Pipeline_clear_RAM_op}
  {SRCNAME reset MODELNAME reset RTLNAME alv_VHDL_reset}
  {SRCNAME Block_entry1_proc MODELNAME Block_entry1_proc RTLNAME alv_VHDL_Block_entry1_proc
    SUBMODULES {
      {MODELNAME alv_VHDL_Block_entry1_proc_ALU_operation_MEM_RAM_AUTO_1R1W RTLNAME alv_VHDL_Block_entry1_proc_ALU_operation_MEM_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME alv_VHDL_fifo_w32_d50_A RTLNAME alv_VHDL_fifo_w32_d50_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME data_a_U}
      {MODELNAME alv_VHDL_fifo_w32_d50_A RTLNAME alv_VHDL_fifo_w32_d50_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME data_b_U}
      {MODELNAME alv_VHDL_fifo_w32_d50_A RTLNAME alv_VHDL_fifo_w32_d50_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME ALU_operation_U}
      {MODELNAME alv_VHDL_fifo_w32_d50_A RTLNAME alv_VHDL_fifo_w32_d50_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME data_result_U}
    }
  }
  {SRCNAME alv_VHDL MODELNAME alv_VHDL RTLNAME alv_VHDL IS_TOP 1
    SUBMODULES {
      {MODELNAME alv_VHDL_gmem0_m_axi RTLNAME alv_VHDL_gmem0_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME alv_VHDL_gmem1_m_axi RTLNAME alv_VHDL_gmem1_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME alv_VHDL_gmem2_m_axi RTLNAME alv_VHDL_gmem2_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME alv_VHDL_gmem3_m_axi RTLNAME alv_VHDL_gmem3_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME alv_VHDL_control_s_axi RTLNAME alv_VHDL_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}