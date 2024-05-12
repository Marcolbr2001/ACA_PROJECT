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
#include "xalv_mimd.h"

extern XAlv_mimd_Config XAlv_mimd_ConfigTable[];

#ifdef SDT
XAlv_mimd_Config *XAlv_mimd_LookupConfig(UINTPTR BaseAddress) {
	XAlv_mimd_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XAlv_mimd_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XAlv_mimd_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XAlv_mimd_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XAlv_mimd_Initialize(XAlv_mimd *InstancePtr, UINTPTR BaseAddress) {
	XAlv_mimd_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XAlv_mimd_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XAlv_mimd_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XAlv_mimd_Config *XAlv_mimd_LookupConfig(u16 DeviceId) {
	XAlv_mimd_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XALV_MIMD_NUM_INSTANCES; Index++) {
		if (XAlv_mimd_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XAlv_mimd_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XAlv_mimd_Initialize(XAlv_mimd *InstancePtr, u16 DeviceId) {
	XAlv_mimd_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XAlv_mimd_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XAlv_mimd_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

