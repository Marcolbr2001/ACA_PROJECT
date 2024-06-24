set moduleName dec_MIMD_Pipeline_VITIS_LOOP_49_1
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {dec_MIMD_Pipeline_VITIS_LOOP_49_1}
set C_modelType { void 0 }
set C_modelArgList {
	{ data_result int 32 regular {array 50 { 0 3 } 0 1 }  }
	{ data_a int 32 regular {array 50 { 1 3 } 1 1 } {global 0}  }
	{ ALU_operation int 32 regular {array 50 { 1 3 } 1 1 } {global 0}  }
	{ data_b int 32 regular {array 50 { 1 3 } 1 1 } {global 0}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "data_result", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "data_a", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "ALU_operation", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "data_b", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 19
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ data_result_address0 sc_out sc_lv 6 signal 0 } 
	{ data_result_ce0 sc_out sc_logic 1 signal 0 } 
	{ data_result_we0 sc_out sc_logic 1 signal 0 } 
	{ data_result_d0 sc_out sc_lv 32 signal 0 } 
	{ data_a_address0 sc_out sc_lv 6 signal 1 } 
	{ data_a_ce0 sc_out sc_logic 1 signal 1 } 
	{ data_a_q0 sc_in sc_lv 32 signal 1 } 
	{ ALU_operation_address0 sc_out sc_lv 6 signal 2 } 
	{ ALU_operation_ce0 sc_out sc_logic 1 signal 2 } 
	{ ALU_operation_q0 sc_in sc_lv 32 signal 2 } 
	{ data_b_address0 sc_out sc_lv 6 signal 3 } 
	{ data_b_ce0 sc_out sc_logic 1 signal 3 } 
	{ data_b_q0 sc_in sc_lv 32 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "data_result_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "data_result", "role": "address0" }} , 
 	{ "name": "data_result_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_result", "role": "ce0" }} , 
 	{ "name": "data_result_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_result", "role": "we0" }} , 
 	{ "name": "data_result_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data_result", "role": "d0" }} , 
 	{ "name": "data_a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "data_a", "role": "address0" }} , 
 	{ "name": "data_a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_a", "role": "ce0" }} , 
 	{ "name": "data_a_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data_a", "role": "q0" }} , 
 	{ "name": "ALU_operation_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ALU_operation", "role": "address0" }} , 
 	{ "name": "ALU_operation_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ALU_operation", "role": "ce0" }} , 
 	{ "name": "ALU_operation_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ALU_operation", "role": "q0" }} , 
 	{ "name": "data_b_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "data_b", "role": "address0" }} , 
 	{ "name": "data_b_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_b", "role": "ce0" }} , 
 	{ "name": "data_b_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data_b", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "dec_MIMD_Pipeline_VITIS_LOOP_49_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90", "EstimateLatencyMax" : "90",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "data_result", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "data_a", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ALU_operation", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "data_b", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_49_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter39", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter39", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_32_2_1_U4", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sdiv_32ns_32ns_32_36_1_U5", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	dec_MIMD_Pipeline_VITIS_LOOP_49_1 {
		data_result {Type O LastRead -1 FirstWrite 39}
		data_a {Type I LastRead 2 FirstWrite -1}
		ALU_operation {Type I LastRead 0 FirstWrite -1}
		data_b {Type I LastRead 2 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "90", "Max" : "90"}
	, {"Name" : "Interval", "Min" : "90", "Max" : "90"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	data_result { ap_memory {  { data_result_address0 mem_address 1 6 }  { data_result_ce0 mem_ce 1 1 }  { data_result_we0 mem_we 1 1 }  { data_result_d0 mem_din 1 32 } } }
	data_a { ap_memory {  { data_a_address0 mem_address 1 6 }  { data_a_ce0 mem_ce 1 1 }  { data_a_q0 in_data 0 32 } } }
	ALU_operation { ap_memory {  { ALU_operation_address0 mem_address 1 6 }  { ALU_operation_ce0 mem_ce 1 1 }  { ALU_operation_q0 in_data 0 32 } } }
	data_b { ap_memory {  { data_b_address0 mem_address 1 6 }  { data_b_ce0 mem_ce 1 1 }  { data_b_q0 in_data 0 32 } } }
}
