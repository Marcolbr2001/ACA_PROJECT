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
#include "xalv_vhdl.h"

extern XAlv_vhdl_Config XAlv_vhdl_ConfigTable[];

#ifdef SDT
XAlv_vhdl_Config *XAlv_vhdl_LookupConfig(UINTPTR BaseAddress) {
	XAlv_vhdl_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XAlv_vhdl_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XAlv_vhdl_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XAlv_vhdl_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XAlv_vhdl_Initialize(XAlv_vhdl *InstancePtr, UINTPTR BaseAddress) {
	XAlv_vhdl_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XAlv_vhdl_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XAlv_vhdl_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XAlv_vhdl_Config *XAlv_vhdl_LookupConfig(u16 DeviceId) {
	XAlv_vhdl_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XALV_VHDL_NUM_INSTANCES; Index++) {
		if (XAlv_vhdl_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XAlv_vhdl_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XAlv_vhdl_Initialize(XAlv_vhdl *InstancePtr, u16 DeviceId) {
	XAlv_vhdl_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XAlv_vhdl_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XAlv_vhdl_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

