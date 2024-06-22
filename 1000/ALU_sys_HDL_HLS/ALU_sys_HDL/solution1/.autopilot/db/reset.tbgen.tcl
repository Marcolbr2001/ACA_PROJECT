set moduleName reset
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
set C_modelName {reset}
set C_modelType { void 0 }
set C_modelArgList {
	{ data_a int 32 regular {fifo 0 volatile } {global 0}  }
	{ data_b int 32 regular {fifo 0 volatile } {global 0}  }
	{ ALU_operation int 32 regular {fifo 0 volatile } {global 0}  }
	{ ALU_operation_MEM int 32 regular {array 1000 { 0 3 } 0 1 } {global 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "data_a", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "data_b", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "ALU_operation", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "ALU_operation_MEM", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 19
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ data_a_dout sc_in sc_lv 32 signal 0 } 
	{ data_a_empty_n sc_in sc_logic 1 signal 0 } 
	{ data_a_read sc_out sc_logic 1 signal 0 } 
	{ data_b_dout sc_in sc_lv 32 signal 1 } 
	{ data_b_empty_n sc_in sc_logic 1 signal 1 } 
	{ data_b_read sc_out sc_logic 1 signal 1 } 
	{ ALU_operation_dout sc_in sc_lv 32 signal 2 } 
	{ ALU_operation_empty_n sc_in sc_logic 1 signal 2 } 
	{ ALU_operation_read sc_out sc_logic 1 signal 2 } 
	{ ALU_operation_MEM_address0 sc_out sc_lv 10 signal 3 } 
	{ ALU_operation_MEM_ce0 sc_out sc_logic 1 signal 3 } 
	{ ALU_operation_MEM_we0 sc_out sc_logic 1 signal 3 } 
	{ ALU_operation_MEM_d0 sc_out sc_lv 32 signal 3 } 
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
 	{ "name": "ALU_operation_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ALU_operation", "role": "dout" }} , 
 	{ "name": "ALU_operation_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ALU_operation", "role": "empty_n" }} , 
 	{ "name": "ALU_operation_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ALU_operation", "role": "read" }} , 
 	{ "name": "ALU_operation_MEM_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "ALU_operation_MEM", "role": "address0" }} , 
 	{ "name": "ALU_operation_MEM_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ALU_operation_MEM", "role": "ce0" }} , 
 	{ "name": "ALU_operation_MEM_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ALU_operation_MEM", "role": "we0" }} , 
 	{ "name": "ALU_operation_MEM_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ALU_operation_MEM", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "5", "7"],
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
					{"ID" : "1", "SubInstance" : "grp_reset_Pipeline_clear_FIFO_a_fu_28", "Port" : "data_a", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "data_b", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_reset_Pipeline_clear_FIFO_b_fu_34", "Port" : "data_b", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "ALU_operation", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_reset_Pipeline_clear_ALU_op_fu_40", "Port" : "ALU_operation", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "ALU_operation_MEM", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_reset_Pipeline_clear_RAM_op_fu_46", "Port" : "ALU_operation_MEM", "Inst_start_state" : "7", "Inst_end_state" : "8"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_reset_Pipeline_clear_FIFO_a_fu_28", "Parent" : "0", "Child" : ["2"],
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
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_reset_Pipeline_clear_FIFO_a_fu_28.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_reset_Pipeline_clear_FIFO_b_fu_34", "Parent" : "0", "Child" : ["4"],
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
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_reset_Pipeline_clear_FIFO_b_fu_34.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_reset_Pipeline_clear_ALU_op_fu_40", "Parent" : "0", "Child" : ["6"],
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
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_reset_Pipeline_clear_ALU_op_fu_40.flow_control_loop_pipe_sequential_init_U", "Parent" : "5"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_reset_Pipeline_clear_RAM_op_fu_46", "Parent" : "0", "Child" : ["8"],
		"CDFG" : "reset_Pipeline_clear_RAM_op",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1002", "EstimateLatencyMax" : "1002",
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
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_reset_Pipeline_clear_RAM_op_fu_46.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"}]}


set ArgLastReadFirstWriteLatency {
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
	data_a { ap_fifo {  { data_a_dout fifo_data_in 0 32 }  { data_a_empty_n fifo_status 0 1 }  { data_a_read fifo_port_we 1 1 } } }
	data_b { ap_fifo {  { data_b_dout fifo_data_in 0 32 }  { data_b_empty_n fifo_status 0 1 }  { data_b_read fifo_port_we 1 1 } } }
	ALU_operation { ap_fifo {  { ALU_operation_dout fifo_data_in 0 32 }  { ALU_operation_empty_n fifo_status 0 1 }  { ALU_operation_read fifo_port_we 1 1 } } }
	ALU_operation_MEM { ap_memory {  { ALU_operation_MEM_address0 mem_address 1 10 }  { ALU_operation_MEM_ce0 mem_ce 1 1 }  { ALU_operation_MEM_we0 mem_we 1 1 }  { ALU_operation_MEM_d0 mem_din 1 32 } } }
}
