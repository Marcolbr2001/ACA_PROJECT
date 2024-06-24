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
signed int main(void);
void dec_MIMD(signed int *, signed int *, signed int *, signed int *, signed int );


/* Global Variable Definitions and Initialization */
static  char aesl_internal__OC_str1[46] = "A = %d B = %d RES = %d, OP = %d, SELEC = %d \n";
static  char aesl_internal_str2[36] = "\n TO BE RIGHT THE RESULT MUST BE 28";
static  char aesl_internal_str4[36] = "\n TO BE RIGHT THE RESULT MUST BE 30";
static  char aesl_internal_str5[2] = "\n";


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

signed int main(void) {
  static  unsigned long long aesl_llvm_cbe_DATA_A_count = 0;
  signed int llvm_cbe_DATA_A[50];    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_DATA_B_count = 0;
  signed int llvm_cbe_DATA_B[50];    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_DATA_RESULT_count = 0;
  signed int llvm_cbe_DATA_RESULT[50];    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_ALU_OPERATION_count = 0;
  signed int llvm_cbe_ALU_OPERATION[50];    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_1_count = 0;
  static  unsigned long long aesl_llvm_cbe_2_count = 0;
  static  unsigned long long aesl_llvm_cbe_3_count = 0;
  static  unsigned long long aesl_llvm_cbe_4_count = 0;
  static  unsigned long long aesl_llvm_cbe_puts_count = 0;
  unsigned int llvm_cbe_puts;
  static  unsigned long long aesl_llvm_cbe_5_count = 0;
  static  unsigned long long aesl_llvm_cbe_6_count = 0;
  static  unsigned long long aesl_llvm_cbe_7_count = 0;
  static  unsigned long long aesl_llvm_cbe_8_count = 0;
  static  unsigned long long aesl_llvm_cbe_9_count = 0;
  static  unsigned long long aesl_llvm_cbe_10_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge24_count = 0;
  unsigned int llvm_cbe_storemerge24;
  unsigned int llvm_cbe_storemerge24__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_11_count = 0;
  unsigned long long llvm_cbe_tmp__1;
  static  unsigned long long aesl_llvm_cbe_12_count = 0;
  signed int *llvm_cbe_tmp__2;
  static  unsigned long long aesl_llvm_cbe_13_count = 0;
  static  unsigned long long aesl_llvm_cbe_14_count = 0;
  signed int *llvm_cbe_tmp__3;
  static  unsigned long long aesl_llvm_cbe_15_count = 0;
  static  unsigned long long aesl_llvm_cbe_16_count = 0;
  unsigned int llvm_cbe_tmp__4;
  static  unsigned long long aesl_llvm_cbe_17_count = 0;
  static  unsigned long long aesl_llvm_cbe_18_count = 0;
  static  unsigned long long aesl_llvm_cbe_19_count = 0;
  static  unsigned long long aesl_llvm_cbe_20_count = 0;
  static  unsigned long long aesl_llvm_cbe_21_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond32_count = 0;
  static  unsigned long long aesl_llvm_cbe_22_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge123_count = 0;
  unsigned int llvm_cbe_storemerge123;
  unsigned int llvm_cbe_storemerge123__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_23_count = 0;
  unsigned long long llvm_cbe_tmp__5;
  static  unsigned long long aesl_llvm_cbe_24_count = 0;
  signed int *llvm_cbe_tmp__6;
  static  unsigned long long aesl_llvm_cbe_25_count = 0;
  static  unsigned long long aesl_llvm_cbe_26_count = 0;
  unsigned int llvm_cbe_tmp__7;
  static  unsigned long long aesl_llvm_cbe_27_count = 0;
  static  unsigned long long aesl_llvm_cbe_28_count = 0;
  static  unsigned long long aesl_llvm_cbe_29_count = 0;
  static  unsigned long long aesl_llvm_cbe_30_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond31_count = 0;
  static  unsigned long long aesl_llvm_cbe_31_count = 0;
  static  unsigned long long aesl_llvm_cbe_32_count = 0;
  static  unsigned long long aesl_llvm_cbe_33_count = 0;
  static  unsigned long long aesl_llvm_cbe_34_count = 0;
  static  unsigned long long aesl_llvm_cbe_35_count = 0;
  static  unsigned long long aesl_llvm_cbe_36_count = 0;
  static  unsigned long long aesl_llvm_cbe_37_count = 0;
  static  unsigned long long aesl_llvm_cbe_38_count = 0;
  static  unsigned long long aesl_llvm_cbe_39_count = 0;
  signed int *llvm_cbe_tmp__8;
  static  unsigned long long aesl_llvm_cbe_40_count = 0;
  signed int *llvm_cbe_tmp__9;
  static  unsigned long long aesl_llvm_cbe_41_count = 0;
  signed int *llvm_cbe_tmp__10;
  static  unsigned long long aesl_llvm_cbe_42_count = 0;
  signed int *llvm_cbe_tmp__11;
  static  unsigned long long aesl_llvm_cbe_43_count = 0;
  static  unsigned long long aesl_llvm_cbe_44_count = 0;
  static  unsigned long long aesl_llvm_cbe_45_count = 0;
  static  unsigned long long aesl_llvm_cbe_46_count = 0;
  static  unsigned long long aesl_llvm_cbe_47_count = 0;
  static  unsigned long long aesl_llvm_cbe_48_count = 0;
  static  unsigned long long aesl_llvm_cbe_49_count = 0;
  static  unsigned long long aesl_llvm_cbe_50_count = 0;
  static  unsigned long long aesl_llvm_cbe_51_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge221_count = 0;
  unsigned int llvm_cbe_storemerge221;
  unsigned int llvm_cbe_storemerge221__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_52_count = 0;
  unsigned long long llvm_cbe_tmp__12;
  static  unsigned long long aesl_llvm_cbe_53_count = 0;
  signed int *llvm_cbe_tmp__13;
  static  unsigned long long aesl_llvm_cbe_54_count = 0;
  unsigned int llvm_cbe_tmp__14;
  static  unsigned long long aesl_llvm_cbe_55_count = 0;
  signed int *llvm_cbe_tmp__15;
  static  unsigned long long aesl_llvm_cbe_56_count = 0;
  unsigned int llvm_cbe_tmp__16;
  static  unsigned long long aesl_llvm_cbe_57_count = 0;
  signed int *llvm_cbe_tmp__17;
  static  unsigned long long aesl_llvm_cbe_58_count = 0;
  unsigned int llvm_cbe_tmp__18;
  static  unsigned long long aesl_llvm_cbe_59_count = 0;
  signed int *llvm_cbe_tmp__19;
  static  unsigned long long aesl_llvm_cbe_60_count = 0;
  unsigned int llvm_cbe_tmp__20;
  static  unsigned long long aesl_llvm_cbe_61_count = 0;
  unsigned int llvm_cbe_tmp__21;
  static  unsigned long long aesl_llvm_cbe_62_count = 0;
  unsigned int llvm_cbe_tmp__22;
  static  unsigned long long aesl_llvm_cbe_63_count = 0;
  static  unsigned long long aesl_llvm_cbe_64_count = 0;
  static  unsigned long long aesl_llvm_cbe_65_count = 0;
  static  unsigned long long aesl_llvm_cbe_66_count = 0;
  static  unsigned long long aesl_llvm_cbe_67_count = 0;
  static  unsigned long long aesl_llvm_cbe_68_count = 0;
  static  unsigned long long aesl_llvm_cbe_69_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond30_count = 0;
  static  unsigned long long aesl_llvm_cbe_70_count = 0;
  static  unsigned long long aesl_llvm_cbe_puts9_count = 0;
  unsigned int llvm_cbe_puts9;
  static  unsigned long long aesl_llvm_cbe_puts10_count = 0;
  unsigned int llvm_cbe_puts10;
  static  unsigned long long aesl_llvm_cbe_71_count = 0;
  static  unsigned long long aesl_llvm_cbe_72_count = 0;
  static  unsigned long long aesl_llvm_cbe_73_count = 0;
  static  unsigned long long aesl_llvm_cbe_74_count = 0;
  static  unsigned long long aesl_llvm_cbe_75_count = 0;
  static  unsigned long long aesl_llvm_cbe_76_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge320_count = 0;
  unsigned int llvm_cbe_storemerge320;
  unsigned int llvm_cbe_storemerge320__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_77_count = 0;
  unsigned long long llvm_cbe_tmp__23;
  static  unsigned long long aesl_llvm_cbe_78_count = 0;
  signed int *llvm_cbe_tmp__24;
  static  unsigned long long aesl_llvm_cbe_79_count = 0;
  static  unsigned long long aesl_llvm_cbe_80_count = 0;
  signed int *llvm_cbe_tmp__25;
  static  unsigned long long aesl_llvm_cbe_81_count = 0;
  static  unsigned long long aesl_llvm_cbe_82_count = 0;
  unsigned int llvm_cbe_tmp__26;
  static  unsigned long long aesl_llvm_cbe_83_count = 0;
  static  unsigned long long aesl_llvm_cbe_84_count = 0;
  static  unsigned long long aesl_llvm_cbe_85_count = 0;
  static  unsigned long long aesl_llvm_cbe_86_count = 0;
  static  unsigned long long aesl_llvm_cbe_87_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond29_count = 0;
  static  unsigned long long aesl_llvm_cbe_88_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge419_count = 0;
  unsigned int llvm_cbe_storemerge419;
  unsigned int llvm_cbe_storemerge419__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_89_count = 0;
  unsigned long long llvm_cbe_tmp__27;
  static  unsigned long long aesl_llvm_cbe_90_count = 0;
  signed int *llvm_cbe_tmp__28;
  static  unsigned long long aesl_llvm_cbe_91_count = 0;
  static  unsigned long long aesl_llvm_cbe_92_count = 0;
  unsigned int llvm_cbe_tmp__29;
  static  unsigned long long aesl_llvm_cbe_93_count = 0;
  static  unsigned long long aesl_llvm_cbe_94_count = 0;
  static  unsigned long long aesl_llvm_cbe_95_count = 0;
  static  unsigned long long aesl_llvm_cbe_96_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond28_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_110_count = 0;
  static  unsigned long long aesl_llvm_cbe_111_count = 0;
  static  unsigned long long aesl_llvm_cbe_112_count = 0;
  static  unsigned long long aesl_llvm_cbe_113_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge517_count = 0;
  unsigned int llvm_cbe_storemerge517;
  unsigned int llvm_cbe_storemerge517__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_114_count = 0;
  unsigned long long llvm_cbe_tmp__30;
  static  unsigned long long aesl_llvm_cbe_115_count = 0;
  signed int *llvm_cbe_tmp__31;
  static  unsigned long long aesl_llvm_cbe_116_count = 0;
  unsigned int llvm_cbe_tmp__32;
  static  unsigned long long aesl_llvm_cbe_117_count = 0;
  signed int *llvm_cbe_tmp__33;
  static  unsigned long long aesl_llvm_cbe_118_count = 0;
  unsigned int llvm_cbe_tmp__34;
  static  unsigned long long aesl_llvm_cbe_119_count = 0;
  signed int *llvm_cbe_tmp__35;
  static  unsigned long long aesl_llvm_cbe_120_count = 0;
  unsigned int llvm_cbe_tmp__36;
  static  unsigned long long aesl_llvm_cbe_121_count = 0;
  signed int *llvm_cbe_tmp__37;
  static  unsigned long long aesl_llvm_cbe_122_count = 0;
  unsigned int llvm_cbe_tmp__38;
  static  unsigned long long aesl_llvm_cbe_123_count = 0;
  unsigned int llvm_cbe_tmp__39;
  static  unsigned long long aesl_llvm_cbe_124_count = 0;
  unsigned int llvm_cbe_tmp__40;
  static  unsigned long long aesl_llvm_cbe_125_count = 0;
  static  unsigned long long aesl_llvm_cbe_126_count = 0;
  static  unsigned long long aesl_llvm_cbe_127_count = 0;
  static  unsigned long long aesl_llvm_cbe_128_count = 0;
  static  unsigned long long aesl_llvm_cbe_129_count = 0;
  static  unsigned long long aesl_llvm_cbe_130_count = 0;
  static  unsigned long long aesl_llvm_cbe_131_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond27_count = 0;
  static  unsigned long long aesl_llvm_cbe_132_count = 0;
  static  unsigned long long aesl_llvm_cbe_puts11_count = 0;
  unsigned int llvm_cbe_puts11;
  static  unsigned long long aesl_llvm_cbe_puts12_count = 0;
  unsigned int llvm_cbe_puts12;
  static  unsigned long long aesl_llvm_cbe_133_count = 0;
  static  unsigned long long aesl_llvm_cbe_134_count = 0;
  static  unsigned long long aesl_llvm_cbe_135_count = 0;
  static  unsigned long long aesl_llvm_cbe_136_count = 0;
  static  unsigned long long aesl_llvm_cbe_137_count = 0;
  static  unsigned long long aesl_llvm_cbe_138_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge616_count = 0;
  unsigned int llvm_cbe_storemerge616;
  unsigned int llvm_cbe_storemerge616__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_139_count = 0;
  unsigned long long llvm_cbe_tmp__41;
  static  unsigned long long aesl_llvm_cbe_140_count = 0;
  signed int *llvm_cbe_tmp__42;
  static  unsigned long long aesl_llvm_cbe_141_count = 0;
  static  unsigned long long aesl_llvm_cbe_142_count = 0;
  signed int *llvm_cbe_tmp__43;
  static  unsigned long long aesl_llvm_cbe_143_count = 0;
  static  unsigned long long aesl_llvm_cbe_144_count = 0;
  unsigned int llvm_cbe_tmp__44;
  static  unsigned long long aesl_llvm_cbe_145_count = 0;
  static  unsigned long long aesl_llvm_cbe_146_count = 0;
  static  unsigned long long aesl_llvm_cbe_147_count = 0;
  static  unsigned long long aesl_llvm_cbe_148_count = 0;
  static  unsigned long long aesl_llvm_cbe_149_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond26_count = 0;
  static  unsigned long long aesl_llvm_cbe_150_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge715_count = 0;
  unsigned int llvm_cbe_storemerge715;
  unsigned int llvm_cbe_storemerge715__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_151_count = 0;
  unsigned long long llvm_cbe_tmp__45;
  static  unsigned long long aesl_llvm_cbe_152_count = 0;
  signed int *llvm_cbe_tmp__46;
  static  unsigned long long aesl_llvm_cbe_153_count = 0;
  static  unsigned long long aesl_llvm_cbe_154_count = 0;
  unsigned int llvm_cbe_tmp__47;
  static  unsigned long long aesl_llvm_cbe_155_count = 0;
  static  unsigned long long aesl_llvm_cbe_156_count = 0;
  static  unsigned long long aesl_llvm_cbe_157_count = 0;
  static  unsigned long long aesl_llvm_cbe_158_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond25_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_storemerge814_count = 0;
  unsigned int llvm_cbe_storemerge814;
  unsigned int llvm_cbe_storemerge814__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_176_count = 0;
  unsigned long long llvm_cbe_tmp__48;
  static  unsigned long long aesl_llvm_cbe_177_count = 0;
  signed int *llvm_cbe_tmp__49;
  static  unsigned long long aesl_llvm_cbe_178_count = 0;
  unsigned int llvm_cbe_tmp__50;
  static  unsigned long long aesl_llvm_cbe_179_count = 0;
  signed int *llvm_cbe_tmp__51;
  static  unsigned long long aesl_llvm_cbe_180_count = 0;
  unsigned int llvm_cbe_tmp__52;
  static  unsigned long long aesl_llvm_cbe_181_count = 0;
  signed int *llvm_cbe_tmp__53;
  static  unsigned long long aesl_llvm_cbe_182_count = 0;
  unsigned int llvm_cbe_tmp__54;
  static  unsigned long long aesl_llvm_cbe_183_count = 0;
  signed int *llvm_cbe_tmp__55;
  static  unsigned long long aesl_llvm_cbe_184_count = 0;
  unsigned int llvm_cbe_tmp__56;
  static  unsigned long long aesl_llvm_cbe_185_count = 0;
  unsigned int llvm_cbe_tmp__57;
  static  unsigned long long aesl_llvm_cbe_186_count = 0;
  unsigned int llvm_cbe_tmp__58;
  static  unsigned long long aesl_llvm_cbe_187_count = 0;
  static  unsigned long long aesl_llvm_cbe_188_count = 0;
  static  unsigned long long aesl_llvm_cbe_189_count = 0;
  static  unsigned long long aesl_llvm_cbe_190_count = 0;
  static  unsigned long long aesl_llvm_cbe_191_count = 0;
  static  unsigned long long aesl_llvm_cbe_192_count = 0;
  static  unsigned long long aesl_llvm_cbe_193_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_194_count = 0;
  static  unsigned long long aesl_llvm_cbe_puts13_count = 0;
  unsigned int llvm_cbe_puts13;
  static  unsigned long long aesl_llvm_cbe_195_count = 0;

  CODE_FOR_MAIN();
const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @main\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%puts = call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @aesl_internal_str5, i64 0, i64 0)), !dbg !3 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_puts_count);
  puts(( char *)((&aesl_internal_str5[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn puts = 0x%X",llvm_cbe_puts);
}
  llvm_cbe_storemerge24__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe_tmp__59;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__59:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge24 = phi i32 [ 0, %%0 ], [ %%5, %%1  for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_storemerge24_count);
  llvm_cbe_storemerge24 = (unsigned int )llvm_cbe_storemerge24__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge24 = 0x%X",llvm_cbe_storemerge24);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__4);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = sext i32 %%storemerge24 to i64, !dbg !3 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_11_count);
  llvm_cbe_tmp__1 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge24);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__1);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = getelementptr inbounds [50 x i32]* %%DATA_A, i64 0, i64 %%2, !dbg !3 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_12_count);
  llvm_cbe_tmp__2 = (signed int *)(&llvm_cbe_DATA_A[(((signed long long )llvm_cbe_tmp__1))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__1));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__1) < 50 && "Write access out of array 'DATA_A' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 1, i32* %%3, align 4, !dbg !3 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_13_count);
  *llvm_cbe_tmp__2 = 1u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 1u);
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = getelementptr inbounds [50 x i32]* %%DATA_B, i64 0, i64 %%2, !dbg !3 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_14_count);
  llvm_cbe_tmp__3 = (signed int *)(&llvm_cbe_DATA_B[(((signed long long )llvm_cbe_tmp__1))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__1));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__1) < 50 && "Write access out of array 'DATA_B' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 1, i32* %%4, align 4, !dbg !3 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_15_count);
  *llvm_cbe_tmp__3 = 1u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 1u);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = add nsw i32 %%storemerge24, 1, !dbg !3 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_16_count);
  llvm_cbe_tmp__4 = (unsigned int )((unsigned int )(llvm_cbe_storemerge24&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__4&4294967295ull)));
  if (((llvm_cbe_tmp__4&4294967295U) == (50u&4294967295U))) {
    llvm_cbe_storemerge123__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_preheader22;
  } else {
    llvm_cbe_storemerge24__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__4;   /* for PHI node */
    goto llvm_cbe_tmp__59;
  }

  } while (1); /* end of syntactic loop '' */
  do {     /* Syntactic loop '.preheader22' to make GCC happy */
llvm_cbe__2e_preheader22:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge123 = phi i32 [ %%8, %%.preheader22 ], [ 0, %%1  for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_storemerge123_count);
  llvm_cbe_storemerge123 = (unsigned int )llvm_cbe_storemerge123__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge123 = 0x%X",llvm_cbe_storemerge123);
printf("\n = 0x%X",llvm_cbe_tmp__7);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = sext i32 %%storemerge123 to i64, !dbg !3 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_23_count);
  llvm_cbe_tmp__5 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge123);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__5);
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = getelementptr inbounds [50 x i32]* %%ALU_OPERATION, i64 0, i64 %%6, !dbg !3 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_24_count);
  llvm_cbe_tmp__6 = (signed int *)(&llvm_cbe_ALU_OPERATION[(((signed long long )llvm_cbe_tmp__5))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__5));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__5) < 50 && "Write access out of array 'ALU_OPERATION' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 10, i32* %%7, align 4, !dbg !3 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_25_count);
  *llvm_cbe_tmp__6 = 10u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 10u);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = add nsw i32 %%storemerge123, 1, !dbg !4 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_26_count);
  llvm_cbe_tmp__7 = (unsigned int )((unsigned int )(llvm_cbe_storemerge123&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__7&4294967295ull)));
  if (((llvm_cbe_tmp__7&4294967295U) == (50u&4294967295U))) {
    goto llvm_cbe_tmp__60;
  } else {
    llvm_cbe_storemerge123__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__7;   /* for PHI node */
    goto llvm_cbe__2e_preheader22;
  }

  } while (1); /* end of syntactic loop '.preheader22' */
llvm_cbe_tmp__60:
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = getelementptr inbounds [50 x i32]* %%DATA_A, i64 0, i64 0, !dbg !4 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_39_count);
  llvm_cbe_tmp__8 = (signed int *)(&llvm_cbe_DATA_A[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = getelementptr inbounds [50 x i32]* %%DATA_B, i64 0, i64 0, !dbg !4 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_40_count);
  llvm_cbe_tmp__9 = (signed int *)(&llvm_cbe_DATA_B[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = getelementptr inbounds [50 x i32]* %%DATA_RESULT, i64 0, i64 0, !dbg !4 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_41_count);
  llvm_cbe_tmp__10 = (signed int *)(&llvm_cbe_DATA_RESULT[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = getelementptr inbounds [50 x i32]* %%ALU_OPERATION, i64 0, i64 0, !dbg !4 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_42_count);
  llvm_cbe_tmp__11 = (signed int *)(&llvm_cbe_ALU_OPERATION[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @dec_MIMD(i32* %%10, i32* %%11, i32* %%12, i32* %%13, i32 2) nounwind, !dbg !4 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_43_count);
  dec_MIMD((signed int *)llvm_cbe_tmp__8, (signed int *)llvm_cbe_tmp__9, (signed int *)llvm_cbe_tmp__10, (signed int *)llvm_cbe_tmp__11, 2u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",2u);
}
  llvm_cbe_storemerge221__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe_tmp__61;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__61:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge221 = phi i32 [ 0, %%9 ], [ %%25, %%14  for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_storemerge221_count);
  llvm_cbe_storemerge221 = (unsigned int )llvm_cbe_storemerge221__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge221 = 0x%X",llvm_cbe_storemerge221);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__22);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = sext i32 %%storemerge221 to i64, !dbg !4 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_52_count);
  llvm_cbe_tmp__12 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge221);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__12);
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = getelementptr inbounds [50 x i32]* %%DATA_A, i64 0, i64 %%15, !dbg !4 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_53_count);
  llvm_cbe_tmp__13 = (signed int *)(&llvm_cbe_DATA_A[(((signed long long )llvm_cbe_tmp__12))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__12));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__12) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'DATA_A' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = load i32* %%16, align 4, !dbg !4 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_54_count);
  llvm_cbe_tmp__14 = (unsigned int )*llvm_cbe_tmp__13;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__14);
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = getelementptr inbounds [50 x i32]* %%DATA_B, i64 0, i64 %%15, !dbg !4 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_55_count);
  llvm_cbe_tmp__15 = (signed int *)(&llvm_cbe_DATA_B[(((signed long long )llvm_cbe_tmp__12))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__12));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__12) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'DATA_B' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = load i32* %%18, align 4, !dbg !4 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_56_count);
  llvm_cbe_tmp__16 = (unsigned int )*llvm_cbe_tmp__15;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__16);
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = getelementptr inbounds [50 x i32]* %%DATA_RESULT, i64 0, i64 %%15, !dbg !4 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_57_count);
  llvm_cbe_tmp__17 = (signed int *)(&llvm_cbe_DATA_RESULT[(((signed long long )llvm_cbe_tmp__12))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__12));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__12) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'DATA_RESULT' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = load i32* %%20, align 4, !dbg !4 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_58_count);
  llvm_cbe_tmp__18 = (unsigned int )*llvm_cbe_tmp__17;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__18);
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = getelementptr inbounds [50 x i32]* %%ALU_OPERATION, i64 0, i64 %%15, !dbg !4 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_59_count);
  llvm_cbe_tmp__19 = (signed int *)(&llvm_cbe_ALU_OPERATION[(((signed long long )llvm_cbe_tmp__12))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__12));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__12) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'ALU_OPERATION' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = load i32* %%22, align 4, !dbg !4 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_60_count);
  llvm_cbe_tmp__20 = (unsigned int )*llvm_cbe_tmp__19;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__20);
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([46 x i8]* @aesl_internal_.str1, i64 0, i64 0), i32 %%17, i32 %%19, i32 %%21, i32 %%23, i32 2) nounwind, !dbg !4 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_61_count);
  printf(( char *)((&aesl_internal__OC_str1[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 46
#endif
])), llvm_cbe_tmp__14, llvm_cbe_tmp__16, llvm_cbe_tmp__18, llvm_cbe_tmp__20, 2u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__14);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__16);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__18);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__20);
printf("\nArgument  = 0x%X",2u);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__21);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = add nsw i32 %%storemerge221, 1, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_62_count);
  llvm_cbe_tmp__22 = (unsigned int )((unsigned int )(llvm_cbe_storemerge221&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__22&4294967295ull)));
  if (((llvm_cbe_tmp__22&4294967295U) == (50u&4294967295U))) {
    goto llvm_cbe_tmp__62;
  } else {
    llvm_cbe_storemerge221__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__22;   /* for PHI node */
    goto llvm_cbe_tmp__61;
  }

  } while (1); /* end of syntactic loop '' */
llvm_cbe_tmp__62:
if (AESL_DEBUG_TRACE)
printf("\n  %%puts9 = call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @aesl_internal_str5, i64 0, i64 0)), !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_puts9_count);
  puts(( char *)((&aesl_internal_str5[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn puts9 = 0x%X",llvm_cbe_puts9);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%puts10 = call i32 @puts(i8* getelementptr inbounds ([36 x i8]* @aesl_internal_str2, i64 0, i64 0)), !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_puts10_count);
  puts(( char *)((&aesl_internal_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 36
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn puts10 = 0x%X",llvm_cbe_puts10);
}
  llvm_cbe_storemerge320__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe_tmp__63;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__63:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge320 = phi i32 [ 0, %%26 ], [ %%31, %%27  for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_storemerge320_count);
  llvm_cbe_storemerge320 = (unsigned int )llvm_cbe_storemerge320__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge320 = 0x%X",llvm_cbe_storemerge320);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__26);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = sext i32 %%storemerge320 to i64, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_77_count);
  llvm_cbe_tmp__23 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge320);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__23);
if (AESL_DEBUG_TRACE)
printf("\n  %%29 = getelementptr inbounds [50 x i32]* %%DATA_A, i64 0, i64 %%28, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_78_count);
  llvm_cbe_tmp__24 = (signed int *)(&llvm_cbe_DATA_A[(((signed long long )llvm_cbe_tmp__23))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__23));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__23) < 50 && "Write access out of array 'DATA_A' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 2, i32* %%29, align 4, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_79_count);
  *llvm_cbe_tmp__24 = 2u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 2u);
if (AESL_DEBUG_TRACE)
printf("\n  %%30 = getelementptr inbounds [50 x i32]* %%DATA_B, i64 0, i64 %%28, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_80_count);
  llvm_cbe_tmp__25 = (signed int *)(&llvm_cbe_DATA_B[(((signed long long )llvm_cbe_tmp__23))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__23));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__23) < 50 && "Write access out of array 'DATA_B' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 2, i32* %%30, align 4, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_81_count);
  *llvm_cbe_tmp__25 = 2u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 2u);
if (AESL_DEBUG_TRACE)
printf("\n  %%31 = add nsw i32 %%storemerge320, 1, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_82_count);
  llvm_cbe_tmp__26 = (unsigned int )((unsigned int )(llvm_cbe_storemerge320&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__26&4294967295ull)));
  if (((llvm_cbe_tmp__26&4294967295U) == (50u&4294967295U))) {
    llvm_cbe_storemerge419__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_preheader18;
  } else {
    llvm_cbe_storemerge320__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__26;   /* for PHI node */
    goto llvm_cbe_tmp__63;
  }

  } while (1); /* end of syntactic loop '' */
  do {     /* Syntactic loop '.preheader18' to make GCC happy */
llvm_cbe__2e_preheader18:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge419 = phi i32 [ %%34, %%.preheader18 ], [ 0, %%27  for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_storemerge419_count);
  llvm_cbe_storemerge419 = (unsigned int )llvm_cbe_storemerge419__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge419 = 0x%X",llvm_cbe_storemerge419);
printf("\n = 0x%X",llvm_cbe_tmp__29);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%32 = sext i32 %%storemerge419 to i64, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_89_count);
  llvm_cbe_tmp__27 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge419);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__27);
if (AESL_DEBUG_TRACE)
printf("\n  %%33 = getelementptr inbounds [50 x i32]* %%ALU_OPERATION, i64 0, i64 %%32, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_90_count);
  llvm_cbe_tmp__28 = (signed int *)(&llvm_cbe_ALU_OPERATION[(((signed long long )llvm_cbe_tmp__27))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__27));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__27) < 50 && "Write access out of array 'ALU_OPERATION' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* %%33, align 4, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_91_count);
  *llvm_cbe_tmp__28 = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  %%34 = add nsw i32 %%storemerge419, 1, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_92_count);
  llvm_cbe_tmp__29 = (unsigned int )((unsigned int )(llvm_cbe_storemerge419&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__29&4294967295ull)));
  if (((llvm_cbe_tmp__29&4294967295U) == (50u&4294967295U))) {
    goto llvm_cbe_tmp__64;
  } else {
    llvm_cbe_storemerge419__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__29;   /* for PHI node */
    goto llvm_cbe__2e_preheader18;
  }

  } while (1); /* end of syntactic loop '.preheader18' */
llvm_cbe_tmp__64:
if (AESL_DEBUG_TRACE)
printf("\n  call void @dec_MIMD(i32* %%10, i32* %%11, i32* %%12, i32* %%13, i32 1) nounwind, !dbg !5 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_105_count);
  dec_MIMD((signed int *)llvm_cbe_tmp__8, (signed int *)llvm_cbe_tmp__9, (signed int *)llvm_cbe_tmp__10, (signed int *)llvm_cbe_tmp__11, 1u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",1u);
}
  llvm_cbe_storemerge517__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe_tmp__65;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__65:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge517 = phi i32 [ 0, %%35 ], [ %%47, %%36  for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_storemerge517_count);
  llvm_cbe_storemerge517 = (unsigned int )llvm_cbe_storemerge517__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge517 = 0x%X",llvm_cbe_storemerge517);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__40);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%37 = sext i32 %%storemerge517 to i64, !dbg !5 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_114_count);
  llvm_cbe_tmp__30 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge517);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__30);
if (AESL_DEBUG_TRACE)
printf("\n  %%38 = getelementptr inbounds [50 x i32]* %%DATA_A, i64 0, i64 %%37, !dbg !5 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_115_count);
  llvm_cbe_tmp__31 = (signed int *)(&llvm_cbe_DATA_A[(((signed long long )llvm_cbe_tmp__30))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__30));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__30) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'DATA_A' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%39 = load i32* %%38, align 4, !dbg !5 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_116_count);
  llvm_cbe_tmp__32 = (unsigned int )*llvm_cbe_tmp__31;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__32);
if (AESL_DEBUG_TRACE)
printf("\n  %%40 = getelementptr inbounds [50 x i32]* %%DATA_B, i64 0, i64 %%37, !dbg !5 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_117_count);
  llvm_cbe_tmp__33 = (signed int *)(&llvm_cbe_DATA_B[(((signed long long )llvm_cbe_tmp__30))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__30));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__30) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'DATA_B' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%41 = load i32* %%40, align 4, !dbg !5 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_118_count);
  llvm_cbe_tmp__34 = (unsigned int )*llvm_cbe_tmp__33;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__34);
if (AESL_DEBUG_TRACE)
printf("\n  %%42 = getelementptr inbounds [50 x i32]* %%DATA_RESULT, i64 0, i64 %%37, !dbg !5 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_119_count);
  llvm_cbe_tmp__35 = (signed int *)(&llvm_cbe_DATA_RESULT[(((signed long long )llvm_cbe_tmp__30))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__30));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__30) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'DATA_RESULT' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%43 = load i32* %%42, align 4, !dbg !5 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_120_count);
  llvm_cbe_tmp__36 = (unsigned int )*llvm_cbe_tmp__35;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__36);
if (AESL_DEBUG_TRACE)
printf("\n  %%44 = getelementptr inbounds [50 x i32]* %%ALU_OPERATION, i64 0, i64 %%37, !dbg !5 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_121_count);
  llvm_cbe_tmp__37 = (signed int *)(&llvm_cbe_ALU_OPERATION[(((signed long long )llvm_cbe_tmp__30))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__30));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__30) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'ALU_OPERATION' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%45 = load i32* %%44, align 4, !dbg !5 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_122_count);
  llvm_cbe_tmp__38 = (unsigned int )*llvm_cbe_tmp__37;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__38);
if (AESL_DEBUG_TRACE)
printf("\n  %%46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([46 x i8]* @aesl_internal_.str1, i64 0, i64 0), i32 %%39, i32 %%41, i32 %%43, i32 %%45, i32 1) nounwind, !dbg !5 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_123_count);
  printf(( char *)((&aesl_internal__OC_str1[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 46
#endif
])), llvm_cbe_tmp__32, llvm_cbe_tmp__34, llvm_cbe_tmp__36, llvm_cbe_tmp__38, 1u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__32);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__34);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__36);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__38);
printf("\nArgument  = 0x%X",1u);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__39);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%47 = add nsw i32 %%storemerge517, 1, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_124_count);
  llvm_cbe_tmp__40 = (unsigned int )((unsigned int )(llvm_cbe_storemerge517&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__40&4294967295ull)));
  if (((llvm_cbe_tmp__40&4294967295U) == (50u&4294967295U))) {
    goto llvm_cbe_tmp__66;
  } else {
    llvm_cbe_storemerge517__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__40;   /* for PHI node */
    goto llvm_cbe_tmp__65;
  }

  } while (1); /* end of syntactic loop '' */
llvm_cbe_tmp__66:
if (AESL_DEBUG_TRACE)
printf("\n  %%puts11 = call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @aesl_internal_str5, i64 0, i64 0)), !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_puts11_count);
  puts(( char *)((&aesl_internal_str5[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn puts11 = 0x%X",llvm_cbe_puts11);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%puts12 = call i32 @puts(i8* getelementptr inbounds ([36 x i8]* @aesl_internal_str4, i64 0, i64 0)), !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_puts12_count);
  puts(( char *)((&aesl_internal_str4[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 36
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn puts12 = 0x%X",llvm_cbe_puts12);
}
  llvm_cbe_storemerge616__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe_tmp__67;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__67:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge616 = phi i32 [ 0, %%48 ], [ %%53, %%49  for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_storemerge616_count);
  llvm_cbe_storemerge616 = (unsigned int )llvm_cbe_storemerge616__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge616 = 0x%X",llvm_cbe_storemerge616);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__44);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%50 = sext i32 %%storemerge616 to i64, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_139_count);
  llvm_cbe_tmp__41 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge616);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__41);
if (AESL_DEBUG_TRACE)
printf("\n  %%51 = getelementptr inbounds [50 x i32]* %%DATA_A, i64 0, i64 %%50, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_140_count);
  llvm_cbe_tmp__42 = (signed int *)(&llvm_cbe_DATA_A[(((signed long long )llvm_cbe_tmp__41))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__41));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__41) < 50 && "Write access out of array 'DATA_A' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 3, i32* %%51, align 4, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_141_count);
  *llvm_cbe_tmp__42 = 3u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 3u);
if (AESL_DEBUG_TRACE)
printf("\n  %%52 = getelementptr inbounds [50 x i32]* %%DATA_B, i64 0, i64 %%50, !dbg !9 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_142_count);
  llvm_cbe_tmp__43 = (signed int *)(&llvm_cbe_DATA_B[(((signed long long )llvm_cbe_tmp__41))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__41));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__41) < 50 && "Write access out of array 'DATA_B' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 3, i32* %%52, align 4, !dbg !9 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_143_count);
  *llvm_cbe_tmp__43 = 3u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 3u);
if (AESL_DEBUG_TRACE)
printf("\n  %%53 = add nsw i32 %%storemerge616, 1, !dbg !9 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_144_count);
  llvm_cbe_tmp__44 = (unsigned int )((unsigned int )(llvm_cbe_storemerge616&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__44&4294967295ull)));
  if (((llvm_cbe_tmp__44&4294967295U) == (50u&4294967295U))) {
    llvm_cbe_storemerge715__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_preheader;
  } else {
    llvm_cbe_storemerge616__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__44;   /* for PHI node */
    goto llvm_cbe_tmp__67;
  }

  } while (1); /* end of syntactic loop '' */
  do {     /* Syntactic loop '.preheader' to make GCC happy */
llvm_cbe__2e_preheader:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge715 = phi i32 [ %%56, %%.preheader ], [ 0, %%49  for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_storemerge715_count);
  llvm_cbe_storemerge715 = (unsigned int )llvm_cbe_storemerge715__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge715 = 0x%X",llvm_cbe_storemerge715);
printf("\n = 0x%X",llvm_cbe_tmp__47);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%54 = sext i32 %%storemerge715 to i64, !dbg !9 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_151_count);
  llvm_cbe_tmp__45 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge715);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__45);
if (AESL_DEBUG_TRACE)
printf("\n  %%55 = getelementptr inbounds [50 x i32]* %%ALU_OPERATION, i64 0, i64 %%54, !dbg !9 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_152_count);
  llvm_cbe_tmp__46 = (signed int *)(&llvm_cbe_ALU_OPERATION[(((signed long long )llvm_cbe_tmp__45))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__45));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__45) < 50 && "Write access out of array 'ALU_OPERATION' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 10, i32* %%55, align 4, !dbg !9 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_153_count);
  *llvm_cbe_tmp__46 = 10u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 10u);
if (AESL_DEBUG_TRACE)
printf("\n  %%56 = add nsw i32 %%storemerge715, 1, !dbg !9 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_154_count);
  llvm_cbe_tmp__47 = (unsigned int )((unsigned int )(llvm_cbe_storemerge715&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__47&4294967295ull)));
  if (((llvm_cbe_tmp__47&4294967295U) == (50u&4294967295U))) {
    goto llvm_cbe_tmp__68;
  } else {
    llvm_cbe_storemerge715__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__47;   /* for PHI node */
    goto llvm_cbe__2e_preheader;
  }

  } while (1); /* end of syntactic loop '.preheader' */
llvm_cbe_tmp__68:
if (AESL_DEBUG_TRACE)
printf("\n  call void @dec_MIMD(i32* %%10, i32* %%11, i32* %%12, i32* %%13, i32 0) nounwind, !dbg !5 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_167_count);
  dec_MIMD((signed int *)llvm_cbe_tmp__8, (signed int *)llvm_cbe_tmp__9, (signed int *)llvm_cbe_tmp__10, (signed int *)llvm_cbe_tmp__11, 0u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",0u);
}
  llvm_cbe_storemerge814__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe_tmp__69;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__69:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge814 = phi i32 [ 0, %%57 ], [ %%69, %%58  for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_storemerge814_count);
  llvm_cbe_storemerge814 = (unsigned int )llvm_cbe_storemerge814__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge814 = 0x%X",llvm_cbe_storemerge814);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__58);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%59 = sext i32 %%storemerge814 to i64, !dbg !5 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_176_count);
  llvm_cbe_tmp__48 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge814);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__48);
if (AESL_DEBUG_TRACE)
printf("\n  %%60 = getelementptr inbounds [50 x i32]* %%DATA_A, i64 0, i64 %%59, !dbg !5 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_177_count);
  llvm_cbe_tmp__49 = (signed int *)(&llvm_cbe_DATA_A[(((signed long long )llvm_cbe_tmp__48))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__48));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__48) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'DATA_A' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%61 = load i32* %%60, align 4, !dbg !5 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_178_count);
  llvm_cbe_tmp__50 = (unsigned int )*llvm_cbe_tmp__49;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__50);
if (AESL_DEBUG_TRACE)
printf("\n  %%62 = getelementptr inbounds [50 x i32]* %%DATA_B, i64 0, i64 %%59, !dbg !5 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_179_count);
  llvm_cbe_tmp__51 = (signed int *)(&llvm_cbe_DATA_B[(((signed long long )llvm_cbe_tmp__48))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__48));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__48) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'DATA_B' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%63 = load i32* %%62, align 4, !dbg !5 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_180_count);
  llvm_cbe_tmp__52 = (unsigned int )*llvm_cbe_tmp__51;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__52);
if (AESL_DEBUG_TRACE)
printf("\n  %%64 = getelementptr inbounds [50 x i32]* %%DATA_RESULT, i64 0, i64 %%59, !dbg !5 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_181_count);
  llvm_cbe_tmp__53 = (signed int *)(&llvm_cbe_DATA_RESULT[(((signed long long )llvm_cbe_tmp__48))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__48));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__48) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'DATA_RESULT' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%65 = load i32* %%64, align 4, !dbg !5 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_182_count);
  llvm_cbe_tmp__54 = (unsigned int )*llvm_cbe_tmp__53;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__54);
if (AESL_DEBUG_TRACE)
printf("\n  %%66 = getelementptr inbounds [50 x i32]* %%ALU_OPERATION, i64 0, i64 %%59, !dbg !5 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_183_count);
  llvm_cbe_tmp__55 = (signed int *)(&llvm_cbe_ALU_OPERATION[(((signed long long )llvm_cbe_tmp__48))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__48));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__48) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'ALU_OPERATION' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%67 = load i32* %%66, align 4, !dbg !5 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_184_count);
  llvm_cbe_tmp__56 = (unsigned int )*llvm_cbe_tmp__55;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__56);
if (AESL_DEBUG_TRACE)
printf("\n  %%68 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([46 x i8]* @aesl_internal_.str1, i64 0, i64 0), i32 %%61, i32 %%63, i32 %%65, i32 %%67, i32 0) nounwind, !dbg !5 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_185_count);
  printf(( char *)((&aesl_internal__OC_str1[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 46
#endif
])), llvm_cbe_tmp__50, llvm_cbe_tmp__52, llvm_cbe_tmp__54, llvm_cbe_tmp__56, 0u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__50);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__52);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__54);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__56);
printf("\nArgument  = 0x%X",0u);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__57);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%69 = add nsw i32 %%storemerge814, 1, !dbg !10 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_186_count);
  llvm_cbe_tmp__58 = (unsigned int )((unsigned int )(llvm_cbe_storemerge814&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__58&4294967295ull)));
  if (((llvm_cbe_tmp__58&4294967295U) == (50u&4294967295U))) {
    goto llvm_cbe_tmp__70;
  } else {
    llvm_cbe_storemerge814__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__58;   /* for PHI node */
    goto llvm_cbe_tmp__69;
  }

  } while (1); /* end of syntactic loop '' */
llvm_cbe_tmp__70:
if (AESL_DEBUG_TRACE)
printf("\n  %%puts13 = call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @aesl_internal_str5, i64 0, i64 0)), !dbg !10 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_puts13_count);
  puts(( char *)((&aesl_internal_str5[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn puts13 = 0x%X",llvm_cbe_puts13);
}
  if (AESL_DEBUG_TRACE)
      printf("\nEND @main}\n");
  return 0u;
}

