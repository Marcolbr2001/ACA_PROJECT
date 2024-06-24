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

void XSetmem_Start(XSetmem *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSetmem_ReadReg(InstancePtr->Control_BaseAddress, XSETMEM_CONTROL_ADDR_AP_CTRL) & 0x80;
    XSetmem_WriteReg(InstancePtr->Control_BaseAddress, XSETMEM_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XSetmem_IsDone(XSetmem *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSetmem_ReadReg(InstancePtr->Control_BaseAddress, XSETMEM_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XSetmem_IsIdle(XSetmem *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSetmem_ReadReg(InstancePtr->Control_BaseAddress, XSETMEM_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XSetmem_IsReady(XSetmem *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSetmem_ReadReg(InstancePtr->Control_BaseAddress, XSETMEM_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XSetmem_EnableAutoRestart(XSetmem *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSetmem_WriteReg(InstancePtr->Control_BaseAddress, XSETMEM_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XSetmem_DisableAutoRestart(XSetmem *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSetmem_WriteReg(InstancePtr->Control_BaseAddress, XSETMEM_CONTROL_ADDR_AP_CTRL, 0);
}

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

void XSetmem_Set_op(XSetmem *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSetmem_WriteReg(InstancePtr->Control_BaseAddress, XSETMEM_CONTROL_ADDR_OP_DATA, (u32)(Data));
    XSetmem_WriteReg(InstancePtr->Control_BaseAddress, XSETMEM_CONTROL_ADDR_OP_DATA + 4, (u32)(Data >> 32));
}

u64 XSetmem_Get_op(XSetmem *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSetmem_ReadReg(InstancePtr->Control_BaseAddress, XSETMEM_CONTROL_ADDR_OP_DATA);
    Data += (u64)XSetmem_ReadReg(InstancePtr->Control_BaseAddress, XSETMEM_CONTROL_ADDR_OP_DATA + 4) << 32;
    return Data;
}

void XSetmem_InterruptGlobalEnable(XSetmem *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSetmem_WriteReg(InstancePtr->Control_BaseAddress, XSETMEM_CONTROL_ADDR_GIE, 1);
}

void XSetmem_InterruptGlobalDisable(XSetmem *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSetmem_WriteReg(InstancePtr->Control_BaseAddress, XSETMEM_CONTROL_ADDR_GIE, 0);
}

void XSetmem_InterruptEnable(XSetmem *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XSetmem_ReadReg(InstancePtr->Control_BaseAddress, XSETMEM_CONTROL_ADDR_IER);
    XSetmem_WriteReg(InstancePtr->Control_BaseAddress, XSETMEM_CONTROL_ADDR_IER, Register | Mask);
}

void XSetmem_InterruptDisable(XSetmem *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XSetmem_ReadReg(InstancePtr->Control_BaseAddress, XSETMEM_CONTROL_ADDR_IER);
    XSetmem_WriteReg(InstancePtr->Control_BaseAddress, XSETMEM_CONTROL_ADDR_IER, Register & (~Mask));
}

void XSetmem_InterruptClear(XSetmem *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSetmem_WriteReg(InstancePtr->Control_BaseAddress, XSETMEM_CONTROL_ADDR_ISR, Mask);
}

u32 XSetmem_InterruptGetEnabled(XSetmem *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSetmem_ReadReg(InstancePtr->Control_BaseAddress, XSETMEM_CONTROL_ADDR_IER);
}

u32 XSetmem_InterruptGetStatus(XSetmem *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSetmem_ReadReg(InstancePtr->Control_BaseAddress, XSETMEM_CONTROL_ADDR_ISR);
}

