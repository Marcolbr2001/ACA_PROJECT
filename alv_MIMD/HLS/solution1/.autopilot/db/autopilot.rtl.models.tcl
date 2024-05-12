set SynModuleInfo {
  {SRCNAME alv_MIMD_Pipeline_l_data_and_operation MODELNAME alv_MIMD_Pipeline_l_data_and_operation RTLNAME alv_MIMD_alv_MIMD_Pipeline_l_data_and_operation
    SUBMODULES {
      {MODELNAME alv_MIMD_flow_control_loop_pipe_sequential_init RTLNAME alv_MIMD_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME alv_MIMD_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME execute MODELNAME execute RTLNAME alv_MIMD_execute
    SUBMODULES {
      {MODELNAME alv_MIMD_mul_32s_32s_32_2_1 RTLNAME alv_MIMD_mul_32s_32s_32_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME alv_MIMD_sdiv_32ns_32ns_32_36_1 RTLNAME alv_MIMD_sdiv_32ns_32ns_32_36_1 BINDTYPE op TYPE sdiv IMPL auto LATENCY 35 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME alv_MIMD_Pipeline_output1 MODELNAME alv_MIMD_Pipeline_output1 RTLNAME alv_MIMD_alv_MIMD_Pipeline_output1}
  {SRCNAME alv_MIMD_Pipeline_l_data MODELNAME alv_MIMD_Pipeline_l_data RTLNAME alv_MIMD_alv_MIMD_Pipeline_l_data}
  {SRCNAME alv_MIMD_Pipeline_output MODELNAME alv_MIMD_Pipeline_output RTLNAME alv_MIMD_alv_MIMD_Pipeline_output}
  {SRCNAME alv_MIMD_Pipeline_l_operation MODELNAME alv_MIMD_Pipeline_l_operation RTLNAME alv_MIMD_alv_MIMD_Pipeline_l_operation}
  {SRCNAME alv_MIMD_Pipeline_reset MODELNAME alv_MIMD_Pipeline_reset RTLNAME alv_MIMD_alv_MIMD_Pipeline_reset}
  {SRCNAME alv_MIMD MODELNAME alv_MIMD RTLNAME alv_MIMD IS_TOP 1
    SUBMODULES {
      {MODELNAME alv_MIMD_fifo_w32_d2_S RTLNAME alv_MIMD_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME data_a_U}
      {MODELNAME alv_MIMD_fifo_w32_d2_S RTLNAME alv_MIMD_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME data_b_U}
      {MODELNAME alv_MIMD_fifo_w32_d2_S RTLNAME alv_MIMD_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME data_result_U}
      {MODELNAME alv_MIMD_fifo_w32_d2_S RTLNAME alv_MIMD_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME ALU_operation_U}
      {MODELNAME alv_MIMD_gmem0_m_axi RTLNAME alv_MIMD_gmem0_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME alv_MIMD_gmem2_m_axi RTLNAME alv_MIMD_gmem2_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME alv_MIMD_gmem3_m_axi RTLNAME alv_MIMD_gmem3_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME alv_MIMD_control_s_axi RTLNAME alv_MIMD_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
