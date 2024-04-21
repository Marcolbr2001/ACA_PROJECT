// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XDEC_MIMD_H
#define XDEC_MIMD_H

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
#include "xdec_mimd_hw.h"

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
} XDec_mimd_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XDec_mimd;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XDec_mimd_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XDec_mimd_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XDec_mimd_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XDec_mimd_ReadReg(BaseAddress, RegOffset) \
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
int XDec_mimd_Initialize(XDec_mimd *InstancePtr, UINTPTR BaseAddress);
XDec_mimd_Config* XDec_mimd_LookupConfig(UINTPTR BaseAddress);
#else
int XDec_mimd_Initialize(XDec_mimd *InstancePtr, u16 DeviceId);
XDec_mimd_Config* XDec_mimd_LookupConfig(u16 DeviceId);
#endif
int XDec_mimd_CfgInitialize(XDec_mimd *InstancePtr, XDec_mimd_Config *ConfigPtr);
#else
int XDec_mimd_Initialize(XDec_mimd *InstancePtr, const char* InstanceName);
int XDec_mimd_Release(XDec_mimd *InstancePtr);
#endif

void XDec_mimd_Start(XDec_mimd *InstancePtr);
u32 XDec_mimd_IsDone(XDec_mimd *InstancePtr);
u32 XDec_mimd_IsIdle(XDec_mimd *InstancePtr);
u32 XDec_mimd_IsReady(XDec_mimd *InstancePtr);
void XDec_mimd_EnableAutoRestart(XDec_mimd *InstancePtr);
void XDec_mimd_DisableAutoRestart(XDec_mimd *InstancePtr);

void XDec_mimd_Set_a(XDec_mimd *InstancePtr, u64 Data);
u64 XDec_mimd_Get_a(XDec_mimd *InstancePtr);
void XDec_mimd_Set_b(XDec_mimd *InstancePtr, u64 Data);
u64 XDec_mimd_Get_b(XDec_mimd *InstancePtr);
void XDec_mimd_Set_c(XDec_mimd *InstancePtr, u64 Data);
u64 XDec_mimd_Get_c(XDec_mimd *InstancePtr);
void XDec_mimd_Set_op(XDec_mimd *InstancePtr, u64 Data);
u64 XDec_mimd_Get_op(XDec_mimd *InstancePtr);
void XDec_mimd_Set_group_r(XDec_mimd *InstancePtr, u32 Data);
u32 XDec_mimd_Get_group_r(XDec_mimd *InstancePtr);

void XDec_mimd_InterruptGlobalEnable(XDec_mimd *InstancePtr);
void XDec_mimd_InterruptGlobalDisable(XDec_mimd *InstancePtr);
void XDec_mimd_InterruptEnable(XDec_mimd *InstancePtr, u32 Mask);
void XDec_mimd_InterruptDisable(XDec_mimd *InstancePtr, u32 Mask);
void XDec_mimd_InterruptClear(XDec_mimd *InstancePtr, u32 Mask);
u32 XDec_mimd_InterruptGetEnabled(XDec_mimd *InstancePtr);
u32 XDec_mimd_InterruptGetStatus(XDec_mimd *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
