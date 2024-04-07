
log_wave -r /
set designtopgroup [add_wave_group "Design Top Signals"]
set cinoutgroup [add_wave_group "C InOuts" -into $designtopgroup]
set a__b__c_group [add_wave_group a__b__c(axi_master) -into $cinoutgroup]
set rdata_group [add_wave_group "Read Channel" -into $a__b__c_group]
set wdata_group [add_wave_group "Write Channel" -into $a__b__c_group]
set ctrl_group [add_wave_group "Handshakes" -into $a__b__c_group]
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_BUSER -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_BID -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_BRESP -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_BREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_BVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_RRESP -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_RUSER -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_RID -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_RLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_RDATA -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_RREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_RVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_ARUSER -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_ARREGION -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_ARQOS -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_ARPROT -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_ARCACHE -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_ARLOCK -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_ARBURST -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_ARSIZE -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_ARLEN -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_ARID -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_ARADDR -into $rdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_ARREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_ARVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_WUSER -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_WID -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_WLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_WSTRB -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_WDATA -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_WREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_WVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_AWUSER -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_AWREGION -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_AWQOS -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_AWPROT -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_AWCACHE -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_AWLOCK -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_AWBURST -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_AWSIZE -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_AWLEN -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_AWID -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_AWADDR -into $wdata_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_AWREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/m_axi_gmem_AWVALID -into $ctrl_group -color #ffff00 -radix hex
set cinputgroup [add_wave_group "C Inputs" -into $designtopgroup]
set return_group [add_wave_group return(wire) -into $cinputgroup]
add_wave /apatb_setMem_top/AESL_inst_setMem/op -into $return_group -radix hex
set a__b__c_group [add_wave_group a__b__c(axi_slave) -into $cinputgroup]
add_wave /apatb_setMem_top/AESL_inst_setMem/s_axi_control_BRESP -into $a__b__c_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/s_axi_control_BREADY -into $a__b__c_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/s_axi_control_BVALID -into $a__b__c_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/s_axi_control_RRESP -into $a__b__c_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/s_axi_control_RDATA -into $a__b__c_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/s_axi_control_RREADY -into $a__b__c_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/s_axi_control_RVALID -into $a__b__c_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/s_axi_control_ARREADY -into $a__b__c_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/s_axi_control_ARVALID -into $a__b__c_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/s_axi_control_ARADDR -into $a__b__c_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/s_axi_control_WSTRB -into $a__b__c_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/s_axi_control_WDATA -into $a__b__c_group -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/s_axi_control_WREADY -into $a__b__c_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/s_axi_control_WVALID -into $a__b__c_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/s_axi_control_AWREADY -into $a__b__c_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/s_axi_control_AWVALID -into $a__b__c_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/AESL_inst_setMem/s_axi_control_AWADDR -into $a__b__c_group -radix hex
set blocksiggroup [add_wave_group "Block-level IO Handshake" -into $designtopgroup]
add_wave /apatb_setMem_top/AESL_inst_setMem/ap_start -into $blocksiggroup
add_wave /apatb_setMem_top/AESL_inst_setMem/ap_done -into $blocksiggroup
add_wave /apatb_setMem_top/AESL_inst_setMem/ap_idle -into $blocksiggroup
add_wave /apatb_setMem_top/AESL_inst_setMem/ap_ready -into $blocksiggroup
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
add_wave /apatb_setMem_top/LENGTH_gmem -into $tb_portdepth_group -radix hex
add_wave /apatb_setMem_top/LENGTH_op -into $tb_portdepth_group -radix hex
set tbcinoutgroup [add_wave_group "C InOuts" -into $testbenchgroup]
set tb_a__b__c_group [add_wave_group a__b__c(axi_master) -into $tbcinoutgroup]
set rdata_group [add_wave_group "Read Channel" -into $tb_a__b__c_group]
set wdata_group [add_wave_group "Write Channel" -into $tb_a__b__c_group]
set ctrl_group [add_wave_group "Handshakes" -into $tb_a__b__c_group]
add_wave /apatb_setMem_top/gmem_BUSER -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem_BID -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem_BRESP -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem_BREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem_BVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem_RRESP -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem_RUSER -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem_RID -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem_RLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem_RDATA -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem_RREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem_RVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem_ARUSER -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem_ARREGION -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem_ARQOS -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem_ARPROT -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem_ARCACHE -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem_ARLOCK -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem_ARBURST -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem_ARSIZE -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem_ARLEN -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem_ARID -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem_ARADDR -into $rdata_group -radix hex
add_wave /apatb_setMem_top/gmem_ARREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem_ARVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem_WUSER -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem_WID -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem_WLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem_WSTRB -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem_WDATA -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem_WREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem_WVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem_AWUSER -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem_AWREGION -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem_AWQOS -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem_AWPROT -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem_AWCACHE -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem_AWLOCK -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem_AWBURST -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem_AWSIZE -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem_AWLEN -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem_AWID -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem_AWADDR -into $wdata_group -radix hex
add_wave /apatb_setMem_top/gmem_AWREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/gmem_AWVALID -into $ctrl_group -color #ffff00 -radix hex
set tbcinputgroup [add_wave_group "C Inputs" -into $testbenchgroup]
set tb_return_group [add_wave_group return(wire) -into $tbcinputgroup]
add_wave /apatb_setMem_top/op -into $tb_return_group -radix hex
set tb_a__b__c_group [add_wave_group a__b__c(axi_slave) -into $tbcinputgroup]
add_wave /apatb_setMem_top/control_BRESP -into $tb_a__b__c_group -radix hex
add_wave /apatb_setMem_top/control_BREADY -into $tb_a__b__c_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/control_BVALID -into $tb_a__b__c_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/control_RRESP -into $tb_a__b__c_group -radix hex
add_wave /apatb_setMem_top/control_RDATA -into $tb_a__b__c_group -radix hex
add_wave /apatb_setMem_top/control_RREADY -into $tb_a__b__c_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/control_RVALID -into $tb_a__b__c_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/control_ARREADY -into $tb_a__b__c_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/control_ARVALID -into $tb_a__b__c_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/control_ARADDR -into $tb_a__b__c_group -radix hex
add_wave /apatb_setMem_top/control_WSTRB -into $tb_a__b__c_group -radix hex
add_wave /apatb_setMem_top/control_WDATA -into $tb_a__b__c_group -radix hex
add_wave /apatb_setMem_top/control_WREADY -into $tb_a__b__c_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/control_WVALID -into $tb_a__b__c_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/control_AWREADY -into $tb_a__b__c_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/control_AWVALID -into $tb_a__b__c_group -color #ffff00 -radix hex
add_wave /apatb_setMem_top/control_AWADDR -into $tb_a__b__c_group -radix hex
save_wave_config setMem.wcfg
run all
quit

