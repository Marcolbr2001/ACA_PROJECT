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
#include "xsetmem.h"

extern XSetmem_Config XSetmem_ConfigTable[];

#ifdef SDT
XSetmem_Config *XSetmem_LookupConfig(UINTPTR BaseAddress) {
	XSetmem_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XSetmem_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XSetmem_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XSetmem_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XSetmem_Initialize(XSetmem *InstancePtr, UINTPTR BaseAddress) {
	XSetmem_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XSetmem_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XSetmem_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XSetmem_Config *XSetmem_LookupConfig(u16 DeviceId) {
	XSetmem_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XSETMEM_NUM_INSTANCES; Index++) {
		if (XSetmem_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XSetmem_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XSetmem_Initialize(XSetmem *InstancePtr, u16 DeviceId) {
	XSetmem_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XSetmem_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XSetmem_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

