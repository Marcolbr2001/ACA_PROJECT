// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xalu_sys_hdl.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XAlu_sys_hdl_CfgInitialize(XAlu_sys_hdl *InstancePtr, XAlu_sys_hdl_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XAlu_sys_hdl_Start(XAlu_sys_hdl *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlu_sys_hdl_ReadReg(InstancePtr->Control_BaseAddress, XALU_SYS_HDL_CONTROL_ADDR_AP_CTRL) & 0x80;
    XAlu_sys_hdl_WriteReg(InstancePtr->Control_BaseAddress, XALU_SYS_HDL_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XAlu_sys_hdl_IsDone(XAlu_sys_hdl *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlu_sys_hdl_ReadReg(InstancePtr->Control_BaseAddress, XALU_SYS_HDL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XAlu_sys_hdl_IsIdle(XAlu_sys_hdl *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlu_sys_hdl_ReadReg(InstancePtr->Control_BaseAddress, XALU_SYS_HDL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XAlu_sys_hdl_IsReady(XAlu_sys_hdl *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlu_sys_hdl_ReadReg(InstancePtr->Control_BaseAddress, XALU_SYS_HDL_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XAlu_sys_hdl_EnableAutoRestart(XAlu_sys_hdl *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlu_sys_hdl_WriteReg(InstancePtr->Control_BaseAddress, XALU_SYS_HDL_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XAlu_sys_hdl_DisableAutoRestart(XAlu_sys_hdl *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlu_sys_hdl_WriteReg(InstancePtr->Control_BaseAddress, XALU_SYS_HDL_CONTROL_ADDR_AP_CTRL, 0);
}

void XAlu_sys_hdl_Set_a(XAlu_sys_hdl *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlu_sys_hdl_WriteReg(InstancePtr->Control_BaseAddress, XALU_SYS_HDL_CONTROL_ADDR_A_DATA, (u32)(Data));
    XAlu_sys_hdl_WriteReg(InstancePtr->Control_BaseAddress, XALU_SYS_HDL_CONTROL_ADDR_A_DATA + 4, (u32)(Data >> 32));
}

u64 XAlu_sys_hdl_Get_a(XAlu_sys_hdl *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlu_sys_hdl_ReadReg(InstancePtr->Control_BaseAddress, XALU_SYS_HDL_CONTROL_ADDR_A_DATA);
    Data += (u64)XAlu_sys_hdl_ReadReg(InstancePtr->Control_BaseAddress, XALU_SYS_HDL_CONTROL_ADDR_A_DATA + 4) << 32;
    return Data;
}

void XAlu_sys_hdl_Set_b(XAlu_sys_hdl *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlu_sys_hdl_WriteReg(InstancePtr->Control_BaseAddress, XALU_SYS_HDL_CONTROL_ADDR_B_DATA, (u32)(Data));
    XAlu_sys_hdl_WriteReg(InstancePtr->Control_BaseAddress, XALU_SYS_HDL_CONTROL_ADDR_B_DATA + 4, (u32)(Data >> 32));
}

u64 XAlu_sys_hdl_Get_b(XAlu_sys_hdl *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlu_sys_hdl_ReadReg(InstancePtr->Control_BaseAddress, XALU_SYS_HDL_CONTROL_ADDR_B_DATA);
    Data += (u64)XAlu_sys_hdl_ReadReg(InstancePtr->Control_BaseAddress, XALU_SYS_HDL_CONTROL_ADDR_B_DATA + 4) << 32;
    return Data;
}

void XAlu_sys_hdl_Set_c(XAlu_sys_hdl *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlu_sys_hdl_WriteReg(InstancePtr->Control_BaseAddress, XALU_SYS_HDL_CONTROL_ADDR_C_DATA, (u32)(Data));
    XAlu_sys_hdl_WriteReg(InstancePtr->Control_BaseAddress, XALU_SYS_HDL_CONTROL_ADDR_C_DATA + 4, (u32)(Data >> 32));
}

u64 XAlu_sys_hdl_Get_c(XAlu_sys_hdl *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlu_sys_hdl_ReadReg(InstancePtr->Control_BaseAddress, XALU_SYS_HDL_CONTROL_ADDR_C_DATA);
    Data += (u64)XAlu_sys_hdl_ReadReg(InstancePtr->Control_BaseAddress, XALU_SYS_HDL_CONTROL_ADDR_C_DATA + 4) << 32;
    return Data;
}

void XAlu_sys_hdl_Set_op(XAlu_sys_hdl *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlu_sys_hdl_WriteReg(InstancePtr->Control_BaseAddress, XALU_SYS_HDL_CONTROL_ADDR_OP_DATA, (u32)(Data));
    XAlu_sys_hdl_WriteReg(InstancePtr->Control_BaseAddress, XALU_SYS_HDL_CONTROL_ADDR_OP_DATA + 4, (u32)(Data >> 32));
}

u64 XAlu_sys_hdl_Get_op(XAlu_sys_hdl *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlu_sys_hdl_ReadReg(InstancePtr->Control_BaseAddress, XALU_SYS_HDL_CONTROL_ADDR_OP_DATA);
    Data += (u64)XAlu_sys_hdl_ReadReg(InstancePtr->Control_BaseAddress, XALU_SYS_HDL_CONTROL_ADDR_OP_DATA + 4) << 32;
    return Data;
}

void XAlu_sys_hdl_Set_selec(XAlu_sys_hdl *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlu_sys_hdl_WriteReg(InstancePtr->Control_BaseAddress, XALU_SYS_HDL_CONTROL_ADDR_SELEC_DATA, Data);
}

u32 XAlu_sys_hdl_Get_selec(XAlu_sys_hdl *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlu_sys_hdl_ReadReg(InstancePtr->Control_BaseAddress, XALU_SYS_HDL_CONTROL_ADDR_SELEC_DATA);
    return Data;
}

void XAlu_sys_hdl_InterruptGlobalEnable(XAlu_sys_hdl *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlu_sys_hdl_WriteReg(InstancePtr->Control_BaseAddress, XALU_SYS_HDL_CONTROL_ADDR_GIE, 1);
}

void XAlu_sys_hdl_InterruptGlobalDisable(XAlu_sys_hdl *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlu_sys_hdl_WriteReg(InstancePtr->Control_BaseAddress, XALU_SYS_HDL_CONTROL_ADDR_GIE, 0);
}

void XAlu_sys_hdl_InterruptEnable(XAlu_sys_hdl *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XAlu_sys_hdl_ReadReg(InstancePtr->Control_BaseAddress, XALU_SYS_HDL_CONTROL_ADDR_IER);
    XAlu_sys_hdl_WriteReg(InstancePtr->Control_BaseAddress, XALU_SYS_HDL_CONTROL_ADDR_IER, Register | Mask);
}

void XAlu_sys_hdl_InterruptDisable(XAlu_sys_hdl *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XAlu_sys_hdl_ReadReg(InstancePtr->Control_BaseAddress, XALU_SYS_HDL_CONTROL_ADDR_IER);
    XAlu_sys_hdl_WriteReg(InstancePtr->Control_BaseAddress, XALU_SYS_HDL_CONTROL_ADDR_IER, Register & (~Mask));
}

void XAlu_sys_hdl_InterruptClear(XAlu_sys_hdl *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlu_sys_hdl_WriteReg(InstancePtr->Control_BaseAddress, XALU_SYS_HDL_CONTROL_ADDR_ISR, Mask);
}

u32 XAlu_sys_hdl_InterruptGetEnabled(XAlu_sys_hdl *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XAlu_sys_hdl_ReadReg(InstancePtr->Control_BaseAddress, XALU_SYS_HDL_CONTROL_ADDR_IER);
}

u32 XAlu_sys_hdl_InterruptGetStatus(XAlu_sys_hdl *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XAlu_sys_hdl_ReadReg(InstancePtr->Control_BaseAddress, XALU_SYS_HDL_CONTROL_ADDR_ISR);
}

