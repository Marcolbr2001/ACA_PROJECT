set SynModuleInfo {
  {SRCNAME sisd MODELNAME sisd RTLNAME sisd IS_TOP 1
    SUBMODULES {
      {MODELNAME sisd_mul_32s_32s_32_2_1 RTLNAME sisd_mul_32s_32s_32_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME sisd_sdiv_32s_32s_32_36_seq_1 RTLNAME sisd_sdiv_32s_32s_32_36_seq_1 BINDTYPE op TYPE sdiv IMPL auto_seq LATENCY 35 ALLOW_PRAGMA 1}
      {MODELNAME sisd_control_s_axi RTLNAME sisd_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
