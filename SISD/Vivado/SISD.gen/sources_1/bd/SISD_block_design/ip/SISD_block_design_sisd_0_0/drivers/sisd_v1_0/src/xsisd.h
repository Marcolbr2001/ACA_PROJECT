// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XSISD_H
#define XSISD_H

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
#include "xsisd_hw.h"

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
} XSisd_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XSisd;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XSisd_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XSisd_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XSisd_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XSisd_ReadReg(BaseAddress, RegOffset) \
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
int XSisd_Initialize(XSisd *InstancePtr, UINTPTR BaseAddress);
XSisd_Config* XSisd_LookupConfig(UINTPTR BaseAddress);
#else
int XSisd_Initialize(XSisd *InstancePtr, u16 DeviceId);
XSisd_Config* XSisd_LookupConfig(u16 DeviceId);
#endif
int XSisd_CfgInitialize(XSisd *InstancePtr, XSisd_Config *ConfigPtr);
#else
int XSisd_Initialize(XSisd *InstancePtr, const char* InstanceName);
int XSisd_Release(XSisd *InstancePtr);
#endif

void XSisd_Start(XSisd *InstancePtr);
u32 XSisd_IsDone(XSisd *InstancePtr);
u32 XSisd_IsIdle(XSisd *InstancePtr);
u32 XSisd_IsReady(XSisd *InstancePtr);
void XSisd_EnableAutoRestart(XSisd *InstancePtr);
void XSisd_DisableAutoRestart(XSisd *InstancePtr);
u32 XSisd_Get_return(XSisd *InstancePtr);

void XSisd_Set_a(XSisd *InstancePtr, u32 Data);
u32 XSisd_Get_a(XSisd *InstancePtr);
void XSisd_Set_b(XSisd *InstancePtr, u32 Data);
u32 XSisd_Get_b(XSisd *InstancePtr);
void XSisd_Set_op(XSisd *InstancePtr, u32 Data);
u32 XSisd_Get_op(XSisd *InstancePtr);

void XSisd_InterruptGlobalEnable(XSisd *InstancePtr);
void XSisd_InterruptGlobalDisable(XSisd *InstancePtr);
void XSisd_InterruptEnable(XSisd *InstancePtr, u32 Mask);
void XSisd_InterruptDisable(XSisd *InstancePtr, u32 Mask);
void XSisd_InterruptClear(XSisd *InstancePtr, u32 Mask);
u32 XSisd_InterruptGetEnabled(XSisd *InstancePtr);
u32 XSisd_InterruptGetStatus(XSisd *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
