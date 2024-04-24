set SynModuleInfo {
  {SRCNAME dec_MIMD_Pipeline_VITIS_LOOP_51_3 MODELNAME dec_MIMD_Pipeline_VITIS_LOOP_51_3 RTLNAME dec_MIMD_dec_MIMD_Pipeline_VITIS_LOOP_51_3
    SUBMODULES {
      {MODELNAME dec_MIMD_flow_control_loop_pipe_sequential_init RTLNAME dec_MIMD_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME dec_MIMD_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME dec_MIMD_Pipeline_VITIS_LOOP_43_2 MODELNAME dec_MIMD_Pipeline_VITIS_LOOP_43_2 RTLNAME dec_MIMD_dec_MIMD_Pipeline_VITIS_LOOP_43_2}
  {SRCNAME dec_MIMD_Pipeline_VITIS_LOOP_35_1 MODELNAME dec_MIMD_Pipeline_VITIS_LOOP_35_1 RTLNAME dec_MIMD_dec_MIMD_Pipeline_VITIS_LOOP_35_1}
  {SRCNAME dec_MIMD_Pipeline_VITIS_LOOP_61_4 MODELNAME dec_MIMD_Pipeline_VITIS_LOOP_61_4 RTLNAME dec_MIMD_dec_MIMD_Pipeline_VITIS_LOOP_61_4
    SUBMODULES {
      {MODELNAME dec_MIMD_mul_32s_32s_32_2_1 RTLNAME dec_MIMD_mul_32s_32s_32_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME dec_MIMD_sdiv_32ns_32ns_32_36_1 RTLNAME dec_MIMD_sdiv_32ns_32ns_32_36_1 BINDTYPE op TYPE sdiv IMPL auto LATENCY 35 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME dec_MIMD_Pipeline_VITIS_LOOP_115_5 MODELNAME dec_MIMD_Pipeline_VITIS_LOOP_115_5 RTLNAME dec_MIMD_dec_MIMD_Pipeline_VITIS_LOOP_115_5}
  {SRCNAME dec_MIMD MODELNAME dec_MIMD RTLNAME dec_MIMD IS_TOP 1
    SUBMODULES {
      {MODELNAME dec_MIMD_data_a_RAM_AUTO_1R1W RTLNAME dec_MIMD_data_a_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME dec_MIMD_data_result_RAM_AUTO_1R1W RTLNAME dec_MIMD_data_result_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME dec_MIMD_gmem0_m_axi RTLNAME dec_MIMD_gmem0_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME dec_MIMD_gmem1_m_axi RTLNAME dec_MIMD_gmem1_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME dec_MIMD_gmem2_m_axi RTLNAME dec_MIMD_gmem2_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME dec_MIMD_gmem3_m_axi RTLNAME dec_MIMD_gmem3_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME dec_MIMD_control_s_axi RTLNAME dec_MIMD_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
