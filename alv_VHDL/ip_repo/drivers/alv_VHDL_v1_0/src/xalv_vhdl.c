// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xalv_vhdl.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XAlv_vhdl_CfgInitialize(XAlv_vhdl *InstancePtr, XAlv_vhdl_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XAlv_vhdl_Start(XAlv_vhdl *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlv_vhdl_ReadReg(InstancePtr->Control_BaseAddress, XALV_VHDL_CONTROL_ADDR_AP_CTRL) & 0x80;
    XAlv_vhdl_WriteReg(InstancePtr->Control_BaseAddress, XALV_VHDL_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XAlv_vhdl_IsDone(XAlv_vhdl *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlv_vhdl_ReadReg(InstancePtr->Control_BaseAddress, XALV_VHDL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XAlv_vhdl_IsIdle(XAlv_vhdl *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlv_vhdl_ReadReg(InstancePtr->Control_BaseAddress, XALV_VHDL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XAlv_vhdl_IsReady(XAlv_vhdl *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlv_vhdl_ReadReg(InstancePtr->Control_BaseAddress, XALV_VHDL_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XAlv_vhdl_EnableAutoRestart(XAlv_vhdl *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlv_vhdl_WriteReg(InstancePtr->Control_BaseAddress, XALV_VHDL_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XAlv_vhdl_DisableAutoRestart(XAlv_vhdl *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlv_vhdl_WriteReg(InstancePtr->Control_BaseAddress, XALV_VHDL_CONTROL_ADDR_AP_CTRL, 0);
}

void XAlv_vhdl_Set_a(XAlv_vhdl *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlv_vhdl_WriteReg(InstancePtr->Control_BaseAddress, XALV_VHDL_CONTROL_ADDR_A_DATA, (u32)(Data));
    XAlv_vhdl_WriteReg(InstancePtr->Control_BaseAddress, XALV_VHDL_CONTROL_ADDR_A_DATA + 4, (u32)(Data >> 32));
}

u64 XAlv_vhdl_Get_a(XAlv_vhdl *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlv_vhdl_ReadReg(InstancePtr->Control_BaseAddress, XALV_VHDL_CONTROL_ADDR_A_DATA);
    Data += (u64)XAlv_vhdl_ReadReg(InstancePtr->Control_BaseAddress, XALV_VHDL_CONTROL_ADDR_A_DATA + 4) << 32;
    return Data;
}

void XAlv_vhdl_Set_b(XAlv_vhdl *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlv_vhdl_WriteReg(InstancePtr->Control_BaseAddress, XALV_VHDL_CONTROL_ADDR_B_DATA, (u32)(Data));
    XAlv_vhdl_WriteReg(InstancePtr->Control_BaseAddress, XALV_VHDL_CONTROL_ADDR_B_DATA + 4, (u32)(Data >> 32));
}

u64 XAlv_vhdl_Get_b(XAlv_vhdl *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlv_vhdl_ReadReg(InstancePtr->Control_BaseAddress, XALV_VHDL_CONTROL_ADDR_B_DATA);
    Data += (u64)XAlv_vhdl_ReadReg(InstancePtr->Control_BaseAddress, XALV_VHDL_CONTROL_ADDR_B_DATA + 4) << 32;
    return Data;
}

void XAlv_vhdl_Set_c(XAlv_vhdl *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlv_vhdl_WriteReg(InstancePtr->Control_BaseAddress, XALV_VHDL_CONTROL_ADDR_C_DATA, (u32)(Data));
    XAlv_vhdl_WriteReg(InstancePtr->Control_BaseAddress, XALV_VHDL_CONTROL_ADDR_C_DATA + 4, (u32)(Data >> 32));
}

u64 XAlv_vhdl_Get_c(XAlv_vhdl *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlv_vhdl_ReadReg(InstancePtr->Control_BaseAddress, XALV_VHDL_CONTROL_ADDR_C_DATA);
    Data += (u64)XAlv_vhdl_ReadReg(InstancePtr->Control_BaseAddress, XALV_VHDL_CONTROL_ADDR_C_DATA + 4) << 32;
    return Data;
}

void XAlv_vhdl_Set_op(XAlv_vhdl *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlv_vhdl_WriteReg(InstancePtr->Control_BaseAddress, XALV_VHDL_CONTROL_ADDR_OP_DATA, (u32)(Data));
    XAlv_vhdl_WriteReg(InstancePtr->Control_BaseAddress, XALV_VHDL_CONTROL_ADDR_OP_DATA + 4, (u32)(Data >> 32));
}

u64 XAlv_vhdl_Get_op(XAlv_vhdl *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlv_vhdl_ReadReg(InstancePtr->Control_BaseAddress, XALV_VHDL_CONTROL_ADDR_OP_DATA);
    Data += (u64)XAlv_vhdl_ReadReg(InstancePtr->Control_BaseAddress, XALV_VHDL_CONTROL_ADDR_OP_DATA + 4) << 32;
    return Data;
}

void XAlv_vhdl_Set_selec(XAlv_vhdl *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlv_vhdl_WriteReg(InstancePtr->Control_BaseAddress, XALV_VHDL_CONTROL_ADDR_SELEC_DATA, Data);
}

u32 XAlv_vhdl_Get_selec(XAlv_vhdl *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlv_vhdl_ReadReg(InstancePtr->Control_BaseAddress, XALV_VHDL_CONTROL_ADDR_SELEC_DATA);
    return Data;
}

void XAlv_vhdl_InterruptGlobalEnable(XAlv_vhdl *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlv_vhdl_WriteReg(InstancePtr->Control_BaseAddress, XALV_VHDL_CONTROL_ADDR_GIE, 1);
}

void XAlv_vhdl_InterruptGlobalDisable(XAlv_vhdl *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlv_vhdl_WriteReg(InstancePtr->Control_BaseAddress, XALV_VHDL_CONTROL_ADDR_GIE, 0);
}

void XAlv_vhdl_InterruptEnable(XAlv_vhdl *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XAlv_vhdl_ReadReg(InstancePtr->Control_BaseAddress, XALV_VHDL_CONTROL_ADDR_IER);
    XAlv_vhdl_WriteReg(InstancePtr->Control_BaseAddress, XALV_VHDL_CONTROL_ADDR_IER, Register | Mask);
}

void XAlv_vhdl_InterruptDisable(XAlv_vhdl *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XAlv_vhdl_ReadReg(InstancePtr->Control_BaseAddress, XALV_VHDL_CONTROL_ADDR_IER);
    XAlv_vhdl_WriteReg(InstancePtr->Control_BaseAddress, XALV_VHDL_CONTROL_ADDR_IER, Register & (~Mask));
}

void XAlv_vhdl_InterruptClear(XAlv_vhdl *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlv_vhdl_WriteReg(InstancePtr->Control_BaseAddress, XALV_VHDL_CONTROL_ADDR_ISR, Mask);
}

u32 XAlv_vhdl_InterruptGetEnabled(XAlv_vhdl *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XAlv_vhdl_ReadReg(InstancePtr->Control_BaseAddress, XALV_VHDL_CONTROL_ADDR_IER);
}

u32 XAlv_vhdl_InterruptGetStatus(XAlv_vhdl *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XAlv_vhdl_ReadReg(InstancePtr->Control_BaseAddress, XALV_VHDL_CONTROL_ADDR_ISR);
}

