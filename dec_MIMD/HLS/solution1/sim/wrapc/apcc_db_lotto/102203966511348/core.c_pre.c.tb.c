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
void dec_MIMD(signed int *llvm_cbe_a, signed int *llvm_cbe_b, signed int *llvm_cbe_c, signed int *llvm_cbe_op, signed int llvm_cbe_selec);
void dec_MIMD_hw_stub(signed int *llvm_cbe_a, signed int *llvm_cbe_b, signed int *llvm_cbe_c, signed int *llvm_cbe_op, signed int llvm_cbe_selec);
void apatb_dec_MIMD_sw(signed int *llvm_cbe_a, signed int *llvm_cbe_b, signed int *llvm_cbe_c, signed int *llvm_cbe_op, signed int llvm_cbe_selec);
void refine_signal_handler();
void apatb_dec_MIMD_ir(signed int *, signed int *, signed int *, signed int *, signed int );


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

void dec_MIMD(signed int *llvm_cbe_a, signed int *llvm_cbe_b, signed int *llvm_cbe_c, signed int *llvm_cbe_op, signed int llvm_cbe_selec) {
  static  unsigned long long aesl_llvm_cbe_1_count = 0;
  signed int llvm_cbe_tmp__1;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_data_result_count = 0;
  signed int llvm_cbe_data_result[50];    /* Address-exposed local */
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
  static  unsigned long long aesl_llvm_cbe_14_count = 0;
  static  unsigned long long aesl_llvm_cbe_15_count = 0;
  static  unsigned long long aesl_llvm_cbe_16_count = 0;
  static  unsigned long long aesl_llvm_cbe_17_count = 0;
  unsigned int llvm_cbe_tmp__2;
  static  unsigned long long aesl_llvm_cbe_18_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge414_count = 0;
  unsigned int llvm_cbe_storemerge414;
  unsigned int llvm_cbe_storemerge414__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_19_count = 0;
  unsigned long long llvm_cbe_tmp__3;
  static  unsigned long long aesl_llvm_cbe_20_count = 0;
  signed int *llvm_cbe_tmp__4;
  static  unsigned long long aesl_llvm_cbe_21_count = 0;
  unsigned int llvm_cbe_tmp__5;
  static  unsigned long long aesl_llvm_cbe_22_count = 0;
  signed int *llvm_cbe_tmp__6;
  static  unsigned long long aesl_llvm_cbe_23_count = 0;
  static  unsigned long long aesl_llvm_cbe_24_count = 0;
  signed int *llvm_cbe_tmp__7;
  static  unsigned long long aesl_llvm_cbe_25_count = 0;
  unsigned int llvm_cbe_tmp__8;
  static  unsigned long long aesl_llvm_cbe_26_count = 0;
  signed int *llvm_cbe_tmp__9;
  static  unsigned long long aesl_llvm_cbe_27_count = 0;
  static  unsigned long long aesl_llvm_cbe_28_count = 0;
  unsigned int llvm_cbe_tmp__10;
  static  unsigned long long aesl_llvm_cbe_29_count = 0;
  static  unsigned long long aesl_llvm_cbe_30_count = 0;
  static  unsigned long long aesl_llvm_cbe_31_count = 0;
  static  unsigned long long aesl_llvm_cbe_32_count = 0;
  static  unsigned long long aesl_llvm_cbe_33_count = 0;
  static  unsigned long long aesl_llvm_cbe_34_count = 0;
  static  unsigned long long aesl_llvm_cbe_35_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond18_count = 0;
  static  unsigned long long aesl_llvm_cbe_36_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge311_count = 0;
  unsigned int llvm_cbe_storemerge311;
  unsigned int llvm_cbe_storemerge311__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_37_count = 0;
  unsigned long long llvm_cbe_tmp__11;
  static  unsigned long long aesl_llvm_cbe_38_count = 0;
  signed int *llvm_cbe_tmp__12;
  static  unsigned long long aesl_llvm_cbe_39_count = 0;
  unsigned int llvm_cbe_tmp__13;
  static  unsigned long long aesl_llvm_cbe_40_count = 0;
  signed int *llvm_cbe_tmp__14;
  static  unsigned long long aesl_llvm_cbe_41_count = 0;
  static  unsigned long long aesl_llvm_cbe_42_count = 0;
  unsigned int llvm_cbe_tmp__15;
  static  unsigned long long aesl_llvm_cbe_43_count = 0;
  static  unsigned long long aesl_llvm_cbe_44_count = 0;
  static  unsigned long long aesl_llvm_cbe_45_count = 0;
  static  unsigned long long aesl_llvm_cbe_46_count = 0;
  static  unsigned long long aesl_llvm_cbe_47_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond17_count = 0;
  static  unsigned long long aesl_llvm_cbe_48_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge8_count = 0;
  unsigned int llvm_cbe_storemerge8;
  unsigned int llvm_cbe_storemerge8__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_49_count = 0;
  unsigned long long llvm_cbe_tmp__16;
  static  unsigned long long aesl_llvm_cbe_50_count = 0;
  signed int *llvm_cbe_tmp__17;
  static  unsigned long long aesl_llvm_cbe_51_count = 0;
  unsigned int llvm_cbe_tmp__18;
  static  unsigned long long aesl_llvm_cbe_52_count = 0;
  signed int *llvm_cbe_tmp__19;
  static  unsigned long long aesl_llvm_cbe_53_count = 0;
  static  unsigned long long aesl_llvm_cbe_54_count = 0;
  signed int *llvm_cbe_tmp__20;
  static  unsigned long long aesl_llvm_cbe_55_count = 0;
  unsigned int llvm_cbe_tmp__21;
  static  unsigned long long aesl_llvm_cbe_56_count = 0;
  signed int *llvm_cbe_tmp__22;
  static  unsigned long long aesl_llvm_cbe_57_count = 0;
  static  unsigned long long aesl_llvm_cbe_58_count = 0;
  signed int *llvm_cbe_tmp__23;
  static  unsigned long long aesl_llvm_cbe_59_count = 0;
  unsigned int llvm_cbe_tmp__24;
  static  unsigned long long aesl_llvm_cbe_60_count = 0;
  signed int *llvm_cbe_tmp__25;
  static  unsigned long long aesl_llvm_cbe_61_count = 0;
  static  unsigned long long aesl_llvm_cbe_62_count = 0;
  unsigned int llvm_cbe_tmp__26;
  static  unsigned long long aesl_llvm_cbe_63_count = 0;
  static  unsigned long long aesl_llvm_cbe_64_count = 0;
  static  unsigned long long aesl_llvm_cbe_65_count = 0;
  static  unsigned long long aesl_llvm_cbe_66_count = 0;
  static  unsigned long long aesl_llvm_cbe_67_count = 0;
  static  unsigned long long aesl_llvm_cbe_68_count = 0;
  static  unsigned long long aesl_llvm_cbe_69_count = 0;
  static  unsigned long long aesl_llvm_cbe_70_count = 0;
  static  unsigned long long aesl_llvm_cbe_71_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond16_count = 0;
  static  unsigned long long aesl_llvm_cbe_72_count = 0;
  static  unsigned long long aesl_llvm_cbe_73_count = 0;
  static  unsigned long long aesl_llvm_cbe_74_count = 0;
  static  unsigned long long aesl_llvm_cbe_75_count = 0;
  static  unsigned long long aesl_llvm_cbe_76_count = 0;
  static  unsigned long long aesl_llvm_cbe_77_count = 0;
  static  unsigned long long aesl_llvm_cbe_78_count = 0;
  static  unsigned long long aesl_llvm_cbe_79_count = 0;
  static  unsigned long long aesl_llvm_cbe_80_count = 0;
  static  unsigned long long aesl_llvm_cbe_81_count = 0;
  static  unsigned long long aesl_llvm_cbe_82_count = 0;
  static  unsigned long long aesl_llvm_cbe_83_count = 0;
  static  unsigned long long aesl_llvm_cbe_84_count = 0;
  static  unsigned long long aesl_llvm_cbe_85_count = 0;
  static  unsigned long long aesl_llvm_cbe_86_count = 0;
  static  unsigned long long aesl_llvm_cbe_87_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_storemerge16_count = 0;
  unsigned int llvm_cbe_storemerge16;
  unsigned int llvm_cbe_storemerge16__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_103_count = 0;
  unsigned long long llvm_cbe_tmp__27;
  static  unsigned long long aesl_llvm_cbe_104_count = 0;
  signed int *llvm_cbe_tmp__28;
  static  unsigned long long aesl_llvm_cbe_105_count = 0;
  unsigned int llvm_cbe_tmp__29;
  static  unsigned long long aesl_llvm_cbe_106_count = 0;
  static  unsigned long long aesl_llvm_cbe_107_count = 0;
  signed int *llvm_cbe_tmp__30;
  static  unsigned long long aesl_llvm_cbe_108_count = 0;
  unsigned int llvm_cbe_tmp__31;
  static  unsigned long long aesl_llvm_cbe_109_count = 0;
  unsigned int llvm_cbe_tmp__32;
  static  unsigned long long aesl_llvm_cbe_110_count = 0;
  signed int *llvm_cbe_tmp__33;
  static  unsigned long long aesl_llvm_cbe_111_count = 0;
  static  unsigned long long aesl_llvm_cbe_112_count = 0;
  static  unsigned long long aesl_llvm_cbe_113_count = 0;
  signed int *llvm_cbe_tmp__34;
  static  unsigned long long aesl_llvm_cbe_114_count = 0;
  unsigned int llvm_cbe_tmp__35;
  static  unsigned long long aesl_llvm_cbe_115_count = 0;
  unsigned int llvm_cbe_tmp__36;
  static  unsigned long long aesl_llvm_cbe_116_count = 0;
  signed int *llvm_cbe_tmp__37;
  static  unsigned long long aesl_llvm_cbe_117_count = 0;
  static  unsigned long long aesl_llvm_cbe_118_count = 0;
  static  unsigned long long aesl_llvm_cbe_119_count = 0;
  signed int *llvm_cbe_tmp__38;
  static  unsigned long long aesl_llvm_cbe_120_count = 0;
  unsigned int llvm_cbe_tmp__39;
  static  unsigned long long aesl_llvm_cbe_121_count = 0;
  unsigned int llvm_cbe_tmp__40;
  static  unsigned long long aesl_llvm_cbe_122_count = 0;
  signed int *llvm_cbe_tmp__41;
  static  unsigned long long aesl_llvm_cbe_123_count = 0;
  static  unsigned long long aesl_llvm_cbe_124_count = 0;
  static  unsigned long long aesl_llvm_cbe_125_count = 0;
  signed int *llvm_cbe_tmp__42;
  static  unsigned long long aesl_llvm_cbe_126_count = 0;
  unsigned int llvm_cbe_tmp__43;
  static  unsigned long long aesl_llvm_cbe_127_count = 0;
  unsigned int llvm_cbe_tmp__44;
  static  unsigned long long aesl_llvm_cbe_128_count = 0;
  signed int *llvm_cbe_tmp__45;
  static  unsigned long long aesl_llvm_cbe_129_count = 0;
  static  unsigned long long aesl_llvm_cbe_130_count = 0;
  static  unsigned long long aesl_llvm_cbe_131_count = 0;
  signed int *llvm_cbe_tmp__46;
  static  unsigned long long aesl_llvm_cbe_132_count = 0;
  unsigned int llvm_cbe_tmp__47;
  static  unsigned long long aesl_llvm_cbe_133_count = 0;
  unsigned int llvm_cbe_tmp__48;
  static  unsigned long long aesl_llvm_cbe_134_count = 0;
  signed int *llvm_cbe_tmp__49;
  static  unsigned long long aesl_llvm_cbe_135_count = 0;
  static  unsigned long long aesl_llvm_cbe_136_count = 0;
  static  unsigned long long aesl_llvm_cbe_137_count = 0;
  signed int *llvm_cbe_tmp__50;
  static  unsigned long long aesl_llvm_cbe_138_count = 0;
  unsigned int llvm_cbe_tmp__51;
  static  unsigned long long aesl_llvm_cbe_139_count = 0;
  unsigned int llvm_cbe_tmp__52;
  static  unsigned long long aesl_llvm_cbe_140_count = 0;
  signed int *llvm_cbe_tmp__53;
  static  unsigned long long aesl_llvm_cbe_141_count = 0;
  static  unsigned long long aesl_llvm_cbe_142_count = 0;
  static  unsigned long long aesl_llvm_cbe_143_count = 0;
  signed int *llvm_cbe_tmp__54;
  static  unsigned long long aesl_llvm_cbe_144_count = 0;
  unsigned int llvm_cbe_tmp__55;
  static  unsigned long long aesl_llvm_cbe_145_count = 0;
  signed int *llvm_cbe_tmp__56;
  static  unsigned long long aesl_llvm_cbe_146_count = 0;
  unsigned int llvm_cbe_tmp__57;
  static  unsigned long long aesl_llvm_cbe_147_count = 0;
  unsigned int llvm_cbe_tmp__58;
  static  unsigned long long aesl_llvm_cbe_148_count = 0;
  signed int *llvm_cbe_tmp__59;
  static  unsigned long long aesl_llvm_cbe_149_count = 0;
  static  unsigned long long aesl_llvm_cbe_150_count = 0;
  static  unsigned long long aesl_llvm_cbe_151_count = 0;
  signed int *llvm_cbe_tmp__60;
  static  unsigned long long aesl_llvm_cbe_152_count = 0;
  unsigned int llvm_cbe_tmp__61;
  static  unsigned long long aesl_llvm_cbe_153_count = 0;
  signed int *llvm_cbe_tmp__62;
  static  unsigned long long aesl_llvm_cbe_154_count = 0;
  unsigned int llvm_cbe_tmp__63;
  static  unsigned long long aesl_llvm_cbe_155_count = 0;
  unsigned int llvm_cbe_tmp__64;
  static  unsigned long long aesl_llvm_cbe_156_count = 0;
  signed int *llvm_cbe_tmp__65;
  static  unsigned long long aesl_llvm_cbe_157_count = 0;
  static  unsigned long long aesl_llvm_cbe_158_count = 0;
  static  unsigned long long aesl_llvm_cbe_159_count = 0;
  signed int *llvm_cbe_tmp__66;
  static  unsigned long long aesl_llvm_cbe_160_count = 0;
  unsigned int llvm_cbe_tmp__67;
  static  unsigned long long aesl_llvm_cbe_161_count = 0;
  signed int *llvm_cbe_tmp__68;
  static  unsigned long long aesl_llvm_cbe_162_count = 0;
  unsigned int llvm_cbe_tmp__69;
  static  unsigned long long aesl_llvm_cbe_163_count = 0;
  unsigned int llvm_cbe_tmp__70;
  static  unsigned long long aesl_llvm_cbe_164_count = 0;
  signed int *llvm_cbe_tmp__71;
  static  unsigned long long aesl_llvm_cbe_165_count = 0;
  static  unsigned long long aesl_llvm_cbe_166_count = 0;
  static  unsigned long long aesl_llvm_cbe_167_count = 0;
  signed int *llvm_cbe_tmp__72;
  static  unsigned long long aesl_llvm_cbe_168_count = 0;
  unsigned int llvm_cbe_tmp__73;
  static  unsigned long long aesl_llvm_cbe_169_count = 0;
  signed int *llvm_cbe_tmp__74;
  static  unsigned long long aesl_llvm_cbe_170_count = 0;
  unsigned int llvm_cbe_tmp__75;
  static  unsigned long long aesl_llvm_cbe_171_count = 0;
  unsigned int llvm_cbe_tmp__76;
  static  unsigned long long aesl_llvm_cbe_172_count = 0;
  signed int *llvm_cbe_tmp__77;
  static  unsigned long long aesl_llvm_cbe_173_count = 0;
  static  unsigned long long aesl_llvm_cbe_174_count = 0;
  static  unsigned long long aesl_llvm_cbe_175_count = 0;
  signed int *llvm_cbe_tmp__78;
  static  unsigned long long aesl_llvm_cbe_176_count = 0;
  static  unsigned long long aesl_llvm_cbe_177_count = 0;
  static  unsigned long long aesl_llvm_cbe_178_count = 0;
  unsigned int llvm_cbe_tmp__79;
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
  static  unsigned long long aesl_llvm_cbe_195_count = 0;
  static  unsigned long long aesl_llvm_cbe_196_count = 0;
  static  unsigned long long aesl_llvm_cbe_197_count = 0;
  static  unsigned long long aesl_llvm_cbe_198_count = 0;
  static  unsigned long long aesl_llvm_cbe_199_count = 0;
  static  unsigned long long aesl_llvm_cbe_200_count = 0;
  static  unsigned long long aesl_llvm_cbe_201_count = 0;
  static  unsigned long long aesl_llvm_cbe_202_count = 0;
  static  unsigned long long aesl_llvm_cbe_203_count = 0;
  static  unsigned long long aesl_llvm_cbe_204_count = 0;
  static  unsigned long long aesl_llvm_cbe_205_count = 0;
  static  unsigned long long aesl_llvm_cbe_206_count = 0;
  static  unsigned long long aesl_llvm_cbe_207_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond15_count = 0;
  static  unsigned long long aesl_llvm_cbe_208_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge25_count = 0;
  unsigned int llvm_cbe_storemerge25;
  unsigned int llvm_cbe_storemerge25__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_209_count = 0;
  unsigned long long llvm_cbe_tmp__80;
  static  unsigned long long aesl_llvm_cbe_210_count = 0;
  signed int *llvm_cbe_tmp__81;
  static  unsigned long long aesl_llvm_cbe_211_count = 0;
  unsigned int llvm_cbe_tmp__82;
  static  unsigned long long aesl_llvm_cbe_212_count = 0;
  signed int *llvm_cbe_tmp__83;
  static  unsigned long long aesl_llvm_cbe_213_count = 0;
  static  unsigned long long aesl_llvm_cbe_214_count = 0;
  unsigned int llvm_cbe_tmp__84;
  static  unsigned long long aesl_llvm_cbe_215_count = 0;
  static  unsigned long long aesl_llvm_cbe_216_count = 0;
  static  unsigned long long aesl_llvm_cbe_217_count = 0;
  static  unsigned long long aesl_llvm_cbe_218_count = 0;
  static  unsigned long long aesl_llvm_cbe_219_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_220_count = 0;
  static  unsigned long long aesl_llvm_cbe_221_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @dec_MIMD\n");
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%selec, i32* %%1, align  for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_14_count);
  *((unsigned int volatile*)(&llvm_cbe_tmp__1)) = llvm_cbe_selec;
if (AESL_DEBUG_TRACE)
printf("\nselec = 0x%X\n", llvm_cbe_selec);
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = load volatile i32* %%1, align 4, !dbg !6 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_17_count);
  llvm_cbe_tmp__2 = (unsigned int )*((unsigned int volatile*)(&llvm_cbe_tmp__1));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__2);
  switch (((unsigned int )(llvm_cbe_tmp__2&4294967295ull))) {
  default:
    goto llvm_cbe__2e_loopexit;
;
  case ((unsigned int )(0u&4294967295ull)):
    llvm_cbe_storemerge414__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_preheader12;
    break;
  case ((unsigned int )(1u&4294967295ull)):
    llvm_cbe_storemerge311__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_preheader9;
  case ((unsigned int )(2u&4294967295ull)):
    llvm_cbe_storemerge8__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_preheader7;
  }
  do {     /* Syntactic loop '.preheader12' to make GCC happy */
llvm_cbe__2e_preheader12:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge414 = phi i32 [ %%10, %%.preheader12 ], [ 0, %%0  for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_storemerge414_count);
  llvm_cbe_storemerge414 = (unsigned int )llvm_cbe_storemerge414__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge414 = 0x%X",llvm_cbe_storemerge414);
printf("\n = 0x%X",llvm_cbe_tmp__10);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = sext i32 %%storemerge414 to i64, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_19_count);
  llvm_cbe_tmp__3 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge414);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__3);
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = getelementptr inbounds i32* %%a, i64 %%3, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_20_count);
  llvm_cbe_tmp__4 = (signed int *)(&llvm_cbe_a[(((signed long long )llvm_cbe_tmp__3))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__3));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = load volatile i32* %%4, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_21_count);
  llvm_cbe_tmp__5 = (unsigned int )*((unsigned int volatile*)llvm_cbe_tmp__4);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__5);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = getelementptr inbounds [50 x i32]* @aesl_internal_dec_MIMD.data_a, i64 0, i64 %%3, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_22_count);
  llvm_cbe_tmp__6 = (signed int *)(&aesl_internal_dec_MIMD_OC_data_a[(((signed long long )llvm_cbe_tmp__3))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__3));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__3) < 50 && "Write access out of array 'aesl_internal_dec_MIMD.data_a' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%5, i32* %%6, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_23_count);
  *llvm_cbe_tmp__6 = llvm_cbe_tmp__5;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__5);
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = getelementptr inbounds i32* %%b, i64 %%3, !dbg !4 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_24_count);
  llvm_cbe_tmp__7 = (signed int *)(&llvm_cbe_b[(((signed long long )llvm_cbe_tmp__3))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__3));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = load volatile i32* %%7, align 4, !dbg !4 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_25_count);
  llvm_cbe_tmp__8 = (unsigned int )*((unsigned int volatile*)llvm_cbe_tmp__7);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__8);
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = getelementptr inbounds [50 x i32]* @aesl_internal_dec_MIMD.data_b, i64 0, i64 %%3, !dbg !4 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_26_count);
  llvm_cbe_tmp__9 = (signed int *)(&aesl_internal_dec_MIMD_OC_data_b[(((signed long long )llvm_cbe_tmp__3))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__3));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__3) < 50 && "Write access out of array 'aesl_internal_dec_MIMD.data_b' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%8, i32* %%9, align 4, !dbg !4 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_27_count);
  *llvm_cbe_tmp__9 = llvm_cbe_tmp__8;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__8);
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = add nsw i32 %%storemerge414, 1, !dbg !6 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_28_count);
  llvm_cbe_tmp__10 = (unsigned int )((unsigned int )(llvm_cbe_storemerge414&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__10&4294967295ull)));
  if (((llvm_cbe_tmp__10&4294967295U) == (50u&4294967295U))) {
    goto llvm_cbe__2e_loopexit;
  } else {
    llvm_cbe_storemerge414__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__10;   /* for PHI node */
    goto llvm_cbe__2e_preheader12;
  }

  } while (1); /* end of syntactic loop '.preheader12' */
  do {     /* Syntactic loop '.preheader9' to make GCC happy */
llvm_cbe__2e_preheader9:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge311 = phi i32 [ %%15, %%.preheader9 ], [ 0, %%0  for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_storemerge311_count);
  llvm_cbe_storemerge311 = (unsigned int )llvm_cbe_storemerge311__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge311 = 0x%X",llvm_cbe_storemerge311);
printf("\n = 0x%X",llvm_cbe_tmp__15);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = sext i32 %%storemerge311 to i64, !dbg !5 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_37_count);
  llvm_cbe_tmp__11 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge311);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__11);
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = getelementptr inbounds i32* %%op, i64 %%11, !dbg !5 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_38_count);
  llvm_cbe_tmp__12 = (signed int *)(&llvm_cbe_op[(((signed long long )llvm_cbe_tmp__11))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__11));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = load volatile i32* %%12, align 4, !dbg !5 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_39_count);
  llvm_cbe_tmp__13 = (unsigned int )*((unsigned int volatile*)llvm_cbe_tmp__12);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__13);
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = getelementptr inbounds [50 x i32]* @aesl_internal_dec_MIMD.ALU_operation, i64 0, i64 %%11, !dbg !5 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_40_count);
  llvm_cbe_tmp__14 = (signed int *)(&aesl_internal_dec_MIMD_OC_ALU_operation[(((signed long long )llvm_cbe_tmp__11))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__11));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__11) < 50 && "Write access out of array 'aesl_internal_dec_MIMD.ALU_operation' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%13, i32* %%14, align 4, !dbg !5 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_41_count);
  *llvm_cbe_tmp__14 = llvm_cbe_tmp__13;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__13);
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = add nsw i32 %%storemerge311, 1, !dbg !6 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_42_count);
  llvm_cbe_tmp__15 = (unsigned int )((unsigned int )(llvm_cbe_storemerge311&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__15&4294967295ull)));
  if (((llvm_cbe_tmp__15&4294967295U) == (50u&4294967295U))) {
    goto llvm_cbe__2e_loopexit;
  } else {
    llvm_cbe_storemerge311__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__15;   /* for PHI node */
    goto llvm_cbe__2e_preheader9;
  }

  } while (1); /* end of syntactic loop '.preheader9' */
  do {     /* Syntactic loop '.preheader7' to make GCC happy */
llvm_cbe__2e_preheader7:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge8 = phi i32 [ %%26, %%.preheader7 ], [ 0, %%0  for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_storemerge8_count);
  llvm_cbe_storemerge8 = (unsigned int )llvm_cbe_storemerge8__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge8 = 0x%X",llvm_cbe_storemerge8);
printf("\n = 0x%X",llvm_cbe_tmp__26);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = sext i32 %%storemerge8 to i64, !dbg !4 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_49_count);
  llvm_cbe_tmp__16 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge8);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__16);
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = getelementptr inbounds i32* %%a, i64 %%16, !dbg !4 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_50_count);
  llvm_cbe_tmp__17 = (signed int *)(&llvm_cbe_a[(((signed long long )llvm_cbe_tmp__16))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__16));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = load volatile i32* %%17, align 4, !dbg !4 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_51_count);
  llvm_cbe_tmp__18 = (unsigned int )*((unsigned int volatile*)llvm_cbe_tmp__17);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__18);
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = getelementptr inbounds [50 x i32]* @aesl_internal_dec_MIMD.data_a, i64 0, i64 %%16, !dbg !4 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_52_count);
  llvm_cbe_tmp__19 = (signed int *)(&aesl_internal_dec_MIMD_OC_data_a[(((signed long long )llvm_cbe_tmp__16))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__16));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__16) < 50 && "Write access out of array 'aesl_internal_dec_MIMD.data_a' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%18, i32* %%19, align 4, !dbg !4 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_53_count);
  *llvm_cbe_tmp__19 = llvm_cbe_tmp__18;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__18);
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = getelementptr inbounds i32* %%b, i64 %%16, !dbg !4 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_54_count);
  llvm_cbe_tmp__20 = (signed int *)(&llvm_cbe_b[(((signed long long )llvm_cbe_tmp__16))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__16));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = load volatile i32* %%20, align 4, !dbg !4 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_55_count);
  llvm_cbe_tmp__21 = (unsigned int )*((unsigned int volatile*)llvm_cbe_tmp__20);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__21);
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = getelementptr inbounds [50 x i32]* @aesl_internal_dec_MIMD.data_b, i64 0, i64 %%16, !dbg !4 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_56_count);
  llvm_cbe_tmp__22 = (signed int *)(&aesl_internal_dec_MIMD_OC_data_b[(((signed long long )llvm_cbe_tmp__16))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__16));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__16) < 50 && "Write access out of array 'aesl_internal_dec_MIMD.data_b' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%21, i32* %%22, align 4, !dbg !4 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_57_count);
  *llvm_cbe_tmp__22 = llvm_cbe_tmp__21;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__21);
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = getelementptr inbounds i32* %%op, i64 %%16, !dbg !5 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_58_count);
  llvm_cbe_tmp__23 = (signed int *)(&llvm_cbe_op[(((signed long long )llvm_cbe_tmp__16))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__16));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = load volatile i32* %%23, align 4, !dbg !5 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_59_count);
  llvm_cbe_tmp__24 = (unsigned int )*((unsigned int volatile*)llvm_cbe_tmp__23);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__24);
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = getelementptr inbounds [50 x i32]* @aesl_internal_dec_MIMD.ALU_operation, i64 0, i64 %%16, !dbg !5 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_60_count);
  llvm_cbe_tmp__25 = (signed int *)(&aesl_internal_dec_MIMD_OC_ALU_operation[(((signed long long )llvm_cbe_tmp__16))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__16));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__16) < 50 && "Write access out of array 'aesl_internal_dec_MIMD.ALU_operation' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%24, i32* %%25, align 4, !dbg !5 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_61_count);
  *llvm_cbe_tmp__25 = llvm_cbe_tmp__24;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__24);
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = add nsw i32 %%storemerge8, 1, !dbg !6 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_62_count);
  llvm_cbe_tmp__26 = (unsigned int )((unsigned int )(llvm_cbe_storemerge8&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__26&4294967295ull)));
  if (((llvm_cbe_tmp__26&4294967295U) == (50u&4294967295U))) {
    goto llvm_cbe__2e_loopexit;
  } else {
    llvm_cbe_storemerge8__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__26;   /* for PHI node */
    goto llvm_cbe__2e_preheader7;
  }

  } while (1); /* end of syntactic loop '.preheader7' */
llvm_cbe__2e_loopexit:
  llvm_cbe_storemerge16__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe_tmp__85;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__85:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge16 = phi i32 [ 0, %%.loopexit ], [ %%92, %%91  for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_storemerge16_count);
  llvm_cbe_storemerge16 = (unsigned int )llvm_cbe_storemerge16__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge16 = 0x%X",llvm_cbe_storemerge16);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__79);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = sext i32 %%storemerge16 to i64, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_103_count);
  llvm_cbe_tmp__27 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge16);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__27);
if (AESL_DEBUG_TRACE)
printf("\n  %%29 = getelementptr inbounds [50 x i32]* @aesl_internal_dec_MIMD.ALU_operation, i64 0, i64 %%28, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_104_count);
  llvm_cbe_tmp__28 = (signed int *)(&aesl_internal_dec_MIMD_OC_ALU_operation[(((signed long long )llvm_cbe_tmp__27))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__27));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__27) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'aesl_internal_dec_MIMD.ALU_operation' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%30 = load i32* %%29, align 4, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_105_count);
  llvm_cbe_tmp__29 = (unsigned int )*llvm_cbe_tmp__28;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__29);
  switch (((unsigned int )(llvm_cbe_tmp__29&4294967295ull))) {
  default:
    goto llvm_cbe_tmp__86;
;
  case ((unsigned int )(0u&4294967295ull)):
    goto llvm_cbe_tmp__87;
    break;
  case ((unsigned int )(1u&4294967295ull)):
    goto llvm_cbe_tmp__88;
  case ((unsigned int )(2u&4294967295ull)):
    goto llvm_cbe_tmp__89;
  case ((unsigned int )(3u&4294967295ull)):
    goto llvm_cbe_tmp__90;
  case ((unsigned int )(4u&4294967295ull)):
    goto llvm_cbe_tmp__91;
  case ((unsigned int )(5u&4294967295ull)):
    goto llvm_cbe_tmp__92;
  case ((unsigned int )(6u&4294967295ull)):
    goto llvm_cbe_tmp__93;
  case ((unsigned int )(7u&4294967295ull)):
    goto llvm_cbe_tmp__94;
  case ((unsigned int )(8u&4294967295ull)):
    goto llvm_cbe_tmp__95;
  case ((unsigned int )(9u&4294967295ull)):
    goto llvm_cbe_tmp__96;
  }
llvm_cbe_tmp__97:
if (AESL_DEBUG_TRACE)
printf("\n  %%92 = add nsw i32 %%storemerge16, 1, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_178_count);
  llvm_cbe_tmp__79 = (unsigned int )((unsigned int )(llvm_cbe_storemerge16&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__79&4294967295ull)));
  if (((llvm_cbe_tmp__79&4294967295U) == (50u&4294967295U))) {
    llvm_cbe_storemerge25__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_preheader;
  } else {
    llvm_cbe_storemerge16__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__79;   /* for PHI node */
    goto llvm_cbe_tmp__85;
  }

llvm_cbe_tmp__87:
if (AESL_DEBUG_TRACE)
printf("\n  %%32 = getelementptr inbounds [50 x i32]* @aesl_internal_dec_MIMD.data_a, i64 0, i64 %%28, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_107_count);
  llvm_cbe_tmp__30 = (signed int *)(&aesl_internal_dec_MIMD_OC_data_a[(((signed long long )llvm_cbe_tmp__27))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__27));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__27) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'aesl_internal_dec_MIMD.data_a' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%33 = load i32* %%32, align 4, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_108_count);
  llvm_cbe_tmp__31 = (unsigned int )*llvm_cbe_tmp__30;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__31);
if (AESL_DEBUG_TRACE)
printf("\n  %%34 = add nsw i32 %%33, 27, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_109_count);
  llvm_cbe_tmp__32 = (unsigned int )((unsigned int )(llvm_cbe_tmp__31&4294967295ull)) + ((unsigned int )(27u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__32&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%35 = getelementptr inbounds [50 x i32]* %%data_result, i64 0, i64 %%28, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_110_count);
  llvm_cbe_tmp__33 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__27))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__27));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__27) < 50 && "Write access out of array 'data_result' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%34, i32* %%35, align 4, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_111_count);
  *llvm_cbe_tmp__33 = llvm_cbe_tmp__32;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__32);
  goto llvm_cbe_tmp__97;

llvm_cbe_tmp__88:
if (AESL_DEBUG_TRACE)
printf("\n  %%37 = getelementptr inbounds [50 x i32]* @aesl_internal_dec_MIMD.data_b, i64 0, i64 %%28, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_113_count);
  llvm_cbe_tmp__34 = (signed int *)(&aesl_internal_dec_MIMD_OC_data_b[(((signed long long )llvm_cbe_tmp__27))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__27));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__27) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'aesl_internal_dec_MIMD.data_b' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%38 = load i32* %%37, align 4, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_114_count);
  llvm_cbe_tmp__35 = (unsigned int )*llvm_cbe_tmp__34;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__35);
if (AESL_DEBUG_TRACE)
printf("\n  %%39 = add nsw i32 %%38, 27, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_115_count);
  llvm_cbe_tmp__36 = (unsigned int )((unsigned int )(llvm_cbe_tmp__35&4294967295ull)) + ((unsigned int )(27u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__36&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%40 = getelementptr inbounds [50 x i32]* %%data_result, i64 0, i64 %%28, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_116_count);
  llvm_cbe_tmp__37 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__27))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__27));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__27) < 50 && "Write access out of array 'data_result' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%39, i32* %%40, align 4, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_117_count);
  *llvm_cbe_tmp__37 = llvm_cbe_tmp__36;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__36);
  goto llvm_cbe_tmp__97;

llvm_cbe_tmp__89:
if (AESL_DEBUG_TRACE)
printf("\n  %%42 = getelementptr inbounds [50 x i32]* @aesl_internal_dec_MIMD.data_a, i64 0, i64 %%28, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_119_count);
  llvm_cbe_tmp__38 = (signed int *)(&aesl_internal_dec_MIMD_OC_data_a[(((signed long long )llvm_cbe_tmp__27))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__27));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__27) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'aesl_internal_dec_MIMD.data_a' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%43 = load i32* %%42, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_120_count);
  llvm_cbe_tmp__39 = (unsigned int )*llvm_cbe_tmp__38;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__39);
if (AESL_DEBUG_TRACE)
printf("\n  %%44 = shl nsw i32 %%43, 1, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_121_count);
  llvm_cbe_tmp__40 = (unsigned int )llvm_cbe_tmp__39 << 1u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__40);
if (AESL_DEBUG_TRACE)
printf("\n  %%45 = getelementptr inbounds [50 x i32]* %%data_result, i64 0, i64 %%28, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_122_count);
  llvm_cbe_tmp__41 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__27))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__27));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__27) < 50 && "Write access out of array 'data_result' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%44, i32* %%45, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_123_count);
  *llvm_cbe_tmp__41 = llvm_cbe_tmp__40;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__40);
  goto llvm_cbe_tmp__97;

llvm_cbe_tmp__90:
if (AESL_DEBUG_TRACE)
printf("\n  %%47 = getelementptr inbounds [50 x i32]* @aesl_internal_dec_MIMD.data_b, i64 0, i64 %%28, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_125_count);
  llvm_cbe_tmp__42 = (signed int *)(&aesl_internal_dec_MIMD_OC_data_b[(((signed long long )llvm_cbe_tmp__27))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__27));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__27) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'aesl_internal_dec_MIMD.data_b' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%48 = load i32* %%47, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_126_count);
  llvm_cbe_tmp__43 = (unsigned int )*llvm_cbe_tmp__42;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__43);
if (AESL_DEBUG_TRACE)
printf("\n  %%49 = shl nsw i32 %%48, 1, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_127_count);
  llvm_cbe_tmp__44 = (unsigned int )llvm_cbe_tmp__43 << 1u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__44);
if (AESL_DEBUG_TRACE)
printf("\n  %%50 = getelementptr inbounds [50 x i32]* %%data_result, i64 0, i64 %%28, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_128_count);
  llvm_cbe_tmp__45 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__27))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__27));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__27) < 50 && "Write access out of array 'data_result' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%49, i32* %%50, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_129_count);
  *llvm_cbe_tmp__45 = llvm_cbe_tmp__44;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__44);
  goto llvm_cbe_tmp__97;

llvm_cbe_tmp__91:
if (AESL_DEBUG_TRACE)
printf("\n  %%52 = getelementptr inbounds [50 x i32]* @aesl_internal_dec_MIMD.data_a, i64 0, i64 %%28, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_131_count);
  llvm_cbe_tmp__46 = (signed int *)(&aesl_internal_dec_MIMD_OC_data_a[(((signed long long )llvm_cbe_tmp__27))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__27));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__27) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'aesl_internal_dec_MIMD.data_a' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%53 = load i32* %%52, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_132_count);
  llvm_cbe_tmp__47 = (unsigned int )*llvm_cbe_tmp__46;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__47);
if (AESL_DEBUG_TRACE)
printf("\n  %%54 = sdiv i32 %%53, 2, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_133_count);
  llvm_cbe_tmp__48 = (unsigned int )((signed int )(((signed int )llvm_cbe_tmp__47) / ((signed int )2u)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__48));
if (AESL_DEBUG_TRACE)
printf("\n  %%55 = getelementptr inbounds [50 x i32]* %%data_result, i64 0, i64 %%28, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_134_count);
  llvm_cbe_tmp__49 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__27))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__27));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__27) < 50 && "Write access out of array 'data_result' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%54, i32* %%55, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_135_count);
  *llvm_cbe_tmp__49 = llvm_cbe_tmp__48;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__48);
  goto llvm_cbe_tmp__97;

llvm_cbe_tmp__92:
if (AESL_DEBUG_TRACE)
printf("\n  %%57 = getelementptr inbounds [50 x i32]* @aesl_internal_dec_MIMD.data_b, i64 0, i64 %%28, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_137_count);
  llvm_cbe_tmp__50 = (signed int *)(&aesl_internal_dec_MIMD_OC_data_b[(((signed long long )llvm_cbe_tmp__27))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__27));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__27) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'aesl_internal_dec_MIMD.data_b' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%58 = load i32* %%57, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_138_count);
  llvm_cbe_tmp__51 = (unsigned int )*llvm_cbe_tmp__50;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__51);
if (AESL_DEBUG_TRACE)
printf("\n  %%59 = sdiv i32 %%58, 2, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_139_count);
  llvm_cbe_tmp__52 = (unsigned int )((signed int )(((signed int )llvm_cbe_tmp__51) / ((signed int )2u)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__52));
if (AESL_DEBUG_TRACE)
printf("\n  %%60 = getelementptr inbounds [50 x i32]* %%data_result, i64 0, i64 %%28, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_140_count);
  llvm_cbe_tmp__53 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__27))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__27));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__27) < 50 && "Write access out of array 'data_result' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%59, i32* %%60, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_141_count);
  *llvm_cbe_tmp__53 = llvm_cbe_tmp__52;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__52);
  goto llvm_cbe_tmp__97;

llvm_cbe_tmp__93:
if (AESL_DEBUG_TRACE)
printf("\n  %%62 = getelementptr inbounds [50 x i32]* @aesl_internal_dec_MIMD.data_a, i64 0, i64 %%28, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_143_count);
  llvm_cbe_tmp__54 = (signed int *)(&aesl_internal_dec_MIMD_OC_data_a[(((signed long long )llvm_cbe_tmp__27))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__27));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__27) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'aesl_internal_dec_MIMD.data_a' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%63 = load i32* %%62, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_144_count);
  llvm_cbe_tmp__55 = (unsigned int )*llvm_cbe_tmp__54;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__55);
if (AESL_DEBUG_TRACE)
printf("\n  %%64 = getelementptr inbounds [50 x i32]* @aesl_internal_dec_MIMD.data_b, i64 0, i64 %%28, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_145_count);
  llvm_cbe_tmp__56 = (signed int *)(&aesl_internal_dec_MIMD_OC_data_b[(((signed long long )llvm_cbe_tmp__27))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__27));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__27) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'aesl_internal_dec_MIMD.data_b' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%65 = load i32* %%64, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_146_count);
  llvm_cbe_tmp__57 = (unsigned int )*llvm_cbe_tmp__56;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__57);
if (AESL_DEBUG_TRACE)
printf("\n  %%66 = add nsw i32 %%65, %%63, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_147_count);
  llvm_cbe_tmp__58 = (unsigned int )((unsigned int )(llvm_cbe_tmp__57&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__55&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__58&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%67 = getelementptr inbounds [50 x i32]* %%data_result, i64 0, i64 %%28, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_148_count);
  llvm_cbe_tmp__59 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__27))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__27));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__27) < 50 && "Write access out of array 'data_result' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%66, i32* %%67, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_149_count);
  *llvm_cbe_tmp__59 = llvm_cbe_tmp__58;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__58);
  goto llvm_cbe_tmp__97;

llvm_cbe_tmp__94:
if (AESL_DEBUG_TRACE)
printf("\n  %%69 = getelementptr inbounds [50 x i32]* @aesl_internal_dec_MIMD.data_a, i64 0, i64 %%28, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_151_count);
  llvm_cbe_tmp__60 = (signed int *)(&aesl_internal_dec_MIMD_OC_data_a[(((signed long long )llvm_cbe_tmp__27))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__27));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__27) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'aesl_internal_dec_MIMD.data_a' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%70 = load i32* %%69, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_152_count);
  llvm_cbe_tmp__61 = (unsigned int )*llvm_cbe_tmp__60;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__61);
if (AESL_DEBUG_TRACE)
printf("\n  %%71 = getelementptr inbounds [50 x i32]* @aesl_internal_dec_MIMD.data_b, i64 0, i64 %%28, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_153_count);
  llvm_cbe_tmp__62 = (signed int *)(&aesl_internal_dec_MIMD_OC_data_b[(((signed long long )llvm_cbe_tmp__27))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__27));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__27) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'aesl_internal_dec_MIMD.data_b' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%72 = load i32* %%71, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_154_count);
  llvm_cbe_tmp__63 = (unsigned int )*llvm_cbe_tmp__62;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__63);
if (AESL_DEBUG_TRACE)
printf("\n  %%73 = sub nsw i32 %%70, %%72, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_155_count);
  llvm_cbe_tmp__64 = (unsigned int )((unsigned int )(llvm_cbe_tmp__61&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__63&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__64&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%74 = getelementptr inbounds [50 x i32]* %%data_result, i64 0, i64 %%28, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_156_count);
  llvm_cbe_tmp__65 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__27))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__27));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__27) < 50 && "Write access out of array 'data_result' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%73, i32* %%74, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_157_count);
  *llvm_cbe_tmp__65 = llvm_cbe_tmp__64;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__64);
  goto llvm_cbe_tmp__97;

llvm_cbe_tmp__95:
if (AESL_DEBUG_TRACE)
printf("\n  %%76 = getelementptr inbounds [50 x i32]* @aesl_internal_dec_MIMD.data_a, i64 0, i64 %%28, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_159_count);
  llvm_cbe_tmp__66 = (signed int *)(&aesl_internal_dec_MIMD_OC_data_a[(((signed long long )llvm_cbe_tmp__27))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__27));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__27) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'aesl_internal_dec_MIMD.data_a' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%77 = load i32* %%76, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_160_count);
  llvm_cbe_tmp__67 = (unsigned int )*llvm_cbe_tmp__66;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__67);
if (AESL_DEBUG_TRACE)
printf("\n  %%78 = getelementptr inbounds [50 x i32]* @aesl_internal_dec_MIMD.data_b, i64 0, i64 %%28, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_161_count);
  llvm_cbe_tmp__68 = (signed int *)(&aesl_internal_dec_MIMD_OC_data_b[(((signed long long )llvm_cbe_tmp__27))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__27));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__27) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'aesl_internal_dec_MIMD.data_b' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%79 = load i32* %%78, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_162_count);
  llvm_cbe_tmp__69 = (unsigned int )*llvm_cbe_tmp__68;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__69);
if (AESL_DEBUG_TRACE)
printf("\n  %%80 = mul nsw i32 %%79, %%77, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_163_count);
  llvm_cbe_tmp__70 = (unsigned int )((unsigned int )(llvm_cbe_tmp__69&4294967295ull)) * ((unsigned int )(llvm_cbe_tmp__67&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__70&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%81 = getelementptr inbounds [50 x i32]* %%data_result, i64 0, i64 %%28, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_164_count);
  llvm_cbe_tmp__71 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__27))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__27));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__27) < 50 && "Write access out of array 'data_result' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%80, i32* %%81, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_165_count);
  *llvm_cbe_tmp__71 = llvm_cbe_tmp__70;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__70);
  goto llvm_cbe_tmp__97;

llvm_cbe_tmp__96:
if (AESL_DEBUG_TRACE)
printf("\n  %%83 = getelementptr inbounds [50 x i32]* @aesl_internal_dec_MIMD.data_a, i64 0, i64 %%28, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_167_count);
  llvm_cbe_tmp__72 = (signed int *)(&aesl_internal_dec_MIMD_OC_data_a[(((signed long long )llvm_cbe_tmp__27))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__27));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__27) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'aesl_internal_dec_MIMD.data_a' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%84 = load i32* %%83, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_168_count);
  llvm_cbe_tmp__73 = (unsigned int )*llvm_cbe_tmp__72;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__73);
if (AESL_DEBUG_TRACE)
printf("\n  %%85 = getelementptr inbounds [50 x i32]* @aesl_internal_dec_MIMD.data_b, i64 0, i64 %%28, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_169_count);
  llvm_cbe_tmp__74 = (signed int *)(&aesl_internal_dec_MIMD_OC_data_b[(((signed long long )llvm_cbe_tmp__27))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__27));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__27) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'aesl_internal_dec_MIMD.data_b' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%86 = load i32* %%85, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_170_count);
  llvm_cbe_tmp__75 = (unsigned int )*llvm_cbe_tmp__74;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__75);
if (AESL_DEBUG_TRACE)
printf("\n  %%87 = sdiv i32 %%84, %%86, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_171_count);
  llvm_cbe_tmp__76 = (unsigned int )((signed int )(((signed int )llvm_cbe_tmp__73) / ((signed int )llvm_cbe_tmp__75)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__76));
if (AESL_DEBUG_TRACE)
printf("\n  %%88 = getelementptr inbounds [50 x i32]* %%data_result, i64 0, i64 %%28, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_172_count);
  llvm_cbe_tmp__77 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__27))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__27));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__27) < 50 && "Write access out of array 'data_result' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%87, i32* %%88, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_173_count);
  *llvm_cbe_tmp__77 = llvm_cbe_tmp__76;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__76);
  goto llvm_cbe_tmp__97;

llvm_cbe_tmp__86:
if (AESL_DEBUG_TRACE)
printf("\n  %%90 = getelementptr inbounds [50 x i32]* %%data_result, i64 0, i64 %%28, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_175_count);
  llvm_cbe_tmp__78 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__27))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__27));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__27) < 50 && "Write access out of array 'data_result' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* %%90, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_176_count);
  *llvm_cbe_tmp__78 = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
  goto llvm_cbe_tmp__97;

  } while (1); /* end of syntactic loop '' */
  do {     /* Syntactic loop '.preheader' to make GCC happy */
llvm_cbe__2e_preheader:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge25 = phi i32 [ %%97, %%.preheader ], [ 0, %%91  for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_storemerge25_count);
  llvm_cbe_storemerge25 = (unsigned int )llvm_cbe_storemerge25__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge25 = 0x%X",llvm_cbe_storemerge25);
printf("\n = 0x%X",llvm_cbe_tmp__84);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%93 = sext i32 %%storemerge25 to i64, !dbg !4 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_209_count);
  llvm_cbe_tmp__80 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge25);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__80);
if (AESL_DEBUG_TRACE)
printf("\n  %%94 = getelementptr inbounds [50 x i32]* %%data_result, i64 0, i64 %%93, !dbg !4 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_210_count);
  llvm_cbe_tmp__81 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__80))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__80));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__80) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_result' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%95 = load i32* %%94, align 4, !dbg !4 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_211_count);
  llvm_cbe_tmp__82 = (unsigned int )*llvm_cbe_tmp__81;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__82);
if (AESL_DEBUG_TRACE)
printf("\n  %%96 = getelementptr inbounds i32* %%c, i64 %%93, !dbg !4 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_212_count);
  llvm_cbe_tmp__83 = (signed int *)(&llvm_cbe_c[(((signed long long )llvm_cbe_tmp__80))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__80));
}
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%95, i32* %%96, align 4, !dbg !4 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_213_count);
  *((unsigned int volatile*)llvm_cbe_tmp__83) = llvm_cbe_tmp__82;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__82);
if (AESL_DEBUG_TRACE)
printf("\n  %%97 = add nsw i32 %%storemerge25, 1, !dbg !10 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_214_count);
  llvm_cbe_tmp__84 = (unsigned int )((unsigned int )(llvm_cbe_storemerge25&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__84&4294967295ull)));
  if (((llvm_cbe_tmp__84&4294967295U) == (50u&4294967295U))) {
    goto llvm_cbe_tmp__98;
  } else {
    llvm_cbe_storemerge25__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__84;   /* for PHI node */
    goto llvm_cbe__2e_preheader;
  }

  } while (1); /* end of syntactic loop '.preheader' */
llvm_cbe_tmp__98:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @dec_MIMD}\n");
  return;
}


void dec_MIMD_hw_stub(signed int *llvm_cbe_a, signed int *llvm_cbe_b, signed int *llvm_cbe_c, signed int *llvm_cbe_op, signed int llvm_cbe_selec) {
  static  unsigned long long aesl_llvm_cbe_222_count = 0;
  signed int llvm_cbe_tmp__99;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_223_count = 0;
  static  unsigned long long aesl_llvm_cbe_224_count = 0;
  static  unsigned long long aesl_llvm_cbe_225_count = 0;
  static  unsigned long long aesl_llvm_cbe_226_count = 0;
  static  unsigned long long aesl_llvm_cbe_227_count = 0;
  static  unsigned long long aesl_llvm_cbe_228_count = 0;
  static  unsigned long long aesl_llvm_cbe_229_count = 0;
  static  unsigned long long aesl_llvm_cbe_230_count = 0;
  static  unsigned long long aesl_llvm_cbe_231_count = 0;
  static  unsigned long long aesl_llvm_cbe_232_count = 0;
  static  unsigned long long aesl_llvm_cbe_233_count = 0;
  static  unsigned long long aesl_llvm_cbe_234_count = 0;
  unsigned int llvm_cbe_tmp__100;
  static  unsigned long long aesl_llvm_cbe_235_count = 0;
  static  unsigned long long aesl_llvm_cbe_236_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @dec_MIMD_hw_stub\n");
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%selec, i32* %%1, align  for 0x%I64xth hint within @dec_MIMD_hw_stub  --> \n", ++aesl_llvm_cbe_228_count);
  *((unsigned int volatile*)(&llvm_cbe_tmp__99)) = llvm_cbe_selec;
if (AESL_DEBUG_TRACE)
printf("\nselec = 0x%X\n", llvm_cbe_selec);
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = load volatile i32* %%1, align 4, !dbg !4 for 0x%I64xth hint within @dec_MIMD_hw_stub  --> \n", ++aesl_llvm_cbe_234_count);
  llvm_cbe_tmp__100 = (unsigned int )*((unsigned int volatile*)(&llvm_cbe_tmp__99));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__100);
if (AESL_DEBUG_TRACE)
printf("\n  call void @dec_MIMD(i32* %%a, i32* %%b, i32* %%c, i32* %%op, i32 %%2), !dbg !4 for 0x%I64xth hint within @dec_MIMD_hw_stub  --> \n", ++aesl_llvm_cbe_235_count);
  dec_MIMD((signed int *)llvm_cbe_a, (signed int *)llvm_cbe_b, (signed int *)llvm_cbe_c, (signed int *)llvm_cbe_op, llvm_cbe_tmp__100);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__100);
}
  if (AESL_DEBUG_TRACE)
      printf("\nEND @dec_MIMD_hw_stub}\n");
  return;
}


void apatb_dec_MIMD_sw(signed int *llvm_cbe_a, signed int *llvm_cbe_b, signed int *llvm_cbe_c, signed int *llvm_cbe_op, signed int llvm_cbe_selec) {
  static  unsigned long long aesl_llvm_cbe_237_count = 0;
  signed int llvm_cbe_tmp__101;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_238_count = 0;
  static  unsigned long long aesl_llvm_cbe_239_count = 0;
  static  unsigned long long aesl_llvm_cbe_240_count = 0;
  static  unsigned long long aesl_llvm_cbe_241_count = 0;
  static  unsigned long long aesl_llvm_cbe_242_count = 0;
  static  unsigned long long aesl_llvm_cbe_243_count = 0;
  static  unsigned long long aesl_llvm_cbe_244_count = 0;
  static  unsigned long long aesl_llvm_cbe_245_count = 0;
  static  unsigned long long aesl_llvm_cbe_246_count = 0;
  static  unsigned long long aesl_llvm_cbe_247_count = 0;
  static  unsigned long long aesl_llvm_cbe_248_count = 0;
  static  unsigned long long aesl_llvm_cbe_249_count = 0;
  static  unsigned long long aesl_llvm_cbe_250_count = 0;
  unsigned int llvm_cbe_tmp__102;
  static  unsigned long long aesl_llvm_cbe_251_count = 0;
  static  unsigned long long aesl_llvm_cbe_252_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @apatb_dec_MIMD_sw\n");
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%selec, i32* %%1, align  for 0x%I64xth hint within @apatb_dec_MIMD_sw  --> \n", ++aesl_llvm_cbe_247_count);
  *((unsigned int volatile*)(&llvm_cbe_tmp__101)) = llvm_cbe_selec;
if (AESL_DEBUG_TRACE)
printf("\nselec = 0x%X\n", llvm_cbe_selec);
if (AESL_DEBUG_TRACE)
printf("\n  call void bitcast (void (...)* @refine_signal_handler to void ()*)() nounwind, !dbg !4 for 0x%I64xth hint within @apatb_dec_MIMD_sw  --> \n", ++aesl_llvm_cbe_248_count);
  refine_signal_handler();
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = load volatile i32* %%1, align 4, !dbg !3 for 0x%I64xth hint within @apatb_dec_MIMD_sw  --> \n", ++aesl_llvm_cbe_250_count);
  llvm_cbe_tmp__102 = (unsigned int )*((unsigned int volatile*)(&llvm_cbe_tmp__101));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__102);
if (AESL_DEBUG_TRACE)
printf("\n  call void @apatb_dec_MIMD_ir(i32* %%a, i32* %%b, i32* %%c, i32* %%op, i32 %%2) nounwind, !dbg !3 for 0x%I64xth hint within @apatb_dec_MIMD_sw  --> \n", ++aesl_llvm_cbe_251_count);
  apatb_dec_MIMD_ir((signed int *)llvm_cbe_a, (signed int *)llvm_cbe_b, (signed int *)llvm_cbe_c, (signed int *)llvm_cbe_op, llvm_cbe_tmp__102);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__102);
}
  if (AESL_DEBUG_TRACE)
      printf("\nEND @apatb_dec_MIMD_sw}\n");
  return;
}

