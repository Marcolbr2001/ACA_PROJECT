// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xsetmem.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XSetmem_CfgInitialize(XSetmem *InstancePtr, XSetmem_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XSetmem_Set_a(XSetmem *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSetmem_WriteReg(InstancePtr->Control_BaseAddress, XSETMEM_CONTROL_ADDR_A_DATA, (u32)(Data));
    XSetmem_WriteReg(InstancePtr->Control_BaseAddress, XSETMEM_CONTROL_ADDR_A_DATA + 4, (u32)(Data >> 32));
}

u64 XSetmem_Get_a(XSetmem *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSetmem_ReadReg(InstancePtr->Control_BaseAddress, XSETMEM_CONTROL_ADDR_A_DATA);
    Data += (u64)XSetmem_ReadReg(InstancePtr->Control_BaseAddress, XSETMEM_CONTROL_ADDR_A_DATA + 4) << 32;
    return Data;
}

void XSetmem_Set_b(XSetmem *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSetmem_WriteReg(InstancePtr->Control_BaseAddress, XSETMEM_CONTROL_ADDR_B_DATA, (u32)(Data));
    XSetmem_WriteReg(InstancePtr->Control_BaseAddress, XSETMEM_CONTROL_ADDR_B_DATA + 4, (u32)(Data >> 32));
}

u64 XSetmem_Get_b(XSetmem *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSetmem_ReadReg(InstancePtr->Control_BaseAddress, XSETMEM_CONTROL_ADDR_B_DATA);
    Data += (u64)XSetmem_ReadReg(InstancePtr->Control_BaseAddress, XSETMEM_CONTROL_ADDR_B_DATA + 4) << 32;
    return Data;
}

void XSetmem_Set_c(XSetmem *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSetmem_WriteReg(InstancePtr->Control_BaseAddress, XSETMEM_CONTROL_ADDR_C_DATA, (u32)(Data));
    XSetmem_WriteReg(InstancePtr->Control_BaseAddress, XSETMEM_CONTROL_ADDR_C_DATA + 4, (u32)(Data >> 32));
}

u64 XSetmem_Get_c(XSetmem *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSetmem_ReadReg(InstancePtr->Control_BaseAddress, XSETMEM_CONTROL_ADDR_C_DATA);
    Data += (u64)XSetmem_ReadReg(InstancePtr->Control_BaseAddress, XSETMEM_CONTROL_ADDR_C_DATA + 4) << 32;
    return Data;
}

