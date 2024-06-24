// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XALV_VHDL_H
#define XALV_VHDL_H

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
#include "xalv_vhdl_hw.h"

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
} XAlv_vhdl_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XAlv_vhdl;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XAlv_vhdl_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XAlv_vhdl_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XAlv_vhdl_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XAlv_vhdl_ReadReg(BaseAddress, RegOffset) \
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
int XAlv_vhdl_Initialize(XAlv_vhdl *InstancePtr, UINTPTR BaseAddress);
XAlv_vhdl_Config* XAlv_vhdl_LookupConfig(UINTPTR BaseAddress);
#else
int XAlv_vhdl_Initialize(XAlv_vhdl *InstancePtr, u16 DeviceId);
XAlv_vhdl_Config* XAlv_vhdl_LookupConfig(u16 DeviceId);
#endif
int XAlv_vhdl_CfgInitialize(XAlv_vhdl *InstancePtr, XAlv_vhdl_Config *ConfigPtr);
#else
int XAlv_vhdl_Initialize(XAlv_vhdl *InstancePtr, const char* InstanceName);
int XAlv_vhdl_Release(XAlv_vhdl *InstancePtr);
#endif

void XAlv_vhdl_Start(XAlv_vhdl *InstancePtr);
u32 XAlv_vhdl_IsDone(XAlv_vhdl *InstancePtr);
u32 XAlv_vhdl_IsIdle(XAlv_vhdl *InstancePtr);
u32 XAlv_vhdl_IsReady(XAlv_vhdl *InstancePtr);
void XAlv_vhdl_EnableAutoRestart(XAlv_vhdl *InstancePtr);
void XAlv_vhdl_DisableAutoRestart(XAlv_vhdl *InstancePtr);

void XAlv_vhdl_Set_a(XAlv_vhdl *InstancePtr, u64 Data);
u64 XAlv_vhdl_Get_a(XAlv_vhdl *InstancePtr);
void XAlv_vhdl_Set_b(XAlv_vhdl *InstancePtr, u64 Data);
u64 XAlv_vhdl_Get_b(XAlv_vhdl *InstancePtr);
void XAlv_vhdl_Set_c(XAlv_vhdl *InstancePtr, u64 Data);
u64 XAlv_vhdl_Get_c(XAlv_vhdl *InstancePtr);
void XAlv_vhdl_Set_op(XAlv_vhdl *InstancePtr, u64 Data);
u64 XAlv_vhdl_Get_op(XAlv_vhdl *InstancePtr);
void XAlv_vhdl_Set_selec(XAlv_vhdl *InstancePtr, u32 Data);
u32 XAlv_vhdl_Get_selec(XAlv_vhdl *InstancePtr);

void XAlv_vhdl_InterruptGlobalEnable(XAlv_vhdl *InstancePtr);
void XAlv_vhdl_InterruptGlobalDisable(XAlv_vhdl *InstancePtr);
void XAlv_vhdl_InterruptEnable(XAlv_vhdl *InstancePtr, u32 Mask);
void XAlv_vhdl_InterruptDisable(XAlv_vhdl *InstancePtr, u32 Mask);
void XAlv_vhdl_InterruptClear(XAlv_vhdl *InstancePtr, u32 Mask);
u32 XAlv_vhdl_InterruptGetEnabled(XAlv_vhdl *InstancePtr);
u32 XAlv_vhdl_InterruptGetStatus(XAlv_vhdl *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
