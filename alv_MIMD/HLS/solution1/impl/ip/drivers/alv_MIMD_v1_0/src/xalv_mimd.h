// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XALV_MIMD_H
#define XALV_MIMD_H

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
#include "xalv_mimd_hw.h"

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
} XAlv_mimd_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XAlv_mimd;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XAlv_mimd_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XAlv_mimd_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XAlv_mimd_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XAlv_mimd_ReadReg(BaseAddress, RegOffset) \
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
int XAlv_mimd_Initialize(XAlv_mimd *InstancePtr, UINTPTR BaseAddress);
XAlv_mimd_Config* XAlv_mimd_LookupConfig(UINTPTR BaseAddress);
#else
int XAlv_mimd_Initialize(XAlv_mimd *InstancePtr, u16 DeviceId);
XAlv_mimd_Config* XAlv_mimd_LookupConfig(u16 DeviceId);
#endif
int XAlv_mimd_CfgInitialize(XAlv_mimd *InstancePtr, XAlv_mimd_Config *ConfigPtr);
#else
int XAlv_mimd_Initialize(XAlv_mimd *InstancePtr, const char* InstanceName);
int XAlv_mimd_Release(XAlv_mimd *InstancePtr);
#endif

void XAlv_mimd_Start(XAlv_mimd *InstancePtr);
u32 XAlv_mimd_IsDone(XAlv_mimd *InstancePtr);
u32 XAlv_mimd_IsIdle(XAlv_mimd *InstancePtr);
u32 XAlv_mimd_IsReady(XAlv_mimd *InstancePtr);
void XAlv_mimd_EnableAutoRestart(XAlv_mimd *InstancePtr);
void XAlv_mimd_DisableAutoRestart(XAlv_mimd *InstancePtr);

void XAlv_mimd_Set_a(XAlv_mimd *InstancePtr, u64 Data);
u64 XAlv_mimd_Get_a(XAlv_mimd *InstancePtr);
void XAlv_mimd_Set_b(XAlv_mimd *InstancePtr, u64 Data);
u64 XAlv_mimd_Get_b(XAlv_mimd *InstancePtr);
void XAlv_mimd_Set_c(XAlv_mimd *InstancePtr, u64 Data);
u64 XAlv_mimd_Get_c(XAlv_mimd *InstancePtr);
void XAlv_mimd_Set_op(XAlv_mimd *InstancePtr, u64 Data);
u64 XAlv_mimd_Get_op(XAlv_mimd *InstancePtr);
void XAlv_mimd_Set_selec(XAlv_mimd *InstancePtr, u32 Data);
u32 XAlv_mimd_Get_selec(XAlv_mimd *InstancePtr);

void XAlv_mimd_InterruptGlobalEnable(XAlv_mimd *InstancePtr);
void XAlv_mimd_InterruptGlobalDisable(XAlv_mimd *InstancePtr);
void XAlv_mimd_InterruptEnable(XAlv_mimd *InstancePtr, u32 Mask);
void XAlv_mimd_InterruptDisable(XAlv_mimd *InstancePtr, u32 Mask);
void XAlv_mimd_InterruptClear(XAlv_mimd *InstancePtr, u32 Mask);
u32 XAlv_mimd_InterruptGetEnabled(XAlv_mimd *InstancePtr);
u32 XAlv_mimd_InterruptGetStatus(XAlv_mimd *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
