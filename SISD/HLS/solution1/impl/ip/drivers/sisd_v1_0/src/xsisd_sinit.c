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
#include "xsisd.h"

extern XSisd_Config XSisd_ConfigTable[];

#ifdef SDT
XSisd_Config *XSisd_LookupConfig(UINTPTR BaseAddress) {
	XSisd_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XSisd_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XSisd_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XSisd_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XSisd_Initialize(XSisd *InstancePtr, UINTPTR BaseAddress) {
	XSisd_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XSisd_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XSisd_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XSisd_Config *XSisd_LookupConfig(u16 DeviceId) {
	XSisd_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XSISD_NUM_INSTANCES; Index++) {
		if (XSisd_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XSisd_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XSisd_Initialize(XSisd *InstancePtr, u16 DeviceId) {
	XSisd_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XSisd_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XSisd_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

