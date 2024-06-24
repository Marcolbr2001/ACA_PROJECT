set moduleName operation_Pipeline_s_operation_data_op
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
set C_modelName {operation_Pipeline_s_operation_data_op}
set C_modelType { void 0 }
set C_modelArgList {
	{ ALU_operation_MEM int 32 regular {array 50 { 0 3 } 0 1 }  }
	{ ALU_operation int 32 regular {fifo 0 volatile } {global 0}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "ALU_operation_MEM", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ALU_operation", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 13
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ALU_operation_dout sc_in sc_lv 32 signal 1 } 
	{ ALU_operation_empty_n sc_in sc_logic 1 signal 1 } 
	{ ALU_operation_read sc_out sc_logic 1 signal 1 } 
	{ ALU_operation_MEM_address0 sc_out sc_lv 6 signal 0 } 
	{ ALU_operation_MEM_ce0 sc_out sc_logic 1 signal 0 } 
	{ ALU_operation_MEM_we0 sc_out sc_logic 1 signal 0 } 
	{ ALU_operation_MEM_d0 sc_out sc_lv 32 signal 0 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ALU_operation_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ALU_operation", "role": "dout" }} , 
 	{ "name": "ALU_operation_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ALU_operation", "role": "empty_n" }} , 
 	{ "name": "ALU_operation_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ALU_operation", "role": "read" }} , 
 	{ "name": "ALU_operation_MEM_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ALU_operation_MEM", "role": "address0" }} , 
 	{ "name": "ALU_operation_MEM_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ALU_operation_MEM", "role": "ce0" }} , 
 	{ "name": "ALU_operation_MEM_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ALU_operation_MEM", "role": "we0" }} , 
 	{ "name": "ALU_operation_MEM_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ALU_operation_MEM", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	operation_Pipeline_s_operation_data_op {
		ALU_operation_MEM {Type O LastRead -1 FirstWrite 1}
		ALU_operation {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "52", "Max" : "52"}
	, {"Name" : "Interval", "Min" : "52", "Max" : "52"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	ALU_operation_MEM { ap_memory {  { ALU_operation_MEM_address0 mem_address 1 6 }  { ALU_operation_MEM_ce0 mem_ce 1 1 }  { ALU_operation_MEM_we0 mem_we 1 1 }  { ALU_operation_MEM_d0 mem_din 1 32 } } }
	ALU_operation { ap_fifo {  { ALU_operation_dout fifo_data_in 0 32 }  { ALU_operation_empty_n fifo_status 0 1 }  { ALU_operation_read fifo_port_we 1 1 } } }
}
