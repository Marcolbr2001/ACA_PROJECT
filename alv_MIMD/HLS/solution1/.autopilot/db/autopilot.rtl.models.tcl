set SynModuleInfo {
  {SRCNAME entry_proc MODELNAME entry_proc RTLNAME alv_MIMD_entry_proc}
  {SRCNAME load_op MODELNAME load_op RTLNAME alv_MIMD_load_op
    SUBMODULES {
      {MODELNAME alv_MIMD_flow_control_loop_pipe RTLNAME alv_MIMD_flow_control_loop_pipe BINDTYPE interface TYPE internal_upc_flow_control INSTNAME alv_MIMD_flow_control_loop_pipe_U}
    }
  }
  {SRCNAME load_data_a MODELNAME load_data_a RTLNAME alv_MIMD_load_data_a}
  {SRCNAME load_data_b MODELNAME load_data_b RTLNAME alv_MIMD_load_data_b}
  {SRCNAME execute MODELNAME execute RTLNAME alv_MIMD_execute
    SUBMODULES {
      {MODELNAME alv_MIMD_mul_32s_32s_32_2_1 RTLNAME alv_MIMD_mul_32s_32s_32_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME alv_MIMD_sdiv_32ns_32ns_32_36_1 RTLNAME alv_MIMD_sdiv_32ns_32ns_32_36_1 BINDTYPE op TYPE sdiv IMPL auto LATENCY 35 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME write_back_Pipeline_write_back MODELNAME write_back_Pipeline_write_back RTLNAME alv_MIMD_write_back_Pipeline_write_back
    SUBMODULES {
      {MODELNAME alv_MIMD_flow_control_loop_pipe_sequential_init RTLNAME alv_MIMD_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME alv_MIMD_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME write_back MODELNAME write_back RTLNAME alv_MIMD_write_back}
  {SRCNAME lod_exe_wb MODELNAME lod_exe_wb RTLNAME alv_MIMD_lod_exe_wb
    SUBMODULES {
      {MODELNAME alv_MIMD_fifo_w64_d4_S RTLNAME alv_MIMD_fifo_w64_d4_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME c_c_U}
      {MODELNAME alv_MIMD_fifo_w32_d50_A RTLNAME alv_MIMD_fifo_w32_d50_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME ALU_operation_U}
      {MODELNAME alv_MIMD_fifo_w32_d50_A RTLNAME alv_MIMD_fifo_w32_d50_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME data_a_U}
      {MODELNAME alv_MIMD_fifo_w32_d50_A RTLNAME alv_MIMD_fifo_w32_d50_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME data_b_U}
      {MODELNAME alv_MIMD_fifo_w32_d50_A RTLNAME alv_MIMD_fifo_w32_d50_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME data_result_U}
      {MODELNAME alv_MIMD_start_for_write_back_U0 RTLNAME alv_MIMD_start_for_write_back_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_write_back_U0_U}
      {MODELNAME alv_MIMD_start_for_execute_U0 RTLNAME alv_MIMD_start_for_execute_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_execute_U0_U}
    }
  }
  {SRCNAME alv_MIMD MODELNAME alv_MIMD RTLNAME alv_MIMD IS_TOP 1
    SUBMODULES {
      {MODELNAME alv_MIMD_gmem0_m_axi RTLNAME alv_MIMD_gmem0_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME alv_MIMD_gmem1_m_axi RTLNAME alv_MIMD_gmem1_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME alv_MIMD_gmem2_m_axi RTLNAME alv_MIMD_gmem2_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME alv_MIMD_gmem3_m_axi RTLNAME alv_MIMD_gmem3_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME alv_MIMD_control_s_axi RTLNAME alv_MIMD_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
