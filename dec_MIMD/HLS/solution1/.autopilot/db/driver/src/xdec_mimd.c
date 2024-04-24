// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xdec_mimd.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XDec_mimd_CfgInitialize(XDec_mimd *InstancePtr, XDec_mimd_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XDec_mimd_Start(XDec_mimd *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDec_mimd_ReadReg(InstancePtr->Control_BaseAddress, XDEC_MIMD_CONTROL_ADDR_AP_CTRL) & 0x80;
    XDec_mimd_WriteReg(InstancePtr->Control_BaseAddress, XDEC_MIMD_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XDec_mimd_IsDone(XDec_mimd *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDec_mimd_ReadReg(InstancePtr->Control_BaseAddress, XDEC_MIMD_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XDec_mimd_IsIdle(XDec_mimd *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDec_mimd_ReadReg(InstancePtr->Control_BaseAddress, XDEC_MIMD_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XDec_mimd_IsReady(XDec_mimd *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDec_mimd_ReadReg(InstancePtr->Control_BaseAddress, XDEC_MIMD_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XDec_mimd_EnableAutoRestart(XDec_mimd *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDec_mimd_WriteReg(InstancePtr->Control_BaseAddress, XDEC_MIMD_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XDec_mimd_DisableAutoRestart(XDec_mimd *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDec_mimd_WriteReg(InstancePtr->Control_BaseAddress, XDEC_MIMD_CONTROL_ADDR_AP_CTRL, 0);
}

void XDec_mimd_Set_a(XDec_mimd *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDec_mimd_WriteReg(InstancePtr->Control_BaseAddress, XDEC_MIMD_CONTROL_ADDR_A_DATA, (u32)(Data));
    XDec_mimd_WriteReg(InstancePtr->Control_BaseAddress, XDEC_MIMD_CONTROL_ADDR_A_DATA + 4, (u32)(Data >> 32));
}

u64 XDec_mimd_Get_a(XDec_mimd *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDec_mimd_ReadReg(InstancePtr->Control_BaseAddress, XDEC_MIMD_CONTROL_ADDR_A_DATA);
    Data += (u64)XDec_mimd_ReadReg(InstancePtr->Control_BaseAddress, XDEC_MIMD_CONTROL_ADDR_A_DATA + 4) << 32;
    return Data;
}

void XDec_mimd_Set_b(XDec_mimd *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDec_mimd_WriteReg(InstancePtr->Control_BaseAddress, XDEC_MIMD_CONTROL_ADDR_B_DATA, (u32)(Data));
    XDec_mimd_WriteReg(InstancePtr->Control_BaseAddress, XDEC_MIMD_CONTROL_ADDR_B_DATA + 4, (u32)(Data >> 32));
}

u64 XDec_mimd_Get_b(XDec_mimd *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDec_mimd_ReadReg(InstancePtr->Control_BaseAddress, XDEC_MIMD_CONTROL_ADDR_B_DATA);
    Data += (u64)XDec_mimd_ReadReg(InstancePtr->Control_BaseAddress, XDEC_MIMD_CONTROL_ADDR_B_DATA + 4) << 32;
    return Data;
}

void XDec_mimd_Set_c(XDec_mimd *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDec_mimd_WriteReg(InstancePtr->Control_BaseAddress, XDEC_MIMD_CONTROL_ADDR_C_DATA, (u32)(Data));
    XDec_mimd_WriteReg(InstancePtr->Control_BaseAddress, XDEC_MIMD_CONTROL_ADDR_C_DATA + 4, (u32)(Data >> 32));
}

u64 XDec_mimd_Get_c(XDec_mimd *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDec_mimd_ReadReg(InstancePtr->Control_BaseAddress, XDEC_MIMD_CONTROL_ADDR_C_DATA);
    Data += (u64)XDec_mimd_ReadReg(InstancePtr->Control_BaseAddress, XDEC_MIMD_CONTROL_ADDR_C_DATA + 4) << 32;
    return Data;
}

void XDec_mimd_Set_op(XDec_mimd *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDec_mimd_WriteReg(InstancePtr->Control_BaseAddress, XDEC_MIMD_CONTROL_ADDR_OP_DATA, (u32)(Data));
    XDec_mimd_WriteReg(InstancePtr->Control_BaseAddress, XDEC_MIMD_CONTROL_ADDR_OP_DATA + 4, (u32)(Data >> 32));
}

u64 XDec_mimd_Get_op(XDec_mimd *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDec_mimd_ReadReg(InstancePtr->Control_BaseAddress, XDEC_MIMD_CONTROL_ADDR_OP_DATA);
    Data += (u64)XDec_mimd_ReadReg(InstancePtr->Control_BaseAddress, XDEC_MIMD_CONTROL_ADDR_OP_DATA + 4) << 32;
    return Data;
}

void XDec_mimd_Set_selec(XDec_mimd *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDec_mimd_WriteReg(InstancePtr->Control_BaseAddress, XDEC_MIMD_CONTROL_ADDR_SELEC_DATA, Data);
}

u32 XDec_mimd_Get_selec(XDec_mimd *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDec_mimd_ReadReg(InstancePtr->Control_BaseAddress, XDEC_MIMD_CONTROL_ADDR_SELEC_DATA);
    return Data;
}

void XDec_mimd_InterruptGlobalEnable(XDec_mimd *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDec_mimd_WriteReg(InstancePtr->Control_BaseAddress, XDEC_MIMD_CONTROL_ADDR_GIE, 1);
}

void XDec_mimd_InterruptGlobalDisable(XDec_mimd *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDec_mimd_WriteReg(InstancePtr->Control_BaseAddress, XDEC_MIMD_CONTROL_ADDR_GIE, 0);
}

void XDec_mimd_InterruptEnable(XDec_mimd *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XDec_mimd_ReadReg(InstancePtr->Control_BaseAddress, XDEC_MIMD_CONTROL_ADDR_IER);
    XDec_mimd_WriteReg(InstancePtr->Control_BaseAddress, XDEC_MIMD_CONTROL_ADDR_IER, Register | Mask);
}

void XDec_mimd_InterruptDisable(XDec_mimd *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XDec_mimd_ReadReg(InstancePtr->Control_BaseAddress, XDEC_MIMD_CONTROL_ADDR_IER);
    XDec_mimd_WriteReg(InstancePtr->Control_BaseAddress, XDEC_MIMD_CONTROL_ADDR_IER, Register & (~Mask));
}

void XDec_mimd_InterruptClear(XDec_mimd *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDec_mimd_WriteReg(InstancePtr->Control_BaseAddress, XDEC_MIMD_CONTROL_ADDR_ISR, Mask);
}

u32 XDec_mimd_InterruptGetEnabled(XDec_mimd *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDec_mimd_ReadReg(InstancePtr->Control_BaseAddress, XDEC_MIMD_CONTROL_ADDR_IER);
}

u32 XDec_mimd_InterruptGetStatus(XDec_mimd *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDec_mimd_ReadReg(InstancePtr->Control_BaseAddress, XDEC_MIMD_CONTROL_ADDR_ISR);
}

