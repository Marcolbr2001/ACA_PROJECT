set moduleName Block_entry1_proc
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {Block_entry1_proc}
set C_modelType { void 0 }
set C_modelArgList {
	{ selec int 32 regular  }
	{ gmem3 int 32 regular {axi_master 0}  }
	{ op int 64 regular  }
	{ gmem0 int 32 regular {axi_master 0}  }
	{ a int 64 regular  }
	{ gmem1 int 32 regular {axi_master 0}  }
	{ b int 64 regular  }
	{ gmem2 int 32 regular {axi_master 1}  }
	{ c int 64 regular  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "selec", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "gmem3", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "op","offset": { "type": "dynamic","port_name": "op","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "op", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "gmem0", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "a","offset": { "type": "dynamic","port_name": "a","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "a", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "gmem1", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "b","offset": { "type": "dynamic","port_name": "b","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "b", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "gmem2", "interface" : "axi_master", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "c","offset": { "type": "dynamic","port_name": "c","bundle": "control"},"direction": "WRITEONLY"}]}]} , 
 	{ "Name" : "c", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 196
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ selec sc_in sc_lv 32 signal 0 } 
	{ m_axi_gmem3_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem3_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem3_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_gmem3_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem3_AWLEN sc_out sc_lv 32 signal 1 } 
	{ m_axi_gmem3_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem3_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem3_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem3_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem3_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem3_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem3_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem3_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem3_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem3_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem3_WDATA sc_out sc_lv 32 signal 1 } 
	{ m_axi_gmem3_WSTRB sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem3_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem3_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem3_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem3_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem3_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem3_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_gmem3_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem3_ARLEN sc_out sc_lv 32 signal 1 } 
	{ m_axi_gmem3_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem3_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem3_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem3_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem3_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem3_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem3_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem3_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem3_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem3_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem3_RDATA sc_in sc_lv 32 signal 1 } 
	{ m_axi_gmem3_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem3_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem3_RFIFONUM sc_in sc_lv 9 signal 1 } 
	{ m_axi_gmem3_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem3_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_gmem3_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem3_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem3_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_gmem3_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem3_BUSER sc_in sc_lv 1 signal 1 } 
	{ op sc_in sc_lv 64 signal 2 } 
	{ m_axi_gmem0_AWVALID sc_out sc_logic 1 signal 3 } 
	{ m_axi_gmem0_AWREADY sc_in sc_logic 1 signal 3 } 
	{ m_axi_gmem0_AWADDR sc_out sc_lv 64 signal 3 } 
	{ m_axi_gmem0_AWID sc_out sc_lv 1 signal 3 } 
	{ m_axi_gmem0_AWLEN sc_out sc_lv 32 signal 3 } 
	{ m_axi_gmem0_AWSIZE sc_out sc_lv 3 signal 3 } 
	{ m_axi_gmem0_AWBURST sc_out sc_lv 2 signal 3 } 
	{ m_axi_gmem0_AWLOCK sc_out sc_lv 2 signal 3 } 
	{ m_axi_gmem0_AWCACHE sc_out sc_lv 4 signal 3 } 
	{ m_axi_gmem0_AWPROT sc_out sc_lv 3 signal 3 } 
	{ m_axi_gmem0_AWQOS sc_out sc_lv 4 signal 3 } 
	{ m_axi_gmem0_AWREGION sc_out sc_lv 4 signal 3 } 
	{ m_axi_gmem0_AWUSER sc_out sc_lv 1 signal 3 } 
	{ m_axi_gmem0_WVALID sc_out sc_logic 1 signal 3 } 
	{ m_axi_gmem0_WREADY sc_in sc_logic 1 signal 3 } 
	{ m_axi_gmem0_WDATA sc_out sc_lv 32 signal 3 } 
	{ m_axi_gmem0_WSTRB sc_out sc_lv 4 signal 3 } 
	{ m_axi_gmem0_WLAST sc_out sc_logic 1 signal 3 } 
	{ m_axi_gmem0_WID sc_out sc_lv 1 signal 3 } 
	{ m_axi_gmem0_WUSER sc_out sc_lv 1 signal 3 } 
	{ m_axi_gmem0_ARVALID sc_out sc_logic 1 signal 3 } 
	{ m_axi_gmem0_ARREADY sc_in sc_logic 1 signal 3 } 
	{ m_axi_gmem0_ARADDR sc_out sc_lv 64 signal 3 } 
	{ m_axi_gmem0_ARID sc_out sc_lv 1 signal 3 } 
	{ m_axi_gmem0_ARLEN sc_out sc_lv 32 signal 3 } 
	{ m_axi_gmem0_ARSIZE sc_out sc_lv 3 signal 3 } 
	{ m_axi_gmem0_ARBURST sc_out sc_lv 2 signal 3 } 
	{ m_axi_gmem0_ARLOCK sc_out sc_lv 2 signal 3 } 
	{ m_axi_gmem0_ARCACHE sc_out sc_lv 4 signal 3 } 
	{ m_axi_gmem0_ARPROT sc_out sc_lv 3 signal 3 } 
	{ m_axi_gmem0_ARQOS sc_out sc_lv 4 signal 3 } 
	{ m_axi_gmem0_ARREGION sc_out sc_lv 4 signal 3 } 
	{ m_axi_gmem0_ARUSER sc_out sc_lv 1 signal 3 } 
	{ m_axi_gmem0_RVALID sc_in sc_logic 1 signal 3 } 
	{ m_axi_gmem0_RREADY sc_out sc_logic 1 signal 3 } 
	{ m_axi_gmem0_RDATA sc_in sc_lv 32 signal 3 } 
	{ m_axi_gmem0_RLAST sc_in sc_logic 1 signal 3 } 
	{ m_axi_gmem0_RID sc_in sc_lv 1 signal 3 } 
	{ m_axi_gmem0_RFIFONUM sc_in sc_lv 9 signal 3 } 
	{ m_axi_gmem0_RUSER sc_in sc_lv 1 signal 3 } 
	{ m_axi_gmem0_RRESP sc_in sc_lv 2 signal 3 } 
	{ m_axi_gmem0_BVALID sc_in sc_logic 1 signal 3 } 
	{ m_axi_gmem0_BREADY sc_out sc_logic 1 signal 3 } 
	{ m_axi_gmem0_BRESP sc_in sc_lv 2 signal 3 } 
	{ m_axi_gmem0_BID sc_in sc_lv 1 signal 3 } 
	{ m_axi_gmem0_BUSER sc_in sc_lv 1 signal 3 } 
	{ a sc_in sc_lv 64 signal 4 } 
	{ m_axi_gmem1_AWVALID sc_out sc_logic 1 signal 5 } 
	{ m_axi_gmem1_AWREADY sc_in sc_logic 1 signal 5 } 
	{ m_axi_gmem1_AWADDR sc_out sc_lv 64 signal 5 } 
	{ m_axi_gmem1_AWID sc_out sc_lv 1 signal 5 } 
	{ m_axi_gmem1_AWLEN sc_out sc_lv 32 signal 5 } 
	{ m_axi_gmem1_AWSIZE sc_out sc_lv 3 signal 5 } 
	{ m_axi_gmem1_AWBURST sc_out sc_lv 2 signal 5 } 
	{ m_axi_gmem1_AWLOCK sc_out sc_lv 2 signal 5 } 
	{ m_axi_gmem1_AWCACHE sc_out sc_lv 4 signal 5 } 
	{ m_axi_gmem1_AWPROT sc_out sc_lv 3 signal 5 } 
	{ m_axi_gmem1_AWQOS sc_out sc_lv 4 signal 5 } 
	{ m_axi_gmem1_AWREGION sc_out sc_lv 4 signal 5 } 
	{ m_axi_gmem1_AWUSER sc_out sc_lv 1 signal 5 } 
	{ m_axi_gmem1_WVALID sc_out sc_logic 1 signal 5 } 
	{ m_axi_gmem1_WREADY sc_in sc_logic 1 signal 5 } 
	{ m_axi_gmem1_WDATA sc_out sc_lv 32 signal 5 } 
	{ m_axi_gmem1_WSTRB sc_out sc_lv 4 signal 5 } 
	{ m_axi_gmem1_WLAST sc_out sc_logic 1 signal 5 } 
	{ m_axi_gmem1_WID sc_out sc_lv 1 signal 5 } 
	{ m_axi_gmem1_WUSER sc_out sc_lv 1 signal 5 } 
	{ m_axi_gmem1_ARVALID sc_out sc_logic 1 signal 5 } 
	{ m_axi_gmem1_ARREADY sc_in sc_logic 1 signal 5 } 
	{ m_axi_gmem1_ARADDR sc_out sc_lv 64 signal 5 } 
	{ m_axi_gmem1_ARID sc_out sc_lv 1 signal 5 } 
	{ m_axi_gmem1_ARLEN sc_out sc_lv 32 signal 5 } 
	{ m_axi_gmem1_ARSIZE sc_out sc_lv 3 signal 5 } 
	{ m_axi_gmem1_ARBURST sc_out sc_lv 2 signal 5 } 
	{ m_axi_gmem1_ARLOCK sc_out sc_lv 2 signal 5 } 
	{ m_axi_gmem1_ARCACHE sc_out sc_lv 4 signal 5 } 
	{ m_axi_gmem1_ARPROT sc_out sc_lv 3 signal 5 } 
	{ m_axi_gmem1_ARQOS sc_out sc_lv 4 signal 5 } 
	{ m_axi_gmem1_ARREGION sc_out sc_lv 4 signal 5 } 
	{ m_axi_gmem1_ARUSER sc_out sc_lv 1 signal 5 } 
	{ m_axi_gmem1_RVALID sc_in sc_logic 1 signal 5 } 
	{ m_axi_gmem1_RREADY sc_out sc_logic 1 signal 5 } 
	{ m_axi_gmem1_RDATA sc_in sc_lv 32 signal 5 } 
	{ m_axi_gmem1_RLAST sc_in sc_logic 1 signal 5 } 
	{ m_axi_gmem1_RID sc_in sc_lv 1 signal 5 } 
	{ m_axi_gmem1_RFIFONUM sc_in sc_lv 9 signal 5 } 
	{ m_axi_gmem1_RUSER sc_in sc_lv 1 signal 5 } 
	{ m_axi_gmem1_RRESP sc_in sc_lv 2 signal 5 } 
	{ m_axi_gmem1_BVALID sc_in sc_logic 1 signal 5 } 
	{ m_axi_gmem1_BREADY sc_out sc_logic 1 signal 5 } 
	{ m_axi_gmem1_BRESP sc_in sc_lv 2 signal 5 } 
	{ m_axi_gmem1_BID sc_in sc_lv 1 signal 5 } 
	{ m_axi_gmem1_BUSER sc_in sc_lv 1 signal 5 } 
	{ b sc_in sc_lv 64 signal 6 } 
	{ m_axi_gmem2_AWVALID sc_out sc_logic 1 signal 7 } 
	{ m_axi_gmem2_AWREADY sc_in sc_logic 1 signal 7 } 
	{ m_axi_gmem2_AWADDR sc_out sc_lv 64 signal 7 } 
	{ m_axi_gmem2_AWID sc_out sc_lv 1 signal 7 } 
	{ m_axi_gmem2_AWLEN sc_out sc_lv 32 signal 7 } 
	{ m_axi_gmem2_AWSIZE sc_out sc_lv 3 signal 7 } 
	{ m_axi_gmem2_AWBURST sc_out sc_lv 2 signal 7 } 
	{ m_axi_gmem2_AWLOCK sc_out sc_lv 2 signal 7 } 
	{ m_axi_gmem2_AWCACHE sc_out sc_lv 4 signal 7 } 
	{ m_axi_gmem2_AWPROT sc_out sc_lv 3 signal 7 } 
	{ m_axi_gmem2_AWQOS sc_out sc_lv 4 signal 7 } 
	{ m_axi_gmem2_AWREGION sc_out sc_lv 4 signal 7 } 
	{ m_axi_gmem2_AWUSER sc_out sc_lv 1 signal 7 } 
	{ m_axi_gmem2_WVALID sc_out sc_logic 1 signal 7 } 
	{ m_axi_gmem2_WREADY sc_in sc_logic 1 signal 7 } 
	{ m_axi_gmem2_WDATA sc_out sc_lv 32 signal 7 } 
	{ m_axi_gmem2_WSTRB sc_out sc_lv 4 signal 7 } 
	{ m_axi_gmem2_WLAST sc_out sc_logic 1 signal 7 } 
	{ m_axi_gmem2_WID sc_out sc_lv 1 signal 7 } 
	{ m_axi_gmem2_WUSER sc_out sc_lv 1 signal 7 } 
	{ m_axi_gmem2_ARVALID sc_out sc_logic 1 signal 7 } 
	{ m_axi_gmem2_ARREADY sc_in sc_logic 1 signal 7 } 
	{ m_axi_gmem2_ARADDR sc_out sc_lv 64 signal 7 } 
	{ m_axi_gmem2_ARID sc_out sc_lv 1 signal 7 } 
	{ m_axi_gmem2_ARLEN sc_out sc_lv 32 signal 7 } 
	{ m_axi_gmem2_ARSIZE sc_out sc_lv 3 signal 7 } 
	{ m_axi_gmem2_ARBURST sc_out sc_lv 2 signal 7 } 
	{ m_axi_gmem2_ARLOCK sc_out sc_lv 2 signal 7 } 
	{ m_axi_gmem2_ARCACHE sc_out sc_lv 4 signal 7 } 
	{ m_axi_gmem2_ARPROT sc_out sc_lv 3 signal 7 } 
	{ m_axi_gmem2_ARQOS sc_out sc_lv 4 signal 7 } 
	{ m_axi_gmem2_ARREGION sc_out sc_lv 4 signal 7 } 
	{ m_axi_gmem2_ARUSER sc_out sc_lv 1 signal 7 } 
	{ m_axi_gmem2_RVALID sc_in sc_logic 1 signal 7 } 
	{ m_axi_gmem2_RREADY sc_out sc_logic 1 signal 7 } 
	{ m_axi_gmem2_RDATA sc_in sc_lv 32 signal 7 } 
	{ m_axi_gmem2_RLAST sc_in sc_logic 1 signal 7 } 
	{ m_axi_gmem2_RID sc_in sc_lv 1 signal 7 } 
	{ m_axi_gmem2_RFIFONUM sc_in sc_lv 9 signal 7 } 
	{ m_axi_gmem2_RUSER sc_in sc_lv 1 signal 7 } 
	{ m_axi_gmem2_RRESP sc_in sc_lv 2 signal 7 } 
	{ m_axi_gmem2_BVALID sc_in sc_logic 1 signal 7 } 
	{ m_axi_gmem2_BREADY sc_out sc_logic 1 signal 7 } 
	{ m_axi_gmem2_BRESP sc_in sc_lv 2 signal 7 } 
	{ m_axi_gmem2_BID sc_in sc_lv 1 signal 7 } 
	{ m_axi_gmem2_BUSER sc_in sc_lv 1 signal 7 } 
	{ c sc_in sc_lv 64 signal 8 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "selec", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "selec", "role": "default" }} , 
 	{ "name": "m_axi_gmem3_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem3_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem3_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem3", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem3_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem3_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem3", "role": "AWLEN" }} , 
 	{ "name": "m_axi_gmem3_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem3", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_gmem3_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem3", "role": "AWBURST" }} , 
 	{ "name": "m_axi_gmem3_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem3", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_gmem3_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem3", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_gmem3_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem3", "role": "AWPROT" }} , 
 	{ "name": "m_axi_gmem3_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem3", "role": "AWQOS" }} , 
 	{ "name": "m_axi_gmem3_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem3", "role": "AWREGION" }} , 
 	{ "name": "m_axi_gmem3_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "AWUSER" }} , 
 	{ "name": "m_axi_gmem3_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "WVALID" }} , 
 	{ "name": "m_axi_gmem3_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "WREADY" }} , 
 	{ "name": "m_axi_gmem3_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem3", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem3_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem3", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem3_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem3_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "WID" }} , 
 	{ "name": "m_axi_gmem3_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem3_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem3_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem3_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem3", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem3_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem3_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem3", "role": "ARLEN" }} , 
 	{ "name": "m_axi_gmem3_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem3", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_gmem3_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem3", "role": "ARBURST" }} , 
 	{ "name": "m_axi_gmem3_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem3", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_gmem3_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem3", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_gmem3_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem3", "role": "ARPROT" }} , 
 	{ "name": "m_axi_gmem3_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem3", "role": "ARQOS" }} , 
 	{ "name": "m_axi_gmem3_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem3", "role": "ARREGION" }} , 
 	{ "name": "m_axi_gmem3_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "ARUSER" }} , 
 	{ "name": "m_axi_gmem3_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "RVALID" }} , 
 	{ "name": "m_axi_gmem3_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "RREADY" }} , 
 	{ "name": "m_axi_gmem3_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem3", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem3_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem3_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "RID" }} , 
 	{ "name": "m_axi_gmem3_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "gmem3", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_gmem3_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem3_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem3", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem3_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem3_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem3_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem3", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem3_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "BID" }} , 
 	{ "name": "m_axi_gmem3_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "BUSER" }} , 
 	{ "name": "op", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "op", "role": "default" }} , 
 	{ "name": "m_axi_gmem0_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem0_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem0_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem0", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem0_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem0_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem0", "role": "AWLEN" }} , 
 	{ "name": "m_axi_gmem0_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem0", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_gmem0_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "AWBURST" }} , 
 	{ "name": "m_axi_gmem0_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_gmem0_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_gmem0_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem0", "role": "AWPROT" }} , 
 	{ "name": "m_axi_gmem0_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "AWQOS" }} , 
 	{ "name": "m_axi_gmem0_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "AWREGION" }} , 
 	{ "name": "m_axi_gmem0_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "AWUSER" }} , 
 	{ "name": "m_axi_gmem0_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "WVALID" }} , 
 	{ "name": "m_axi_gmem0_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "WREADY" }} , 
 	{ "name": "m_axi_gmem0_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem0", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem0_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem0_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem0_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "WID" }} , 
 	{ "name": "m_axi_gmem0_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem0_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem0_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem0_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem0", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem0_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem0_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem0", "role": "ARLEN" }} , 
 	{ "name": "m_axi_gmem0_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem0", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_gmem0_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "ARBURST" }} , 
 	{ "name": "m_axi_gmem0_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_gmem0_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_gmem0_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem0", "role": "ARPROT" }} , 
 	{ "name": "m_axi_gmem0_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "ARQOS" }} , 
 	{ "name": "m_axi_gmem0_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "ARREGION" }} , 
 	{ "name": "m_axi_gmem0_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "ARUSER" }} , 
 	{ "name": "m_axi_gmem0_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "RVALID" }} , 
 	{ "name": "m_axi_gmem0_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "RREADY" }} , 
 	{ "name": "m_axi_gmem0_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem0", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem0_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem0_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "RID" }} , 
 	{ "name": "m_axi_gmem0_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "gmem0", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_gmem0_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem0_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem0_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem0_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem0_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem0_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "BID" }} , 
 	{ "name": "m_axi_gmem0_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "BUSER" }} , 
 	{ "name": "a", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "a", "role": "default" }} , 
 	{ "name": "m_axi_gmem1_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem1_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem1_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem1", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem1_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem1_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem1", "role": "AWLEN" }} , 
 	{ "name": "m_axi_gmem1_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem1", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_gmem1_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem1", "role": "AWBURST" }} , 
 	{ "name": "m_axi_gmem1_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem1", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_gmem1_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem1", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_gmem1_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem1", "role": "AWPROT" }} , 
 	{ "name": "m_axi_gmem1_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem1", "role": "AWQOS" }} , 
 	{ "name": "m_axi_gmem1_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem1", "role": "AWREGION" }} , 
 	{ "name": "m_axi_gmem1_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "AWUSER" }} , 
 	{ "name": "m_axi_gmem1_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "WVALID" }} , 
 	{ "name": "m_axi_gmem1_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "WREADY" }} , 
 	{ "name": "m_axi_gmem1_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem1", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem1_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem1", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem1_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem1_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "WID" }} , 
 	{ "name": "m_axi_gmem1_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem1_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem1_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem1_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem1", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem1_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem1_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem1", "role": "ARLEN" }} , 
 	{ "name": "m_axi_gmem1_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem1", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_gmem1_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem1", "role": "ARBURST" }} , 
 	{ "name": "m_axi_gmem1_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem1", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_gmem1_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem1", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_gmem1_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem1", "role": "ARPROT" }} , 
 	{ "name": "m_axi_gmem1_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem1", "role": "ARQOS" }} , 
 	{ "name": "m_axi_gmem1_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem1", "role": "ARREGION" }} , 
 	{ "name": "m_axi_gmem1_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "ARUSER" }} , 
 	{ "name": "m_axi_gmem1_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "RVALID" }} , 
 	{ "name": "m_axi_gmem1_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "RREADY" }} , 
 	{ "name": "m_axi_gmem1_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem1", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem1_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem1_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "RID" }} , 
 	{ "name": "m_axi_gmem1_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "gmem1", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_gmem1_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem1_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem1", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem1_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem1_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem1_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem1", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem1_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "BID" }} , 
 	{ "name": "m_axi_gmem1_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "BUSER" }} , 
 	{ "name": "b", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "b", "role": "default" }} , 
 	{ "name": "m_axi_gmem2_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem2_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem2_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem2", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem2_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem2_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem2", "role": "AWLEN" }} , 
 	{ "name": "m_axi_gmem2_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem2", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_gmem2_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem2", "role": "AWBURST" }} , 
 	{ "name": "m_axi_gmem2_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem2", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_gmem2_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem2", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_gmem2_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem2", "role": "AWPROT" }} , 
 	{ "name": "m_axi_gmem2_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem2", "role": "AWQOS" }} , 
 	{ "name": "m_axi_gmem2_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem2", "role": "AWREGION" }} , 
 	{ "name": "m_axi_gmem2_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "AWUSER" }} , 
 	{ "name": "m_axi_gmem2_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "WVALID" }} , 
 	{ "name": "m_axi_gmem2_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "WREADY" }} , 
 	{ "name": "m_axi_gmem2_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem2", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem2_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem2", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem2_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem2_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "WID" }} , 
 	{ "name": "m_axi_gmem2_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem2_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem2_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem2_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem2", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem2_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem2_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem2", "role": "ARLEN" }} , 
 	{ "name": "m_axi_gmem2_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem2", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_gmem2_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem2", "role": "ARBURST" }} , 
 	{ "name": "m_axi_gmem2_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem2", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_gmem2_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem2", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_gmem2_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem2", "role": "ARPROT" }} , 
 	{ "name": "m_axi_gmem2_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem2", "role": "ARQOS" }} , 
 	{ "name": "m_axi_gmem2_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem2", "role": "ARREGION" }} , 
 	{ "name": "m_axi_gmem2_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "ARUSER" }} , 
 	{ "name": "m_axi_gmem2_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "RVALID" }} , 
 	{ "name": "m_axi_gmem2_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "RREADY" }} , 
 	{ "name": "m_axi_gmem2_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem2", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem2_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem2_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "RID" }} , 
 	{ "name": "m_axi_gmem2_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "gmem2", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_gmem2_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem2_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem2", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem2_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem2_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem2_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem2", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem2_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "BID" }} , 
 	{ "name": "m_axi_gmem2_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "BUSER" }} , 
 	{ "name": "c", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "c", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "17", "28", "33", "42", "43", "44", "45"],
		"CDFG" : "Block_entry1_proc",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "selec", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem3", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "28", "SubInstance" : "grp_operation_fu_166", "Port" : "gmem3", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "2", "SubInstance" : "grp_op_data_exe_wb_fu_112", "Port" : "gmem3", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "op", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem0", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_data_exe_wb_fu_142", "Port" : "gmem0", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "2", "SubInstance" : "grp_op_data_exe_wb_fu_112", "Port" : "gmem0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem1", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_data_exe_wb_fu_142", "Port" : "gmem1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "2", "SubInstance" : "grp_op_data_exe_wb_fu_112", "Port" : "gmem1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem2", "Type" : "MAXI", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_data_exe_wb_fu_142", "Port" : "gmem2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "2", "SubInstance" : "grp_op_data_exe_wb_fu_112", "Port" : "gmem2", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "c", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_a", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "33", "SubInstance" : "grp_reset_fu_178", "Port" : "data_a", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "17", "SubInstance" : "grp_data_exe_wb_fu_142", "Port" : "data_a", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "2", "SubInstance" : "grp_op_data_exe_wb_fu_112", "Port" : "data_a", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "data_b", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "33", "SubInstance" : "grp_reset_fu_178", "Port" : "data_b", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "17", "SubInstance" : "grp_data_exe_wb_fu_142", "Port" : "data_b", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "2", "SubInstance" : "grp_op_data_exe_wb_fu_112", "Port" : "data_b", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "ALU_operation", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "33", "SubInstance" : "grp_reset_fu_178", "Port" : "ALU_operation", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "28", "SubInstance" : "grp_operation_fu_166", "Port" : "ALU_operation", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "2", "SubInstance" : "grp_op_data_exe_wb_fu_112", "Port" : "ALU_operation", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "ALU_operation_MEM", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "33", "SubInstance" : "grp_reset_fu_178", "Port" : "ALU_operation_MEM", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "17", "SubInstance" : "grp_data_exe_wb_fu_142", "Port" : "ALU_operation_MEM", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "28", "SubInstance" : "grp_operation_fu_166", "Port" : "ALU_operation_MEM", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "2", "SubInstance" : "grp_op_data_exe_wb_fu_112", "Port" : "ALU_operation_MEM", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "data_result", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_data_exe_wb_fu_142", "Port" : "data_result", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "2", "SubInstance" : "grp_op_data_exe_wb_fu_112", "Port" : "data_result", "Inst_start_state" : "1", "Inst_end_state" : "2"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ALU_operation_MEM_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_op_data_exe_wb_fu_112", "Parent" : "0", "Child" : ["3", "5", "7", "9", "11", "15"],
		"CDFG" : "op_data_exe_wb",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "399", "EstimateLatencyMax" : "399",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "gmem0", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_op_data_exe_wb_Pipeline_l_data_a_fu_101", "Port" : "gmem0", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem1", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_op_data_exe_wb_Pipeline_l_data_b_fu_110", "Port" : "gmem1", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem3", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_op_data_exe_wb_Pipeline_l_operation_fu_92", "Port" : "gmem3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "op", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem2", "Type" : "MAXI", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "grp_op_data_exe_wb_Pipeline_write_back_fu_139", "Port" : "gmem2", "Inst_start_state" : "17", "Inst_end_state" : "18"}]},
			{"Name" : "c", "Type" : "None", "Direction" : "I"},
			{"Name" : "ALU_operation_MEM", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_op_data_exe_wb_Pipeline_exe_fu_127", "Port" : "ALU_operation_MEM", "Inst_start_state" : "14", "Inst_end_state" : "15"},
					{"ID" : "9", "SubInstance" : "grp_op_data_exe_wb_Pipeline_s_operation_data_op_fu_119", "Port" : "ALU_operation_MEM", "Inst_start_state" : "11", "Inst_end_state" : "12"}]},
			{"Name" : "ALU_operation", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_op_data_exe_wb_Pipeline_l_operation_fu_92", "Port" : "ALU_operation", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "9", "SubInstance" : "grp_op_data_exe_wb_Pipeline_s_operation_data_op_fu_119", "Port" : "ALU_operation", "Inst_start_state" : "11", "Inst_end_state" : "12"}]},
			{"Name" : "data_a", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_op_data_exe_wb_Pipeline_l_data_a_fu_101", "Port" : "data_a", "Inst_start_state" : "5", "Inst_end_state" : "6"},
					{"ID" : "11", "SubInstance" : "grp_op_data_exe_wb_Pipeline_exe_fu_127", "Port" : "data_a", "Inst_start_state" : "14", "Inst_end_state" : "15"}]},
			{"Name" : "data_b", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_op_data_exe_wb_Pipeline_l_data_b_fu_110", "Port" : "data_b", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "11", "SubInstance" : "grp_op_data_exe_wb_Pipeline_exe_fu_127", "Port" : "data_b", "Inst_start_state" : "14", "Inst_end_state" : "15"}]},
			{"Name" : "data_result", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_op_data_exe_wb_Pipeline_exe_fu_127", "Port" : "data_result", "Inst_start_state" : "14", "Inst_end_state" : "15"},
					{"ID" : "15", "SubInstance" : "grp_op_data_exe_wb_Pipeline_write_back_fu_139", "Port" : "data_result", "Inst_start_state" : "17", "Inst_end_state" : "18"}]}]},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_op_data_exe_wb_fu_112.grp_op_data_exe_wb_Pipeline_l_operation_fu_92", "Parent" : "2", "Child" : ["4"],
		"CDFG" : "op_data_exe_wb_Pipeline_l_operation",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "61", "EstimateLatencyMax" : "61",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "op", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem3", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem3_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem3_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "ALU_operation", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "ALU_operation_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "l_operation", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter10", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter10", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "4", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_op_data_exe_wb_fu_112.grp_op_data_exe_wb_Pipeline_l_operation_fu_92.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_op_data_exe_wb_fu_112.grp_op_data_exe_wb_Pipeline_l_data_a_fu_101", "Parent" : "2", "Child" : ["6"],
		"CDFG" : "op_data_exe_wb_Pipeline_l_data_a",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "61", "EstimateLatencyMax" : "61",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem0", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem0_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem0_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "data_a", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "data_a_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "l_data_a", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter10", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter10", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "6", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_op_data_exe_wb_fu_112.grp_op_data_exe_wb_Pipeline_l_data_a_fu_101.flow_control_loop_pipe_sequential_init_U", "Parent" : "5"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_op_data_exe_wb_fu_112.grp_op_data_exe_wb_Pipeline_l_data_b_fu_110", "Parent" : "2", "Child" : ["8"],
		"CDFG" : "op_data_exe_wb_Pipeline_l_data_b",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "61", "EstimateLatencyMax" : "61",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem1", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem1_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem1_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "data_b", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "data_b_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "l_data_b", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter10", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter10", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "8", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_op_data_exe_wb_fu_112.grp_op_data_exe_wb_Pipeline_l_data_b_fu_110.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_op_data_exe_wb_fu_112.grp_op_data_exe_wb_Pipeline_s_operation_data_op_fu_119", "Parent" : "2", "Child" : ["10"],
		"CDFG" : "op_data_exe_wb_Pipeline_s_operation_data_op",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "52", "EstimateLatencyMax" : "52",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "ALU_operation_MEM", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ALU_operation", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "ALU_operation_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "s_operation_data_op", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "10", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_op_data_exe_wb_fu_112.grp_op_data_exe_wb_Pipeline_s_operation_data_op_fu_119.flow_control_loop_pipe_sequential_init_U", "Parent" : "9"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_op_data_exe_wb_fu_112.grp_op_data_exe_wb_Pipeline_exe_fu_127", "Parent" : "2", "Child" : ["12", "13", "14"],
		"CDFG" : "op_data_exe_wb_Pipeline_exe",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "89", "EstimateLatencyMax" : "89",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "ALU_operation_MEM", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "data_result", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "data_result_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "data_a", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "data_a_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "data_b", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "data_b_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "exe", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter38", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter38", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "12", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_op_data_exe_wb_fu_112.grp_op_data_exe_wb_Pipeline_exe_fu_127.mul_32s_32s_32_2_1_U12", "Parent" : "11"},
	{"ID" : "13", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_op_data_exe_wb_fu_112.grp_op_data_exe_wb_Pipeline_exe_fu_127.sdiv_32s_32s_32_36_1_U13", "Parent" : "11"},
	{"ID" : "14", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_op_data_exe_wb_fu_112.grp_op_data_exe_wb_Pipeline_exe_fu_127.flow_control_loop_pipe_sequential_init_U", "Parent" : "11"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_op_data_exe_wb_fu_112.grp_op_data_exe_wb_Pipeline_write_back_fu_139", "Parent" : "2", "Child" : ["16"],
		"CDFG" : "op_data_exe_wb_Pipeline_write_back",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "58", "EstimateLatencyMax" : "58",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "c", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem2", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "gmem2_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "gmem2_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "gmem2_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "data_result", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "data_result_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "write_back", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter7", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter7", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "16", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_op_data_exe_wb_fu_112.grp_op_data_exe_wb_Pipeline_write_back_fu_139.flow_control_loop_pipe_sequential_init_U", "Parent" : "15"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_data_exe_wb_fu_142", "Parent" : "0", "Child" : ["18", "20", "22", "26"],
		"CDFG" : "data_exe_wb",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "280", "EstimateLatencyMax" : "280",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "gmem0", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_data_exe_wb_Pipeline_l_data_a_fu_74", "Port" : "gmem0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem1", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_data_exe_wb_Pipeline_l_data_b_fu_83", "Port" : "gmem1", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem2", "Type" : "MAXI", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "26", "SubInstance" : "grp_data_exe_wb_Pipeline_write_back_fu_104", "Port" : "gmem2", "Inst_start_state" : "11", "Inst_end_state" : "12"}]},
			{"Name" : "c", "Type" : "None", "Direction" : "I"},
			{"Name" : "ALU_operation_MEM", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "22", "SubInstance" : "grp_data_exe_wb_Pipeline_exe_fu_92", "Port" : "ALU_operation_MEM", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "data_a", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "22", "SubInstance" : "grp_data_exe_wb_Pipeline_exe_fu_92", "Port" : "data_a", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "18", "SubInstance" : "grp_data_exe_wb_Pipeline_l_data_a_fu_74", "Port" : "data_a", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "data_b", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "22", "SubInstance" : "grp_data_exe_wb_Pipeline_exe_fu_92", "Port" : "data_b", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "20", "SubInstance" : "grp_data_exe_wb_Pipeline_l_data_b_fu_83", "Port" : "data_b", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "data_result", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "26", "SubInstance" : "grp_data_exe_wb_Pipeline_write_back_fu_104", "Port" : "data_result", "Inst_start_state" : "11", "Inst_end_state" : "12"},
					{"ID" : "22", "SubInstance" : "grp_data_exe_wb_Pipeline_exe_fu_92", "Port" : "data_result", "Inst_start_state" : "8", "Inst_end_state" : "9"}]}]},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_data_exe_wb_fu_142.grp_data_exe_wb_Pipeline_l_data_a_fu_74", "Parent" : "17", "Child" : ["19"],
		"CDFG" : "data_exe_wb_Pipeline_l_data_a",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "61", "EstimateLatencyMax" : "61",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem0", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem0_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem0_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "data_a", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "data_a_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "l_data_a", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter10", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter10", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "19", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_data_exe_wb_fu_142.grp_data_exe_wb_Pipeline_l_data_a_fu_74.flow_control_loop_pipe_sequential_init_U", "Parent" : "18"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_data_exe_wb_fu_142.grp_data_exe_wb_Pipeline_l_data_b_fu_83", "Parent" : "17", "Child" : ["21"],
		"CDFG" : "data_exe_wb_Pipeline_l_data_b",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "61", "EstimateLatencyMax" : "61",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem1", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem1_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem1_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "data_b", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "data_b_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "l_data_b", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter10", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter10", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "21", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_data_exe_wb_fu_142.grp_data_exe_wb_Pipeline_l_data_b_fu_83.flow_control_loop_pipe_sequential_init_U", "Parent" : "20"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_data_exe_wb_fu_142.grp_data_exe_wb_Pipeline_exe_fu_92", "Parent" : "17", "Child" : ["23", "24", "25"],
		"CDFG" : "data_exe_wb_Pipeline_exe",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "89", "EstimateLatencyMax" : "89",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "ALU_operation_MEM", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "data_result", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "data_result_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "data_a", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "data_a_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "data_b", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "data_b_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "exe", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter38", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter38", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "23", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_data_exe_wb_fu_142.grp_data_exe_wb_Pipeline_exe_fu_92.mul_32s_32s_32_2_1_U42", "Parent" : "22"},
	{"ID" : "24", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_data_exe_wb_fu_142.grp_data_exe_wb_Pipeline_exe_fu_92.sdiv_32s_32s_32_36_1_U43", "Parent" : "22"},
	{"ID" : "25", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_data_exe_wb_fu_142.grp_data_exe_wb_Pipeline_exe_fu_92.flow_control_loop_pipe_sequential_init_U", "Parent" : "22"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_data_exe_wb_fu_142.grp_data_exe_wb_Pipeline_write_back_fu_104", "Parent" : "17", "Child" : ["27"],
		"CDFG" : "data_exe_wb_Pipeline_write_back",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "58", "EstimateLatencyMax" : "58",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "c", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem2", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "gmem2_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "gmem2_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "gmem2_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "data_result", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "data_result_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "write_back", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter7", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter7", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "27", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_data_exe_wb_fu_142.grp_data_exe_wb_Pipeline_write_back_fu_104.flow_control_loop_pipe_sequential_init_U", "Parent" : "26"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_operation_fu_166", "Parent" : "0", "Child" : ["29", "31"],
		"CDFG" : "operation",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "118", "EstimateLatencyMax" : "118",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "gmem3", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "29", "SubInstance" : "grp_operation_Pipeline_l_operation_fu_42", "Port" : "gmem3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "op", "Type" : "None", "Direction" : "I"},
			{"Name" : "ALU_operation_MEM", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "31", "SubInstance" : "grp_operation_Pipeline_s_operation_data_op_fu_51", "Port" : "ALU_operation_MEM", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "ALU_operation", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "29", "SubInstance" : "grp_operation_Pipeline_l_operation_fu_42", "Port" : "ALU_operation", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "31", "SubInstance" : "grp_operation_Pipeline_s_operation_data_op_fu_51", "Port" : "ALU_operation", "Inst_start_state" : "5", "Inst_end_state" : "6"}]}]},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_operation_fu_166.grp_operation_Pipeline_l_operation_fu_42", "Parent" : "28", "Child" : ["30"],
		"CDFG" : "operation_Pipeline_l_operation",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "61", "EstimateLatencyMax" : "61",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "op", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem3", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem3_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem3_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "ALU_operation", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "ALU_operation_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "l_operation", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter10", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter10", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "30", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_operation_fu_166.grp_operation_Pipeline_l_operation_fu_42.flow_control_loop_pipe_sequential_init_U", "Parent" : "29"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_operation_fu_166.grp_operation_Pipeline_s_operation_data_op_fu_51", "Parent" : "28", "Child" : ["32"],
		"CDFG" : "operation_Pipeline_s_operation_data_op",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "52", "EstimateLatencyMax" : "52",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "ALU_operation_MEM", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ALU_operation", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "ALU_operation_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "s_operation_data_op", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "32", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_operation_fu_166.grp_operation_Pipeline_s_operation_data_op_fu_51.flow_control_loop_pipe_sequential_init_U", "Parent" : "31"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_reset_fu_178", "Parent" : "0", "Child" : ["34", "36", "38", "40"],
		"CDFG" : "reset",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "data_a", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "34", "SubInstance" : "grp_reset_Pipeline_clear_FIFO_a_fu_28", "Port" : "data_a", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "data_b", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_reset_Pipeline_clear_FIFO_b_fu_34", "Port" : "data_b", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "ALU_operation", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "grp_reset_Pipeline_clear_ALU_op_fu_40", "Port" : "ALU_operation", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "ALU_operation_MEM", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "40", "SubInstance" : "grp_reset_Pipeline_clear_RAM_op_fu_46", "Port" : "ALU_operation_MEM", "Inst_start_state" : "7", "Inst_end_state" : "8"}]}]},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_reset_fu_178.grp_reset_Pipeline_clear_FIFO_a_fu_28", "Parent" : "33", "Child" : ["35"],
		"CDFG" : "reset_Pipeline_clear_FIFO_a",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "1",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "data_a", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "data_a_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "clear_FIFO_a", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state1", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state1_blk", "QuitState" : "ap_ST_fsm_state1", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state1_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "35", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_reset_fu_178.grp_reset_Pipeline_clear_FIFO_a_fu_28.flow_control_loop_pipe_sequential_init_U", "Parent" : "34"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_reset_fu_178.grp_reset_Pipeline_clear_FIFO_b_fu_34", "Parent" : "33", "Child" : ["37"],
		"CDFG" : "reset_Pipeline_clear_FIFO_b",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "1",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "data_b", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "data_b_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "clear_FIFO_b", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state1", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state1_blk", "QuitState" : "ap_ST_fsm_state1", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state1_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "37", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_reset_fu_178.grp_reset_Pipeline_clear_FIFO_b_fu_34.flow_control_loop_pipe_sequential_init_U", "Parent" : "36"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_reset_fu_178.grp_reset_Pipeline_clear_ALU_op_fu_40", "Parent" : "33", "Child" : ["39"],
		"CDFG" : "reset_Pipeline_clear_ALU_op",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "1",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "ALU_operation", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "ALU_operation_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "clear_ALU_op", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state1", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state1_blk", "QuitState" : "ap_ST_fsm_state1", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state1_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "39", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_reset_fu_178.grp_reset_Pipeline_clear_ALU_op_fu_40.flow_control_loop_pipe_sequential_init_U", "Parent" : "38"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_reset_fu_178.grp_reset_Pipeline_clear_RAM_op_fu_46", "Parent" : "33", "Child" : ["41"],
		"CDFG" : "reset_Pipeline_clear_RAM_op",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "52", "EstimateLatencyMax" : "52",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "ALU_operation_MEM", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "clear_RAM_op", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state1", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state1_blk", "QuitState" : "ap_ST_fsm_state1", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state1_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "41", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_reset_fu_178.grp_reset_Pipeline_clear_RAM_op_fu_46.flow_control_loop_pipe_sequential_init_U", "Parent" : "40"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ALU_operation_fifo_U", "Parent" : "0"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.data_a_fifo_U", "Parent" : "0"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.data_b_fifo_U", "Parent" : "0"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.data_result_fifo_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	Block_entry1_proc {
		selec {Type I LastRead 0 FirstWrite -1}
		gmem3 {Type I LastRead 9 FirstWrite -1}
		op {Type I LastRead 0 FirstWrite -1}
		gmem0 {Type I LastRead 9 FirstWrite -1}
		a {Type I LastRead 0 FirstWrite -1}
		gmem1 {Type I LastRead 9 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		gmem2 {Type O LastRead 3 FirstWrite 2}
		c {Type I LastRead 0 FirstWrite -1}
		data_a {Type IO LastRead -1 FirstWrite -1}
		data_b {Type IO LastRead -1 FirstWrite -1}
		ALU_operation {Type IO LastRead -1 FirstWrite -1}
		ALU_operation_MEM {Type IO LastRead -1 FirstWrite -1}
		data_result {Type IO LastRead -1 FirstWrite -1}}
	op_data_exe_wb {
		gmem0 {Type I LastRead 9 FirstWrite -1}
		a {Type I LastRead 0 FirstWrite -1}
		gmem1 {Type I LastRead 9 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		gmem3 {Type I LastRead 9 FirstWrite -1}
		op {Type I LastRead 0 FirstWrite -1}
		gmem2 {Type O LastRead 3 FirstWrite 2}
		c {Type I LastRead 0 FirstWrite -1}
		ALU_operation_MEM {Type IO LastRead 1 FirstWrite -1}
		ALU_operation {Type IO LastRead 1 FirstWrite -1}
		data_a {Type IO LastRead 1 FirstWrite -1}
		data_b {Type IO LastRead 1 FirstWrite -1}
		data_result {Type IO LastRead 1 FirstWrite -1}}
	op_data_exe_wb_Pipeline_l_operation {
		op {Type I LastRead 0 FirstWrite -1}
		gmem3 {Type I LastRead 9 FirstWrite -1}
		ALU_operation {Type O LastRead -1 FirstWrite 10}}
	op_data_exe_wb_Pipeline_l_data_a {
		a {Type I LastRead 0 FirstWrite -1}
		gmem0 {Type I LastRead 9 FirstWrite -1}
		data_a {Type O LastRead -1 FirstWrite 10}}
	op_data_exe_wb_Pipeline_l_data_b {
		b {Type I LastRead 0 FirstWrite -1}
		gmem1 {Type I LastRead 9 FirstWrite -1}
		data_b {Type O LastRead -1 FirstWrite 10}}
	op_data_exe_wb_Pipeline_s_operation_data_op {
		ALU_operation_MEM {Type O LastRead -1 FirstWrite 1}
		ALU_operation {Type I LastRead 1 FirstWrite -1}}
	op_data_exe_wb_Pipeline_exe {
		ALU_operation_MEM {Type I LastRead 1 FirstWrite -1}
		data_result {Type O LastRead -1 FirstWrite 38}
		data_a {Type I LastRead 1 FirstWrite -1}
		data_b {Type I LastRead 1 FirstWrite -1}}
	op_data_exe_wb_Pipeline_write_back {
		c {Type I LastRead 0 FirstWrite -1}
		gmem2 {Type O LastRead 3 FirstWrite 2}
		data_result {Type I LastRead 1 FirstWrite -1}}
	data_exe_wb {
		gmem0 {Type I LastRead 9 FirstWrite -1}
		a {Type I LastRead 0 FirstWrite -1}
		gmem1 {Type I LastRead 9 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		gmem2 {Type O LastRead 3 FirstWrite 2}
		c {Type I LastRead 0 FirstWrite -1}
		ALU_operation_MEM {Type I LastRead 1 FirstWrite -1}
		data_a {Type IO LastRead 1 FirstWrite -1}
		data_b {Type IO LastRead 1 FirstWrite -1}
		data_result {Type IO LastRead 1 FirstWrite -1}}
	data_exe_wb_Pipeline_l_data_a {
		a {Type I LastRead 0 FirstWrite -1}
		gmem0 {Type I LastRead 9 FirstWrite -1}
		data_a {Type O LastRead -1 FirstWrite 10}}
	data_exe_wb_Pipeline_l_data_b {
		b {Type I LastRead 0 FirstWrite -1}
		gmem1 {Type I LastRead 9 FirstWrite -1}
		data_b {Type O LastRead -1 FirstWrite 10}}
	data_exe_wb_Pipeline_exe {
		ALU_operation_MEM {Type I LastRead 1 FirstWrite -1}
		data_result {Type O LastRead -1 FirstWrite 38}
		data_a {Type I LastRead 1 FirstWrite -1}
		data_b {Type I LastRead 1 FirstWrite -1}}
	data_exe_wb_Pipeline_write_back {
		c {Type I LastRead 0 FirstWrite -1}
		gmem2 {Type O LastRead 3 FirstWrite 2}
		data_result {Type I LastRead 1 FirstWrite -1}}
	operation {
		gmem3 {Type I LastRead 9 FirstWrite -1}
		op {Type I LastRead 0 FirstWrite -1}
		ALU_operation_MEM {Type O LastRead -1 FirstWrite 1}
		ALU_operation {Type IO LastRead 1 FirstWrite -1}}
	operation_Pipeline_l_operation {
		op {Type I LastRead 0 FirstWrite -1}
		gmem3 {Type I LastRead 9 FirstWrite -1}
		ALU_operation {Type O LastRead -1 FirstWrite 10}}
	operation_Pipeline_s_operation_data_op {
		ALU_operation_MEM {Type O LastRead -1 FirstWrite 1}
		ALU_operation {Type I LastRead 1 FirstWrite -1}}
	reset {
		data_a {Type I LastRead 0 FirstWrite -1}
		data_b {Type I LastRead 0 FirstWrite -1}
		ALU_operation {Type I LastRead 0 FirstWrite -1}
		ALU_operation_MEM {Type O LastRead -1 FirstWrite 0}}
	reset_Pipeline_clear_FIFO_a {
		data_a {Type I LastRead 0 FirstWrite -1}}
	reset_Pipeline_clear_FIFO_b {
		data_b {Type I LastRead 0 FirstWrite -1}}
	reset_Pipeline_clear_ALU_op {
		ALU_operation {Type I LastRead 0 FirstWrite -1}}
	reset_Pipeline_clear_RAM_op {
		ALU_operation_MEM {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	selec { ap_none {  { selec in_data 0 32 } } }
	 { m_axi {  { m_axi_gmem3_AWVALID VALID 1 1 }  { m_axi_gmem3_AWREADY READY 0 1 }  { m_axi_gmem3_AWADDR ADDR 1 64 }  { m_axi_gmem3_AWID ID 1 1 }  { m_axi_gmem3_AWLEN SIZE 1 32 }  { m_axi_gmem3_AWSIZE BURST 1 3 }  { m_axi_gmem3_AWBURST LOCK 1 2 }  { m_axi_gmem3_AWLOCK CACHE 1 2 }  { m_axi_gmem3_AWCACHE PROT 1 4 }  { m_axi_gmem3_AWPROT QOS 1 3 }  { m_axi_gmem3_AWQOS REGION 1 4 }  { m_axi_gmem3_AWREGION USER 1 4 }  { m_axi_gmem3_AWUSER DATA 1 1 }  { m_axi_gmem3_WVALID VALID 1 1 }  { m_axi_gmem3_WREADY READY 0 1 }  { m_axi_gmem3_WDATA FIFONUM 1 32 }  { m_axi_gmem3_WSTRB STRB 1 4 }  { m_axi_gmem3_WLAST LAST 1 1 }  { m_axi_gmem3_WID ID 1 1 }  { m_axi_gmem3_WUSER DATA 1 1 }  { m_axi_gmem3_ARVALID VALID 1 1 }  { m_axi_gmem3_ARREADY READY 0 1 }  { m_axi_gmem3_ARADDR ADDR 1 64 }  { m_axi_gmem3_ARID ID 1 1 }  { m_axi_gmem3_ARLEN SIZE 1 32 }  { m_axi_gmem3_ARSIZE BURST 1 3 }  { m_axi_gmem3_ARBURST LOCK 1 2 }  { m_axi_gmem3_ARLOCK CACHE 1 2 }  { m_axi_gmem3_ARCACHE PROT 1 4 }  { m_axi_gmem3_ARPROT QOS 1 3 }  { m_axi_gmem3_ARQOS REGION 1 4 }  { m_axi_gmem3_ARREGION USER 1 4 }  { m_axi_gmem3_ARUSER DATA 1 1 }  { m_axi_gmem3_RVALID VALID 0 1 }  { m_axi_gmem3_RREADY READY 1 1 }  { m_axi_gmem3_RDATA FIFONUM 0 32 }  { m_axi_gmem3_RLAST LAST 0 1 }  { m_axi_gmem3_RID ID 0 1 }  { m_axi_gmem3_RFIFONUM LEN 0 9 }  { m_axi_gmem3_RUSER DATA 0 1 }  { m_axi_gmem3_RRESP RESP 0 2 }  { m_axi_gmem3_BVALID VALID 0 1 }  { m_axi_gmem3_BREADY READY 1 1 }  { m_axi_gmem3_BRESP RESP 0 2 }  { m_axi_gmem3_BID ID 0 1 }  { m_axi_gmem3_BUSER DATA 0 1 } } }
	op { ap_none {  { op in_data 0 64 } } }
	 { m_axi {  { m_axi_gmem0_AWVALID VALID 1 1 }  { m_axi_gmem0_AWREADY READY 0 1 }  { m_axi_gmem0_AWADDR ADDR 1 64 }  { m_axi_gmem0_AWID ID 1 1 }  { m_axi_gmem0_AWLEN SIZE 1 32 }  { m_axi_gmem0_AWSIZE BURST 1 3 }  { m_axi_gmem0_AWBURST LOCK 1 2 }  { m_axi_gmem0_AWLOCK CACHE 1 2 }  { m_axi_gmem0_AWCACHE PROT 1 4 }  { m_axi_gmem0_AWPROT QOS 1 3 }  { m_axi_gmem0_AWQOS REGION 1 4 }  { m_axi_gmem0_AWREGION USER 1 4 }  { m_axi_gmem0_AWUSER DATA 1 1 }  { m_axi_gmem0_WVALID VALID 1 1 }  { m_axi_gmem0_WREADY READY 0 1 }  { m_axi_gmem0_WDATA FIFONUM 1 32 }  { m_axi_gmem0_WSTRB STRB 1 4 }  { m_axi_gmem0_WLAST LAST 1 1 }  { m_axi_gmem0_WID ID 1 1 }  { m_axi_gmem0_WUSER DATA 1 1 }  { m_axi_gmem0_ARVALID VALID 1 1 }  { m_axi_gmem0_ARREADY READY 0 1 }  { m_axi_gmem0_ARADDR ADDR 1 64 }  { m_axi_gmem0_ARID ID 1 1 }  { m_axi_gmem0_ARLEN SIZE 1 32 }  { m_axi_gmem0_ARSIZE BURST 1 3 }  { m_axi_gmem0_ARBURST LOCK 1 2 }  { m_axi_gmem0_ARLOCK CACHE 1 2 }  { m_axi_gmem0_ARCACHE PROT 1 4 }  { m_axi_gmem0_ARPROT QOS 1 3 }  { m_axi_gmem0_ARQOS REGION 1 4 }  { m_axi_gmem0_ARREGION USER 1 4 }  { m_axi_gmem0_ARUSER DATA 1 1 }  { m_axi_gmem0_RVALID VALID 0 1 }  { m_axi_gmem0_RREADY READY 1 1 }  { m_axi_gmem0_RDATA FIFONUM 0 32 }  { m_axi_gmem0_RLAST LAST 0 1 }  { m_axi_gmem0_RID ID 0 1 }  { m_axi_gmem0_RFIFONUM LEN 0 9 }  { m_axi_gmem0_RUSER DATA 0 1 }  { m_axi_gmem0_RRESP RESP 0 2 }  { m_axi_gmem0_BVALID VALID 0 1 }  { m_axi_gmem0_BREADY READY 1 1 }  { m_axi_gmem0_BRESP RESP 0 2 }  { m_axi_gmem0_BID ID 0 1 }  { m_axi_gmem0_BUSER DATA 0 1 } } }
	a { ap_none {  { a in_data 0 64 } } }
	 { m_axi {  { m_axi_gmem1_AWVALID VALID 1 1 }  { m_axi_gmem1_AWREADY READY 0 1 }  { m_axi_gmem1_AWADDR ADDR 1 64 }  { m_axi_gmem1_AWID ID 1 1 }  { m_axi_gmem1_AWLEN SIZE 1 32 }  { m_axi_gmem1_AWSIZE BURST 1 3 }  { m_axi_gmem1_AWBURST LOCK 1 2 }  { m_axi_gmem1_AWLOCK CACHE 1 2 }  { m_axi_gmem1_AWCACHE PROT 1 4 }  { m_axi_gmem1_AWPROT QOS 1 3 }  { m_axi_gmem1_AWQOS REGION 1 4 }  { m_axi_gmem1_AWREGION USER 1 4 }  { m_axi_gmem1_AWUSER DATA 1 1 }  { m_axi_gmem1_WVALID VALID 1 1 }  { m_axi_gmem1_WREADY READY 0 1 }  { m_axi_gmem1_WDATA FIFONUM 1 32 }  { m_axi_gmem1_WSTRB STRB 1 4 }  { m_axi_gmem1_WLAST LAST 1 1 }  { m_axi_gmem1_WID ID 1 1 }  { m_axi_gmem1_WUSER DATA 1 1 }  { m_axi_gmem1_ARVALID VALID 1 1 }  { m_axi_gmem1_ARREADY READY 0 1 }  { m_axi_gmem1_ARADDR ADDR 1 64 }  { m_axi_gmem1_ARID ID 1 1 }  { m_axi_gmem1_ARLEN SIZE 1 32 }  { m_axi_gmem1_ARSIZE BURST 1 3 }  { m_axi_gmem1_ARBURST LOCK 1 2 }  { m_axi_gmem1_ARLOCK CACHE 1 2 }  { m_axi_gmem1_ARCACHE PROT 1 4 }  { m_axi_gmem1_ARPROT QOS 1 3 }  { m_axi_gmem1_ARQOS REGION 1 4 }  { m_axi_gmem1_ARREGION USER 1 4 }  { m_axi_gmem1_ARUSER DATA 1 1 }  { m_axi_gmem1_RVALID VALID 0 1 }  { m_axi_gmem1_RREADY READY 1 1 }  { m_axi_gmem1_RDATA FIFONUM 0 32 }  { m_axi_gmem1_RLAST LAST 0 1 }  { m_axi_gmem1_RID ID 0 1 }  { m_axi_gmem1_RFIFONUM LEN 0 9 }  { m_axi_gmem1_RUSER DATA 0 1 }  { m_axi_gmem1_RRESP RESP 0 2 }  { m_axi_gmem1_BVALID VALID 0 1 }  { m_axi_gmem1_BREADY READY 1 1 }  { m_axi_gmem1_BRESP RESP 0 2 }  { m_axi_gmem1_BID ID 0 1 }  { m_axi_gmem1_BUSER DATA 0 1 } } }
	b { ap_none {  { b in_data 0 64 } } }
	 { m_axi {  { m_axi_gmem2_AWVALID VALID 1 1 }  { m_axi_gmem2_AWREADY READY 0 1 }  { m_axi_gmem2_AWADDR ADDR 1 64 }  { m_axi_gmem2_AWID ID 1 1 }  { m_axi_gmem2_AWLEN SIZE 1 32 }  { m_axi_gmem2_AWSIZE BURST 1 3 }  { m_axi_gmem2_AWBURST LOCK 1 2 }  { m_axi_gmem2_AWLOCK CACHE 1 2 }  { m_axi_gmem2_AWCACHE PROT 1 4 }  { m_axi_gmem2_AWPROT QOS 1 3 }  { m_axi_gmem2_AWQOS REGION 1 4 }  { m_axi_gmem2_AWREGION USER 1 4 }  { m_axi_gmem2_AWUSER DATA 1 1 }  { m_axi_gmem2_WVALID VALID 1 1 }  { m_axi_gmem2_WREADY READY 0 1 }  { m_axi_gmem2_WDATA FIFONUM 1 32 }  { m_axi_gmem2_WSTRB STRB 1 4 }  { m_axi_gmem2_WLAST LAST 1 1 }  { m_axi_gmem2_WID ID 1 1 }  { m_axi_gmem2_WUSER DATA 1 1 }  { m_axi_gmem2_ARVALID VALID 1 1 }  { m_axi_gmem2_ARREADY READY 0 1 }  { m_axi_gmem2_ARADDR ADDR 1 64 }  { m_axi_gmem2_ARID ID 1 1 }  { m_axi_gmem2_ARLEN SIZE 1 32 }  { m_axi_gmem2_ARSIZE BURST 1 3 }  { m_axi_gmem2_ARBURST LOCK 1 2 }  { m_axi_gmem2_ARLOCK CACHE 1 2 }  { m_axi_gmem2_ARCACHE PROT 1 4 }  { m_axi_gmem2_ARPROT QOS 1 3 }  { m_axi_gmem2_ARQOS REGION 1 4 }  { m_axi_gmem2_ARREGION USER 1 4 }  { m_axi_gmem2_ARUSER DATA 1 1 }  { m_axi_gmem2_RVALID VALID 0 1 }  { m_axi_gmem2_RREADY READY 1 1 }  { m_axi_gmem2_RDATA FIFONUM 0 32 }  { m_axi_gmem2_RLAST LAST 0 1 }  { m_axi_gmem2_RID ID 0 1 }  { m_axi_gmem2_RFIFONUM LEN 0 9 }  { m_axi_gmem2_RUSER DATA 0 1 }  { m_axi_gmem2_RRESP RESP 0 2 }  { m_axi_gmem2_BVALID VALID 0 1 }  { m_axi_gmem2_BREADY READY 1 1 }  { m_axi_gmem2_BRESP RESP 0 2 }  { m_axi_gmem2_BID ID 0 1 }  { m_axi_gmem2_BUSER DATA 0 1 } } }
	c { ap_none {  { c in_data 0 64 } } }
}
