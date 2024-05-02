/* Provide Declarations */
#include <stdarg.h>
#include <setjmp.h>
#include <limits.h>
#ifdef NEED_CBEAPINT
#include <autopilot_cbe.h>
#else
#define aesl_fopen fopen
#define aesl_freopen freopen
#define aesl_tmpfile tmpfile
#endif
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#ifdef __STRICT_ANSI__
#define inline __inline__
#define typeof __typeof__ 
#endif
#define __isoc99_fscanf fscanf
#define __isoc99_sscanf sscanf
#undef ferror
#undef feof
/* get a declaration for alloca */
#if defined(__CYGWIN__) || defined(__MINGW32__)
#define  alloca(x) __builtin_alloca((x))
#define _alloca(x) __builtin_alloca((x))
#elif defined(__APPLE__)
extern void *__builtin_alloca(unsigned long);
#define alloca(x) __builtin_alloca(x)
#define longjmp _longjmp
#define setjmp _setjmp
#elif defined(__sun__)
#if defined(__sparcv9)
extern void *__builtin_alloca(unsigned long);
#else
extern void *__builtin_alloca(unsigned int);
#endif
#define alloca(x) __builtin_alloca(x)
#elif defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__) || defined(__arm__)
#define alloca(x) __builtin_alloca(x)
#elif defined(_MSC_VER)
#define inline _inline
#define alloca(x) _alloca(x)
#else
#include <alloca.h>
#endif

#ifndef __GNUC__  /* Can only support "linkonce" vars with GCC */
#define __attribute__(X)
#endif

#if defined(__GNUC__) && defined(__APPLE_CC__)
#define __EXTERNAL_WEAK__ __attribute__((weak_import))
#elif defined(__GNUC__)
#define __EXTERNAL_WEAK__ __attribute__((weak))
#else
#define __EXTERNAL_WEAK__
#endif

#if defined(__GNUC__) && (defined(__APPLE_CC__) || defined(__CYGWIN__) || defined(__MINGW32__))
#define __ATTRIBUTE_WEAK__
#elif defined(__GNUC__)
#define __ATTRIBUTE_WEAK__ __attribute__((weak))
#else
#define __ATTRIBUTE_WEAK__
#endif

#if defined(__GNUC__)
#define __HIDDEN__ __attribute__((visibility("hidden")))
#endif

#ifdef __GNUC__
#define LLVM_NAN(NanStr)   __builtin_nan(NanStr)   /* Double */
#define LLVM_NANF(NanStr)  __builtin_nanf(NanStr)  /* Float */
#define LLVM_NANS(NanStr)  __builtin_nans(NanStr)  /* Double */
#define LLVM_NANSF(NanStr) __builtin_nansf(NanStr) /* Float */
#define LLVM_INF           __builtin_inf()         /* Double */
#define LLVM_INFF          __builtin_inff()        /* Float */
#define LLVM_PREFETCH(addr,rw,locality) __builtin_prefetch(addr,rw,locality)
#define __ATTRIBUTE_CTOR__ __attribute__((constructor))
#define __ATTRIBUTE_DTOR__ __attribute__((destructor))
#define LLVM_ASM           __asm__
#else
#define LLVM_NAN(NanStr)   ((double)0.0)           /* Double */
#define LLVM_NANF(NanStr)  0.0F                    /* Float */
#define LLVM_NANS(NanStr)  ((double)0.0)           /* Double */
#define LLVM_NANSF(NanStr) 0.0F                    /* Float */
#define LLVM_INF           ((double)0.0)           /* Double */
#define LLVM_INFF          0.0F                    /* Float */
#define LLVM_PREFETCH(addr,rw,locality)            /* PREFETCH */
#define __ATTRIBUTE_CTOR__
#define __ATTRIBUTE_DTOR__
#define LLVM_ASM(X)
#endif

#if __GNUC__ < 4 /* Old GCC's, or compilers not GCC */ 
#define __builtin_stack_save() 0   /* not implemented */
#define __builtin_stack_restore(X) /* noop */
#endif

#if __GNUC__ && __LP64__ /* 128-bit integer types */
typedef int __attribute__((mode(TI))) llvmInt128;
typedef unsigned __attribute__((mode(TI))) llvmUInt128;
#endif

#define CODE_FOR_MAIN() /* Any target-specific code for main()*/

#ifndef __cplusplus
typedef unsigned char bool;
#endif


/* Support for floating point constants */
typedef unsigned long long ConstantDoubleTy;
typedef unsigned int        ConstantFloatTy;
typedef struct { unsigned long long f1; unsigned short f2; unsigned short pad[3]; } ConstantFP80Ty;
typedef struct { unsigned long long f1; unsigned long long f2; } ConstantFP128Ty;


/* Global Declarations */
/* Helper union for bitcasts */
typedef union {
  unsigned int Int32;
  unsigned long long Int64;
  float Float;
  double Double;
} llvmBitCastUnion;

/* External Global Variable Declarations */

/* Function Declarations */
double fmod(double, double);
float fmodf(float, float);
long double fmodl(long double, long double);
void reset(signed int *llvm_cbe_c, signed int *llvm_cbe_data_a, signed int *llvm_cbe_data_b);
void load_data(signed int *llvm_cbe_a, signed int *llvm_cbe_b, signed int *llvm_cbe_data_a, signed int *llvm_cbe_data_b);
void load_op(signed int *llvm_cbe_op, signed int *llvm_cbe_ALU_operation);
void load_data_and_op(signed int *llvm_cbe_a, signed int *llvm_cbe_b, signed int *llvm_cbe_op, signed int *llvm_cbe_data_a, signed int *llvm_cbe_data_b, signed int *llvm_cbe_ALU_operation);
void execute(signed int *llvm_cbe_data_a, signed int *llvm_cbe_data_b, signed int *llvm_cbe_ALU_operation, signed int *llvm_cbe_data_result);
void output(signed int *llvm_cbe_data_result, signed int *llvm_cbe_c);
void dec_MIMD(signed int *llvm_cbe_a, signed int *llvm_cbe_b, signed int *llvm_cbe_c, signed int *llvm_cbe_op, signed int llvm_cbe_selec);


/* Global Variable Definitions and Initialization */
static signed int aesl_internal_dec_MIMD_OC_data_a[50];
static signed int aesl_internal_dec_MIMD_OC_data_b[50];
static signed int aesl_internal_dec_MIMD_OC_ALU_operation[50];


/* Function Bodies */
static inline int llvm_fcmp_ord(double X, double Y) { return X == X && Y == Y; }
static inline int llvm_fcmp_uno(double X, double Y) { return X != X || Y != Y; }
static inline int llvm_fcmp_ueq(double X, double Y) { return X == Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_une(double X, double Y) { return X != Y; }
static inline int llvm_fcmp_ult(double X, double Y) { return X <  Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_ugt(double X, double Y) { return X >  Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_ule(double X, double Y) { return X <= Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_uge(double X, double Y) { return X >= Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_oeq(double X, double Y) { return X == Y ; }
static inline int llvm_fcmp_one(double X, double Y) { return X != Y && llvm_fcmp_ord(X, Y); }
static inline int llvm_fcmp_olt(double X, double Y) { return X <  Y ; }
static inline int llvm_fcmp_ogt(double X, double Y) { return X >  Y ; }
static inline int llvm_fcmp_ole(double X, double Y) { return X <= Y ; }
static inline int llvm_fcmp_oge(double X, double Y) { return X >= Y ; }

void reset(signed int *llvm_cbe_c, signed int *llvm_cbe_data_a, signed int *llvm_cbe_data_b) {
  static  unsigned long long aesl_llvm_cbe_1_count = 0;
  static  unsigned long long aesl_llvm_cbe_2_count = 0;
  static  unsigned long long aesl_llvm_cbe_3_count = 0;
  static  unsigned long long aesl_llvm_cbe_4_count = 0;
  static  unsigned long long aesl_llvm_cbe_5_count = 0;
  static  unsigned long long aesl_llvm_cbe_6_count = 0;
  static  unsigned long long aesl_llvm_cbe_7_count = 0;
  static  unsigned long long aesl_llvm_cbe_8_count = 0;
  static  unsigned long long aesl_llvm_cbe_9_count = 0;
  static  unsigned long long aesl_llvm_cbe_10_count = 0;
  static  unsigned long long aesl_llvm_cbe_11_count = 0;
  static  unsigned long long aesl_llvm_cbe_12_count = 0;
  static  unsigned long long aesl_llvm_cbe_13_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  unsigned int llvm_cbe_storemerge1;
  unsigned int llvm_cbe_storemerge1__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_14_count = 0;
  unsigned long long llvm_cbe_tmp__1;
  static  unsigned long long aesl_llvm_cbe_15_count = 0;
  signed int *llvm_cbe_tmp__2;
  static  unsigned long long aesl_llvm_cbe_16_count = 0;
  static  unsigned long long aesl_llvm_cbe_17_count = 0;
  signed int *llvm_cbe_tmp__3;
  static  unsigned long long aesl_llvm_cbe_18_count = 0;
  static  unsigned long long aesl_llvm_cbe_19_count = 0;
  signed int *llvm_cbe_tmp__4;
  static  unsigned long long aesl_llvm_cbe_20_count = 0;
  static  unsigned long long aesl_llvm_cbe_21_count = 0;
  unsigned int llvm_cbe_tmp__5;
  static  unsigned long long aesl_llvm_cbe_22_count = 0;
  static  unsigned long long aesl_llvm_cbe_23_count = 0;
  static  unsigned long long aesl_llvm_cbe_24_count = 0;
  static  unsigned long long aesl_llvm_cbe_25_count = 0;
  static  unsigned long long aesl_llvm_cbe_26_count = 0;
  static  unsigned long long aesl_llvm_cbe_27_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_28_count = 0;
  static  unsigned long long aesl_llvm_cbe_29_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @reset\n");
  llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe_tmp__6;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__6:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = phi i32 [ 0, %%0 ], [ %%6, %%1  for 0x%I64xth hint within @reset  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (unsigned int )llvm_cbe_storemerge1__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1 = 0x%X",llvm_cbe_storemerge1);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__5);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = sext i32 %%storemerge1 to i64, !dbg !8 for 0x%I64xth hint within @reset  --> \n", ++aesl_llvm_cbe_14_count);
  llvm_cbe_tmp__1 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__1);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = getelementptr inbounds i32* %%c, i64 %%2, !dbg !8 for 0x%I64xth hint within @reset  --> \n", ++aesl_llvm_cbe_15_count);
  llvm_cbe_tmp__2 = (signed int *)(&llvm_cbe_c[(((signed long long )llvm_cbe_tmp__1))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__1));
}
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 0, i32* %%3, align 4, !dbg !8 for 0x%I64xth hint within @reset  --> \n", ++aesl_llvm_cbe_16_count);
  *((unsigned int volatile*)llvm_cbe_tmp__2) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = getelementptr inbounds i32* %%data_a, i64 %%2, !dbg !8 for 0x%I64xth hint within @reset  --> \n", ++aesl_llvm_cbe_17_count);
  llvm_cbe_tmp__3 = (signed int *)(&llvm_cbe_data_a[(((signed long long )llvm_cbe_tmp__1))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__1));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* %%4, align 4, !dbg !8 for 0x%I64xth hint within @reset  --> \n", ++aesl_llvm_cbe_18_count);
  *llvm_cbe_tmp__3 = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = getelementptr inbounds i32* %%data_b, i64 %%2, !dbg !8 for 0x%I64xth hint within @reset  --> \n", ++aesl_llvm_cbe_19_count);
  llvm_cbe_tmp__4 = (signed int *)(&llvm_cbe_data_b[(((signed long long )llvm_cbe_tmp__1))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__1));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* %%5, align 4, !dbg !8 for 0x%I64xth hint within @reset  --> \n", ++aesl_llvm_cbe_20_count);
  *llvm_cbe_tmp__4 = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = add nsw i32 %%storemerge1, 1, !dbg !9 for 0x%I64xth hint within @reset  --> \n", ++aesl_llvm_cbe_21_count);
  llvm_cbe_tmp__5 = (unsigned int )((unsigned int )(llvm_cbe_storemerge1&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__5&4294967295ull)));
  if (((llvm_cbe_tmp__5&4294967295U) == (50u&4294967295U))) {
    goto llvm_cbe_tmp__7;
  } else {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__5;   /* for PHI node */
    goto llvm_cbe_tmp__6;
  }

  } while (1); /* end of syntactic loop '' */
llvm_cbe_tmp__7:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @reset}\n");
  return;
}


void load_data(signed int *llvm_cbe_a, signed int *llvm_cbe_b, signed int *llvm_cbe_data_a, signed int *llvm_cbe_data_b) {
  static  unsigned long long aesl_llvm_cbe_30_count = 0;
  static  unsigned long long aesl_llvm_cbe_31_count = 0;
  static  unsigned long long aesl_llvm_cbe_32_count = 0;
  static  unsigned long long aesl_llvm_cbe_33_count = 0;
  static  unsigned long long aesl_llvm_cbe_34_count = 0;
  static  unsigned long long aesl_llvm_cbe_35_count = 0;
  static  unsigned long long aesl_llvm_cbe_36_count = 0;
  static  unsigned long long aesl_llvm_cbe_37_count = 0;
  static  unsigned long long aesl_llvm_cbe_38_count = 0;
  static  unsigned long long aesl_llvm_cbe_39_count = 0;
  static  unsigned long long aesl_llvm_cbe_40_count = 0;
  static  unsigned long long aesl_llvm_cbe_41_count = 0;
  static  unsigned long long aesl_llvm_cbe_42_count = 0;
  static  unsigned long long aesl_llvm_cbe_43_count = 0;
  static  unsigned long long aesl_llvm_cbe_44_count = 0;
  static  unsigned long long aesl_llvm_cbe_45_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  unsigned int llvm_cbe_storemerge1;
  unsigned int llvm_cbe_storemerge1__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_46_count = 0;
  unsigned long long llvm_cbe_tmp__8;
  static  unsigned long long aesl_llvm_cbe_47_count = 0;
  signed int *llvm_cbe_tmp__9;
  static  unsigned long long aesl_llvm_cbe_48_count = 0;
  unsigned int llvm_cbe_tmp__10;
  static  unsigned long long aesl_llvm_cbe_49_count = 0;
  signed int *llvm_cbe_tmp__11;
  static  unsigned long long aesl_llvm_cbe_50_count = 0;
  static  unsigned long long aesl_llvm_cbe_51_count = 0;
  signed int *llvm_cbe_tmp__12;
  static  unsigned long long aesl_llvm_cbe_52_count = 0;
  unsigned int llvm_cbe_tmp__13;
  static  unsigned long long aesl_llvm_cbe_53_count = 0;
  signed int *llvm_cbe_tmp__14;
  static  unsigned long long aesl_llvm_cbe_54_count = 0;
  static  unsigned long long aesl_llvm_cbe_55_count = 0;
  unsigned int llvm_cbe_tmp__15;
  static  unsigned long long aesl_llvm_cbe_56_count = 0;
  static  unsigned long long aesl_llvm_cbe_57_count = 0;
  static  unsigned long long aesl_llvm_cbe_58_count = 0;
  static  unsigned long long aesl_llvm_cbe_59_count = 0;
  static  unsigned long long aesl_llvm_cbe_60_count = 0;
  static  unsigned long long aesl_llvm_cbe_61_count = 0;
  static  unsigned long long aesl_llvm_cbe_62_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_63_count = 0;
  static  unsigned long long aesl_llvm_cbe_64_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @load_data\n");
  llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe_tmp__16;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__16:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = phi i32 [ 0, %%0 ], [ %%9, %%1  for 0x%I64xth hint within @load_data  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (unsigned int )llvm_cbe_storemerge1__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1 = 0x%X",llvm_cbe_storemerge1);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__15);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = sext i32 %%storemerge1 to i64, !dbg !8 for 0x%I64xth hint within @load_data  --> \n", ++aesl_llvm_cbe_46_count);
  llvm_cbe_tmp__8 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__8);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = getelementptr inbounds i32* %%a, i64 %%2, !dbg !8 for 0x%I64xth hint within @load_data  --> \n", ++aesl_llvm_cbe_47_count);
  llvm_cbe_tmp__9 = (signed int *)(&llvm_cbe_a[(((signed long long )llvm_cbe_tmp__8))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__8));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = load volatile i32* %%3, align 4, !dbg !8 for 0x%I64xth hint within @load_data  --> \n", ++aesl_llvm_cbe_48_count);
  llvm_cbe_tmp__10 = (unsigned int )*((unsigned int volatile*)llvm_cbe_tmp__9);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__10);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = getelementptr inbounds i32* %%data_a, i64 %%2, !dbg !8 for 0x%I64xth hint within @load_data  --> \n", ++aesl_llvm_cbe_49_count);
  llvm_cbe_tmp__11 = (signed int *)(&llvm_cbe_data_a[(((signed long long )llvm_cbe_tmp__8))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__8));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%4, i32* %%5, align 4, !dbg !8 for 0x%I64xth hint within @load_data  --> \n", ++aesl_llvm_cbe_50_count);
  *llvm_cbe_tmp__11 = llvm_cbe_tmp__10;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__10);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = getelementptr inbounds i32* %%b, i64 %%2, !dbg !8 for 0x%I64xth hint within @load_data  --> \n", ++aesl_llvm_cbe_51_count);
  llvm_cbe_tmp__12 = (signed int *)(&llvm_cbe_b[(((signed long long )llvm_cbe_tmp__8))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__8));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = load volatile i32* %%6, align 4, !dbg !8 for 0x%I64xth hint within @load_data  --> \n", ++aesl_llvm_cbe_52_count);
  llvm_cbe_tmp__13 = (unsigned int )*((unsigned int volatile*)llvm_cbe_tmp__12);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__13);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = getelementptr inbounds i32* %%data_b, i64 %%2, !dbg !8 for 0x%I64xth hint within @load_data  --> \n", ++aesl_llvm_cbe_53_count);
  llvm_cbe_tmp__14 = (signed int *)(&llvm_cbe_data_b[(((signed long long )llvm_cbe_tmp__8))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__8));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%7, i32* %%8, align 4, !dbg !8 for 0x%I64xth hint within @load_data  --> \n", ++aesl_llvm_cbe_54_count);
  *llvm_cbe_tmp__14 = llvm_cbe_tmp__13;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__13);
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = add nsw i32 %%storemerge1, 1, !dbg !9 for 0x%I64xth hint within @load_data  --> \n", ++aesl_llvm_cbe_55_count);
  llvm_cbe_tmp__15 = (unsigned int )((unsigned int )(llvm_cbe_storemerge1&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__15&4294967295ull)));
  if (((llvm_cbe_tmp__15&4294967295U) == (50u&4294967295U))) {
    goto llvm_cbe_tmp__17;
  } else {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__15;   /* for PHI node */
    goto llvm_cbe_tmp__16;
  }

  } while (1); /* end of syntactic loop '' */
llvm_cbe_tmp__17:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @load_data}\n");
  return;
}


void load_op(signed int *llvm_cbe_op, signed int *llvm_cbe_ALU_operation) {
  static  unsigned long long aesl_llvm_cbe_65_count = 0;
  static  unsigned long long aesl_llvm_cbe_66_count = 0;
  static  unsigned long long aesl_llvm_cbe_67_count = 0;
  static  unsigned long long aesl_llvm_cbe_68_count = 0;
  static  unsigned long long aesl_llvm_cbe_69_count = 0;
  static  unsigned long long aesl_llvm_cbe_70_count = 0;
  static  unsigned long long aesl_llvm_cbe_71_count = 0;
  static  unsigned long long aesl_llvm_cbe_72_count = 0;
  static  unsigned long long aesl_llvm_cbe_73_count = 0;
  static  unsigned long long aesl_llvm_cbe_74_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  unsigned int llvm_cbe_storemerge1;
  unsigned int llvm_cbe_storemerge1__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_75_count = 0;
  unsigned long long llvm_cbe_tmp__18;
  static  unsigned long long aesl_llvm_cbe_76_count = 0;
  signed int *llvm_cbe_tmp__19;
  static  unsigned long long aesl_llvm_cbe_77_count = 0;
  unsigned int llvm_cbe_tmp__20;
  static  unsigned long long aesl_llvm_cbe_78_count = 0;
  signed int *llvm_cbe_tmp__21;
  static  unsigned long long aesl_llvm_cbe_79_count = 0;
  static  unsigned long long aesl_llvm_cbe_80_count = 0;
  unsigned int llvm_cbe_tmp__22;
  static  unsigned long long aesl_llvm_cbe_81_count = 0;
  static  unsigned long long aesl_llvm_cbe_82_count = 0;
  static  unsigned long long aesl_llvm_cbe_83_count = 0;
  static  unsigned long long aesl_llvm_cbe_84_count = 0;
  static  unsigned long long aesl_llvm_cbe_85_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_86_count = 0;
  static  unsigned long long aesl_llvm_cbe_87_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @load_op\n");
  llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe_tmp__23;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__23:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = phi i32 [ 0, %%0 ], [ %%6, %%1  for 0x%I64xth hint within @load_op  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (unsigned int )llvm_cbe_storemerge1__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1 = 0x%X",llvm_cbe_storemerge1);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__22);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = sext i32 %%storemerge1 to i64, !dbg !8 for 0x%I64xth hint within @load_op  --> \n", ++aesl_llvm_cbe_75_count);
  llvm_cbe_tmp__18 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__18);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = getelementptr inbounds i32* %%op, i64 %%2, !dbg !8 for 0x%I64xth hint within @load_op  --> \n", ++aesl_llvm_cbe_76_count);
  llvm_cbe_tmp__19 = (signed int *)(&llvm_cbe_op[(((signed long long )llvm_cbe_tmp__18))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__18));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = load volatile i32* %%3, align 4, !dbg !8 for 0x%I64xth hint within @load_op  --> \n", ++aesl_llvm_cbe_77_count);
  llvm_cbe_tmp__20 = (unsigned int )*((unsigned int volatile*)llvm_cbe_tmp__19);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__20);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = getelementptr inbounds i32* %%ALU_operation, i64 %%2, !dbg !8 for 0x%I64xth hint within @load_op  --> \n", ++aesl_llvm_cbe_78_count);
  llvm_cbe_tmp__21 = (signed int *)(&llvm_cbe_ALU_operation[(((signed long long )llvm_cbe_tmp__18))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__18));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%4, i32* %%5, align 4, !dbg !8 for 0x%I64xth hint within @load_op  --> \n", ++aesl_llvm_cbe_79_count);
  *llvm_cbe_tmp__21 = llvm_cbe_tmp__20;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__20);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = add nsw i32 %%storemerge1, 1, !dbg !8 for 0x%I64xth hint within @load_op  --> \n", ++aesl_llvm_cbe_80_count);
  llvm_cbe_tmp__22 = (unsigned int )((unsigned int )(llvm_cbe_storemerge1&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__22&4294967295ull)));
  if (((llvm_cbe_tmp__22&4294967295U) == (50u&4294967295U))) {
    goto llvm_cbe_tmp__24;
  } else {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__22;   /* for PHI node */
    goto llvm_cbe_tmp__23;
  }

  } while (1); /* end of syntactic loop '' */
llvm_cbe_tmp__24:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @load_op}\n");
  return;
}


void load_data_and_op(signed int *llvm_cbe_a, signed int *llvm_cbe_b, signed int *llvm_cbe_op, signed int *llvm_cbe_data_a, signed int *llvm_cbe_data_b, signed int *llvm_cbe_ALU_operation) {
  static  unsigned long long aesl_llvm_cbe_88_count = 0;
  static  unsigned long long aesl_llvm_cbe_89_count = 0;
  static  unsigned long long aesl_llvm_cbe_90_count = 0;
  static  unsigned long long aesl_llvm_cbe_91_count = 0;
  static  unsigned long long aesl_llvm_cbe_92_count = 0;
  static  unsigned long long aesl_llvm_cbe_93_count = 0;
  static  unsigned long long aesl_llvm_cbe_94_count = 0;
  static  unsigned long long aesl_llvm_cbe_95_count = 0;
  static  unsigned long long aesl_llvm_cbe_96_count = 0;
  static  unsigned long long aesl_llvm_cbe_97_count = 0;
  static  unsigned long long aesl_llvm_cbe_98_count = 0;
  static  unsigned long long aesl_llvm_cbe_99_count = 0;
  static  unsigned long long aesl_llvm_cbe_100_count = 0;
  static  unsigned long long aesl_llvm_cbe_101_count = 0;
  static  unsigned long long aesl_llvm_cbe_102_count = 0;
  static  unsigned long long aesl_llvm_cbe_103_count = 0;
  static  unsigned long long aesl_llvm_cbe_104_count = 0;
  static  unsigned long long aesl_llvm_cbe_105_count = 0;
  static  unsigned long long aesl_llvm_cbe_106_count = 0;
  static  unsigned long long aesl_llvm_cbe_107_count = 0;
  static  unsigned long long aesl_llvm_cbe_108_count = 0;
  static  unsigned long long aesl_llvm_cbe_109_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  unsigned int llvm_cbe_storemerge1;
  unsigned int llvm_cbe_storemerge1__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_110_count = 0;
  unsigned long long llvm_cbe_tmp__25;
  static  unsigned long long aesl_llvm_cbe_111_count = 0;
  signed int *llvm_cbe_tmp__26;
  static  unsigned long long aesl_llvm_cbe_112_count = 0;
  unsigned int llvm_cbe_tmp__27;
  static  unsigned long long aesl_llvm_cbe_113_count = 0;
  signed int *llvm_cbe_tmp__28;
  static  unsigned long long aesl_llvm_cbe_114_count = 0;
  static  unsigned long long aesl_llvm_cbe_115_count = 0;
  signed int *llvm_cbe_tmp__29;
  static  unsigned long long aesl_llvm_cbe_116_count = 0;
  unsigned int llvm_cbe_tmp__30;
  static  unsigned long long aesl_llvm_cbe_117_count = 0;
  signed int *llvm_cbe_tmp__31;
  static  unsigned long long aesl_llvm_cbe_118_count = 0;
  static  unsigned long long aesl_llvm_cbe_119_count = 0;
  signed int *llvm_cbe_tmp__32;
  static  unsigned long long aesl_llvm_cbe_120_count = 0;
  unsigned int llvm_cbe_tmp__33;
  static  unsigned long long aesl_llvm_cbe_121_count = 0;
  signed int *llvm_cbe_tmp__34;
  static  unsigned long long aesl_llvm_cbe_122_count = 0;
  static  unsigned long long aesl_llvm_cbe_123_count = 0;
  unsigned int llvm_cbe_tmp__35;
  static  unsigned long long aesl_llvm_cbe_124_count = 0;
  static  unsigned long long aesl_llvm_cbe_125_count = 0;
  static  unsigned long long aesl_llvm_cbe_126_count = 0;
  static  unsigned long long aesl_llvm_cbe_127_count = 0;
  static  unsigned long long aesl_llvm_cbe_128_count = 0;
  static  unsigned long long aesl_llvm_cbe_129_count = 0;
  static  unsigned long long aesl_llvm_cbe_130_count = 0;
  static  unsigned long long aesl_llvm_cbe_131_count = 0;
  static  unsigned long long aesl_llvm_cbe_132_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_133_count = 0;
  static  unsigned long long aesl_llvm_cbe_134_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @load_data_and_op\n");
  llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe_tmp__36;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__36:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = phi i32 [ 0, %%0 ], [ %%12, %%1  for 0x%I64xth hint within @load_data_and_op  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (unsigned int )llvm_cbe_storemerge1__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1 = 0x%X",llvm_cbe_storemerge1);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__35);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = sext i32 %%storemerge1 to i64, !dbg !8 for 0x%I64xth hint within @load_data_and_op  --> \n", ++aesl_llvm_cbe_110_count);
  llvm_cbe_tmp__25 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__25);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = getelementptr inbounds i32* %%a, i64 %%2, !dbg !8 for 0x%I64xth hint within @load_data_and_op  --> \n", ++aesl_llvm_cbe_111_count);
  llvm_cbe_tmp__26 = (signed int *)(&llvm_cbe_a[(((signed long long )llvm_cbe_tmp__25))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__25));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = load volatile i32* %%3, align 4, !dbg !8 for 0x%I64xth hint within @load_data_and_op  --> \n", ++aesl_llvm_cbe_112_count);
  llvm_cbe_tmp__27 = (unsigned int )*((unsigned int volatile*)llvm_cbe_tmp__26);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__27);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = getelementptr inbounds i32* %%data_a, i64 %%2, !dbg !8 for 0x%I64xth hint within @load_data_and_op  --> \n", ++aesl_llvm_cbe_113_count);
  llvm_cbe_tmp__28 = (signed int *)(&llvm_cbe_data_a[(((signed long long )llvm_cbe_tmp__25))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__25));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%4, i32* %%5, align 4, !dbg !8 for 0x%I64xth hint within @load_data_and_op  --> \n", ++aesl_llvm_cbe_114_count);
  *llvm_cbe_tmp__28 = llvm_cbe_tmp__27;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__27);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = getelementptr inbounds i32* %%b, i64 %%2, !dbg !8 for 0x%I64xth hint within @load_data_and_op  --> \n", ++aesl_llvm_cbe_115_count);
  llvm_cbe_tmp__29 = (signed int *)(&llvm_cbe_b[(((signed long long )llvm_cbe_tmp__25))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__25));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = load volatile i32* %%6, align 4, !dbg !8 for 0x%I64xth hint within @load_data_and_op  --> \n", ++aesl_llvm_cbe_116_count);
  llvm_cbe_tmp__30 = (unsigned int )*((unsigned int volatile*)llvm_cbe_tmp__29);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__30);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = getelementptr inbounds i32* %%data_b, i64 %%2, !dbg !8 for 0x%I64xth hint within @load_data_and_op  --> \n", ++aesl_llvm_cbe_117_count);
  llvm_cbe_tmp__31 = (signed int *)(&llvm_cbe_data_b[(((signed long long )llvm_cbe_tmp__25))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__25));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%7, i32* %%8, align 4, !dbg !8 for 0x%I64xth hint within @load_data_and_op  --> \n", ++aesl_llvm_cbe_118_count);
  *llvm_cbe_tmp__31 = llvm_cbe_tmp__30;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__30);
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = getelementptr inbounds i32* %%op, i64 %%2, !dbg !8 for 0x%I64xth hint within @load_data_and_op  --> \n", ++aesl_llvm_cbe_119_count);
  llvm_cbe_tmp__32 = (signed int *)(&llvm_cbe_op[(((signed long long )llvm_cbe_tmp__25))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__25));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = load volatile i32* %%9, align 4, !dbg !8 for 0x%I64xth hint within @load_data_and_op  --> \n", ++aesl_llvm_cbe_120_count);
  llvm_cbe_tmp__33 = (unsigned int )*((unsigned int volatile*)llvm_cbe_tmp__32);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__33);
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = getelementptr inbounds i32* %%ALU_operation, i64 %%2, !dbg !8 for 0x%I64xth hint within @load_data_and_op  --> \n", ++aesl_llvm_cbe_121_count);
  llvm_cbe_tmp__34 = (signed int *)(&llvm_cbe_ALU_operation[(((signed long long )llvm_cbe_tmp__25))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__25));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%10, i32* %%11, align 4, !dbg !8 for 0x%I64xth hint within @load_data_and_op  --> \n", ++aesl_llvm_cbe_122_count);
  *llvm_cbe_tmp__34 = llvm_cbe_tmp__33;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__33);
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = add nsw i32 %%storemerge1, 1, !dbg !9 for 0x%I64xth hint within @load_data_and_op  --> \n", ++aesl_llvm_cbe_123_count);
  llvm_cbe_tmp__35 = (unsigned int )((unsigned int )(llvm_cbe_storemerge1&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__35&4294967295ull)));
  if (((llvm_cbe_tmp__35&4294967295U) == (50u&4294967295U))) {
    goto llvm_cbe_tmp__37;
  } else {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__35;   /* for PHI node */
    goto llvm_cbe_tmp__36;
  }

  } while (1); /* end of syntactic loop '' */
llvm_cbe_tmp__37:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @load_data_and_op}\n");
  return;
}


void execute(signed int *llvm_cbe_data_a, signed int *llvm_cbe_data_b, signed int *llvm_cbe_ALU_operation, signed int *llvm_cbe_data_result) {
  static  unsigned long long aesl_llvm_cbe_135_count = 0;
  static  unsigned long long aesl_llvm_cbe_136_count = 0;
  static  unsigned long long aesl_llvm_cbe_137_count = 0;
  static  unsigned long long aesl_llvm_cbe_138_count = 0;
  static  unsigned long long aesl_llvm_cbe_139_count = 0;
  static  unsigned long long aesl_llvm_cbe_140_count = 0;
  static  unsigned long long aesl_llvm_cbe_141_count = 0;
  static  unsigned long long aesl_llvm_cbe_142_count = 0;
  static  unsigned long long aesl_llvm_cbe_143_count = 0;
  static  unsigned long long aesl_llvm_cbe_144_count = 0;
  static  unsigned long long aesl_llvm_cbe_145_count = 0;
  static  unsigned long long aesl_llvm_cbe_146_count = 0;
  static  unsigned long long aesl_llvm_cbe_147_count = 0;
  static  unsigned long long aesl_llvm_cbe_148_count = 0;
  static  unsigned long long aesl_llvm_cbe_149_count = 0;
  static  unsigned long long aesl_llvm_cbe_150_count = 0;
  static  unsigned long long aesl_llvm_cbe_151_count = 0;
  static  unsigned long long aesl_llvm_cbe_152_count = 0;
  static  unsigned long long aesl_llvm_cbe_153_count = 0;
  static  unsigned long long aesl_llvm_cbe_154_count = 0;
  static  unsigned long long aesl_llvm_cbe_155_count = 0;
  static  unsigned long long aesl_llvm_cbe_156_count = 0;
  static  unsigned long long aesl_llvm_cbe_157_count = 0;
  static  unsigned long long aesl_llvm_cbe_158_count = 0;
  static  unsigned long long aesl_llvm_cbe_159_count = 0;
  static  unsigned long long aesl_llvm_cbe_160_count = 0;
  static  unsigned long long aesl_llvm_cbe_161_count = 0;
  static  unsigned long long aesl_llvm_cbe_162_count = 0;
  static  unsigned long long aesl_llvm_cbe_163_count = 0;
  static  unsigned long long aesl_llvm_cbe_164_count = 0;
  static  unsigned long long aesl_llvm_cbe_165_count = 0;
  static  unsigned long long aesl_llvm_cbe_166_count = 0;
  static  unsigned long long aesl_llvm_cbe_167_count = 0;
  static  unsigned long long aesl_llvm_cbe_168_count = 0;
  static  unsigned long long aesl_llvm_cbe_169_count = 0;
  static  unsigned long long aesl_llvm_cbe_170_count = 0;
  static  unsigned long long aesl_llvm_cbe_171_count = 0;
  static  unsigned long long aesl_llvm_cbe_172_count = 0;
  static  unsigned long long aesl_llvm_cbe_173_count = 0;
  static  unsigned long long aesl_llvm_cbe_174_count = 0;
  static  unsigned long long aesl_llvm_cbe_175_count = 0;
  static  unsigned long long aesl_llvm_cbe_176_count = 0;
  static  unsigned long long aesl_llvm_cbe_177_count = 0;
  static  unsigned long long aesl_llvm_cbe_178_count = 0;
  static  unsigned long long aesl_llvm_cbe_179_count = 0;
  static  unsigned long long aesl_llvm_cbe_180_count = 0;
  static  unsigned long long aesl_llvm_cbe_181_count = 0;
  static  unsigned long long aesl_llvm_cbe_182_count = 0;
  static  unsigned long long aesl_llvm_cbe_183_count = 0;
  static  unsigned long long aesl_llvm_cbe_184_count = 0;
  static  unsigned long long aesl_llvm_cbe_185_count = 0;
  static  unsigned long long aesl_llvm_cbe_186_count = 0;
  static  unsigned long long aesl_llvm_cbe_187_count = 0;
  static  unsigned long long aesl_llvm_cbe_188_count = 0;
  static  unsigned long long aesl_llvm_cbe_189_count = 0;
  static  unsigned long long aesl_llvm_cbe_190_count = 0;
  static  unsigned long long aesl_llvm_cbe_191_count = 0;
  static  unsigned long long aesl_llvm_cbe_192_count = 0;
  static  unsigned long long aesl_llvm_cbe_193_count = 0;
  static  unsigned long long aesl_llvm_cbe_194_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  unsigned int llvm_cbe_storemerge1;
  unsigned int llvm_cbe_storemerge1__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_195_count = 0;
  unsigned long long llvm_cbe_tmp__38;
  static  unsigned long long aesl_llvm_cbe_196_count = 0;
  signed int *llvm_cbe_tmp__39;
  static  unsigned long long aesl_llvm_cbe_197_count = 0;
  unsigned int llvm_cbe_tmp__40;
  static  unsigned long long aesl_llvm_cbe_198_count = 0;
  static  unsigned long long aesl_llvm_cbe_199_count = 0;
  signed int *llvm_cbe_tmp__41;
  static  unsigned long long aesl_llvm_cbe_200_count = 0;
  unsigned int llvm_cbe_tmp__42;
  static  unsigned long long aesl_llvm_cbe_201_count = 0;
  unsigned int llvm_cbe_tmp__43;
  static  unsigned long long aesl_llvm_cbe_202_count = 0;
  signed int *llvm_cbe_tmp__44;
  static  unsigned long long aesl_llvm_cbe_203_count = 0;
  static  unsigned long long aesl_llvm_cbe_204_count = 0;
  static  unsigned long long aesl_llvm_cbe_205_count = 0;
  signed int *llvm_cbe_tmp__45;
  static  unsigned long long aesl_llvm_cbe_206_count = 0;
  unsigned int llvm_cbe_tmp__46;
  static  unsigned long long aesl_llvm_cbe_207_count = 0;
  unsigned int llvm_cbe_tmp__47;
  static  unsigned long long aesl_llvm_cbe_208_count = 0;
  signed int *llvm_cbe_tmp__48;
  static  unsigned long long aesl_llvm_cbe_209_count = 0;
  static  unsigned long long aesl_llvm_cbe_210_count = 0;
  static  unsigned long long aesl_llvm_cbe_211_count = 0;
  signed int *llvm_cbe_tmp__49;
  static  unsigned long long aesl_llvm_cbe_212_count = 0;
  unsigned int llvm_cbe_tmp__50;
  static  unsigned long long aesl_llvm_cbe_213_count = 0;
  unsigned int llvm_cbe_tmp__51;
  static  unsigned long long aesl_llvm_cbe_214_count = 0;
  signed int *llvm_cbe_tmp__52;
  static  unsigned long long aesl_llvm_cbe_215_count = 0;
  static  unsigned long long aesl_llvm_cbe_216_count = 0;
  static  unsigned long long aesl_llvm_cbe_217_count = 0;
  signed int *llvm_cbe_tmp__53;
  static  unsigned long long aesl_llvm_cbe_218_count = 0;
  unsigned int llvm_cbe_tmp__54;
  static  unsigned long long aesl_llvm_cbe_219_count = 0;
  unsigned int llvm_cbe_tmp__55;
  static  unsigned long long aesl_llvm_cbe_220_count = 0;
  signed int *llvm_cbe_tmp__56;
  static  unsigned long long aesl_llvm_cbe_221_count = 0;
  static  unsigned long long aesl_llvm_cbe_222_count = 0;
  static  unsigned long long aesl_llvm_cbe_223_count = 0;
  signed int *llvm_cbe_tmp__57;
  static  unsigned long long aesl_llvm_cbe_224_count = 0;
  unsigned int llvm_cbe_tmp__58;
  static  unsigned long long aesl_llvm_cbe_225_count = 0;
  unsigned int llvm_cbe_tmp__59;
  static  unsigned long long aesl_llvm_cbe_226_count = 0;
  signed int *llvm_cbe_tmp__60;
  static  unsigned long long aesl_llvm_cbe_227_count = 0;
  static  unsigned long long aesl_llvm_cbe_228_count = 0;
  static  unsigned long long aesl_llvm_cbe_229_count = 0;
  signed int *llvm_cbe_tmp__61;
  static  unsigned long long aesl_llvm_cbe_230_count = 0;
  unsigned int llvm_cbe_tmp__62;
  static  unsigned long long aesl_llvm_cbe_231_count = 0;
  unsigned int llvm_cbe_tmp__63;
  static  unsigned long long aesl_llvm_cbe_232_count = 0;
  signed int *llvm_cbe_tmp__64;
  static  unsigned long long aesl_llvm_cbe_233_count = 0;
  static  unsigned long long aesl_llvm_cbe_234_count = 0;
  static  unsigned long long aesl_llvm_cbe_235_count = 0;
  signed int *llvm_cbe_tmp__65;
  static  unsigned long long aesl_llvm_cbe_236_count = 0;
  unsigned int llvm_cbe_tmp__66;
  static  unsigned long long aesl_llvm_cbe_237_count = 0;
  signed int *llvm_cbe_tmp__67;
  static  unsigned long long aesl_llvm_cbe_238_count = 0;
  unsigned int llvm_cbe_tmp__68;
  static  unsigned long long aesl_llvm_cbe_239_count = 0;
  unsigned int llvm_cbe_tmp__69;
  static  unsigned long long aesl_llvm_cbe_240_count = 0;
  signed int *llvm_cbe_tmp__70;
  static  unsigned long long aesl_llvm_cbe_241_count = 0;
  static  unsigned long long aesl_llvm_cbe_242_count = 0;
  static  unsigned long long aesl_llvm_cbe_243_count = 0;
  signed int *llvm_cbe_tmp__71;
  static  unsigned long long aesl_llvm_cbe_244_count = 0;
  unsigned int llvm_cbe_tmp__72;
  static  unsigned long long aesl_llvm_cbe_245_count = 0;
  signed int *llvm_cbe_tmp__73;
  static  unsigned long long aesl_llvm_cbe_246_count = 0;
  unsigned int llvm_cbe_tmp__74;
  static  unsigned long long aesl_llvm_cbe_247_count = 0;
  unsigned int llvm_cbe_tmp__75;
  static  unsigned long long aesl_llvm_cbe_248_count = 0;
  signed int *llvm_cbe_tmp__76;
  static  unsigned long long aesl_llvm_cbe_249_count = 0;
  static  unsigned long long aesl_llvm_cbe_250_count = 0;
  static  unsigned long long aesl_llvm_cbe_251_count = 0;
  signed int *llvm_cbe_tmp__77;
  static  unsigned long long aesl_llvm_cbe_252_count = 0;
  unsigned int llvm_cbe_tmp__78;
  static  unsigned long long aesl_llvm_cbe_253_count = 0;
  signed int *llvm_cbe_tmp__79;
  static  unsigned long long aesl_llvm_cbe_254_count = 0;
  unsigned int llvm_cbe_tmp__80;
  static  unsigned long long aesl_llvm_cbe_255_count = 0;
  unsigned int llvm_cbe_tmp__81;
  static  unsigned long long aesl_llvm_cbe_256_count = 0;
  signed int *llvm_cbe_tmp__82;
  static  unsigned long long aesl_llvm_cbe_257_count = 0;
  static  unsigned long long aesl_llvm_cbe_258_count = 0;
  static  unsigned long long aesl_llvm_cbe_259_count = 0;
  signed int *llvm_cbe_tmp__83;
  static  unsigned long long aesl_llvm_cbe_260_count = 0;
  unsigned int llvm_cbe_tmp__84;
  static  unsigned long long aesl_llvm_cbe_261_count = 0;
  signed int *llvm_cbe_tmp__85;
  static  unsigned long long aesl_llvm_cbe_262_count = 0;
  unsigned int llvm_cbe_tmp__86;
  static  unsigned long long aesl_llvm_cbe_263_count = 0;
  unsigned int llvm_cbe_tmp__87;
  static  unsigned long long aesl_llvm_cbe_264_count = 0;
  signed int *llvm_cbe_tmp__88;
  static  unsigned long long aesl_llvm_cbe_265_count = 0;
  static  unsigned long long aesl_llvm_cbe_266_count = 0;
  static  unsigned long long aesl_llvm_cbe_267_count = 0;
  signed int *llvm_cbe_tmp__89;
  static  unsigned long long aesl_llvm_cbe_268_count = 0;
  static  unsigned long long aesl_llvm_cbe_269_count = 0;
  static  unsigned long long aesl_llvm_cbe_270_count = 0;
  unsigned int llvm_cbe_tmp__90;
  static  unsigned long long aesl_llvm_cbe_271_count = 0;
  static  unsigned long long aesl_llvm_cbe_272_count = 0;
  static  unsigned long long aesl_llvm_cbe_273_count = 0;
  static  unsigned long long aesl_llvm_cbe_274_count = 0;
  static  unsigned long long aesl_llvm_cbe_275_count = 0;
  static  unsigned long long aesl_llvm_cbe_276_count = 0;
  static  unsigned long long aesl_llvm_cbe_277_count = 0;
  static  unsigned long long aesl_llvm_cbe_278_count = 0;
  static  unsigned long long aesl_llvm_cbe_279_count = 0;
  static  unsigned long long aesl_llvm_cbe_280_count = 0;
  static  unsigned long long aesl_llvm_cbe_281_count = 0;
  static  unsigned long long aesl_llvm_cbe_282_count = 0;
  static  unsigned long long aesl_llvm_cbe_283_count = 0;
  static  unsigned long long aesl_llvm_cbe_284_count = 0;
  static  unsigned long long aesl_llvm_cbe_285_count = 0;
  static  unsigned long long aesl_llvm_cbe_286_count = 0;
  static  unsigned long long aesl_llvm_cbe_287_count = 0;
  static  unsigned long long aesl_llvm_cbe_288_count = 0;
  static  unsigned long long aesl_llvm_cbe_289_count = 0;
  static  unsigned long long aesl_llvm_cbe_290_count = 0;
  static  unsigned long long aesl_llvm_cbe_291_count = 0;
  static  unsigned long long aesl_llvm_cbe_292_count = 0;
  static  unsigned long long aesl_llvm_cbe_293_count = 0;
  static  unsigned long long aesl_llvm_cbe_294_count = 0;
  static  unsigned long long aesl_llvm_cbe_295_count = 0;
  static  unsigned long long aesl_llvm_cbe_296_count = 0;
  static  unsigned long long aesl_llvm_cbe_297_count = 0;
  static  unsigned long long aesl_llvm_cbe_298_count = 0;
  static  unsigned long long aesl_llvm_cbe_299_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_300_count = 0;
  static  unsigned long long aesl_llvm_cbe_301_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @execute\n");
  llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe_tmp__91;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__91:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = phi i32 [ 0, %%0 ], [ %%66, %%65  for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (unsigned int )llvm_cbe_storemerge1__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1 = 0x%X",llvm_cbe_storemerge1);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__90);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = sext i32 %%storemerge1 to i64, !dbg !9 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_195_count);
  llvm_cbe_tmp__38 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__38);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = getelementptr inbounds i32* %%ALU_operation, i64 %%2, !dbg !9 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_196_count);
  llvm_cbe_tmp__39 = (signed int *)(&llvm_cbe_ALU_operation[(((signed long long )llvm_cbe_tmp__38))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__38));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = load i32* %%3, align 4, !dbg !9 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_197_count);
  llvm_cbe_tmp__40 = (unsigned int )*llvm_cbe_tmp__39;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__40);
  switch (((unsigned int )(llvm_cbe_tmp__40&4294967295ull))) {
  default:
    goto llvm_cbe_tmp__92;
;
  case ((unsigned int )(0u&4294967295ull)):
    goto llvm_cbe_tmp__93;
    break;
  case ((unsigned int )(1u&4294967295ull)):
    goto llvm_cbe_tmp__94;
  case ((unsigned int )(2u&4294967295ull)):
    goto llvm_cbe_tmp__95;
  case ((unsigned int )(3u&4294967295ull)):
    goto llvm_cbe_tmp__96;
  case ((unsigned int )(4u&4294967295ull)):
    goto llvm_cbe_tmp__97;
  case ((unsigned int )(5u&4294967295ull)):
    goto llvm_cbe_tmp__98;
  case ((unsigned int )(6u&4294967295ull)):
    goto llvm_cbe_tmp__99;
  case ((unsigned int )(7u&4294967295ull)):
    goto llvm_cbe_tmp__100;
  case ((unsigned int )(8u&4294967295ull)):
    goto llvm_cbe_tmp__101;
  case ((unsigned int )(9u&4294967295ull)):
    goto llvm_cbe_tmp__102;
  }
llvm_cbe_tmp__103:
if (AESL_DEBUG_TRACE)
printf("\n  %%66 = add nsw i32 %%storemerge1, 1, !dbg !10 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_270_count);
  llvm_cbe_tmp__90 = (unsigned int )((unsigned int )(llvm_cbe_storemerge1&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__90&4294967295ull)));
  if (((llvm_cbe_tmp__90&4294967295U) == (50u&4294967295U))) {
    goto llvm_cbe_tmp__104;
  } else {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__90;   /* for PHI node */
    goto llvm_cbe_tmp__91;
  }

llvm_cbe_tmp__93:
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = getelementptr inbounds i32* %%data_a, i64 %%2, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_199_count);
  llvm_cbe_tmp__41 = (signed int *)(&llvm_cbe_data_a[(((signed long long )llvm_cbe_tmp__38))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__38));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = load i32* %%6, align 4, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_200_count);
  llvm_cbe_tmp__42 = (unsigned int )*llvm_cbe_tmp__41;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__42);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = add nsw i32 %%7, 27, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_201_count);
  llvm_cbe_tmp__43 = (unsigned int )((unsigned int )(llvm_cbe_tmp__42&4294967295ull)) + ((unsigned int )(27u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__43&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = getelementptr inbounds i32* %%data_result, i64 %%2, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_202_count);
  llvm_cbe_tmp__44 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__38))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__38));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%8, i32* %%9, align 4, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_203_count);
  *llvm_cbe_tmp__44 = llvm_cbe_tmp__43;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__43);
  goto llvm_cbe_tmp__103;

llvm_cbe_tmp__94:
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = getelementptr inbounds i32* %%data_b, i64 %%2, !dbg !9 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_205_count);
  llvm_cbe_tmp__45 = (signed int *)(&llvm_cbe_data_b[(((signed long long )llvm_cbe_tmp__38))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__38));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = load i32* %%11, align 4, !dbg !9 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_206_count);
  llvm_cbe_tmp__46 = (unsigned int )*llvm_cbe_tmp__45;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__46);
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = add nsw i32 %%12, 27, !dbg !9 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_207_count);
  llvm_cbe_tmp__47 = (unsigned int )((unsigned int )(llvm_cbe_tmp__46&4294967295ull)) + ((unsigned int )(27u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__47&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = getelementptr inbounds i32* %%data_result, i64 %%2, !dbg !9 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_208_count);
  llvm_cbe_tmp__48 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__38))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__38));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%13, i32* %%14, align 4, !dbg !9 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_209_count);
  *llvm_cbe_tmp__48 = llvm_cbe_tmp__47;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__47);
  goto llvm_cbe_tmp__103;

llvm_cbe_tmp__95:
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = getelementptr inbounds i32* %%data_a, i64 %%2, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_211_count);
  llvm_cbe_tmp__49 = (signed int *)(&llvm_cbe_data_a[(((signed long long )llvm_cbe_tmp__38))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__38));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = load i32* %%16, align 4, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_212_count);
  llvm_cbe_tmp__50 = (unsigned int )*llvm_cbe_tmp__49;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__50);
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = shl nsw i32 %%17, 1, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_213_count);
  llvm_cbe_tmp__51 = (unsigned int )llvm_cbe_tmp__50 << 1u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__51);
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = getelementptr inbounds i32* %%data_result, i64 %%2, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_214_count);
  llvm_cbe_tmp__52 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__38))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__38));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%18, i32* %%19, align 4, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_215_count);
  *llvm_cbe_tmp__52 = llvm_cbe_tmp__51;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__51);
  goto llvm_cbe_tmp__103;

llvm_cbe_tmp__96:
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = getelementptr inbounds i32* %%data_b, i64 %%2, !dbg !9 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_217_count);
  llvm_cbe_tmp__53 = (signed int *)(&llvm_cbe_data_b[(((signed long long )llvm_cbe_tmp__38))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__38));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = load i32* %%21, align 4, !dbg !9 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_218_count);
  llvm_cbe_tmp__54 = (unsigned int )*llvm_cbe_tmp__53;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__54);
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = shl nsw i32 %%22, 1, !dbg !9 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_219_count);
  llvm_cbe_tmp__55 = (unsigned int )llvm_cbe_tmp__54 << 1u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__55);
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = getelementptr inbounds i32* %%data_result, i64 %%2, !dbg !9 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_220_count);
  llvm_cbe_tmp__56 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__38))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__38));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%23, i32* %%24, align 4, !dbg !9 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_221_count);
  *llvm_cbe_tmp__56 = llvm_cbe_tmp__55;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__55);
  goto llvm_cbe_tmp__103;

llvm_cbe_tmp__97:
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = getelementptr inbounds i32* %%data_a, i64 %%2, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_223_count);
  llvm_cbe_tmp__57 = (signed int *)(&llvm_cbe_data_a[(((signed long long )llvm_cbe_tmp__38))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__38));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = load i32* %%26, align 4, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_224_count);
  llvm_cbe_tmp__58 = (unsigned int )*llvm_cbe_tmp__57;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__58);
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = sdiv i32 %%27, 2, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_225_count);
  llvm_cbe_tmp__59 = (unsigned int )((signed int )(((signed int )llvm_cbe_tmp__58) / ((signed int )2u)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__59));
if (AESL_DEBUG_TRACE)
printf("\n  %%29 = getelementptr inbounds i32* %%data_result, i64 %%2, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_226_count);
  llvm_cbe_tmp__60 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__38))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__38));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%28, i32* %%29, align 4, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_227_count);
  *llvm_cbe_tmp__60 = llvm_cbe_tmp__59;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__59);
  goto llvm_cbe_tmp__103;

llvm_cbe_tmp__98:
if (AESL_DEBUG_TRACE)
printf("\n  %%31 = getelementptr inbounds i32* %%data_b, i64 %%2, !dbg !9 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_229_count);
  llvm_cbe_tmp__61 = (signed int *)(&llvm_cbe_data_b[(((signed long long )llvm_cbe_tmp__38))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__38));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%32 = load i32* %%31, align 4, !dbg !9 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_230_count);
  llvm_cbe_tmp__62 = (unsigned int )*llvm_cbe_tmp__61;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__62);
if (AESL_DEBUG_TRACE)
printf("\n  %%33 = sdiv i32 %%32, 2, !dbg !9 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_231_count);
  llvm_cbe_tmp__63 = (unsigned int )((signed int )(((signed int )llvm_cbe_tmp__62) / ((signed int )2u)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__63));
if (AESL_DEBUG_TRACE)
printf("\n  %%34 = getelementptr inbounds i32* %%data_result, i64 %%2, !dbg !9 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_232_count);
  llvm_cbe_tmp__64 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__38))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__38));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%33, i32* %%34, align 4, !dbg !9 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_233_count);
  *llvm_cbe_tmp__64 = llvm_cbe_tmp__63;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__63);
  goto llvm_cbe_tmp__103;

llvm_cbe_tmp__99:
if (AESL_DEBUG_TRACE)
printf("\n  %%36 = getelementptr inbounds i32* %%data_a, i64 %%2, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_235_count);
  llvm_cbe_tmp__65 = (signed int *)(&llvm_cbe_data_a[(((signed long long )llvm_cbe_tmp__38))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__38));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%37 = load i32* %%36, align 4, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_236_count);
  llvm_cbe_tmp__66 = (unsigned int )*llvm_cbe_tmp__65;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__66);
if (AESL_DEBUG_TRACE)
printf("\n  %%38 = getelementptr inbounds i32* %%data_b, i64 %%2, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_237_count);
  llvm_cbe_tmp__67 = (signed int *)(&llvm_cbe_data_b[(((signed long long )llvm_cbe_tmp__38))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__38));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%39 = load i32* %%38, align 4, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_238_count);
  llvm_cbe_tmp__68 = (unsigned int )*llvm_cbe_tmp__67;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__68);
if (AESL_DEBUG_TRACE)
printf("\n  %%40 = add nsw i32 %%39, %%37, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_239_count);
  llvm_cbe_tmp__69 = (unsigned int )((unsigned int )(llvm_cbe_tmp__68&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__66&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__69&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%41 = getelementptr inbounds i32* %%data_result, i64 %%2, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_240_count);
  llvm_cbe_tmp__70 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__38))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__38));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%40, i32* %%41, align 4, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_241_count);
  *llvm_cbe_tmp__70 = llvm_cbe_tmp__69;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__69);
  goto llvm_cbe_tmp__103;

llvm_cbe_tmp__100:
if (AESL_DEBUG_TRACE)
printf("\n  %%43 = getelementptr inbounds i32* %%data_a, i64 %%2, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_243_count);
  llvm_cbe_tmp__71 = (signed int *)(&llvm_cbe_data_a[(((signed long long )llvm_cbe_tmp__38))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__38));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%44 = load i32* %%43, align 4, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_244_count);
  llvm_cbe_tmp__72 = (unsigned int )*llvm_cbe_tmp__71;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__72);
if (AESL_DEBUG_TRACE)
printf("\n  %%45 = getelementptr inbounds i32* %%data_b, i64 %%2, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_245_count);
  llvm_cbe_tmp__73 = (signed int *)(&llvm_cbe_data_b[(((signed long long )llvm_cbe_tmp__38))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__38));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%46 = load i32* %%45, align 4, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_246_count);
  llvm_cbe_tmp__74 = (unsigned int )*llvm_cbe_tmp__73;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__74);
if (AESL_DEBUG_TRACE)
printf("\n  %%47 = sub nsw i32 %%44, %%46, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_247_count);
  llvm_cbe_tmp__75 = (unsigned int )((unsigned int )(llvm_cbe_tmp__72&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__74&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__75&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%48 = getelementptr inbounds i32* %%data_result, i64 %%2, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_248_count);
  llvm_cbe_tmp__76 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__38))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__38));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%47, i32* %%48, align 4, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_249_count);
  *llvm_cbe_tmp__76 = llvm_cbe_tmp__75;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__75);
  goto llvm_cbe_tmp__103;

llvm_cbe_tmp__101:
if (AESL_DEBUG_TRACE)
printf("\n  %%50 = getelementptr inbounds i32* %%data_a, i64 %%2, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_251_count);
  llvm_cbe_tmp__77 = (signed int *)(&llvm_cbe_data_a[(((signed long long )llvm_cbe_tmp__38))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__38));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%51 = load i32* %%50, align 4, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_252_count);
  llvm_cbe_tmp__78 = (unsigned int )*llvm_cbe_tmp__77;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__78);
if (AESL_DEBUG_TRACE)
printf("\n  %%52 = getelementptr inbounds i32* %%data_b, i64 %%2, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_253_count);
  llvm_cbe_tmp__79 = (signed int *)(&llvm_cbe_data_b[(((signed long long )llvm_cbe_tmp__38))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__38));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%53 = load i32* %%52, align 4, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_254_count);
  llvm_cbe_tmp__80 = (unsigned int )*llvm_cbe_tmp__79;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__80);
if (AESL_DEBUG_TRACE)
printf("\n  %%54 = mul nsw i32 %%53, %%51, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_255_count);
  llvm_cbe_tmp__81 = (unsigned int )((unsigned int )(llvm_cbe_tmp__80&4294967295ull)) * ((unsigned int )(llvm_cbe_tmp__78&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__81&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%55 = getelementptr inbounds i32* %%data_result, i64 %%2, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_256_count);
  llvm_cbe_tmp__82 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__38))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__38));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%54, i32* %%55, align 4, !dbg !8 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_257_count);
  *llvm_cbe_tmp__82 = llvm_cbe_tmp__81;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__81);
  goto llvm_cbe_tmp__103;

llvm_cbe_tmp__102:
if (AESL_DEBUG_TRACE)
printf("\n  %%57 = getelementptr inbounds i32* %%data_a, i64 %%2, !dbg !9 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_259_count);
  llvm_cbe_tmp__83 = (signed int *)(&llvm_cbe_data_a[(((signed long long )llvm_cbe_tmp__38))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__38));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%58 = load i32* %%57, align 4, !dbg !9 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_260_count);
  llvm_cbe_tmp__84 = (unsigned int )*llvm_cbe_tmp__83;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__84);
if (AESL_DEBUG_TRACE)
printf("\n  %%59 = getelementptr inbounds i32* %%data_b, i64 %%2, !dbg !9 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_261_count);
  llvm_cbe_tmp__85 = (signed int *)(&llvm_cbe_data_b[(((signed long long )llvm_cbe_tmp__38))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__38));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%60 = load i32* %%59, align 4, !dbg !9 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_262_count);
  llvm_cbe_tmp__86 = (unsigned int )*llvm_cbe_tmp__85;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__86);
if (AESL_DEBUG_TRACE)
printf("\n  %%61 = sdiv i32 %%58, %%60, !dbg !9 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_263_count);
  llvm_cbe_tmp__87 = (unsigned int )((signed int )(((signed int )llvm_cbe_tmp__84) / ((signed int )llvm_cbe_tmp__86)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__87));
if (AESL_DEBUG_TRACE)
printf("\n  %%62 = getelementptr inbounds i32* %%data_result, i64 %%2, !dbg !9 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_264_count);
  llvm_cbe_tmp__88 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__38))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__38));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%61, i32* %%62, align 4, !dbg !9 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_265_count);
  *llvm_cbe_tmp__88 = llvm_cbe_tmp__87;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__87);
  goto llvm_cbe_tmp__103;

llvm_cbe_tmp__92:
if (AESL_DEBUG_TRACE)
printf("\n  %%64 = getelementptr inbounds i32* %%data_result, i64 %%2, !dbg !10 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_267_count);
  llvm_cbe_tmp__89 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__38))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__38));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* %%64, align 4, !dbg !10 for 0x%I64xth hint within @execute  --> \n", ++aesl_llvm_cbe_268_count);
  *llvm_cbe_tmp__89 = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
  goto llvm_cbe_tmp__103;

  } while (1); /* end of syntactic loop '' */
llvm_cbe_tmp__104:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @execute}\n");
  return;
}


void output(signed int *llvm_cbe_data_result, signed int *llvm_cbe_c) {
  static  unsigned long long aesl_llvm_cbe_302_count = 0;
  static  unsigned long long aesl_llvm_cbe_303_count = 0;
  static  unsigned long long aesl_llvm_cbe_304_count = 0;
  static  unsigned long long aesl_llvm_cbe_305_count = 0;
  static  unsigned long long aesl_llvm_cbe_306_count = 0;
  static  unsigned long long aesl_llvm_cbe_307_count = 0;
  static  unsigned long long aesl_llvm_cbe_308_count = 0;
  static  unsigned long long aesl_llvm_cbe_309_count = 0;
  static  unsigned long long aesl_llvm_cbe_310_count = 0;
  static  unsigned long long aesl_llvm_cbe_311_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  unsigned int llvm_cbe_storemerge1;
  unsigned int llvm_cbe_storemerge1__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_312_count = 0;
  unsigned long long llvm_cbe_tmp__105;
  static  unsigned long long aesl_llvm_cbe_313_count = 0;
  signed int *llvm_cbe_tmp__106;
  static  unsigned long long aesl_llvm_cbe_314_count = 0;
  unsigned int llvm_cbe_tmp__107;
  static  unsigned long long aesl_llvm_cbe_315_count = 0;
  signed int *llvm_cbe_tmp__108;
  static  unsigned long long aesl_llvm_cbe_316_count = 0;
  static  unsigned long long aesl_llvm_cbe_317_count = 0;
  unsigned int llvm_cbe_tmp__109;
  static  unsigned long long aesl_llvm_cbe_318_count = 0;
  static  unsigned long long aesl_llvm_cbe_319_count = 0;
  static  unsigned long long aesl_llvm_cbe_320_count = 0;
  static  unsigned long long aesl_llvm_cbe_321_count = 0;
  static  unsigned long long aesl_llvm_cbe_322_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_323_count = 0;
  static  unsigned long long aesl_llvm_cbe_324_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @output\n");
  llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe_tmp__110;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__110:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = phi i32 [ 0, %%0 ], [ %%6, %%1  for 0x%I64xth hint within @output  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (unsigned int )llvm_cbe_storemerge1__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1 = 0x%X",llvm_cbe_storemerge1);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__109);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = sext i32 %%storemerge1 to i64, !dbg !8 for 0x%I64xth hint within @output  --> \n", ++aesl_llvm_cbe_312_count);
  llvm_cbe_tmp__105 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__105);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = getelementptr inbounds i32* %%data_result, i64 %%2, !dbg !8 for 0x%I64xth hint within @output  --> \n", ++aesl_llvm_cbe_313_count);
  llvm_cbe_tmp__106 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__105))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__105));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = load i32* %%3, align 4, !dbg !8 for 0x%I64xth hint within @output  --> \n", ++aesl_llvm_cbe_314_count);
  llvm_cbe_tmp__107 = (unsigned int )*llvm_cbe_tmp__106;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__107);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = getelementptr inbounds i32* %%c, i64 %%2, !dbg !8 for 0x%I64xth hint within @output  --> \n", ++aesl_llvm_cbe_315_count);
  llvm_cbe_tmp__108 = (signed int *)(&llvm_cbe_c[(((signed long long )llvm_cbe_tmp__105))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__105));
}
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%4, i32* %%5, align 4, !dbg !8 for 0x%I64xth hint within @output  --> \n", ++aesl_llvm_cbe_316_count);
  *((unsigned int volatile*)llvm_cbe_tmp__108) = llvm_cbe_tmp__107;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__107);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = add nsw i32 %%storemerge1, 1, !dbg !8 for 0x%I64xth hint within @output  --> \n", ++aesl_llvm_cbe_317_count);
  llvm_cbe_tmp__109 = (unsigned int )((unsigned int )(llvm_cbe_storemerge1&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__109&4294967295ull)));
  if (((llvm_cbe_tmp__109&4294967295U) == (50u&4294967295U))) {
    goto llvm_cbe_tmp__111;
  } else {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__109;   /* for PHI node */
    goto llvm_cbe_tmp__110;
  }

  } while (1); /* end of syntactic loop '' */
llvm_cbe_tmp__111:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @output}\n");
  return;
}


void dec_MIMD(signed int *llvm_cbe_a, signed int *llvm_cbe_b, signed int *llvm_cbe_c, signed int *llvm_cbe_op, signed int llvm_cbe_selec) {
  static  unsigned long long aesl_llvm_cbe_325_count = 0;
  signed int llvm_cbe_tmp__112;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_data_result_count = 0;
  signed int llvm_cbe_data_result[50];    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_326_count = 0;
  static  unsigned long long aesl_llvm_cbe_327_count = 0;
  static  unsigned long long aesl_llvm_cbe_328_count = 0;
  static  unsigned long long aesl_llvm_cbe_329_count = 0;
  static  unsigned long long aesl_llvm_cbe_330_count = 0;
  static  unsigned long long aesl_llvm_cbe_331_count = 0;
  static  unsigned long long aesl_llvm_cbe_332_count = 0;
  static  unsigned long long aesl_llvm_cbe_333_count = 0;
  static  unsigned long long aesl_llvm_cbe_334_count = 0;
  static  unsigned long long aesl_llvm_cbe_335_count = 0;
  static  unsigned long long aesl_llvm_cbe_336_count = 0;
  static  unsigned long long aesl_llvm_cbe_337_count = 0;
  static  unsigned long long aesl_llvm_cbe_338_count = 0;
  static  unsigned long long aesl_llvm_cbe_339_count = 0;
  static  unsigned long long aesl_llvm_cbe_340_count = 0;
  static  unsigned long long aesl_llvm_cbe_341_count = 0;
  static  unsigned long long aesl_llvm_cbe_342_count = 0;
  unsigned int llvm_cbe_tmp__113;
  static  unsigned long long aesl_llvm_cbe_343_count = 0;
  static  unsigned long long aesl_llvm_cbe_344_count = 0;
  static  unsigned long long aesl_llvm_cbe_345_count = 0;
  static  unsigned long long aesl_llvm_cbe_346_count = 0;
  static  unsigned long long aesl_llvm_cbe_347_count = 0;
  static  unsigned long long aesl_llvm_cbe_348_count = 0;
  static  unsigned long long aesl_llvm_cbe_349_count = 0;
  static  unsigned long long aesl_llvm_cbe_350_count = 0;
  signed int *llvm_cbe_tmp__114;
  static  unsigned long long aesl_llvm_cbe_351_count = 0;
  static  unsigned long long aesl_llvm_cbe_352_count = 0;
  static  unsigned long long aesl_llvm_cbe_353_count = 0;
  signed int *llvm_cbe_tmp__115;
  static  unsigned long long aesl_llvm_cbe_354_count = 0;
  static  unsigned long long aesl_llvm_cbe_355_count = 0;
  static  unsigned long long aesl_llvm_cbe_356_count = 0;
  static  unsigned long long aesl_llvm_cbe_357_count = 0;
  static  unsigned long long aesl_llvm_cbe_358_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @dec_MIMD\n");
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%selec, i32* %%1, align  for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_339_count);
  *((unsigned int volatile*)(&llvm_cbe_tmp__112)) = llvm_cbe_selec;
if (AESL_DEBUG_TRACE)
printf("\nselec = 0x%X\n", llvm_cbe_selec);
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = load volatile i32* %%1, align 4, !dbg !9 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_342_count);
  llvm_cbe_tmp__113 = (unsigned int )*((unsigned int volatile*)(&llvm_cbe_tmp__112));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__113);
  switch (((unsigned int )(llvm_cbe_tmp__113&4294967295ull))) {
  default:
    goto llvm_cbe_tmp__116;
;
  case ((unsigned int )(0u&4294967295ull)):
    goto llvm_cbe_tmp__117;
    break;
  case ((unsigned int )(1u&4294967295ull)):
    goto llvm_cbe_tmp__118;
  case ((unsigned int )(2u&4294967295ull)):
    goto llvm_cbe_tmp__119;
  case ((unsigned int )(3u&4294967295ull)):
    goto llvm_cbe_tmp__120;
  case ((unsigned int )(4u&4294967295ull)):
    goto llvm_cbe_tmp__121;
  }
llvm_cbe_tmp__117:
if (AESL_DEBUG_TRACE)
printf("\n  call void @load_data(i32* %%a, i32* %%b, i32* getelementptr inbounds ([50 x i32]* @aesl_internal_dec_MIMD.data_a, i64 0, i64 0), i32* getelementptr inbounds ([50 x i32]* @aesl_internal_dec_MIMD.data_b, i64 0, i64 0)), !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_344_count);
  load_data((signed int *)llvm_cbe_a, (signed int *)llvm_cbe_b, (signed int *)((&aesl_internal_dec_MIMD_OC_data_a[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 50
#endif
])), (signed int *)((&aesl_internal_dec_MIMD_OC_data_b[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 50
#endif
])));
if (AESL_DEBUG_TRACE) {
}
  goto llvm_cbe_tmp__122;

llvm_cbe_tmp__118:
if (AESL_DEBUG_TRACE)
printf("\n  call void @load_op(i32* %%op, i32* getelementptr inbounds ([50 x i32]* @aesl_internal_dec_MIMD.ALU_operation, i64 0, i64 0)), !dbg !9 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_346_count);
  load_op((signed int *)llvm_cbe_op, (signed int *)((&aesl_internal_dec_MIMD_OC_ALU_operation[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 50
#endif
])));
if (AESL_DEBUG_TRACE) {
}
  goto llvm_cbe_tmp__122;

llvm_cbe_tmp__119:
if (AESL_DEBUG_TRACE)
printf("\n  call void @load_data_and_op(i32* %%a, i32* %%b, i32* %%op, i32* getelementptr inbounds ([50 x i32]* @aesl_internal_dec_MIMD.data_a, i64 0, i64 0), i32* getelementptr inbounds ([50 x i32]* @aesl_internal_dec_MIMD.data_b, i64 0, i64 0), i32* getelementptr inbounds ([50 x i32]* @aesl_internal_dec_MIMD.ALU_operation, i64 0, i64 0)), !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_348_count);
  load_data_and_op((signed int *)llvm_cbe_a, (signed int *)llvm_cbe_b, (signed int *)llvm_cbe_op, (signed int *)((&aesl_internal_dec_MIMD_OC_data_a[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 50
#endif
])), (signed int *)((&aesl_internal_dec_MIMD_OC_data_b[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 50
#endif
])), (signed int *)((&aesl_internal_dec_MIMD_OC_ALU_operation[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 50
#endif
])));
if (AESL_DEBUG_TRACE) {
}
  goto llvm_cbe_tmp__122;

llvm_cbe_tmp__120:
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = getelementptr inbounds [50 x i32]* %%data_result, i64 0, i64 0, !dbg !10 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_350_count);
  llvm_cbe_tmp__114 = (signed int *)(&llvm_cbe_data_result[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @execute(i32* getelementptr inbounds ([50 x i32]* @aesl_internal_dec_MIMD.data_a, i64 0, i64 0), i32* getelementptr inbounds ([50 x i32]* @aesl_internal_dec_MIMD.data_b, i64 0, i64 0), i32* getelementptr inbounds ([50 x i32]* @aesl_internal_dec_MIMD.ALU_operation, i64 0, i64 0), i32* %%7), !dbg !10 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_351_count);
  execute((signed int *)((&aesl_internal_dec_MIMD_OC_data_a[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 50
#endif
])), (signed int *)((&aesl_internal_dec_MIMD_OC_data_b[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 50
#endif
])), (signed int *)((&aesl_internal_dec_MIMD_OC_ALU_operation[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 50
#endif
])), (signed int *)llvm_cbe_tmp__114);
if (AESL_DEBUG_TRACE) {
}
  goto llvm_cbe_tmp__122;

llvm_cbe_tmp__121:
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = getelementptr inbounds [50 x i32]* %%data_result, i64 0, i64 0, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_353_count);
  llvm_cbe_tmp__115 = (signed int *)(&llvm_cbe_data_result[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @output(i32* %%9, i32* %%c), !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_354_count);
  output((signed int *)llvm_cbe_tmp__115, (signed int *)llvm_cbe_c);
if (AESL_DEBUG_TRACE) {
}
  goto llvm_cbe_tmp__122;

llvm_cbe_tmp__116:
if (AESL_DEBUG_TRACE)
printf("\n  call void @reset(i32* %%c, i32* getelementptr inbounds ([50 x i32]* @aesl_internal_dec_MIMD.data_a, i64 0, i64 0), i32* getelementptr inbounds ([50 x i32]* @aesl_internal_dec_MIMD.data_b, i64 0, i64 0)), !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_356_count);
  reset((signed int *)llvm_cbe_c, (signed int *)((&aesl_internal_dec_MIMD_OC_data_a[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 50
#endif
])), (signed int *)((&aesl_internal_dec_MIMD_OC_data_b[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 50
#endif
])));
if (AESL_DEBUG_TRACE) {
}
  goto llvm_cbe_tmp__122;

llvm_cbe_tmp__122:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @dec_MIMD}\n");
  return;
}

