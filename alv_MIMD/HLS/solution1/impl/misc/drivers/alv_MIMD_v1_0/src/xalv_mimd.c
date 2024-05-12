// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xalv_mimd.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XAlv_mimd_CfgInitialize(XAlv_mimd *InstancePtr, XAlv_mimd_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XAlv_mimd_Start(XAlv_mimd *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlv_mimd_ReadReg(InstancePtr->Control_BaseAddress, XALV_MIMD_CONTROL_ADDR_AP_CTRL) & 0x80;
    XAlv_mimd_WriteReg(InstancePtr->Control_BaseAddress, XALV_MIMD_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XAlv_mimd_IsDone(XAlv_mimd *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlv_mimd_ReadReg(InstancePtr->Control_BaseAddress, XALV_MIMD_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XAlv_mimd_IsIdle(XAlv_mimd *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlv_mimd_ReadReg(InstancePtr->Control_BaseAddress, XALV_MIMD_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XAlv_mimd_IsReady(XAlv_mimd *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlv_mimd_ReadReg(InstancePtr->Control_BaseAddress, XALV_MIMD_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XAlv_mimd_EnableAutoRestart(XAlv_mimd *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlv_mimd_WriteReg(InstancePtr->Control_BaseAddress, XALV_MIMD_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XAlv_mimd_DisableAutoRestart(XAlv_mimd *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlv_mimd_WriteReg(InstancePtr->Control_BaseAddress, XALV_MIMD_CONTROL_ADDR_AP_CTRL, 0);
}

void XAlv_mimd_Set_a(XAlv_mimd *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlv_mimd_WriteReg(InstancePtr->Control_BaseAddress, XALV_MIMD_CONTROL_ADDR_A_DATA, (u32)(Data));
    XAlv_mimd_WriteReg(InstancePtr->Control_BaseAddress, XALV_MIMD_CONTROL_ADDR_A_DATA + 4, (u32)(Data >> 32));
}

u64 XAlv_mimd_Get_a(XAlv_mimd *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlv_mimd_ReadReg(InstancePtr->Control_BaseAddress, XALV_MIMD_CONTROL_ADDR_A_DATA);
    Data += (u64)XAlv_mimd_ReadReg(InstancePtr->Control_BaseAddress, XALV_MIMD_CONTROL_ADDR_A_DATA + 4) << 32;
    return Data;
}

void XAlv_mimd_Set_b(XAlv_mimd *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlv_mimd_WriteReg(InstancePtr->Control_BaseAddress, XALV_MIMD_CONTROL_ADDR_B_DATA, (u32)(Data));
    XAlv_mimd_WriteReg(InstancePtr->Control_BaseAddress, XALV_MIMD_CONTROL_ADDR_B_DATA + 4, (u32)(Data >> 32));
}

u64 XAlv_mimd_Get_b(XAlv_mimd *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlv_mimd_ReadReg(InstancePtr->Control_BaseAddress, XALV_MIMD_CONTROL_ADDR_B_DATA);
    Data += (u64)XAlv_mimd_ReadReg(InstancePtr->Control_BaseAddress, XALV_MIMD_CONTROL_ADDR_B_DATA + 4) << 32;
    return Data;
}

void XAlv_mimd_Set_c(XAlv_mimd *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlv_mimd_WriteReg(InstancePtr->Control_BaseAddress, XALV_MIMD_CONTROL_ADDR_C_DATA, (u32)(Data));
    XAlv_mimd_WriteReg(InstancePtr->Control_BaseAddress, XALV_MIMD_CONTROL_ADDR_C_DATA + 4, (u32)(Data >> 32));
}

u64 XAlv_mimd_Get_c(XAlv_mimd *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlv_mimd_ReadReg(InstancePtr->Control_BaseAddress, XALV_MIMD_CONTROL_ADDR_C_DATA);
    Data += (u64)XAlv_mimd_ReadReg(InstancePtr->Control_BaseAddress, XALV_MIMD_CONTROL_ADDR_C_DATA + 4) << 32;
    return Data;
}

void XAlv_mimd_Set_op(XAlv_mimd *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlv_mimd_WriteReg(InstancePtr->Control_BaseAddress, XALV_MIMD_CONTROL_ADDR_OP_DATA, (u32)(Data));
    XAlv_mimd_WriteReg(InstancePtr->Control_BaseAddress, XALV_MIMD_CONTROL_ADDR_OP_DATA + 4, (u32)(Data >> 32));
}

u64 XAlv_mimd_Get_op(XAlv_mimd *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlv_mimd_ReadReg(InstancePtr->Control_BaseAddress, XALV_MIMD_CONTROL_ADDR_OP_DATA);
    Data += (u64)XAlv_mimd_ReadReg(InstancePtr->Control_BaseAddress, XALV_MIMD_CONTROL_ADDR_OP_DATA + 4) << 32;
    return Data;
}

void XAlv_mimd_Set_selec(XAlv_mimd *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlv_mimd_WriteReg(InstancePtr->Control_BaseAddress, XALV_MIMD_CONTROL_ADDR_SELEC_DATA, Data);
}

u32 XAlv_mimd_Get_selec(XAlv_mimd *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlv_mimd_ReadReg(InstancePtr->Control_BaseAddress, XALV_MIMD_CONTROL_ADDR_SELEC_DATA);
    return Data;
}

void XAlv_mimd_InterruptGlobalEnable(XAlv_mimd *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlv_mimd_WriteReg(InstancePtr->Control_BaseAddress, XALV_MIMD_CONTROL_ADDR_GIE, 1);
}

void XAlv_mimd_InterruptGlobalDisable(XAlv_mimd *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlv_mimd_WriteReg(InstancePtr->Control_BaseAddress, XALV_MIMD_CONTROL_ADDR_GIE, 0);
}

void XAlv_mimd_InterruptEnable(XAlv_mimd *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XAlv_mimd_ReadReg(InstancePtr->Control_BaseAddress, XALV_MIMD_CONTROL_ADDR_IER);
    XAlv_mimd_WriteReg(InstancePtr->Control_BaseAddress, XALV_MIMD_CONTROL_ADDR_IER, Register | Mask);
}

void XAlv_mimd_InterruptDisable(XAlv_mimd *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XAlv_mimd_ReadReg(InstancePtr->Control_BaseAddress, XALV_MIMD_CONTROL_ADDR_IER);
    XAlv_mimd_WriteReg(InstancePtr->Control_BaseAddress, XALV_MIMD_CONTROL_ADDR_IER, Register & (~Mask));
}

void XAlv_mimd_InterruptClear(XAlv_mimd *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlv_mimd_WriteReg(InstancePtr->Control_BaseAddress, XALV_MIMD_CONTROL_ADDR_ISR, Mask);
}

u32 XAlv_mimd_InterruptGetEnabled(XAlv_mimd *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XAlv_mimd_ReadReg(InstancePtr->Control_BaseAddress, XALV_MIMD_CONTROL_ADDR_IER);
}

u32 XAlv_mimd_InterruptGetStatus(XAlv_mimd *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XAlv_mimd_ReadReg(InstancePtr->Control_BaseAddress, XALV_MIMD_CONTROL_ADDR_ISR);
}

