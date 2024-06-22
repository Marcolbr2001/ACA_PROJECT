set SynModuleInfo {
  {SRCNAME op_data_exe_wb_Pipeline_l_operation MODELNAME op_data_exe_wb_Pipeline_l_operation RTLNAME ALU_sys_HDL_op_data_exe_wb_Pipeline_l_operation
    SUBMODULES {
      {MODELNAME ALU_sys_HDL_flow_control_loop_pipe_sequential_init RTLNAME ALU_sys_HDL_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME ALU_sys_HDL_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME op_data_exe_wb_Pipeline_l_data_a MODELNAME op_data_exe_wb_Pipeline_l_data_a RTLNAME ALU_sys_HDL_op_data_exe_wb_Pipeline_l_data_a}
  {SRCNAME op_data_exe_wb_Pipeline_l_data_b MODELNAME op_data_exe_wb_Pipeline_l_data_b RTLNAME ALU_sys_HDL_op_data_exe_wb_Pipeline_l_data_b}
  {SRCNAME op_data_exe_wb_Pipeline_s_operation_data_op MODELNAME op_data_exe_wb_Pipeline_s_operation_data_op RTLNAME ALU_sys_HDL_op_data_exe_wb_Pipeline_s_operation_data_op}
  {SRCNAME op_data_exe_wb_Pipeline_exe MODELNAME op_data_exe_wb_Pipeline_exe RTLNAME ALU_sys_HDL_op_data_exe_wb_Pipeline_exe
    SUBMODULES {
      {MODELNAME ALU_sys_HDL_mul_32s_32s_32_2_1 RTLNAME ALU_sys_HDL_mul_32s_32s_32_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME ALU_sys_HDL_sdiv_32s_32s_32_36_1 RTLNAME ALU_sys_HDL_sdiv_32s_32s_32_36_1 BINDTYPE op TYPE sdiv IMPL auto LATENCY 35 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME op_data_exe_wb_Pipeline_write_back MODELNAME op_data_exe_wb_Pipeline_write_back RTLNAME ALU_sys_HDL_op_data_exe_wb_Pipeline_write_back}
  {SRCNAME op_data_exe_wb MODELNAME op_data_exe_wb RTLNAME ALU_sys_HDL_op_data_exe_wb}
  {SRCNAME data_exe_wb_Pipeline_l_data_a MODELNAME data_exe_wb_Pipeline_l_data_a RTLNAME ALU_sys_HDL_data_exe_wb_Pipeline_l_data_a}
  {SRCNAME data_exe_wb_Pipeline_l_data_b MODELNAME data_exe_wb_Pipeline_l_data_b RTLNAME ALU_sys_HDL_data_exe_wb_Pipeline_l_data_b}
  {SRCNAME data_exe_wb_Pipeline_exe MODELNAME data_exe_wb_Pipeline_exe RTLNAME ALU_sys_HDL_data_exe_wb_Pipeline_exe}
  {SRCNAME data_exe_wb_Pipeline_write_back MODELNAME data_exe_wb_Pipeline_write_back RTLNAME ALU_sys_HDL_data_exe_wb_Pipeline_write_back}
  {SRCNAME data_exe_wb MODELNAME data_exe_wb RTLNAME ALU_sys_HDL_data_exe_wb}
  {SRCNAME operation_Pipeline_l_operation MODELNAME operation_Pipeline_l_operation RTLNAME ALU_sys_HDL_operation_Pipeline_l_operation}
  {SRCNAME operation_Pipeline_s_operation_data_op MODELNAME operation_Pipeline_s_operation_data_op RTLNAME ALU_sys_HDL_operation_Pipeline_s_operation_data_op}
  {SRCNAME operation MODELNAME operation RTLNAME ALU_sys_HDL_operation}
  {SRCNAME reset_Pipeline_clear_FIFO_a MODELNAME reset_Pipeline_clear_FIFO_a RTLNAME ALU_sys_HDL_reset_Pipeline_clear_FIFO_a}
  {SRCNAME reset_Pipeline_clear_FIFO_b MODELNAME reset_Pipeline_clear_FIFO_b RTLNAME ALU_sys_HDL_reset_Pipeline_clear_FIFO_b}
  {SRCNAME reset_Pipeline_clear_ALU_op MODELNAME reset_Pipeline_clear_ALU_op RTLNAME ALU_sys_HDL_reset_Pipeline_clear_ALU_op}
  {SRCNAME reset_Pipeline_clear_RAM_op MODELNAME reset_Pipeline_clear_RAM_op RTLNAME ALU_sys_HDL_reset_Pipeline_clear_RAM_op}
  {SRCNAME reset MODELNAME reset RTLNAME ALU_sys_HDL_reset}
  {SRCNAME Block_entry1_proc MODELNAME Block_entry1_proc RTLNAME ALU_sys_HDL_Block_entry1_proc
    SUBMODULES {
      {MODELNAME ALU_sys_HDL_Block_entry1_proc_ALU_operation_MEM_RAM_AUTO_1R1W RTLNAME ALU_sys_HDL_Block_entry1_proc_ALU_operation_MEM_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME ALU_sys_HDL_fifo_w32_d1000_A RTLNAME ALU_sys_HDL_fifo_w32_d1000_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME data_a_U}
      {MODELNAME ALU_sys_HDL_fifo_w32_d1000_A RTLNAME ALU_sys_HDL_fifo_w32_d1000_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME data_b_U}
      {MODELNAME ALU_sys_HDL_fifo_w32_d1000_A RTLNAME ALU_sys_HDL_fifo_w32_d1000_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME ALU_operation_U}
      {MODELNAME ALU_sys_HDL_fifo_w32_d1000_A RTLNAME ALU_sys_HDL_fifo_w32_d1000_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME data_result_U}
    }
  }
  {SRCNAME ALU_sys_HDL MODELNAME ALU_sys_HDL RTLNAME ALU_sys_HDL IS_TOP 1
    SUBMODULES {
      {MODELNAME ALU_sys_HDL_gmem0_m_axi RTLNAME ALU_sys_HDL_gmem0_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME ALU_sys_HDL_gmem1_m_axi RTLNAME ALU_sys_HDL_gmem1_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME ALU_sys_HDL_gmem2_m_axi RTLNAME ALU_sys_HDL_gmem2_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME ALU_sys_HDL_gmem3_m_axi RTLNAME ALU_sys_HDL_gmem3_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME ALU_sys_HDL_control_s_axi RTLNAME ALU_sys_HDL_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
