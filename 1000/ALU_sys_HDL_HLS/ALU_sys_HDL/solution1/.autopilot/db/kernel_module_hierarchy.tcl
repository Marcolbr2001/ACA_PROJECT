set ModuleHierarchy {[{
"Name" : "ALU_sys_HDL","ID" : "0","Type" : "dataflow",
"SubInsts" : [
	{"Name" : "Block_entry1_proc_U0","ID" : "1","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_op_data_exe_wb_fu_112","ID" : "2","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_op_data_exe_wb_Pipeline_l_operation_fu_92","ID" : "3","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "l_operation","ID" : "4","Type" : "pipeline"},]},
			{"Name" : "grp_op_data_exe_wb_Pipeline_l_data_a_fu_101","ID" : "5","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "l_data_a","ID" : "6","Type" : "pipeline"},]},
			{"Name" : "grp_op_data_exe_wb_Pipeline_l_data_b_fu_110","ID" : "7","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "l_data_b","ID" : "8","Type" : "pipeline"},]},
			{"Name" : "grp_op_data_exe_wb_Pipeline_s_operation_data_op_fu_119","ID" : "9","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "s_operation_data_op","ID" : "10","Type" : "pipeline"},]},
			{"Name" : "grp_op_data_exe_wb_Pipeline_exe_fu_127","ID" : "11","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "exe","ID" : "12","Type" : "pipeline"},]},
			{"Name" : "grp_op_data_exe_wb_Pipeline_write_back_fu_139","ID" : "13","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "write_back","ID" : "14","Type" : "pipeline"},]},]},
		{"Name" : "grp_data_exe_wb_fu_142","ID" : "15","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_data_exe_wb_Pipeline_l_data_a_fu_74","ID" : "16","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "l_data_a","ID" : "17","Type" : "pipeline"},]},
			{"Name" : "grp_data_exe_wb_Pipeline_l_data_b_fu_83","ID" : "18","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "l_data_b","ID" : "19","Type" : "pipeline"},]},
			{"Name" : "grp_data_exe_wb_Pipeline_exe_fu_92","ID" : "20","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "exe","ID" : "21","Type" : "pipeline"},]},
			{"Name" : "grp_data_exe_wb_Pipeline_write_back_fu_104","ID" : "22","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "write_back","ID" : "23","Type" : "pipeline"},]},]},
		{"Name" : "grp_operation_fu_166","ID" : "24","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_operation_Pipeline_l_operation_fu_42","ID" : "25","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "l_operation","ID" : "26","Type" : "pipeline"},]},
			{"Name" : "grp_operation_Pipeline_s_operation_data_op_fu_51","ID" : "27","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "s_operation_data_op","ID" : "28","Type" : "pipeline"},]},]},
		{"Name" : "grp_reset_fu_178","ID" : "29","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_reset_Pipeline_clear_FIFO_a_fu_28","ID" : "30","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "clear_FIFO_a","ID" : "31","Type" : "pipeline"},]},
			{"Name" : "grp_reset_Pipeline_clear_FIFO_b_fu_34","ID" : "32","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "clear_FIFO_b","ID" : "33","Type" : "pipeline"},]},
			{"Name" : "grp_reset_Pipeline_clear_ALU_op_fu_40","ID" : "34","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "clear_ALU_op","ID" : "35","Type" : "pipeline"},]},
			{"Name" : "grp_reset_Pipeline_clear_RAM_op_fu_46","ID" : "36","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "clear_RAM_op","ID" : "37","Type" : "pipeline"},]},]},]},]
}]}