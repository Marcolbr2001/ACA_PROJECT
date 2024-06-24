// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XALU_SYS_HDL_H
#define XALU_SYS_HDL_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xalu_sys_hdl_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u64 Control_BaseAddress;
} XAlu_sys_hdl_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XAlu_sys_hdl;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XAlu_sys_hdl_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XAlu_sys_hdl_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XAlu_sys_hdl_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XAlu_sys_hdl_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
#ifdef SDT
int XAlu_sys_hdl_Initialize(XAlu_sys_hdl *InstancePtr, UINTPTR BaseAddress);
XAlu_sys_hdl_Config* XAlu_sys_hdl_LookupConfig(UINTPTR BaseAddress);
#else
int XAlu_sys_hdl_Initialize(XAlu_sys_hdl *InstancePtr, u16 DeviceId);
XAlu_sys_hdl_Config* XAlu_sys_hdl_LookupConfig(u16 DeviceId);
#endif
int XAlu_sys_hdl_CfgInitialize(XAlu_sys_hdl *InstancePtr, XAlu_sys_hdl_Config *ConfigPtr);
#else
int XAlu_sys_hdl_Initialize(XAlu_sys_hdl *InstancePtr, const char* InstanceName);
int XAlu_sys_hdl_Release(XAlu_sys_hdl *InstancePtr);
#endif

void XAlu_sys_hdl_Start(XAlu_sys_hdl *InstancePtr);
u32 XAlu_sys_hdl_IsDone(XAlu_sys_hdl *InstancePtr);
u32 XAlu_sys_hdl_IsIdle(XAlu_sys_hdl *InstancePtr);
u32 XAlu_sys_hdl_IsReady(XAlu_sys_hdl *InstancePtr);
void XAlu_sys_hdl_EnableAutoRestart(XAlu_sys_hdl *InstancePtr);
void XAlu_sys_hdl_DisableAutoRestart(XAlu_sys_hdl *InstancePtr);

void XAlu_sys_hdl_Set_a(XAlu_sys_hdl *InstancePtr, u64 Data);
u64 XAlu_sys_hdl_Get_a(XAlu_sys_hdl *InstancePtr);
void XAlu_sys_hdl_Set_b(XAlu_sys_hdl *InstancePtr, u64 Data);
u64 XAlu_sys_hdl_Get_b(XAlu_sys_hdl *InstancePtr);
void XAlu_sys_hdl_Set_c(XAlu_sys_hdl *InstancePtr, u64 Data);
u64 XAlu_sys_hdl_Get_c(XAlu_sys_hdl *InstancePtr);
void XAlu_sys_hdl_Set_op(XAlu_sys_hdl *InstancePtr, u64 Data);
u64 XAlu_sys_hdl_Get_op(XAlu_sys_hdl *InstancePtr);
void XAlu_sys_hdl_Set_selec(XAlu_sys_hdl *InstancePtr, u32 Data);
u32 XAlu_sys_hdl_Get_selec(XAlu_sys_hdl *InstancePtr);

void XAlu_sys_hdl_InterruptGlobalEnable(XAlu_sys_hdl *InstancePtr);
void XAlu_sys_hdl_InterruptGlobalDisable(XAlu_sys_hdl *InstancePtr);
void XAlu_sys_hdl_InterruptEnable(XAlu_sys_hdl *InstancePtr, u32 Mask);
void XAlu_sys_hdl_InterruptDisable(XAlu_sys_hdl *InstancePtr, u32 Mask);
void XAlu_sys_hdl_InterruptClear(XAlu_sys_hdl *InstancePtr, u32 Mask);
u32 XAlu_sys_hdl_InterruptGetEnabled(XAlu_sys_hdl *InstancePtr);
u32 XAlu_sys_hdl_InterruptGetStatus(XAlu_sys_hdl *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
