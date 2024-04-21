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

/* Function Declarations */
double fmod(double, double);
float fmodf(float, float);
long double fmodl(long double, long double);
void dec_MIMD(signed int *llvm_cbe_a, signed int *llvm_cbe_b, signed int *llvm_cbe_c, signed int *llvm_cbe_op, signed int llvm_cbe_group);


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

void dec_MIMD(signed int *llvm_cbe_a, signed int *llvm_cbe_b, signed int *llvm_cbe_c, signed int *llvm_cbe_op, signed int llvm_cbe_group) {
  static  unsigned long long aesl_llvm_cbe_1_count = 0;
  signed int llvm_cbe_tmp__1;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_data_a_count = 0;
  signed int llvm_cbe_data_a[50];    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_data_b_count = 0;
  signed int llvm_cbe_data_b[50];    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_data_result_count = 0;
  signed int llvm_cbe_data_result[10];    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_ALU_operation_count = 0;
  signed int llvm_cbe_ALU_operation[10];    /* Address-exposed local */
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
  static  unsigned long long aesl_llvm_cbe_19_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge16_count = 0;
  unsigned int llvm_cbe_storemerge16;
  unsigned int llvm_cbe_storemerge16__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_20_count = 0;
  static  unsigned long long aesl_llvm_cbe_21_count = 0;
  unsigned int llvm_cbe_tmp__3;
  static  unsigned long long aesl_llvm_cbe_22_count = 0;
  unsigned int llvm_cbe_tmp__4;
  static  unsigned long long aesl_llvm_cbe_23_count = 0;
  unsigned int llvm_cbe_tmp__5;
  static  unsigned long long aesl_llvm_cbe_24_count = 0;
  unsigned long long llvm_cbe_tmp__6;
  static  unsigned long long aesl_llvm_cbe_25_count = 0;
  signed int *llvm_cbe_tmp__7;
  static  unsigned long long aesl_llvm_cbe_26_count = 0;
  unsigned int llvm_cbe_tmp__8;
  static  unsigned long long aesl_llvm_cbe_27_count = 0;
  unsigned long long llvm_cbe_tmp__9;
  static  unsigned long long aesl_llvm_cbe_28_count = 0;
  signed int *llvm_cbe_tmp__10;
  static  unsigned long long aesl_llvm_cbe_29_count = 0;
  static  unsigned long long aesl_llvm_cbe_30_count = 0;
  static  unsigned long long aesl_llvm_cbe_31_count = 0;
  unsigned int llvm_cbe_tmp__11;
  static  unsigned long long aesl_llvm_cbe_32_count = 0;
  unsigned int llvm_cbe_tmp__12;
  static  unsigned long long aesl_llvm_cbe_33_count = 0;
  unsigned int llvm_cbe_tmp__13;
  static  unsigned long long aesl_llvm_cbe_34_count = 0;
  unsigned long long llvm_cbe_tmp__14;
  static  unsigned long long aesl_llvm_cbe_35_count = 0;
  signed int *llvm_cbe_tmp__15;
  static  unsigned long long aesl_llvm_cbe_36_count = 0;
  unsigned int llvm_cbe_tmp__16;
  static  unsigned long long aesl_llvm_cbe_37_count = 0;
  signed int *llvm_cbe_tmp__17;
  static  unsigned long long aesl_llvm_cbe_38_count = 0;
  static  unsigned long long aesl_llvm_cbe_39_count = 0;
  static  unsigned long long aesl_llvm_cbe_40_count = 0;
  static  unsigned long long aesl_llvm_cbe_41_count = 0;
  signed int *llvm_cbe_tmp__18;
  static  unsigned long long aesl_llvm_cbe_42_count = 0;
  unsigned int llvm_cbe_tmp__19;
  static  unsigned long long aesl_llvm_cbe_43_count = 0;
  signed int *llvm_cbe_tmp__20;
  static  unsigned long long aesl_llvm_cbe_44_count = 0;
  static  unsigned long long aesl_llvm_cbe_45_count = 0;
  static  unsigned long long aesl_llvm_cbe_46_count = 0;
  unsigned int llvm_cbe_tmp__21;
  static  unsigned long long aesl_llvm_cbe_47_count = 0;
  static  unsigned long long aesl_llvm_cbe_48_count = 0;
  static  unsigned long long aesl_llvm_cbe_49_count = 0;
  static  unsigned long long aesl_llvm_cbe_50_count = 0;
  static  unsigned long long aesl_llvm_cbe_51_count = 0;
  static  unsigned long long aesl_llvm_cbe_52_count = 0;
  static  unsigned long long aesl_llvm_cbe_53_count = 0;
  static  unsigned long long aesl_llvm_cbe_54_count = 0;
  static  unsigned long long aesl_llvm_cbe_55_count = 0;
  static  unsigned long long aesl_llvm_cbe_56_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond8_count = 0;
  static  unsigned long long aesl_llvm_cbe_57_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge24_count = 0;
  unsigned int llvm_cbe_storemerge24;
  unsigned int llvm_cbe_storemerge24__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_58_count = 0;
  unsigned long long llvm_cbe_tmp__22;
  static  unsigned long long aesl_llvm_cbe_59_count = 0;
  signed int *llvm_cbe_tmp__23;
  static  unsigned long long aesl_llvm_cbe_60_count = 0;
  unsigned int llvm_cbe_tmp__24;
  static  unsigned long long aesl_llvm_cbe_61_count = 0;
  static  unsigned long long aesl_llvm_cbe_62_count = 0;
  signed int *llvm_cbe_tmp__25;
  static  unsigned long long aesl_llvm_cbe_63_count = 0;
  unsigned int llvm_cbe_tmp__26;
  static  unsigned long long aesl_llvm_cbe_64_count = 0;
  unsigned int llvm_cbe_tmp__27;
  static  unsigned long long aesl_llvm_cbe_65_count = 0;
  signed int *llvm_cbe_tmp__28;
  static  unsigned long long aesl_llvm_cbe_66_count = 0;
  static  unsigned long long aesl_llvm_cbe_67_count = 0;
  static  unsigned long long aesl_llvm_cbe_68_count = 0;
  signed int *llvm_cbe_tmp__29;
  static  unsigned long long aesl_llvm_cbe_69_count = 0;
  unsigned int llvm_cbe_tmp__30;
  static  unsigned long long aesl_llvm_cbe_70_count = 0;
  unsigned int llvm_cbe_tmp__31;
  static  unsigned long long aesl_llvm_cbe_71_count = 0;
  signed int *llvm_cbe_tmp__32;
  static  unsigned long long aesl_llvm_cbe_72_count = 0;
  static  unsigned long long aesl_llvm_cbe_73_count = 0;
  static  unsigned long long aesl_llvm_cbe_74_count = 0;
  signed int *llvm_cbe_tmp__33;
  static  unsigned long long aesl_llvm_cbe_75_count = 0;
  unsigned int llvm_cbe_tmp__34;
  static  unsigned long long aesl_llvm_cbe_76_count = 0;
  unsigned int llvm_cbe_tmp__35;
  static  unsigned long long aesl_llvm_cbe_77_count = 0;
  signed int *llvm_cbe_tmp__36;
  static  unsigned long long aesl_llvm_cbe_78_count = 0;
  static  unsigned long long aesl_llvm_cbe_79_count = 0;
  static  unsigned long long aesl_llvm_cbe_80_count = 0;
  signed int *llvm_cbe_tmp__37;
  static  unsigned long long aesl_llvm_cbe_81_count = 0;
  unsigned int llvm_cbe_tmp__38;
  static  unsigned long long aesl_llvm_cbe_82_count = 0;
  unsigned int llvm_cbe_tmp__39;
  static  unsigned long long aesl_llvm_cbe_83_count = 0;
  signed int *llvm_cbe_tmp__40;
  static  unsigned long long aesl_llvm_cbe_84_count = 0;
  static  unsigned long long aesl_llvm_cbe_85_count = 0;
  static  unsigned long long aesl_llvm_cbe_86_count = 0;
  signed int *llvm_cbe_tmp__41;
  static  unsigned long long aesl_llvm_cbe_87_count = 0;
  unsigned int llvm_cbe_tmp__42;
  static  unsigned long long aesl_llvm_cbe_88_count = 0;
  unsigned int llvm_cbe_tmp__43;
  static  unsigned long long aesl_llvm_cbe_89_count = 0;
  signed int *llvm_cbe_tmp__44;
  static  unsigned long long aesl_llvm_cbe_90_count = 0;
  static  unsigned long long aesl_llvm_cbe_91_count = 0;
  static  unsigned long long aesl_llvm_cbe_92_count = 0;
  signed int *llvm_cbe_tmp__45;
  static  unsigned long long aesl_llvm_cbe_93_count = 0;
  unsigned int llvm_cbe_tmp__46;
  static  unsigned long long aesl_llvm_cbe_94_count = 0;
  unsigned int llvm_cbe_tmp__47;
  static  unsigned long long aesl_llvm_cbe_95_count = 0;
  signed int *llvm_cbe_tmp__48;
  static  unsigned long long aesl_llvm_cbe_96_count = 0;
  static  unsigned long long aesl_llvm_cbe_97_count = 0;
  static  unsigned long long aesl_llvm_cbe_98_count = 0;
  signed int *llvm_cbe_tmp__49;
  static  unsigned long long aesl_llvm_cbe_99_count = 0;
  unsigned int llvm_cbe_tmp__50;
  static  unsigned long long aesl_llvm_cbe_100_count = 0;
  signed int *llvm_cbe_tmp__51;
  static  unsigned long long aesl_llvm_cbe_101_count = 0;
  unsigned int llvm_cbe_tmp__52;
  static  unsigned long long aesl_llvm_cbe_102_count = 0;
  unsigned int llvm_cbe_tmp__53;
  static  unsigned long long aesl_llvm_cbe_103_count = 0;
  signed int *llvm_cbe_tmp__54;
  static  unsigned long long aesl_llvm_cbe_104_count = 0;
  static  unsigned long long aesl_llvm_cbe_105_count = 0;
  static  unsigned long long aesl_llvm_cbe_106_count = 0;
  signed int *llvm_cbe_tmp__55;
  static  unsigned long long aesl_llvm_cbe_107_count = 0;
  unsigned int llvm_cbe_tmp__56;
  static  unsigned long long aesl_llvm_cbe_108_count = 0;
  signed int *llvm_cbe_tmp__57;
  static  unsigned long long aesl_llvm_cbe_109_count = 0;
  unsigned int llvm_cbe_tmp__58;
  static  unsigned long long aesl_llvm_cbe_110_count = 0;
  unsigned int llvm_cbe_tmp__59;
  static  unsigned long long aesl_llvm_cbe_111_count = 0;
  signed int *llvm_cbe_tmp__60;
  static  unsigned long long aesl_llvm_cbe_112_count = 0;
  static  unsigned long long aesl_llvm_cbe_113_count = 0;
  static  unsigned long long aesl_llvm_cbe_114_count = 0;
  signed int *llvm_cbe_tmp__61;
  static  unsigned long long aesl_llvm_cbe_115_count = 0;
  unsigned int llvm_cbe_tmp__62;
  static  unsigned long long aesl_llvm_cbe_116_count = 0;
  signed int *llvm_cbe_tmp__63;
  static  unsigned long long aesl_llvm_cbe_117_count = 0;
  unsigned int llvm_cbe_tmp__64;
  static  unsigned long long aesl_llvm_cbe_118_count = 0;
  unsigned int llvm_cbe_tmp__65;
  static  unsigned long long aesl_llvm_cbe_119_count = 0;
  signed int *llvm_cbe_tmp__66;
  static  unsigned long long aesl_llvm_cbe_120_count = 0;
  static  unsigned long long aesl_llvm_cbe_121_count = 0;
  static  unsigned long long aesl_llvm_cbe_122_count = 0;
  signed int *llvm_cbe_tmp__67;
  static  unsigned long long aesl_llvm_cbe_123_count = 0;
  unsigned int llvm_cbe_tmp__68;
  static  unsigned long long aesl_llvm_cbe_124_count = 0;
  signed int *llvm_cbe_tmp__69;
  static  unsigned long long aesl_llvm_cbe_125_count = 0;
  unsigned int llvm_cbe_tmp__70;
  static  unsigned long long aesl_llvm_cbe_126_count = 0;
  unsigned int llvm_cbe_tmp__71;
  static  unsigned long long aesl_llvm_cbe_127_count = 0;
  signed int *llvm_cbe_tmp__72;
  static  unsigned long long aesl_llvm_cbe_128_count = 0;
  static  unsigned long long aesl_llvm_cbe_129_count = 0;
  static  unsigned long long aesl_llvm_cbe_130_count = 0;
  signed int *llvm_cbe_tmp__73;
  static  unsigned long long aesl_llvm_cbe_131_count = 0;
  static  unsigned long long aesl_llvm_cbe_132_count = 0;
  static  unsigned long long aesl_llvm_cbe_133_count = 0;
  unsigned int llvm_cbe_tmp__74;
  static  unsigned long long aesl_llvm_cbe_134_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_exitcond7_count = 0;
  static  unsigned long long aesl_llvm_cbe_163_count = 0;
  static  unsigned long long aesl_llvm_cbe_164_count = 0;
  static  unsigned long long aesl_llvm_cbe_165_count = 0;
  static  unsigned long long aesl_llvm_cbe_166_count = 0;
  static  unsigned long long aesl_llvm_cbe_167_count = 0;
  static  unsigned long long aesl_llvm_cbe_168_count = 0;
  static  unsigned long long aesl_llvm_cbe_169_count = 0;
  signed int *llvm_cbe_tmp__75;
  static  unsigned long long aesl_llvm_cbe_170_count = 0;
  unsigned int llvm_cbe_tmp__76;
  static  unsigned long long aesl_llvm_cbe_171_count = 0;
  static  unsigned long long aesl_llvm_cbe_172_count = 0;
  static  unsigned long long aesl_llvm_cbe_173_count = 0;
  static  unsigned long long aesl_llvm_cbe_174_count = 0;
  static  unsigned long long aesl_llvm_cbe_175_count = 0;
  static  unsigned long long aesl_llvm_cbe_176_count = 0;
  static  unsigned long long aesl_llvm_cbe_177_count = 0;
  signed int *llvm_cbe_tmp__77;
  static  unsigned long long aesl_llvm_cbe_178_count = 0;
  unsigned int llvm_cbe_tmp__78;
  static  unsigned long long aesl_llvm_cbe_179_count = 0;
  signed int *llvm_cbe_tmp__79;
  static  unsigned long long aesl_llvm_cbe_180_count = 0;
  static  unsigned long long aesl_llvm_cbe_181_count = 0;
  static  unsigned long long aesl_llvm_cbe_182_count = 0;
  static  unsigned long long aesl_llvm_cbe_183_count = 0;
  static  unsigned long long aesl_llvm_cbe_184_count = 0;
  static  unsigned long long aesl_llvm_cbe_185_count = 0;
  static  unsigned long long aesl_llvm_cbe_186_count = 0;
  signed int *llvm_cbe_tmp__80;
  static  unsigned long long aesl_llvm_cbe_187_count = 0;
  unsigned int llvm_cbe_tmp__81;
  static  unsigned long long aesl_llvm_cbe_188_count = 0;
  signed int *llvm_cbe_tmp__82;
  static  unsigned long long aesl_llvm_cbe_189_count = 0;
  static  unsigned long long aesl_llvm_cbe_190_count = 0;
  static  unsigned long long aesl_llvm_cbe_191_count = 0;
  static  unsigned long long aesl_llvm_cbe_192_count = 0;
  static  unsigned long long aesl_llvm_cbe_193_count = 0;
  static  unsigned long long aesl_llvm_cbe_194_count = 0;
  static  unsigned long long aesl_llvm_cbe_195_count = 0;
  signed int *llvm_cbe_tmp__83;
  static  unsigned long long aesl_llvm_cbe_196_count = 0;
  unsigned int llvm_cbe_tmp__84;
  static  unsigned long long aesl_llvm_cbe_197_count = 0;
  signed int *llvm_cbe_tmp__85;
  static  unsigned long long aesl_llvm_cbe_198_count = 0;
  static  unsigned long long aesl_llvm_cbe_199_count = 0;
  static  unsigned long long aesl_llvm_cbe_200_count = 0;
  static  unsigned long long aesl_llvm_cbe_201_count = 0;
  static  unsigned long long aesl_llvm_cbe_202_count = 0;
  static  unsigned long long aesl_llvm_cbe_203_count = 0;
  static  unsigned long long aesl_llvm_cbe_204_count = 0;
  signed int *llvm_cbe_tmp__86;
  static  unsigned long long aesl_llvm_cbe_205_count = 0;
  unsigned int llvm_cbe_tmp__87;
  static  unsigned long long aesl_llvm_cbe_206_count = 0;
  signed int *llvm_cbe_tmp__88;
  static  unsigned long long aesl_llvm_cbe_207_count = 0;
  static  unsigned long long aesl_llvm_cbe_208_count = 0;
  static  unsigned long long aesl_llvm_cbe_209_count = 0;
  static  unsigned long long aesl_llvm_cbe_210_count = 0;
  static  unsigned long long aesl_llvm_cbe_211_count = 0;
  static  unsigned long long aesl_llvm_cbe_212_count = 0;
  static  unsigned long long aesl_llvm_cbe_213_count = 0;
  signed int *llvm_cbe_tmp__89;
  static  unsigned long long aesl_llvm_cbe_214_count = 0;
  unsigned int llvm_cbe_tmp__90;
  static  unsigned long long aesl_llvm_cbe_215_count = 0;
  signed int *llvm_cbe_tmp__91;
  static  unsigned long long aesl_llvm_cbe_216_count = 0;
  static  unsigned long long aesl_llvm_cbe_217_count = 0;
  static  unsigned long long aesl_llvm_cbe_218_count = 0;
  static  unsigned long long aesl_llvm_cbe_219_count = 0;
  static  unsigned long long aesl_llvm_cbe_220_count = 0;
  static  unsigned long long aesl_llvm_cbe_221_count = 0;
  static  unsigned long long aesl_llvm_cbe_222_count = 0;
  signed int *llvm_cbe_tmp__92;
  static  unsigned long long aesl_llvm_cbe_223_count = 0;
  unsigned int llvm_cbe_tmp__93;
  static  unsigned long long aesl_llvm_cbe_224_count = 0;
  signed int *llvm_cbe_tmp__94;
  static  unsigned long long aesl_llvm_cbe_225_count = 0;
  static  unsigned long long aesl_llvm_cbe_226_count = 0;
  static  unsigned long long aesl_llvm_cbe_227_count = 0;
  static  unsigned long long aesl_llvm_cbe_228_count = 0;
  static  unsigned long long aesl_llvm_cbe_229_count = 0;
  static  unsigned long long aesl_llvm_cbe_230_count = 0;
  static  unsigned long long aesl_llvm_cbe_231_count = 0;
  signed int *llvm_cbe_tmp__95;
  static  unsigned long long aesl_llvm_cbe_232_count = 0;
  unsigned int llvm_cbe_tmp__96;
  static  unsigned long long aesl_llvm_cbe_233_count = 0;
  signed int *llvm_cbe_tmp__97;
  static  unsigned long long aesl_llvm_cbe_234_count = 0;
  static  unsigned long long aesl_llvm_cbe_235_count = 0;
  static  unsigned long long aesl_llvm_cbe_236_count = 0;
  static  unsigned long long aesl_llvm_cbe_237_count = 0;
  static  unsigned long long aesl_llvm_cbe_238_count = 0;
  static  unsigned long long aesl_llvm_cbe_239_count = 0;
  static  unsigned long long aesl_llvm_cbe_240_count = 0;
  signed int *llvm_cbe_tmp__98;
  static  unsigned long long aesl_llvm_cbe_241_count = 0;
  unsigned int llvm_cbe_tmp__99;
  static  unsigned long long aesl_llvm_cbe_242_count = 0;
  signed int *llvm_cbe_tmp__100;
  static  unsigned long long aesl_llvm_cbe_243_count = 0;
  static  unsigned long long aesl_llvm_cbe_244_count = 0;
  static  unsigned long long aesl_llvm_cbe_245_count = 0;
  static  unsigned long long aesl_llvm_cbe_246_count = 0;
  static  unsigned long long aesl_llvm_cbe_247_count = 0;
  static  unsigned long long aesl_llvm_cbe_248_count = 0;
  static  unsigned long long aesl_llvm_cbe_249_count = 0;
  signed int *llvm_cbe_tmp__101;
  static  unsigned long long aesl_llvm_cbe_250_count = 0;
  unsigned int llvm_cbe_tmp__102;
  static  unsigned long long aesl_llvm_cbe_251_count = 0;
  signed int *llvm_cbe_tmp__103;
  static  unsigned long long aesl_llvm_cbe_252_count = 0;
  static  unsigned long long aesl_llvm_cbe_253_count = 0;
  static  unsigned long long aesl_llvm_cbe_254_count = 0;
  static  unsigned long long aesl_llvm_cbe_255_count = 0;
  static  unsigned long long aesl_llvm_cbe_256_count = 0;
  static  unsigned long long aesl_llvm_cbe_257_count = 0;
  static  unsigned long long aesl_llvm_cbe_258_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @dec_MIMD\n");
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%group, i32* %%1, align  for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_11_count);
  *((unsigned int volatile*)(&llvm_cbe_tmp__1)) = llvm_cbe_group;
if (AESL_DEBUG_TRACE)
printf("\ngroup = 0x%X\n", llvm_cbe_group);
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = load volatile i32* %%1, align 4, !dbg !5 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_17_count);
  llvm_cbe_tmp__2 = (unsigned int )*((unsigned int volatile*)(&llvm_cbe_tmp__1));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__2);
  if ((((signed int )llvm_cbe_tmp__2) < ((signed int )5u))) {
    llvm_cbe_storemerge16__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_preheader5;
  } else {
    goto llvm_cbe__2e_loopexit;
  }

  do {     /* Syntactic loop '.preheader5' to make GCC happy */
llvm_cbe__2e_preheader5:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge16 = phi i32 [ %%25, %%24 ], [ 0, %%0  for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_storemerge16_count);
  llvm_cbe_storemerge16 = (unsigned int )llvm_cbe_storemerge16__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge16 = 0x%X",llvm_cbe_storemerge16);
printf("\n = 0x%X",llvm_cbe_tmp__21);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = load volatile i32* %%1, align 4, !dbg !2 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_21_count);
  llvm_cbe_tmp__3 = (unsigned int )*((unsigned int volatile*)(&llvm_cbe_tmp__1));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__3);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = mul nsw i32 %%4, 10, !dbg !2 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_22_count);
  llvm_cbe_tmp__4 = (unsigned int )((unsigned int )(llvm_cbe_tmp__3&4294967295ull)) * ((unsigned int )(10u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__4&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = add nsw i32 %%5, %%storemerge16, !dbg !2 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_23_count);
  llvm_cbe_tmp__5 = (unsigned int )((unsigned int )(llvm_cbe_tmp__4&4294967295ull)) + ((unsigned int )(llvm_cbe_storemerge16&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__5&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = sext i32 %%6 to i64, !dbg !2 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_24_count);
  llvm_cbe_tmp__6 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__5);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__6);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = getelementptr inbounds i32* %%a, i64 %%7, !dbg !2 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_25_count);
  llvm_cbe_tmp__7 = (signed int *)(&llvm_cbe_a[(((signed long long )llvm_cbe_tmp__6))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__6));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = load volatile i32* %%8, align 4, !dbg !2 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_26_count);
  llvm_cbe_tmp__8 = (unsigned int )*((unsigned int volatile*)llvm_cbe_tmp__7);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__8);
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = sext i32 %%storemerge16 to i64, !dbg !2 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_27_count);
  llvm_cbe_tmp__9 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge16);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__9);
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = getelementptr inbounds [50 x i32]* %%data_a, i64 0, i64 %%10, !dbg !2 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_28_count);
  llvm_cbe_tmp__10 = (signed int *)(&llvm_cbe_data_a[(((signed long long )llvm_cbe_tmp__9))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__9));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__9) < 50 && "Write access out of array 'data_a' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%9, i32* %%11, align 4, !dbg !2 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_29_count);
  *llvm_cbe_tmp__10 = llvm_cbe_tmp__8;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__8);
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = load volatile i32* %%1, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_31_count);
  llvm_cbe_tmp__11 = (unsigned int )*((unsigned int volatile*)(&llvm_cbe_tmp__1));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__11);
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = mul nsw i32 %%12, 10, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_32_count);
  llvm_cbe_tmp__12 = (unsigned int )((unsigned int )(llvm_cbe_tmp__11&4294967295ull)) * ((unsigned int )(10u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__12&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = add nsw i32 %%13, %%storemerge16, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_33_count);
  llvm_cbe_tmp__13 = (unsigned int )((unsigned int )(llvm_cbe_tmp__12&4294967295ull)) + ((unsigned int )(llvm_cbe_storemerge16&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__13&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = sext i32 %%14 to i64, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_34_count);
  llvm_cbe_tmp__14 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__13);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__14);
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = getelementptr inbounds i32* %%b, i64 %%15, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_35_count);
  llvm_cbe_tmp__15 = (signed int *)(&llvm_cbe_b[(((signed long long )llvm_cbe_tmp__14))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__14));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = load volatile i32* %%16, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_36_count);
  llvm_cbe_tmp__16 = (unsigned int )*((unsigned int volatile*)llvm_cbe_tmp__15);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__16);
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = getelementptr inbounds [50 x i32]* %%data_b, i64 0, i64 %%10, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_37_count);
  llvm_cbe_tmp__17 = (signed int *)(&llvm_cbe_data_b[(((signed long long )llvm_cbe_tmp__9))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__9));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__9) < 50 && "Write access out of array 'data_b' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%17, i32* %%18, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_38_count);
  *llvm_cbe_tmp__17 = llvm_cbe_tmp__16;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__16);
  if ((((signed int )llvm_cbe_storemerge16) < ((signed int )10u))) {
    goto llvm_cbe_tmp__104;
  } else {
    goto llvm_cbe_tmp__105;
  }

llvm_cbe_tmp__105:
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = add nsw i32 %%storemerge16, 1, !dbg !5 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_46_count);
  llvm_cbe_tmp__21 = (unsigned int )((unsigned int )(llvm_cbe_storemerge16&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__21&4294967295ull)));
  if (((llvm_cbe_tmp__21&4294967295U) == (50u&4294967295U))) {
    llvm_cbe_storemerge24__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_preheader;
  } else {
    llvm_cbe_storemerge16__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__21;   /* for PHI node */
    goto llvm_cbe__2e_preheader5;
  }

llvm_cbe_tmp__104:
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = getelementptr inbounds i32* %%op, i64 %%10, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_41_count);
  llvm_cbe_tmp__18 = (signed int *)(&llvm_cbe_op[(((signed long long )llvm_cbe_tmp__9))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__9));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = load volatile i32* %%21, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_42_count);
  llvm_cbe_tmp__19 = (unsigned int )*((unsigned int volatile*)llvm_cbe_tmp__18);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__19);
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = getelementptr inbounds [10 x i32]* %%ALU_operation, i64 0, i64 %%10, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_43_count);
  llvm_cbe_tmp__20 = (signed int *)(&llvm_cbe_ALU_operation[(((signed long long )llvm_cbe_tmp__9))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__9));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__9) < 10 && "Write access out of array 'ALU_operation' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%22, i32* %%23, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_44_count);
  *llvm_cbe_tmp__20 = llvm_cbe_tmp__19;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__19);
  goto llvm_cbe_tmp__105;

  } while (1); /* end of syntactic loop '.preheader5' */
  do {     /* Syntactic loop '.preheader' to make GCC happy */
llvm_cbe__2e_preheader:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge24 = phi i32 [ %%90, %%89 ], [ 0, %%24  for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_storemerge24_count);
  llvm_cbe_storemerge24 = (unsigned int )llvm_cbe_storemerge24__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge24 = 0x%X",llvm_cbe_storemerge24);
printf("\n = 0x%X",llvm_cbe_tmp__74);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = sext i32 %%storemerge24 to i64, !dbg !6 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_58_count);
  llvm_cbe_tmp__22 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge24);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__22);
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = getelementptr inbounds [10 x i32]* %%ALU_operation, i64 0, i64 %%26, !dbg !6 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_59_count);
  llvm_cbe_tmp__23 = (signed int *)(&llvm_cbe_ALU_operation[(((signed long long )llvm_cbe_tmp__22))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__22));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__22) < 10)) fprintf(stderr, "%s:%d: warning: Read access out of array 'ALU_operation' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = load i32* %%27, align 4, !dbg !6 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_60_count);
  llvm_cbe_tmp__24 = (unsigned int )*llvm_cbe_tmp__23;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__24);
  switch (((unsigned int )(llvm_cbe_tmp__24&4294967295ull))) {
  default:
    goto llvm_cbe_tmp__106;
;
  case ((unsigned int )(0u&4294967295ull)):
    goto llvm_cbe_tmp__107;
    break;
  case ((unsigned int )(1u&4294967295ull)):
    goto llvm_cbe_tmp__108;
  case ((unsigned int )(2u&4294967295ull)):
    goto llvm_cbe_tmp__109;
  case ((unsigned int )(3u&4294967295ull)):
    goto llvm_cbe_tmp__110;
  case ((unsigned int )(4u&4294967295ull)):
    goto llvm_cbe_tmp__111;
  case ((unsigned int )(5u&4294967295ull)):
    goto llvm_cbe_tmp__112;
  case ((unsigned int )(6u&4294967295ull)):
    goto llvm_cbe_tmp__113;
  case ((unsigned int )(7u&4294967295ull)):
    goto llvm_cbe_tmp__114;
  case ((unsigned int )(8u&4294967295ull)):
    goto llvm_cbe_tmp__115;
  case ((unsigned int )(9u&4294967295ull)):
    goto llvm_cbe_tmp__116;
  }
llvm_cbe_tmp__117:
if (AESL_DEBUG_TRACE)
printf("\n  %%90 = add nsw i32 %%storemerge24, 1, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_133_count);
  llvm_cbe_tmp__74 = (unsigned int )((unsigned int )(llvm_cbe_storemerge24&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__74&4294967295ull)));
  if (((llvm_cbe_tmp__74&4294967295U) == (10u&4294967295U))) {
    goto llvm_cbe__2e_loopexit;
  } else {
    llvm_cbe_storemerge24__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__74;   /* for PHI node */
    goto llvm_cbe__2e_preheader;
  }

llvm_cbe_tmp__107:
if (AESL_DEBUG_TRACE)
printf("\n  %%30 = getelementptr inbounds [50 x i32]* %%data_a, i64 0, i64 %%26, !dbg !6 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_62_count);
  llvm_cbe_tmp__25 = (signed int *)(&llvm_cbe_data_a[(((signed long long )llvm_cbe_tmp__22))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__22));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__22) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_a' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%31 = load i32* %%30, align 4, !dbg !6 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_63_count);
  llvm_cbe_tmp__26 = (unsigned int )*llvm_cbe_tmp__25;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__26);
if (AESL_DEBUG_TRACE)
printf("\n  %%32 = add nsw i32 %%31, 27, !dbg !6 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_64_count);
  llvm_cbe_tmp__27 = (unsigned int )((unsigned int )(llvm_cbe_tmp__26&4294967295ull)) + ((unsigned int )(27u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__27&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%33 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 %%26, !dbg !6 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_65_count);
  llvm_cbe_tmp__28 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__22))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__22));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__22) < 10 && "Write access out of array 'data_result' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%32, i32* %%33, align 4, !dbg !6 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_66_count);
  *llvm_cbe_tmp__28 = llvm_cbe_tmp__27;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__27);
  goto llvm_cbe_tmp__117;

llvm_cbe_tmp__108:
if (AESL_DEBUG_TRACE)
printf("\n  %%35 = getelementptr inbounds [50 x i32]* %%data_b, i64 0, i64 %%26, !dbg !6 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_68_count);
  llvm_cbe_tmp__29 = (signed int *)(&llvm_cbe_data_b[(((signed long long )llvm_cbe_tmp__22))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__22));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__22) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_b' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%36 = load i32* %%35, align 4, !dbg !6 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_69_count);
  llvm_cbe_tmp__30 = (unsigned int )*llvm_cbe_tmp__29;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__30);
if (AESL_DEBUG_TRACE)
printf("\n  %%37 = add nsw i32 %%36, 27, !dbg !6 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_70_count);
  llvm_cbe_tmp__31 = (unsigned int )((unsigned int )(llvm_cbe_tmp__30&4294967295ull)) + ((unsigned int )(27u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__31&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%38 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 %%26, !dbg !6 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_71_count);
  llvm_cbe_tmp__32 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__22))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__22));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__22) < 10 && "Write access out of array 'data_result' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%37, i32* %%38, align 4, !dbg !6 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_72_count);
  *llvm_cbe_tmp__32 = llvm_cbe_tmp__31;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__31);
  goto llvm_cbe_tmp__117;

llvm_cbe_tmp__109:
if (AESL_DEBUG_TRACE)
printf("\n  %%40 = getelementptr inbounds [50 x i32]* %%data_a, i64 0, i64 %%26, !dbg !6 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_74_count);
  llvm_cbe_tmp__33 = (signed int *)(&llvm_cbe_data_a[(((signed long long )llvm_cbe_tmp__22))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__22));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__22) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_a' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%41 = load i32* %%40, align 4, !dbg !6 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_75_count);
  llvm_cbe_tmp__34 = (unsigned int )*llvm_cbe_tmp__33;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__34);
if (AESL_DEBUG_TRACE)
printf("\n  %%42 = shl nsw i32 %%41, 1, !dbg !6 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_76_count);
  llvm_cbe_tmp__35 = (unsigned int )llvm_cbe_tmp__34 << 1u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__35);
if (AESL_DEBUG_TRACE)
printf("\n  %%43 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 %%26, !dbg !6 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_77_count);
  llvm_cbe_tmp__36 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__22))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__22));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__22) < 10 && "Write access out of array 'data_result' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%42, i32* %%43, align 4, !dbg !6 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_78_count);
  *llvm_cbe_tmp__36 = llvm_cbe_tmp__35;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__35);
  goto llvm_cbe_tmp__117;

llvm_cbe_tmp__110:
if (AESL_DEBUG_TRACE)
printf("\n  %%45 = getelementptr inbounds [50 x i32]* %%data_b, i64 0, i64 %%26, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_80_count);
  llvm_cbe_tmp__37 = (signed int *)(&llvm_cbe_data_b[(((signed long long )llvm_cbe_tmp__22))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__22));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__22) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_b' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%46 = load i32* %%45, align 4, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_81_count);
  llvm_cbe_tmp__38 = (unsigned int )*llvm_cbe_tmp__37;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__38);
if (AESL_DEBUG_TRACE)
printf("\n  %%47 = shl nsw i32 %%46, 1, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_82_count);
  llvm_cbe_tmp__39 = (unsigned int )llvm_cbe_tmp__38 << 1u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__39);
if (AESL_DEBUG_TRACE)
printf("\n  %%48 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 %%26, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_83_count);
  llvm_cbe_tmp__40 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__22))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__22));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__22) < 10 && "Write access out of array 'data_result' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%47, i32* %%48, align 4, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_84_count);
  *llvm_cbe_tmp__40 = llvm_cbe_tmp__39;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__39);
  goto llvm_cbe_tmp__117;

llvm_cbe_tmp__111:
if (AESL_DEBUG_TRACE)
printf("\n  %%50 = getelementptr inbounds [50 x i32]* %%data_a, i64 0, i64 %%26, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_86_count);
  llvm_cbe_tmp__41 = (signed int *)(&llvm_cbe_data_a[(((signed long long )llvm_cbe_tmp__22))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__22));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__22) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_a' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%51 = load i32* %%50, align 4, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_87_count);
  llvm_cbe_tmp__42 = (unsigned int )*llvm_cbe_tmp__41;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__42);
if (AESL_DEBUG_TRACE)
printf("\n  %%52 = sdiv i32 %%51, 2, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_88_count);
  llvm_cbe_tmp__43 = (unsigned int )((signed int )(((signed int )llvm_cbe_tmp__42) / ((signed int )2u)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__43));
if (AESL_DEBUG_TRACE)
printf("\n  %%53 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 %%26, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_89_count);
  llvm_cbe_tmp__44 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__22))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__22));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__22) < 10 && "Write access out of array 'data_result' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%52, i32* %%53, align 4, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_90_count);
  *llvm_cbe_tmp__44 = llvm_cbe_tmp__43;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__43);
  goto llvm_cbe_tmp__117;

llvm_cbe_tmp__112:
if (AESL_DEBUG_TRACE)
printf("\n  %%55 = getelementptr inbounds [50 x i32]* %%data_b, i64 0, i64 %%26, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_92_count);
  llvm_cbe_tmp__45 = (signed int *)(&llvm_cbe_data_b[(((signed long long )llvm_cbe_tmp__22))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__22));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__22) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_b' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%56 = load i32* %%55, align 4, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_93_count);
  llvm_cbe_tmp__46 = (unsigned int )*llvm_cbe_tmp__45;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__46);
if (AESL_DEBUG_TRACE)
printf("\n  %%57 = sdiv i32 %%56, 2, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_94_count);
  llvm_cbe_tmp__47 = (unsigned int )((signed int )(((signed int )llvm_cbe_tmp__46) / ((signed int )2u)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__47));
if (AESL_DEBUG_TRACE)
printf("\n  %%58 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 %%26, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_95_count);
  llvm_cbe_tmp__48 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__22))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__22));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__22) < 10 && "Write access out of array 'data_result' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%57, i32* %%58, align 4, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_96_count);
  *llvm_cbe_tmp__48 = llvm_cbe_tmp__47;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__47);
  goto llvm_cbe_tmp__117;

llvm_cbe_tmp__113:
if (AESL_DEBUG_TRACE)
printf("\n  %%60 = getelementptr inbounds [50 x i32]* %%data_a, i64 0, i64 %%26, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_98_count);
  llvm_cbe_tmp__49 = (signed int *)(&llvm_cbe_data_a[(((signed long long )llvm_cbe_tmp__22))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__22));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__22) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_a' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%61 = load i32* %%60, align 4, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_99_count);
  llvm_cbe_tmp__50 = (unsigned int )*llvm_cbe_tmp__49;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__50);
if (AESL_DEBUG_TRACE)
printf("\n  %%62 = getelementptr inbounds [50 x i32]* %%data_b, i64 0, i64 %%26, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_100_count);
  llvm_cbe_tmp__51 = (signed int *)(&llvm_cbe_data_b[(((signed long long )llvm_cbe_tmp__22))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__22));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__22) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_b' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%63 = load i32* %%62, align 4, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_101_count);
  llvm_cbe_tmp__52 = (unsigned int )*llvm_cbe_tmp__51;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__52);
if (AESL_DEBUG_TRACE)
printf("\n  %%64 = add nsw i32 %%63, %%61, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_102_count);
  llvm_cbe_tmp__53 = (unsigned int )((unsigned int )(llvm_cbe_tmp__52&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__50&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__53&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%65 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 %%26, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_103_count);
  llvm_cbe_tmp__54 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__22))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__22));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__22) < 10 && "Write access out of array 'data_result' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%64, i32* %%65, align 4, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_104_count);
  *llvm_cbe_tmp__54 = llvm_cbe_tmp__53;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__53);
  goto llvm_cbe_tmp__117;

llvm_cbe_tmp__114:
if (AESL_DEBUG_TRACE)
printf("\n  %%67 = getelementptr inbounds [50 x i32]* %%data_a, i64 0, i64 %%26, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_106_count);
  llvm_cbe_tmp__55 = (signed int *)(&llvm_cbe_data_a[(((signed long long )llvm_cbe_tmp__22))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__22));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__22) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_a' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%68 = load i32* %%67, align 4, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_107_count);
  llvm_cbe_tmp__56 = (unsigned int )*llvm_cbe_tmp__55;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__56);
if (AESL_DEBUG_TRACE)
printf("\n  %%69 = getelementptr inbounds [50 x i32]* %%data_b, i64 0, i64 %%26, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_108_count);
  llvm_cbe_tmp__57 = (signed int *)(&llvm_cbe_data_b[(((signed long long )llvm_cbe_tmp__22))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__22));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__22) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_b' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%70 = load i32* %%69, align 4, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_109_count);
  llvm_cbe_tmp__58 = (unsigned int )*llvm_cbe_tmp__57;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__58);
if (AESL_DEBUG_TRACE)
printf("\n  %%71 = sub nsw i32 %%68, %%70, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_110_count);
  llvm_cbe_tmp__59 = (unsigned int )((unsigned int )(llvm_cbe_tmp__56&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__58&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__59&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%72 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 %%26, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_111_count);
  llvm_cbe_tmp__60 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__22))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__22));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__22) < 10 && "Write access out of array 'data_result' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%71, i32* %%72, align 4, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_112_count);
  *llvm_cbe_tmp__60 = llvm_cbe_tmp__59;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__59);
  goto llvm_cbe_tmp__117;

llvm_cbe_tmp__115:
if (AESL_DEBUG_TRACE)
printf("\n  %%74 = getelementptr inbounds [50 x i32]* %%data_a, i64 0, i64 %%26, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_114_count);
  llvm_cbe_tmp__61 = (signed int *)(&llvm_cbe_data_a[(((signed long long )llvm_cbe_tmp__22))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__22));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__22) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_a' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%75 = load i32* %%74, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_115_count);
  llvm_cbe_tmp__62 = (unsigned int )*llvm_cbe_tmp__61;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__62);
if (AESL_DEBUG_TRACE)
printf("\n  %%76 = getelementptr inbounds [50 x i32]* %%data_b, i64 0, i64 %%26, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_116_count);
  llvm_cbe_tmp__63 = (signed int *)(&llvm_cbe_data_b[(((signed long long )llvm_cbe_tmp__22))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__22));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__22) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_b' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%77 = load i32* %%76, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_117_count);
  llvm_cbe_tmp__64 = (unsigned int )*llvm_cbe_tmp__63;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__64);
if (AESL_DEBUG_TRACE)
printf("\n  %%78 = mul nsw i32 %%77, %%75, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_118_count);
  llvm_cbe_tmp__65 = (unsigned int )((unsigned int )(llvm_cbe_tmp__64&4294967295ull)) * ((unsigned int )(llvm_cbe_tmp__62&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__65&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%79 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 %%26, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_119_count);
  llvm_cbe_tmp__66 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__22))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__22));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__22) < 10 && "Write access out of array 'data_result' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%78, i32* %%79, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_120_count);
  *llvm_cbe_tmp__66 = llvm_cbe_tmp__65;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__65);
  goto llvm_cbe_tmp__117;

llvm_cbe_tmp__116:
if (AESL_DEBUG_TRACE)
printf("\n  %%81 = getelementptr inbounds [50 x i32]* %%data_a, i64 0, i64 %%26, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_122_count);
  llvm_cbe_tmp__67 = (signed int *)(&llvm_cbe_data_a[(((signed long long )llvm_cbe_tmp__22))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__22));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__22) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_a' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%82 = load i32* %%81, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_123_count);
  llvm_cbe_tmp__68 = (unsigned int )*llvm_cbe_tmp__67;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__68);
if (AESL_DEBUG_TRACE)
printf("\n  %%83 = getelementptr inbounds [50 x i32]* %%data_b, i64 0, i64 %%26, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_124_count);
  llvm_cbe_tmp__69 = (signed int *)(&llvm_cbe_data_b[(((signed long long )llvm_cbe_tmp__22))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__22));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__22) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_b' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%84 = load i32* %%83, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_125_count);
  llvm_cbe_tmp__70 = (unsigned int )*llvm_cbe_tmp__69;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__70);
if (AESL_DEBUG_TRACE)
printf("\n  %%85 = sdiv i32 %%82, %%84, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_126_count);
  llvm_cbe_tmp__71 = (unsigned int )((signed int )(((signed int )llvm_cbe_tmp__68) / ((signed int )llvm_cbe_tmp__70)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__71));
if (AESL_DEBUG_TRACE)
printf("\n  %%86 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 %%26, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_127_count);
  llvm_cbe_tmp__72 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__22))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__22));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__22) < 10 && "Write access out of array 'data_result' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%85, i32* %%86, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_128_count);
  *llvm_cbe_tmp__72 = llvm_cbe_tmp__71;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__71);
  goto llvm_cbe_tmp__117;

llvm_cbe_tmp__106:
if (AESL_DEBUG_TRACE)
printf("\n  %%88 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 %%26, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_130_count);
  llvm_cbe_tmp__73 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__22))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__22));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__22) < 10 && "Write access out of array 'data_result' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* %%88, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_131_count);
  *llvm_cbe_tmp__73 = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
  goto llvm_cbe_tmp__117;

  } while (1); /* end of syntactic loop '.preheader' */
llvm_cbe__2e_loopexit:
if (AESL_DEBUG_TRACE)
printf("\n  %%91 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 0, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_169_count);
  llvm_cbe_tmp__75 = (signed int *)(&llvm_cbe_data_result[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )0ull) < 10)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_result' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%92 = load i32* %%91, align 16, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_170_count);
  llvm_cbe_tmp__76 = (unsigned int )*llvm_cbe_tmp__75;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__76);
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%92, i32* %%c, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_171_count);
  *((unsigned int volatile*)llvm_cbe_c) = llvm_cbe_tmp__76;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__76);
if (AESL_DEBUG_TRACE)
printf("\n  %%93 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 1, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_177_count);
  llvm_cbe_tmp__77 = (signed int *)(&llvm_cbe_data_result[(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )1ull) < 10)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_result' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%94 = load i32* %%93, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_178_count);
  llvm_cbe_tmp__78 = (unsigned int )*llvm_cbe_tmp__77;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__78);
if (AESL_DEBUG_TRACE)
printf("\n  %%95 = getelementptr inbounds i32* %%c, i64 1, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_179_count);
  llvm_cbe_tmp__79 = (signed int *)(&llvm_cbe_c[(((signed long long )1ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%94, i32* %%95, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_180_count);
  *((unsigned int volatile*)llvm_cbe_tmp__79) = llvm_cbe_tmp__78;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__78);
if (AESL_DEBUG_TRACE)
printf("\n  %%96 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 2, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_186_count);
  llvm_cbe_tmp__80 = (signed int *)(&llvm_cbe_data_result[(((signed long long )2ull))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )2ull) < 10)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_result' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%97 = load i32* %%96, align 8, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_187_count);
  llvm_cbe_tmp__81 = (unsigned int )*llvm_cbe_tmp__80;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__81);
if (AESL_DEBUG_TRACE)
printf("\n  %%98 = getelementptr inbounds i32* %%c, i64 2, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_188_count);
  llvm_cbe_tmp__82 = (signed int *)(&llvm_cbe_c[(((signed long long )2ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%97, i32* %%98, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_189_count);
  *((unsigned int volatile*)llvm_cbe_tmp__82) = llvm_cbe_tmp__81;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__81);
if (AESL_DEBUG_TRACE)
printf("\n  %%99 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 3, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_195_count);
  llvm_cbe_tmp__83 = (signed int *)(&llvm_cbe_data_result[(((signed long long )3ull))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )3ull) < 10)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_result' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%100 = load i32* %%99, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_196_count);
  llvm_cbe_tmp__84 = (unsigned int )*llvm_cbe_tmp__83;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__84);
if (AESL_DEBUG_TRACE)
printf("\n  %%101 = getelementptr inbounds i32* %%c, i64 3, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_197_count);
  llvm_cbe_tmp__85 = (signed int *)(&llvm_cbe_c[(((signed long long )3ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%100, i32* %%101, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_198_count);
  *((unsigned int volatile*)llvm_cbe_tmp__85) = llvm_cbe_tmp__84;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__84);
if (AESL_DEBUG_TRACE)
printf("\n  %%102 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_204_count);
  llvm_cbe_tmp__86 = (signed int *)(&llvm_cbe_data_result[(((signed long long )4ull))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )4ull) < 10)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_result' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%103 = load i32* %%102, align 16, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_205_count);
  llvm_cbe_tmp__87 = (unsigned int )*llvm_cbe_tmp__86;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__87);
if (AESL_DEBUG_TRACE)
printf("\n  %%104 = getelementptr inbounds i32* %%c, i64 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_206_count);
  llvm_cbe_tmp__88 = (signed int *)(&llvm_cbe_c[(((signed long long )4ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%103, i32* %%104, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_207_count);
  *((unsigned int volatile*)llvm_cbe_tmp__88) = llvm_cbe_tmp__87;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__87);
if (AESL_DEBUG_TRACE)
printf("\n  %%105 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 5, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_213_count);
  llvm_cbe_tmp__89 = (signed int *)(&llvm_cbe_data_result[(((signed long long )5ull))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )5ull) < 10)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_result' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%106 = load i32* %%105, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_214_count);
  llvm_cbe_tmp__90 = (unsigned int )*llvm_cbe_tmp__89;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__90);
if (AESL_DEBUG_TRACE)
printf("\n  %%107 = getelementptr inbounds i32* %%c, i64 5, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_215_count);
  llvm_cbe_tmp__91 = (signed int *)(&llvm_cbe_c[(((signed long long )5ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%106, i32* %%107, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_216_count);
  *((unsigned int volatile*)llvm_cbe_tmp__91) = llvm_cbe_tmp__90;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__90);
if (AESL_DEBUG_TRACE)
printf("\n  %%108 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 6, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_222_count);
  llvm_cbe_tmp__92 = (signed int *)(&llvm_cbe_data_result[(((signed long long )6ull))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )6ull) < 10)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_result' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%109 = load i32* %%108, align 8, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_223_count);
  llvm_cbe_tmp__93 = (unsigned int )*llvm_cbe_tmp__92;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__93);
if (AESL_DEBUG_TRACE)
printf("\n  %%110 = getelementptr inbounds i32* %%c, i64 6, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_224_count);
  llvm_cbe_tmp__94 = (signed int *)(&llvm_cbe_c[(((signed long long )6ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%109, i32* %%110, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_225_count);
  *((unsigned int volatile*)llvm_cbe_tmp__94) = llvm_cbe_tmp__93;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__93);
if (AESL_DEBUG_TRACE)
printf("\n  %%111 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 7, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_231_count);
  llvm_cbe_tmp__95 = (signed int *)(&llvm_cbe_data_result[(((signed long long )7ull))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )7ull) < 10)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_result' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%112 = load i32* %%111, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_232_count);
  llvm_cbe_tmp__96 = (unsigned int )*llvm_cbe_tmp__95;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__96);
if (AESL_DEBUG_TRACE)
printf("\n  %%113 = getelementptr inbounds i32* %%c, i64 7, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_233_count);
  llvm_cbe_tmp__97 = (signed int *)(&llvm_cbe_c[(((signed long long )7ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%112, i32* %%113, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_234_count);
  *((unsigned int volatile*)llvm_cbe_tmp__97) = llvm_cbe_tmp__96;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__96);
if (AESL_DEBUG_TRACE)
printf("\n  %%114 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 8, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_240_count);
  llvm_cbe_tmp__98 = (signed int *)(&llvm_cbe_data_result[(((signed long long )8ull))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )8ull) < 10)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_result' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%115 = load i32* %%114, align 16, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_241_count);
  llvm_cbe_tmp__99 = (unsigned int )*llvm_cbe_tmp__98;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__99);
if (AESL_DEBUG_TRACE)
printf("\n  %%116 = getelementptr inbounds i32* %%c, i64 8, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_242_count);
  llvm_cbe_tmp__100 = (signed int *)(&llvm_cbe_c[(((signed long long )8ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%115, i32* %%116, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_243_count);
  *((unsigned int volatile*)llvm_cbe_tmp__100) = llvm_cbe_tmp__99;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__99);
if (AESL_DEBUG_TRACE)
printf("\n  %%117 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 9, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_249_count);
  llvm_cbe_tmp__101 = (signed int *)(&llvm_cbe_data_result[(((signed long long )9ull))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )9ull) < 10)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_result' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%118 = load i32* %%117, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_250_count);
  llvm_cbe_tmp__102 = (unsigned int )*llvm_cbe_tmp__101;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__102);
if (AESL_DEBUG_TRACE)
printf("\n  %%119 = getelementptr inbounds i32* %%c, i64 9, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_251_count);
  llvm_cbe_tmp__103 = (signed int *)(&llvm_cbe_c[(((signed long long )9ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%118, i32* %%119, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_252_count);
  *((unsigned int volatile*)llvm_cbe_tmp__103) = llvm_cbe_tmp__102;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__102);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @dec_MIMD}\n");
  return;
}

