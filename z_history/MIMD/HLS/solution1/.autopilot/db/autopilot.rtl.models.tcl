set SynModuleInfo {
  {SRCNAME setMem_Pipeline_VITIS_LOOP_34_1 MODELNAME setMem_Pipeline_VITIS_LOOP_34_1 RTLNAME setMem_setMem_Pipeline_VITIS_LOOP_34_1
    SUBMODULES {
      {MODELNAME setMem_flow_control_loop_pipe_sequential_init RTLNAME setMem_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME setMem_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME setMem_Pipeline_VITIS_LOOP_42_2 MODELNAME setMem_Pipeline_VITIS_LOOP_42_2 RTLNAME setMem_setMem_Pipeline_VITIS_LOOP_42_2
    SUBMODULES {
      {MODELNAME setMem_mul_32s_32s_32_2_1 RTLNAME setMem_mul_32s_32s_32_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME setMem_sdiv_32ns_32ns_32_36_1 RTLNAME setMem_sdiv_32ns_32ns_32_36_1 BINDTYPE op TYPE sdiv IMPL auto LATENCY 35 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME setMem_Pipeline_VITIS_LOOP_97_3 MODELNAME setMem_Pipeline_VITIS_LOOP_97_3 RTLNAME setMem_setMem_Pipeline_VITIS_LOOP_97_3}
  {SRCNAME setMem MODELNAME setMem RTLNAME setMem IS_TOP 1
    SUBMODULES {
      {MODELNAME setMem_data_a_RAM_AUTO_1R1W RTLNAME setMem_data_a_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME setMem_gmem0_m_axi RTLNAME setMem_gmem0_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME setMem_gmem1_m_axi RTLNAME setMem_gmem1_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME setMem_gmem2_m_axi RTLNAME setMem_gmem2_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME setMem_gmem3_m_axi RTLNAME setMem_gmem3_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME setMem_control_s_axi RTLNAME setMem_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
