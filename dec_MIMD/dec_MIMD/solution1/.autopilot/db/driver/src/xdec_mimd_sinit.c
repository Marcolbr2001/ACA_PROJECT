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
#include "xdec_mimd.h"

extern XDec_mimd_Config XDec_mimd_ConfigTable[];

#ifdef SDT
XDec_mimd_Config *XDec_mimd_LookupConfig(UINTPTR BaseAddress) {
	XDec_mimd_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XDec_mimd_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XDec_mimd_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XDec_mimd_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XDec_mimd_Initialize(XDec_mimd *InstancePtr, UINTPTR BaseAddress) {
	XDec_mimd_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XDec_mimd_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XDec_mimd_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XDec_mimd_Config *XDec_mimd_LookupConfig(u16 DeviceId) {
	XDec_mimd_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XDEC_MIMD_NUM_INSTANCES; Index++) {
		if (XDec_mimd_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XDec_mimd_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XDec_mimd_Initialize(XDec_mimd *InstancePtr, u16 DeviceId) {
	XDec_mimd_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XDec_mimd_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XDec_mimd_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

