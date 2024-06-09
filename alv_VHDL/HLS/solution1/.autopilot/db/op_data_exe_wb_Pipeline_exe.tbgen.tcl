set moduleName op_data_exe_wb_Pipeline_exe
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
set C_modelName {op_data_exe_wb_Pipeline_exe}
set C_modelType { void 0 }
set C_modelArgList {
	{ ALU_operation_MEM int 32 regular {array 50 { 1 3 } 1 1 }  }
	{ data_result int 32 regular {fifo 1 volatile } {global 1}  }
	{ data_a int 32 regular {fifo 0 volatile } {global 0}  }
	{ data_b int 32 regular {fifo 0 volatile } {global 0}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "ALU_operation_MEM", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "data_result", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "data_a", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "data_b", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 18
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ data_a_dout sc_in sc_lv 32 signal 2 } 
	{ data_a_empty_n sc_in sc_logic 1 signal 2 } 
	{ data_a_read sc_out sc_logic 1 signal 2 } 
	{ data_b_dout sc_in sc_lv 32 signal 3 } 
	{ data_b_empty_n sc_in sc_logic 1 signal 3 } 
	{ data_b_read sc_out sc_logic 1 signal 3 } 
	{ data_result_din sc_out sc_lv 32 signal 1 } 
	{ data_result_full_n sc_in sc_logic 1 signal 1 } 
	{ data_result_write sc_out sc_logic 1 signal 1 } 
	{ ALU_operation_MEM_address0 sc_out sc_lv 6 signal 0 } 
	{ ALU_operation_MEM_ce0 sc_out sc_logic 1 signal 0 } 
	{ ALU_operation_MEM_q0 sc_in sc_lv 32 signal 0 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "data_a_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data_a", "role": "dout" }} , 
 	{ "name": "data_a_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_a", "role": "empty_n" }} , 
 	{ "name": "data_a_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_a", "role": "read" }} , 
 	{ "name": "data_b_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data_b", "role": "dout" }} , 
 	{ "name": "data_b_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_b", "role": "empty_n" }} , 
 	{ "name": "data_b_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_b", "role": "read" }} , 
 	{ "name": "data_result_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data_result", "role": "din" }} , 
 	{ "name": "data_result_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_result", "role": "full_n" }} , 
 	{ "name": "data_result_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_result", "role": "write" }} , 
 	{ "name": "ALU_operation_MEM_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ALU_operation_MEM", "role": "address0" }} , 
 	{ "name": "ALU_operation_MEM_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ALU_operation_MEM", "role": "ce0" }} , 
 	{ "name": "ALU_operation_MEM_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ALU_operation_MEM", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_32_2_1_U12", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sdiv_32s_32s_32_36_1_U13", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	op_data_exe_wb_Pipeline_exe {
		ALU_operation_MEM {Type I LastRead 1 FirstWrite -1}
		data_result {Type O LastRead -1 FirstWrite 38}
		data_a {Type I LastRead 1 FirstWrite -1}
		data_b {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "89", "Max" : "89"}
	, {"Name" : "Interval", "Min" : "89", "Max" : "89"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	ALU_operation_MEM { ap_memory {  { ALU_operation_MEM_address0 mem_address 1 6 }  { ALU_operation_MEM_ce0 mem_ce 1 1 }  { ALU_operation_MEM_q0 in_data 0 32 } } }
	data_result { ap_fifo {  { data_result_din fifo_data_in 1 32 }  { data_result_full_n fifo_status 0 1 }  { data_result_write fifo_port_we 1 1 } } }
	data_a { ap_fifo {  { data_a_dout fifo_data_in 0 32 }  { data_a_empty_n fifo_status 0 1 }  { data_a_read fifo_port_we 1 1 } } }
	data_b { ap_fifo {  { data_b_dout fifo_data_in 0 32 }  { data_b_empty_n fifo_status 0 1 }  { data_b_read fifo_port_we 1 1 } } }
}
