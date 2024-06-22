// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xsisd.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XSisd_CfgInitialize(XSisd *InstancePtr, XSisd_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XSisd_Start(XSisd *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSisd_ReadReg(InstancePtr->Control_BaseAddress, XSISD_CONTROL_ADDR_AP_CTRL) & 0x80;
    XSisd_WriteReg(InstancePtr->Control_BaseAddress, XSISD_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XSisd_IsDone(XSisd *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSisd_ReadReg(InstancePtr->Control_BaseAddress, XSISD_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XSisd_IsIdle(XSisd *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSisd_ReadReg(InstancePtr->Control_BaseAddress, XSISD_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XSisd_IsReady(XSisd *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSisd_ReadReg(InstancePtr->Control_BaseAddress, XSISD_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XSisd_EnableAutoRestart(XSisd *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSisd_WriteReg(InstancePtr->Control_BaseAddress, XSISD_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XSisd_DisableAutoRestart(XSisd *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSisd_WriteReg(InstancePtr->Control_BaseAddress, XSISD_CONTROL_ADDR_AP_CTRL, 0);
}

u32 XSisd_Get_return(XSisd *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSisd_ReadReg(InstancePtr->Control_BaseAddress, XSISD_CONTROL_ADDR_AP_RETURN);
    return Data;
}
void XSisd_Set_a(XSisd *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSisd_WriteReg(InstancePtr->Control_BaseAddress, XSISD_CONTROL_ADDR_A_DATA, Data);
}

u32 XSisd_Get_a(XSisd *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSisd_ReadReg(InstancePtr->Control_BaseAddress, XSISD_CONTROL_ADDR_A_DATA);
    return Data;
}

void XSisd_Set_b(XSisd *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSisd_WriteReg(InstancePtr->Control_BaseAddress, XSISD_CONTROL_ADDR_B_DATA, Data);
}

u32 XSisd_Get_b(XSisd *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSisd_ReadReg(InstancePtr->Control_BaseAddress, XSISD_CONTROL_ADDR_B_DATA);
    return Data;
}

void XSisd_Set_op(XSisd *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSisd_WriteReg(InstancePtr->Control_BaseAddress, XSISD_CONTROL_ADDR_OP_DATA, Data);
}

u32 XSisd_Get_op(XSisd *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSisd_ReadReg(InstancePtr->Control_BaseAddress, XSISD_CONTROL_ADDR_OP_DATA);
    return Data;
}

void XSisd_InterruptGlobalEnable(XSisd *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSisd_WriteReg(InstancePtr->Control_BaseAddress, XSISD_CONTROL_ADDR_GIE, 1);
}

void XSisd_InterruptGlobalDisable(XSisd *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSisd_WriteReg(InstancePtr->Control_BaseAddress, XSISD_CONTROL_ADDR_GIE, 0);
}

void XSisd_InterruptEnable(XSisd *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XSisd_ReadReg(InstancePtr->Control_BaseAddress, XSISD_CONTROL_ADDR_IER);
    XSisd_WriteReg(InstancePtr->Control_BaseAddress, XSISD_CONTROL_ADDR_IER, Register | Mask);
}

void XSisd_InterruptDisable(XSisd *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XSisd_ReadReg(InstancePtr->Control_BaseAddress, XSISD_CONTROL_ADDR_IER);
    XSisd_WriteReg(InstancePtr->Control_BaseAddress, XSISD_CONTROL_ADDR_IER, Register & (~Mask));
}

void XSisd_InterruptClear(XSisd *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSisd_WriteReg(InstancePtr->Control_BaseAddress, XSISD_CONTROL_ADDR_ISR, Mask);
}

u32 XSisd_InterruptGetEnabled(XSisd *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSisd_ReadReg(InstancePtr->Control_BaseAddress, XSISD_CONTROL_ADDR_IER);
}

u32 XSisd_InterruptGetStatus(XSisd *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSisd_ReadReg(InstancePtr->Control_BaseAddress, XSISD_CONTROL_ADDR_ISR);
}

