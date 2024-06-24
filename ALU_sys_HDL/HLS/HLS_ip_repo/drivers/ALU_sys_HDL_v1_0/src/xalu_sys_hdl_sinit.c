// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xalu_sys_hdl.h"

extern XAlu_sys_hdl_Config XAlu_sys_hdl_ConfigTable[];

#ifdef SDT
XAlu_sys_hdl_Config *XAlu_sys_hdl_LookupConfig(UINTPTR BaseAddress) {
	XAlu_sys_hdl_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XAlu_sys_hdl_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XAlu_sys_hdl_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XAlu_sys_hdl_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XAlu_sys_hdl_Initialize(XAlu_sys_hdl *InstancePtr, UINTPTR BaseAddress) {
	XAlu_sys_hdl_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XAlu_sys_hdl_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XAlu_sys_hdl_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XAlu_sys_hdl_Config *XAlu_sys_hdl_LookupConfig(u16 DeviceId) {
	XAlu_sys_hdl_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XALU_SYS_HDL_NUM_INSTANCES; Index++) {
		if (XAlu_sys_hdl_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XAlu_sys_hdl_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XAlu_sys_hdl_Initialize(XAlu_sys_hdl *InstancePtr, u16 DeviceId) {
	XAlu_sys_hdl_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XAlu_sys_hdl_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XAlu_sys_hdl_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

