
log_wave -r /
set designtopgroup [add_wave_group "Design Top Signals"]
set cinoutgroup [add_wave_group "C InOuts" -into $designtopgroup]
set a__b__c__op__return_group [add_wave_group a__b__c__op__return(axi_slave) -into $cinoutgroup]
add_wave /apatb_setMem_top/AESL_inst_setMem/interrupt -into $a__b__c__op__return_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/s_axi_control_BRESP -into $a__b__c__op__return_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/s_axi_control_BREADY -into $a__b__c__op__return_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/s_axi_control_BVALID -into $a__b__c__op__return_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/s_axi_control_RRESP -into $a__b__c__op__return_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/s_axi_control_RDATA -into $a__b__c__op__return_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/s_axi_control_RREADY -into $a__b__c__op__return_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/s_axi_control_RVALID -into $a__b__c__op__return_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/s_axi_control_ARREADY -into $a__b__c__op__return_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/s_axi_control_ARVALID -into $a__b__c__op__return_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/s_axi_control_ARADDR -into $a__b__c__op__return_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/s_axi_control_WSTRB -into $a__b__c__op__return_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/s_axi_control_WDATA -into $a__b__c__op__return_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/s_axi_control_WREADY -into $a__b__c__op__return_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/s_axi_control_WVALID -into $a__b__c__op__return_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/s_axi_control_AWREADY -into $a__b__c__op__return_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/s_axi_control_AWVALID -into $a__b__c__op__return_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/s_axi_control_AWADDR -into $a__b__c__op__return_group -radix hex
set coutputgroup [add_wave_group "C Outputs" -into $designtopgroup]
set c_group [add_wave_group c(axi_master) -into $coutputgroup]
set rdata_group [add_wave_group "Read Channel" -into $c_group]
set wdata_group [add_wave_group "Write Channel" -into $c_group]
set ctrl_group [add_wave_group "Handshakes" -into $c_group]
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_BUSER -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_BID -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_BRESP -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_BREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_BVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_RRESP -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_RUSER -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_RID -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_RLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_RDATA -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_RREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_RVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_ARUSER -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_ARREGION -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_ARQOS -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_ARPROT -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_ARCACHE -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_ARLOCK -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_ARBURST -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_ARSIZE -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_ARLEN -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_ARID -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_ARADDR -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_ARREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_ARVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_WUSER -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_WID -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_WLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_WSTRB -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_WDATA -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_WREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_WVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_AWUSER -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_AWREGION -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_AWQOS -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_AWPROT -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_AWCACHE -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_AWLOCK -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_AWBURST -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_AWSIZE -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_AWLEN -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_AWID -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_AWADDR -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_AWREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem2_AWVALID -into $ctrl_group -color #ffff00 -radix hex
set cinputgroup [add_wave_group "C Inputs" -into $designtopgroup]
set op_group [add_wave_group op(axi_master) -into $cinputgroup]
set rdata_group [add_wave_group "Read Channel" -into $op_group]
set wdata_group [add_wave_group "Write Channel" -into $op_group]
set ctrl_group [add_wave_group "Handshakes" -into $op_group]
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_BUSER -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_BID -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_BRESP -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_BREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_BVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_RRESP -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_RUSER -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_RID -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_RLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_RDATA -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_RREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_RVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_ARUSER -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_ARREGION -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_ARQOS -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_ARPROT -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_ARCACHE -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_ARLOCK -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_ARBURST -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_ARSIZE -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_ARLEN -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_ARID -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_ARADDR -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_ARREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_ARVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_WUSER -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_WID -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_WLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_WSTRB -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_WDATA -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_WREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_WVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_AWUSER -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_AWREGION -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_AWQOS -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_AWPROT -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_AWCACHE -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_AWLOCK -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_AWBURST -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_AWSIZE -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_AWLEN -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_AWID -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_AWADDR -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_AWREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem3_AWVALID -into $ctrl_group -color #ffff00 -radix hex
set b_group [add_wave_group b(axi_master) -into $cinputgroup]
set rdata_group [add_wave_group "Read Channel" -into $b_group]
set wdata_group [add_wave_group "Write Channel" -into $b_group]
set ctrl_group [add_wave_group "Handshakes" -into $b_group]
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_BUSER -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_BID -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_BRESP -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_BREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_BVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_RRESP -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_RUSER -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_RID -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_RLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_RDATA -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_RREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_RVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_ARUSER -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_ARREGION -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_ARQOS -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_ARPROT -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_ARCACHE -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_ARLOCK -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_ARBURST -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_ARSIZE -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_ARLEN -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_ARID -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_ARADDR -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_ARREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_ARVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_WUSER -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_WID -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_WLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_WSTRB -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_WDATA -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_WREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_WVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_AWUSER -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_AWREGION -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_AWQOS -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_AWPROT -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_AWCACHE -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_AWLOCK -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_AWBURST -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_AWSIZE -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_AWLEN -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_AWID -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_AWADDR -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_AWREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem1_AWVALID -into $ctrl_group -color #ffff00 -radix hex
set a_group [add_wave_group a(axi_master) -into $cinputgroup]
set rdata_group [add_wave_group "Read Channel" -into $a_group]
set wdata_group [add_wave_group "Write Channel" -into $a_group]
set ctrl_group [add_wave_group "Handshakes" -into $a_group]
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_BUSER -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_BID -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_BRESP -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_BREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_BVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_RRESP -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_RUSER -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_RID -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_RLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_RDATA -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_RREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_RVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_ARUSER -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_ARREGION -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_ARQOS -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_ARPROT -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_ARCACHE -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_ARLOCK -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_ARBURST -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_ARSIZE -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_ARLEN -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_ARID -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_ARADDR -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_ARREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_ARVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_WUSER -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_WID -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_WLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_WSTRB -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_WDATA -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_WREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_WVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_AWUSER -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_AWREGION -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_AWQOS -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_AWPROT -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_AWCACHE -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_AWLOCK -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_AWBURST -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_AWSIZE -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_AWLEN -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_AWID -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_AWADDR -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_AWREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem0_AWVALID -into $ctrl_group -color #ffff00 -radix hex
set blocksiggroup [add_wave_group "Block-level IO Handshake(internal)" -into $designtopgroup]
add_wave /apatb_setMem_top/AESL_inst_setMem/ap_done -into $blocksiggroup
add_wave /apatb_setMem_top/AESL_inst_setMem/ap_idle -into $blocksiggroup
add_wave /apatb_setMem_top/AESL_inst_setMem/ap_ready -into $blocksiggroup
add_wave /apatb_setMem_top/AESL_inst_setMem/ap_start -into $blocksiggroup
set resetgroup [add_wave_group "Reset" -into $designtopgroup]
add_wave /apatb_setMem_top/AESL_inst_setMem/ap_rst_n -into $resetgroup
set clockgroup [add_wave_group "Clock" -into $designtopgroup]
add_wave /apatb_setMem_top/AESL_inst_setMem/ap_clk -into $clockgroup
set testbenchgroup [add_wave_group "Test Bench Signals"]
set tbinternalsiggroup [add_wave_group "Internal Signals" -into $testbenchgroup]
set tb_simstatus_group [add_wave_group "Simulation Status" -into $tbinternalsiggroup]
set tb_portdepth_group [add_wave_group "Port Depth" -into $tbinternalsiggroup]
add_wave /apatb_setMem_top/AUTOTB_TRANSACTION_NUM -into $tb_simstatus_group -radix hex
add_wave /apatb_setMem_top/ready_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_setMem_top/done_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_setMem_top/LENGTH_a -into $tb_portdepth_group -radix hex
add_wave /apatb_setMem_top/LENGTH_b -into $tb_portdepth_group -radix hex
add_wave /apatb_setMem_top/LENGTH_c -into $tb_portdepth_group -radix hex
add_wave /apatb_setMem_top/LENGTH_gmem0 -into $tb_portdepth_group -radix hex
add_wave /apatb_setMem_top/LENGTH_gmem1 -into $tb_portdepth_group -radix hex
add_wave /apatb_setMem_top/LENGTH_gmem2 -into $tb_portdepth_group -radix hex
add_wave /apatb_setMem_top/LENGTH_gmem3 -into $tb_portdepth_group -radix hex
add_wave /apatb_setMem_top/LENGTH_op -into $tb_portdepth_group -radix hex
set tbcinoutgroup [add_wave_group "C InOuts" -into $testbenchgroup]
set tb_a__b__c__op__return_group [add_wave_group a__b__c__op__return(axi_slave) -into $tbcinoutgroup]
add_wave /apatb_setMem_top/control_INTERRUPT -into $tb_a__b__c__op__return_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/control_BRESP -into $tb_a__b__c__op__return_group -radix hex
add_wave /apatb_setMem_top/control_BREADY -into $tb_a__b__c__op__return_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/control_BVALID -into $tb_a__b__c__op__return_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/control_RRESP -into $tb_a__b__c__op__return_group -radix hex
add_wave /apatb_setMem_top/control_RDATA -into $tb_a__b__c__op__return_group -radix hex
add_wave /apatb_setMem_top/control_RREADY -into $tb_a__b__c__op__return_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/control_RVALID -into $tb_a__b__c__op__return_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/control_ARREADY -into $tb_a__b__c__op__return_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/control_ARVALID -into $tb_a__b__c__op__return_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/control_ARADDR -into $tb_a__b__c__op__return_group -radix hex
add_wave /apatb_setMem_top/control_WSTRB -into $tb_a__b__c__op__return_group -radix hex
add_wave /apatb_setMem_top/control_WDATA -into $tb_a__b__c__op__return_group -radix hex
add_wave /apatb_setMem_top/control_WREADY -into $tb_a__b__c__op__return_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/control_WVALID -into $tb_a__b__c__op__return_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/control_AWREADY -into $tb_a__b__c__op__return_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/control_AWVALID -into $tb_a__b__c__op__return_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/control_AWADDR -into $tb_a__b__c__op__return_group -radix hex
set tbcoutputgroup [add_wave_group "C Outputs" -into $testbenchgroup]
set tb_c_group [add_wave_group c(axi_master) -into $tbcoutputgroup]
set rdata_group [add_wave_group "Read Channel" -into $tb_c_group]
set wdata_group [add_wave_group "Write Channel" -into $tb_c_group]
set ctrl_group [add_wave_group "Handshakes" -into $tb_c_group]
add_wave /apatb_setMem_top/gmem2_BUSER -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem2_BID -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem2_BRESP -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem2_BREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem2_BVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem2_RRESP -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem2_RUSER -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem2_RID -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem2_RLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem2_RDATA -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem2_RREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem2_RVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem2_ARUSER -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem2_ARREGION -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem2_ARQOS -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem2_ARPROT -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem2_ARCACHE -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem2_ARLOCK -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem2_ARBURST -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem2_ARSIZE -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem2_ARLEN -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem2_ARID -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem2_ARADDR -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem2_ARREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem2_ARVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem2_WUSER -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem2_WID -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem2_WLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem2_WSTRB -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem2_WDATA -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem2_WREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem2_WVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem2_AWUSER -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem2_AWREGION -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem2_AWQOS -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem2_AWPROT -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem2_AWCACHE -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem2_AWLOCK -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem2_AWBURST -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem2_AWSIZE -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem2_AWLEN -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem2_AWID -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem2_AWADDR -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem2_AWREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem2_AWVALID -into $ctrl_group -color #ffff00 -radix hex
set tbcinputgroup [add_wave_group "C Inputs" -into $testbenchgroup]
set tb_op_group [add_wave_group op(axi_master) -into $tbcinputgroup]
set rdata_group [add_wave_group "Read Channel" -into $tb_op_group]
set wdata_group [add_wave_group "Write Channel" -into $tb_op_group]
set ctrl_group [add_wave_group "Handshakes" -into $tb_op_group]
add_wave /apatb_setMem_top/gmem3_BUSER -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem3_BID -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem3_BRESP -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem3_BREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem3_BVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem3_RRESP -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem3_RUSER -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem3_RID -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem3_RLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem3_RDATA -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem3_RREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem3_RVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem3_ARUSER -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem3_ARREGION -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem3_ARQOS -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem3_ARPROT -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem3_ARCACHE -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem3_ARLOCK -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem3_ARBURST -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem3_ARSIZE -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem3_ARLEN -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem3_ARID -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem3_ARADDR -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem3_ARREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem3_ARVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem3_WUSER -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem3_WID -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem3_WLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem3_WSTRB -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem3_WDATA -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem3_WREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem3_WVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem3_AWUSER -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem3_AWREGION -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem3_AWQOS -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem3_AWPROT -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem3_AWCACHE -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem3_AWLOCK -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem3_AWBURST -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem3_AWSIZE -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem3_AWLEN -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem3_AWID -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem3_AWADDR -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem3_AWREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem3_AWVALID -into $ctrl_group -color #ffff00 -radix hex
set tb_b_group [add_wave_group b(axi_master) -into $tbcinputgroup]
set rdata_group [add_wave_group "Read Channel" -into $tb_b_group]
set wdata_group [add_wave_group "Write Channel" -into $tb_b_group]
set ctrl_group [add_wave_group "Handshakes" -into $tb_b_group]
add_wave /apatb_setMem_top/gmem1_BUSER -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem1_BID -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem1_BRESP -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem1_BREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem1_BVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem1_RRESP -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem1_RUSER -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem1_RID -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem1_RLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem1_RDATA -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem1_RREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem1_RVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem1_ARUSER -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem1_ARREGION -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem1_ARQOS -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem1_ARPROT -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem1_ARCACHE -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem1_ARLOCK -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem1_ARBURST -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem1_ARSIZE -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem1_ARLEN -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem1_ARID -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem1_ARADDR -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem1_ARREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem1_ARVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem1_WUSER -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem1_WID -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem1_WLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem1_WSTRB -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem1_WDATA -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem1_WREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem1_WVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem1_AWUSER -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem1_AWREGION -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem1_AWQOS -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem1_AWPROT -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem1_AWCACHE -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem1_AWLOCK -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem1_AWBURST -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem1_AWSIZE -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem1_AWLEN -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem1_AWID -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem1_AWADDR -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem1_AWREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem1_AWVALID -into $ctrl_group -color #ffff00 -radix hex
set tb_a_group [add_wave_group a(axi_master) -into $tbcinputgroup]
set rdata_group [add_wave_group "Read Channel" -into $tb_a_group]
set wdata_group [add_wave_group "Write Channel" -into $tb_a_group]
set ctrl_group [add_wave_group "Handshakes" -into $tb_a_group]
add_wave /apatb_setMem_top/gmem0_BUSER -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem0_BID -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem0_BRESP -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem0_BREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem0_BVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem0_RRESP -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem0_RUSER -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem0_RID -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem0_RLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem0_RDATA -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem0_RREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem0_RVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem0_ARUSER -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem0_ARREGION -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem0_ARQOS -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem0_ARPROT -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem0_ARCACHE -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem0_ARLOCK -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem0_ARBURST -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem0_ARSIZE -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem0_ARLEN -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem0_ARID -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem0_ARADDR -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem0_ARREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem0_ARVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem0_WUSER -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem0_WID -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem0_WLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem0_WSTRB -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem0_WDATA -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem0_WREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem0_WVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem0_AWUSER -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem0_AWREGION -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem0_AWQOS -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem0_AWPROT -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem0_AWCACHE -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem0_AWLOCK -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem0_AWBURST -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem0_AWSIZE -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem0_AWLEN -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem0_AWID -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem0_AWADDR -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem0_AWREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem0_AWVALID -into $ctrl_group -color #ffff00 -radix hex
save_wave_config setMem.wcfg
run all
quit

