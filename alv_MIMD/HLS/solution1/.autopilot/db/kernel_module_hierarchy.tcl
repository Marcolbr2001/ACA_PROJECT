set ModuleHierarchy {[{
"Name" : "alv_MIMD","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_lod_exe_wb_fu_114","ID" : "1","Type" : "dataflow",
		"SubInsts" : [
		{"Name" : "load_op_U0","ID" : "2","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "l_operation","ID" : "3","Type" : "pipeline"},]},
		{"Name" : "load_data_a_U0","ID" : "4","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "l_data_a","ID" : "5","Type" : "pipeline"},]},
		{"Name" : "load_data_b_U0","ID" : "6","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "l_data_b","ID" : "7","Type" : "pipeline"},]},
		{"Name" : "execute_U0","ID" : "8","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "exe","ID" : "9","Type" : "pipeline"},]},
		{"Name" : "entry_proc_U0","ID" : "10","Type" : "sequential"},
		{"Name" : "write_back_U0","ID" : "11","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_write_back_Pipeline_write_back_fu_46","ID" : "12","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "write_back","ID" : "13","Type" : "pipeline"},]},]},]},]
}]}