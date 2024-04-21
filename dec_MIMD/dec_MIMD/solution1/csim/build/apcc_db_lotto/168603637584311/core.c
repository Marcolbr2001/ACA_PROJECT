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
  static  unsigned long long aesl_llvm_cbe_20_count = 0;
  static  unsigned long long aesl_llvm_cbe_21_count = 0;
  static  unsigned long long aesl_llvm_cbe_22_count = 0;
  static  unsigned long long aesl_llvm_cbe_23_count = 0;
  static  unsigned long long aesl_llvm_cbe_24_count = 0;
  static  unsigned long long aesl_llvm_cbe_25_count = 0;
  static  unsigned long long aesl_llvm_cbe_26_count = 0;
  static  unsigned long long aesl_llvm_cbe_27_count = 0;
  static  unsigned long long aesl_llvm_cbe_28_count = 0;
  static  unsigned long long aesl_llvm_cbe_29_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_46_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_57_count = 0;
  static  unsigned long long aesl_llvm_cbe_58_count = 0;
  static  unsigned long long aesl_llvm_cbe_59_count = 0;
  static  unsigned long long aesl_llvm_cbe_60_count = 0;
  static  unsigned long long aesl_llvm_cbe_61_count = 0;
  static  unsigned long long aesl_llvm_cbe_62_count = 0;
  static  unsigned long long aesl_llvm_cbe_63_count = 0;
   char *llvm_cbe_tmp__3;
  static  unsigned long long aesl_llvm_cbe_64_count = 0;
   char *llvm_cbe_tmp__4;
  static  unsigned long long aesl_llvm_cbe_65_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge210_count = 0;
  unsigned int llvm_cbe_storemerge210;
  unsigned int llvm_cbe_storemerge210__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_66_count = 0;
  static  unsigned long long aesl_llvm_cbe_67_count = 0;
  unsigned int llvm_cbe_tmp__5;
  static  unsigned long long aesl_llvm_cbe_68_count = 0;
  unsigned int llvm_cbe_tmp__6;
  static  unsigned long long aesl_llvm_cbe_69_count = 0;
  unsigned int llvm_cbe_tmp__7;
  static  unsigned long long aesl_llvm_cbe_70_count = 0;
  unsigned long long llvm_cbe_tmp__8;
  static  unsigned long long aesl_llvm_cbe_71_count = 0;
  signed int *llvm_cbe_tmp__9;
  static  unsigned long long aesl_llvm_cbe_72_count = 0;
  unsigned int llvm_cbe_tmp__10;
  static  unsigned long long aesl_llvm_cbe_73_count = 0;
  unsigned long long llvm_cbe_tmp__11;
  static  unsigned long long aesl_llvm_cbe_74_count = 0;
  signed int *llvm_cbe_tmp__12;
  static  unsigned long long aesl_llvm_cbe_75_count = 0;
  static  unsigned long long aesl_llvm_cbe_76_count = 0;
  static  unsigned long long aesl_llvm_cbe_77_count = 0;
  unsigned int llvm_cbe_tmp__13;
  static  unsigned long long aesl_llvm_cbe_78_count = 0;
  unsigned int llvm_cbe_tmp__14;
  static  unsigned long long aesl_llvm_cbe_79_count = 0;
  unsigned int llvm_cbe_tmp__15;
  static  unsigned long long aesl_llvm_cbe_80_count = 0;
  unsigned long long llvm_cbe_tmp__16;
  static  unsigned long long aesl_llvm_cbe_81_count = 0;
  signed int *llvm_cbe_tmp__17;
  static  unsigned long long aesl_llvm_cbe_82_count = 0;
  unsigned int llvm_cbe_tmp__18;
  static  unsigned long long aesl_llvm_cbe_83_count = 0;
  signed int *llvm_cbe_tmp__19;
  static  unsigned long long aesl_llvm_cbe_84_count = 0;
  static  unsigned long long aesl_llvm_cbe_85_count = 0;
  static  unsigned long long aesl_llvm_cbe_86_count = 0;
  static  unsigned long long aesl_llvm_cbe_87_count = 0;
  signed int *llvm_cbe_tmp__20;
  static  unsigned long long aesl_llvm_cbe_88_count = 0;
  unsigned int llvm_cbe_tmp__21;
  static  unsigned long long aesl_llvm_cbe_89_count = 0;
  signed int *llvm_cbe_tmp__22;
  static  unsigned long long aesl_llvm_cbe_90_count = 0;
  static  unsigned long long aesl_llvm_cbe_91_count = 0;
  static  unsigned long long aesl_llvm_cbe_92_count = 0;
  unsigned int llvm_cbe_tmp__23;
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
  static  unsigned long long aesl_llvm_cbe_exitcond13_count = 0;
  static  unsigned long long aesl_llvm_cbe_103_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge38_count = 0;
  unsigned int llvm_cbe_storemerge38;
  unsigned int llvm_cbe_storemerge38__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_104_count = 0;
  unsigned long long llvm_cbe_tmp__24;
  static  unsigned long long aesl_llvm_cbe_105_count = 0;
  signed int *llvm_cbe_tmp__25;
  static  unsigned long long aesl_llvm_cbe_106_count = 0;
  unsigned int llvm_cbe_tmp__26;
  static  unsigned long long aesl_llvm_cbe_107_count = 0;
  static  unsigned long long aesl_llvm_cbe_108_count = 0;
  signed int *llvm_cbe_tmp__27;
  static  unsigned long long aesl_llvm_cbe_109_count = 0;
  unsigned int llvm_cbe_tmp__28;
  static  unsigned long long aesl_llvm_cbe_110_count = 0;
  unsigned int llvm_cbe_tmp__29;
  static  unsigned long long aesl_llvm_cbe_111_count = 0;
  signed int *llvm_cbe_tmp__30;
  static  unsigned long long aesl_llvm_cbe_112_count = 0;
  static  unsigned long long aesl_llvm_cbe_113_count = 0;
  static  unsigned long long aesl_llvm_cbe_114_count = 0;
  signed int *llvm_cbe_tmp__31;
  static  unsigned long long aesl_llvm_cbe_115_count = 0;
  unsigned int llvm_cbe_tmp__32;
  static  unsigned long long aesl_llvm_cbe_116_count = 0;
  unsigned int llvm_cbe_tmp__33;
  static  unsigned long long aesl_llvm_cbe_117_count = 0;
  signed int *llvm_cbe_tmp__34;
  static  unsigned long long aesl_llvm_cbe_118_count = 0;
  static  unsigned long long aesl_llvm_cbe_119_count = 0;
  static  unsigned long long aesl_llvm_cbe_120_count = 0;
  signed int *llvm_cbe_tmp__35;
  static  unsigned long long aesl_llvm_cbe_121_count = 0;
  unsigned int llvm_cbe_tmp__36;
  static  unsigned long long aesl_llvm_cbe_122_count = 0;
  unsigned int llvm_cbe_tmp__37;
  static  unsigned long long aesl_llvm_cbe_123_count = 0;
  signed int *llvm_cbe_tmp__38;
  static  unsigned long long aesl_llvm_cbe_124_count = 0;
  static  unsigned long long aesl_llvm_cbe_125_count = 0;
  static  unsigned long long aesl_llvm_cbe_126_count = 0;
  signed int *llvm_cbe_tmp__39;
  static  unsigned long long aesl_llvm_cbe_127_count = 0;
  unsigned int llvm_cbe_tmp__40;
  static  unsigned long long aesl_llvm_cbe_128_count = 0;
  unsigned int llvm_cbe_tmp__41;
  static  unsigned long long aesl_llvm_cbe_129_count = 0;
  signed int *llvm_cbe_tmp__42;
  static  unsigned long long aesl_llvm_cbe_130_count = 0;
  static  unsigned long long aesl_llvm_cbe_131_count = 0;
  static  unsigned long long aesl_llvm_cbe_132_count = 0;
  signed int *llvm_cbe_tmp__43;
  static  unsigned long long aesl_llvm_cbe_133_count = 0;
  unsigned int llvm_cbe_tmp__44;
  static  unsigned long long aesl_llvm_cbe_134_count = 0;
  unsigned int llvm_cbe_tmp__45;
  static  unsigned long long aesl_llvm_cbe_135_count = 0;
  signed int *llvm_cbe_tmp__46;
  static  unsigned long long aesl_llvm_cbe_136_count = 0;
  static  unsigned long long aesl_llvm_cbe_137_count = 0;
  static  unsigned long long aesl_llvm_cbe_138_count = 0;
  signed int *llvm_cbe_tmp__47;
  static  unsigned long long aesl_llvm_cbe_139_count = 0;
  unsigned int llvm_cbe_tmp__48;
  static  unsigned long long aesl_llvm_cbe_140_count = 0;
  unsigned int llvm_cbe_tmp__49;
  static  unsigned long long aesl_llvm_cbe_141_count = 0;
  signed int *llvm_cbe_tmp__50;
  static  unsigned long long aesl_llvm_cbe_142_count = 0;
  static  unsigned long long aesl_llvm_cbe_143_count = 0;
  static  unsigned long long aesl_llvm_cbe_144_count = 0;
  signed int *llvm_cbe_tmp__51;
  static  unsigned long long aesl_llvm_cbe_145_count = 0;
  unsigned int llvm_cbe_tmp__52;
  static  unsigned long long aesl_llvm_cbe_146_count = 0;
  signed int *llvm_cbe_tmp__53;
  static  unsigned long long aesl_llvm_cbe_147_count = 0;
  unsigned int llvm_cbe_tmp__54;
  static  unsigned long long aesl_llvm_cbe_148_count = 0;
  unsigned int llvm_cbe_tmp__55;
  static  unsigned long long aesl_llvm_cbe_149_count = 0;
  signed int *llvm_cbe_tmp__56;
  static  unsigned long long aesl_llvm_cbe_150_count = 0;
  static  unsigned long long aesl_llvm_cbe_151_count = 0;
  static  unsigned long long aesl_llvm_cbe_152_count = 0;
  signed int *llvm_cbe_tmp__57;
  static  unsigned long long aesl_llvm_cbe_153_count = 0;
  unsigned int llvm_cbe_tmp__58;
  static  unsigned long long aesl_llvm_cbe_154_count = 0;
  signed int *llvm_cbe_tmp__59;
  static  unsigned long long aesl_llvm_cbe_155_count = 0;
  unsigned int llvm_cbe_tmp__60;
  static  unsigned long long aesl_llvm_cbe_156_count = 0;
  unsigned int llvm_cbe_tmp__61;
  static  unsigned long long aesl_llvm_cbe_157_count = 0;
  signed int *llvm_cbe_tmp__62;
  static  unsigned long long aesl_llvm_cbe_158_count = 0;
  static  unsigned long long aesl_llvm_cbe_159_count = 0;
  static  unsigned long long aesl_llvm_cbe_160_count = 0;
  signed int *llvm_cbe_tmp__63;
  static  unsigned long long aesl_llvm_cbe_161_count = 0;
  unsigned int llvm_cbe_tmp__64;
  static  unsigned long long aesl_llvm_cbe_162_count = 0;
  signed int *llvm_cbe_tmp__65;
  static  unsigned long long aesl_llvm_cbe_163_count = 0;
  unsigned int llvm_cbe_tmp__66;
  static  unsigned long long aesl_llvm_cbe_164_count = 0;
  unsigned int llvm_cbe_tmp__67;
  static  unsigned long long aesl_llvm_cbe_165_count = 0;
  signed int *llvm_cbe_tmp__68;
  static  unsigned long long aesl_llvm_cbe_166_count = 0;
  static  unsigned long long aesl_llvm_cbe_167_count = 0;
  static  unsigned long long aesl_llvm_cbe_168_count = 0;
  signed int *llvm_cbe_tmp__69;
  static  unsigned long long aesl_llvm_cbe_169_count = 0;
  unsigned int llvm_cbe_tmp__70;
  static  unsigned long long aesl_llvm_cbe_170_count = 0;
  signed int *llvm_cbe_tmp__71;
  static  unsigned long long aesl_llvm_cbe_171_count = 0;
  unsigned int llvm_cbe_tmp__72;
  static  unsigned long long aesl_llvm_cbe_172_count = 0;
  unsigned int llvm_cbe_tmp__73;
  static  unsigned long long aesl_llvm_cbe_173_count = 0;
  signed int *llvm_cbe_tmp__74;
  static  unsigned long long aesl_llvm_cbe_174_count = 0;
  static  unsigned long long aesl_llvm_cbe_175_count = 0;
  static  unsigned long long aesl_llvm_cbe_176_count = 0;
  signed int *llvm_cbe_tmp__75;
  static  unsigned long long aesl_llvm_cbe_177_count = 0;
  static  unsigned long long aesl_llvm_cbe_178_count = 0;
  static  unsigned long long aesl_llvm_cbe_179_count = 0;
  unsigned int llvm_cbe_tmp__76;
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
  static  unsigned long long aesl_llvm_cbe_208_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond12_count = 0;
  static  unsigned long long aesl_llvm_cbe_209_count = 0;
  static  unsigned long long aesl_llvm_cbe_210_count = 0;
  static  unsigned long long aesl_llvm_cbe_211_count = 0;
  static  unsigned long long aesl_llvm_cbe_212_count = 0;
  static  unsigned long long aesl_llvm_cbe_213_count = 0;
  static  unsigned long long aesl_llvm_cbe_214_count = 0;
  static  unsigned long long aesl_llvm_cbe_215_count = 0;
  signed int *llvm_cbe_tmp__77;
  static  unsigned long long aesl_llvm_cbe_216_count = 0;
  unsigned int llvm_cbe_tmp__78;
  static  unsigned long long aesl_llvm_cbe_217_count = 0;
  static  unsigned long long aesl_llvm_cbe_218_count = 0;
  static  unsigned long long aesl_llvm_cbe_219_count = 0;
  static  unsigned long long aesl_llvm_cbe_220_count = 0;
  static  unsigned long long aesl_llvm_cbe_221_count = 0;
  static  unsigned long long aesl_llvm_cbe_222_count = 0;
  static  unsigned long long aesl_llvm_cbe_223_count = 0;
  signed int *llvm_cbe_tmp__79;
  static  unsigned long long aesl_llvm_cbe_224_count = 0;
  unsigned int llvm_cbe_tmp__80;
  static  unsigned long long aesl_llvm_cbe_225_count = 0;
  signed int *llvm_cbe_tmp__81;
  static  unsigned long long aesl_llvm_cbe_226_count = 0;
  static  unsigned long long aesl_llvm_cbe_227_count = 0;
  static  unsigned long long aesl_llvm_cbe_228_count = 0;
  static  unsigned long long aesl_llvm_cbe_229_count = 0;
  static  unsigned long long aesl_llvm_cbe_230_count = 0;
  static  unsigned long long aesl_llvm_cbe_231_count = 0;
  static  unsigned long long aesl_llvm_cbe_232_count = 0;
  signed int *llvm_cbe_tmp__82;
  static  unsigned long long aesl_llvm_cbe_233_count = 0;
  unsigned int llvm_cbe_tmp__83;
  static  unsigned long long aesl_llvm_cbe_234_count = 0;
  signed int *llvm_cbe_tmp__84;
  static  unsigned long long aesl_llvm_cbe_235_count = 0;
  static  unsigned long long aesl_llvm_cbe_236_count = 0;
  static  unsigned long long aesl_llvm_cbe_237_count = 0;
  static  unsigned long long aesl_llvm_cbe_238_count = 0;
  static  unsigned long long aesl_llvm_cbe_239_count = 0;
  static  unsigned long long aesl_llvm_cbe_240_count = 0;
  static  unsigned long long aesl_llvm_cbe_241_count = 0;
  signed int *llvm_cbe_tmp__85;
  static  unsigned long long aesl_llvm_cbe_242_count = 0;
  unsigned int llvm_cbe_tmp__86;
  static  unsigned long long aesl_llvm_cbe_243_count = 0;
  signed int *llvm_cbe_tmp__87;
  static  unsigned long long aesl_llvm_cbe_244_count = 0;
  static  unsigned long long aesl_llvm_cbe_245_count = 0;
  static  unsigned long long aesl_llvm_cbe_246_count = 0;
  static  unsigned long long aesl_llvm_cbe_247_count = 0;
  static  unsigned long long aesl_llvm_cbe_248_count = 0;
  static  unsigned long long aesl_llvm_cbe_249_count = 0;
  static  unsigned long long aesl_llvm_cbe_250_count = 0;
  signed int *llvm_cbe_tmp__88;
  static  unsigned long long aesl_llvm_cbe_251_count = 0;
  unsigned int llvm_cbe_tmp__89;
  static  unsigned long long aesl_llvm_cbe_252_count = 0;
  signed int *llvm_cbe_tmp__90;
  static  unsigned long long aesl_llvm_cbe_253_count = 0;
  static  unsigned long long aesl_llvm_cbe_254_count = 0;
  static  unsigned long long aesl_llvm_cbe_255_count = 0;
  static  unsigned long long aesl_llvm_cbe_256_count = 0;
  static  unsigned long long aesl_llvm_cbe_257_count = 0;
  static  unsigned long long aesl_llvm_cbe_258_count = 0;
  static  unsigned long long aesl_llvm_cbe_259_count = 0;
  signed int *llvm_cbe_tmp__91;
  static  unsigned long long aesl_llvm_cbe_260_count = 0;
  unsigned int llvm_cbe_tmp__92;
  static  unsigned long long aesl_llvm_cbe_261_count = 0;
  signed int *llvm_cbe_tmp__93;
  static  unsigned long long aesl_llvm_cbe_262_count = 0;
  static  unsigned long long aesl_llvm_cbe_263_count = 0;
  static  unsigned long long aesl_llvm_cbe_264_count = 0;
  static  unsigned long long aesl_llvm_cbe_265_count = 0;
  static  unsigned long long aesl_llvm_cbe_266_count = 0;
  static  unsigned long long aesl_llvm_cbe_267_count = 0;
  static  unsigned long long aesl_llvm_cbe_268_count = 0;
  signed int *llvm_cbe_tmp__94;
  static  unsigned long long aesl_llvm_cbe_269_count = 0;
  unsigned int llvm_cbe_tmp__95;
  static  unsigned long long aesl_llvm_cbe_270_count = 0;
  signed int *llvm_cbe_tmp__96;
  static  unsigned long long aesl_llvm_cbe_271_count = 0;
  static  unsigned long long aesl_llvm_cbe_272_count = 0;
  static  unsigned long long aesl_llvm_cbe_273_count = 0;
  static  unsigned long long aesl_llvm_cbe_274_count = 0;
  static  unsigned long long aesl_llvm_cbe_275_count = 0;
  static  unsigned long long aesl_llvm_cbe_276_count = 0;
  static  unsigned long long aesl_llvm_cbe_277_count = 0;
  signed int *llvm_cbe_tmp__97;
  static  unsigned long long aesl_llvm_cbe_278_count = 0;
  unsigned int llvm_cbe_tmp__98;
  static  unsigned long long aesl_llvm_cbe_279_count = 0;
  signed int *llvm_cbe_tmp__99;
  static  unsigned long long aesl_llvm_cbe_280_count = 0;
  static  unsigned long long aesl_llvm_cbe_281_count = 0;
  static  unsigned long long aesl_llvm_cbe_282_count = 0;
  static  unsigned long long aesl_llvm_cbe_283_count = 0;
  static  unsigned long long aesl_llvm_cbe_284_count = 0;
  static  unsigned long long aesl_llvm_cbe_285_count = 0;
  static  unsigned long long aesl_llvm_cbe_286_count = 0;
  signed int *llvm_cbe_tmp__100;
  static  unsigned long long aesl_llvm_cbe_287_count = 0;
  unsigned int llvm_cbe_tmp__101;
  static  unsigned long long aesl_llvm_cbe_288_count = 0;
  signed int *llvm_cbe_tmp__102;
  static  unsigned long long aesl_llvm_cbe_289_count = 0;
  static  unsigned long long aesl_llvm_cbe_290_count = 0;
  static  unsigned long long aesl_llvm_cbe_291_count = 0;
  static  unsigned long long aesl_llvm_cbe_292_count = 0;
  static  unsigned long long aesl_llvm_cbe_293_count = 0;
  static  unsigned long long aesl_llvm_cbe_294_count = 0;
  static  unsigned long long aesl_llvm_cbe_295_count = 0;
  signed int *llvm_cbe_tmp__103;
  static  unsigned long long aesl_llvm_cbe_296_count = 0;
  unsigned int llvm_cbe_tmp__104;
  static  unsigned long long aesl_llvm_cbe_297_count = 0;
  signed int *llvm_cbe_tmp__105;
  static  unsigned long long aesl_llvm_cbe_298_count = 0;
  static  unsigned long long aesl_llvm_cbe_299_count = 0;
  static  unsigned long long aesl_llvm_cbe_300_count = 0;
  static  unsigned long long aesl_llvm_cbe_301_count = 0;
  static  unsigned long long aesl_llvm_cbe_302_count = 0;
  static  unsigned long long aesl_llvm_cbe_303_count = 0;
  static  unsigned long long aesl_llvm_cbe_304_count = 0;

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
    llvm_cbe_storemerge210__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_preheader9;
  } else {
    goto llvm_cbe__2e_preheader;
  }

llvm_cbe__2e_preheader:
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = bitcast [10 x i32]* %%data_result to i8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_63_count);
  llvm_cbe_tmp__3 = ( char *)(( char *)(&llvm_cbe_data_result));
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = call i8* @memset(i8* %%4, i32 0, i64 40 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_64_count);
  ( char *)memset(( char *)llvm_cbe_tmp__3, 0u, 40ull);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",0u);
printf("\nArgument  = 0x%I64X",40ull);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__4);
}
  goto llvm_cbe__2e_loopexit7;

  do {     /* Syntactic loop '.preheader9' to make GCC happy */
llvm_cbe__2e_preheader9:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge210 = phi i32 [ %%27, %%26 ], [ 0, %%0  for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_storemerge210_count);
  llvm_cbe_storemerge210 = (unsigned int )llvm_cbe_storemerge210__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge210 = 0x%X",llvm_cbe_storemerge210);
printf("\n = 0x%X",llvm_cbe_tmp__23);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = load volatile i32* %%1, align 4, !dbg !2 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_67_count);
  llvm_cbe_tmp__5 = (unsigned int )*((unsigned int volatile*)(&llvm_cbe_tmp__1));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__5);
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = mul nsw i32 %%6, 10, !dbg !2 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_68_count);
  llvm_cbe_tmp__6 = (unsigned int )((unsigned int )(llvm_cbe_tmp__5&4294967295ull)) * ((unsigned int )(10u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__6&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = add nsw i32 %%7, %%storemerge210, !dbg !2 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_69_count);
  llvm_cbe_tmp__7 = (unsigned int )((unsigned int )(llvm_cbe_tmp__6&4294967295ull)) + ((unsigned int )(llvm_cbe_storemerge210&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__7&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = sext i32 %%8 to i64, !dbg !2 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_70_count);
  llvm_cbe_tmp__8 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__7);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__8);
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = getelementptr inbounds i32* %%a, i64 %%9, !dbg !2 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_71_count);
  llvm_cbe_tmp__9 = (signed int *)(&llvm_cbe_a[(((signed long long )llvm_cbe_tmp__8))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__8));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = load volatile i32* %%10, align 4, !dbg !2 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_72_count);
  llvm_cbe_tmp__10 = (unsigned int )*((unsigned int volatile*)llvm_cbe_tmp__9);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__10);
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = sext i32 %%storemerge210 to i64, !dbg !2 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_73_count);
  llvm_cbe_tmp__11 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge210);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__11);
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = getelementptr inbounds [50 x i32]* %%data_a, i64 0, i64 %%12, !dbg !2 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_74_count);
  llvm_cbe_tmp__12 = (signed int *)(&llvm_cbe_data_a[(((signed long long )llvm_cbe_tmp__11))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__11));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__11) < 50 && "Write access out of array 'data_a' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%11, i32* %%13, align 4, !dbg !2 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_75_count);
  *llvm_cbe_tmp__12 = llvm_cbe_tmp__10;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__10);
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = load volatile i32* %%1, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_77_count);
  llvm_cbe_tmp__13 = (unsigned int )*((unsigned int volatile*)(&llvm_cbe_tmp__1));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__13);
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = mul nsw i32 %%14, 10, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_78_count);
  llvm_cbe_tmp__14 = (unsigned int )((unsigned int )(llvm_cbe_tmp__13&4294967295ull)) * ((unsigned int )(10u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__14&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = add nsw i32 %%15, %%storemerge210, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_79_count);
  llvm_cbe_tmp__15 = (unsigned int )((unsigned int )(llvm_cbe_tmp__14&4294967295ull)) + ((unsigned int )(llvm_cbe_storemerge210&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__15&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = sext i32 %%16 to i64, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_80_count);
  llvm_cbe_tmp__16 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__15);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__16);
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = getelementptr inbounds i32* %%b, i64 %%17, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_81_count);
  llvm_cbe_tmp__17 = (signed int *)(&llvm_cbe_b[(((signed long long )llvm_cbe_tmp__16))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__16));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = load volatile i32* %%18, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_82_count);
  llvm_cbe_tmp__18 = (unsigned int )*((unsigned int volatile*)llvm_cbe_tmp__17);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__18);
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = getelementptr inbounds [50 x i32]* %%data_b, i64 0, i64 %%12, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_83_count);
  llvm_cbe_tmp__19 = (signed int *)(&llvm_cbe_data_b[(((signed long long )llvm_cbe_tmp__11))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__11));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__11) < 50 && "Write access out of array 'data_b' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%19, i32* %%20, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_84_count);
  *llvm_cbe_tmp__19 = llvm_cbe_tmp__18;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__18);
  if ((((signed int )llvm_cbe_storemerge210) < ((signed int )10u))) {
    goto llvm_cbe_tmp__106;
  } else {
    goto llvm_cbe_tmp__107;
  }

llvm_cbe_tmp__107:
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = add nsw i32 %%storemerge210, 1, !dbg !6 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_92_count);
  llvm_cbe_tmp__23 = (unsigned int )((unsigned int )(llvm_cbe_storemerge210&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__23&4294967295ull)));
  if (((llvm_cbe_tmp__23&4294967295U) == (50u&4294967295U))) {
    llvm_cbe_storemerge38__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_preheader6;
  } else {
    llvm_cbe_storemerge210__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__23;   /* for PHI node */
    goto llvm_cbe__2e_preheader9;
  }

llvm_cbe_tmp__106:
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = getelementptr inbounds i32* %%op, i64 %%12, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_87_count);
  llvm_cbe_tmp__20 = (signed int *)(&llvm_cbe_op[(((signed long long )llvm_cbe_tmp__11))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__11));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = load volatile i32* %%23, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_88_count);
  llvm_cbe_tmp__21 = (unsigned int )*((unsigned int volatile*)llvm_cbe_tmp__20);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__21);
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = getelementptr inbounds [10 x i32]* %%ALU_operation, i64 0, i64 %%12, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_89_count);
  llvm_cbe_tmp__22 = (signed int *)(&llvm_cbe_ALU_operation[(((signed long long )llvm_cbe_tmp__11))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__11));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__11) < 10 && "Write access out of array 'ALU_operation' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%24, i32* %%25, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_90_count);
  *llvm_cbe_tmp__22 = llvm_cbe_tmp__21;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__21);
  goto llvm_cbe_tmp__107;

  } while (1); /* end of syntactic loop '.preheader9' */
  do {     /* Syntactic loop '.preheader6' to make GCC happy */
llvm_cbe__2e_preheader6:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge38 = phi i32 [ %%92, %%91 ], [ 0, %%26  for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_storemerge38_count);
  llvm_cbe_storemerge38 = (unsigned int )llvm_cbe_storemerge38__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge38 = 0x%X",llvm_cbe_storemerge38);
printf("\n = 0x%X",llvm_cbe_tmp__76);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = sext i32 %%storemerge38 to i64, !dbg !6 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_104_count);
  llvm_cbe_tmp__24 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge38);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__24);
if (AESL_DEBUG_TRACE)
printf("\n  %%29 = getelementptr inbounds [10 x i32]* %%ALU_operation, i64 0, i64 %%28, !dbg !6 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_105_count);
  llvm_cbe_tmp__25 = (signed int *)(&llvm_cbe_ALU_operation[(((signed long long )llvm_cbe_tmp__24))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__24));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__24) < 10)) fprintf(stderr, "%s:%d: warning: Read access out of array 'ALU_operation' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%30 = load i32* %%29, align 4, !dbg !6 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_106_count);
  llvm_cbe_tmp__26 = (unsigned int )*llvm_cbe_tmp__25;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__26);
  switch (((unsigned int )(llvm_cbe_tmp__26&4294967295ull))) {
  default:
    goto llvm_cbe_tmp__108;
;
  case ((unsigned int )(0u&4294967295ull)):
    goto llvm_cbe_tmp__109;
    break;
  case ((unsigned int )(1u&4294967295ull)):
    goto llvm_cbe_tmp__110;
  case ((unsigned int )(2u&4294967295ull)):
    goto llvm_cbe_tmp__111;
  case ((unsigned int )(3u&4294967295ull)):
    goto llvm_cbe_tmp__112;
  case ((unsigned int )(4u&4294967295ull)):
    goto llvm_cbe_tmp__113;
  case ((unsigned int )(5u&4294967295ull)):
    goto llvm_cbe_tmp__114;
  case ((unsigned int )(6u&4294967295ull)):
    goto llvm_cbe_tmp__115;
  case ((unsigned int )(7u&4294967295ull)):
    goto llvm_cbe_tmp__116;
  case ((unsigned int )(8u&4294967295ull)):
    goto llvm_cbe_tmp__117;
  case ((unsigned int )(9u&4294967295ull)):
    goto llvm_cbe_tmp__118;
  }
llvm_cbe_tmp__119:
if (AESL_DEBUG_TRACE)
printf("\n  %%92 = add nsw i32 %%storemerge38, 1, !dbg !9 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_179_count);
  llvm_cbe_tmp__76 = (unsigned int )((unsigned int )(llvm_cbe_storemerge38&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__76&4294967295ull)));
  if (((llvm_cbe_tmp__76&4294967295U) == (10u&4294967295U))) {
    goto llvm_cbe__2e_loopexit7;
  } else {
    llvm_cbe_storemerge38__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__76;   /* for PHI node */
    goto llvm_cbe__2e_preheader6;
  }

llvm_cbe_tmp__109:
if (AESL_DEBUG_TRACE)
printf("\n  %%32 = getelementptr inbounds [50 x i32]* %%data_a, i64 0, i64 %%28, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_108_count);
  llvm_cbe_tmp__27 = (signed int *)(&llvm_cbe_data_a[(((signed long long )llvm_cbe_tmp__24))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__24));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__24) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_a' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%33 = load i32* %%32, align 4, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_109_count);
  llvm_cbe_tmp__28 = (unsigned int )*llvm_cbe_tmp__27;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__28);
if (AESL_DEBUG_TRACE)
printf("\n  %%34 = add nsw i32 %%33, 27, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_110_count);
  llvm_cbe_tmp__29 = (unsigned int )((unsigned int )(llvm_cbe_tmp__28&4294967295ull)) + ((unsigned int )(27u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__29&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%35 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 %%28, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_111_count);
  llvm_cbe_tmp__30 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__24))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__24));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__24) < 10 && "Write access out of array 'data_result' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%34, i32* %%35, align 4, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_112_count);
  *llvm_cbe_tmp__30 = llvm_cbe_tmp__29;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__29);
  goto llvm_cbe_tmp__119;

llvm_cbe_tmp__110:
if (AESL_DEBUG_TRACE)
printf("\n  %%37 = getelementptr inbounds [50 x i32]* %%data_b, i64 0, i64 %%28, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_114_count);
  llvm_cbe_tmp__31 = (signed int *)(&llvm_cbe_data_b[(((signed long long )llvm_cbe_tmp__24))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__24));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__24) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_b' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%38 = load i32* %%37, align 4, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_115_count);
  llvm_cbe_tmp__32 = (unsigned int )*llvm_cbe_tmp__31;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__32);
if (AESL_DEBUG_TRACE)
printf("\n  %%39 = add nsw i32 %%38, 27, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_116_count);
  llvm_cbe_tmp__33 = (unsigned int )((unsigned int )(llvm_cbe_tmp__32&4294967295ull)) + ((unsigned int )(27u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__33&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%40 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 %%28, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_117_count);
  llvm_cbe_tmp__34 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__24))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__24));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__24) < 10 && "Write access out of array 'data_result' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%39, i32* %%40, align 4, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_118_count);
  *llvm_cbe_tmp__34 = llvm_cbe_tmp__33;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__33);
  goto llvm_cbe_tmp__119;

llvm_cbe_tmp__111:
if (AESL_DEBUG_TRACE)
printf("\n  %%42 = getelementptr inbounds [50 x i32]* %%data_a, i64 0, i64 %%28, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_120_count);
  llvm_cbe_tmp__35 = (signed int *)(&llvm_cbe_data_a[(((signed long long )llvm_cbe_tmp__24))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__24));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__24) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_a' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%43 = load i32* %%42, align 4, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_121_count);
  llvm_cbe_tmp__36 = (unsigned int )*llvm_cbe_tmp__35;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__36);
if (AESL_DEBUG_TRACE)
printf("\n  %%44 = shl nsw i32 %%43, 1, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_122_count);
  llvm_cbe_tmp__37 = (unsigned int )llvm_cbe_tmp__36 << 1u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__37);
if (AESL_DEBUG_TRACE)
printf("\n  %%45 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 %%28, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_123_count);
  llvm_cbe_tmp__38 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__24))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__24));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__24) < 10 && "Write access out of array 'data_result' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%44, i32* %%45, align 4, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_124_count);
  *llvm_cbe_tmp__38 = llvm_cbe_tmp__37;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__37);
  goto llvm_cbe_tmp__119;

llvm_cbe_tmp__112:
if (AESL_DEBUG_TRACE)
printf("\n  %%47 = getelementptr inbounds [50 x i32]* %%data_b, i64 0, i64 %%28, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_126_count);
  llvm_cbe_tmp__39 = (signed int *)(&llvm_cbe_data_b[(((signed long long )llvm_cbe_tmp__24))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__24));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__24) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_b' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%48 = load i32* %%47, align 4, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_127_count);
  llvm_cbe_tmp__40 = (unsigned int )*llvm_cbe_tmp__39;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__40);
if (AESL_DEBUG_TRACE)
printf("\n  %%49 = shl nsw i32 %%48, 1, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_128_count);
  llvm_cbe_tmp__41 = (unsigned int )llvm_cbe_tmp__40 << 1u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__41);
if (AESL_DEBUG_TRACE)
printf("\n  %%50 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 %%28, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_129_count);
  llvm_cbe_tmp__42 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__24))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__24));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__24) < 10 && "Write access out of array 'data_result' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%49, i32* %%50, align 4, !dbg !7 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_130_count);
  *llvm_cbe_tmp__42 = llvm_cbe_tmp__41;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__41);
  goto llvm_cbe_tmp__119;

llvm_cbe_tmp__113:
if (AESL_DEBUG_TRACE)
printf("\n  %%52 = getelementptr inbounds [50 x i32]* %%data_a, i64 0, i64 %%28, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_132_count);
  llvm_cbe_tmp__43 = (signed int *)(&llvm_cbe_data_a[(((signed long long )llvm_cbe_tmp__24))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__24));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__24) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_a' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%53 = load i32* %%52, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_133_count);
  llvm_cbe_tmp__44 = (unsigned int )*llvm_cbe_tmp__43;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__44);
if (AESL_DEBUG_TRACE)
printf("\n  %%54 = sdiv i32 %%53, 2, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_134_count);
  llvm_cbe_tmp__45 = (unsigned int )((signed int )(((signed int )llvm_cbe_tmp__44) / ((signed int )2u)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__45));
if (AESL_DEBUG_TRACE)
printf("\n  %%55 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 %%28, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_135_count);
  llvm_cbe_tmp__46 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__24))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__24));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__24) < 10 && "Write access out of array 'data_result' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%54, i32* %%55, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_136_count);
  *llvm_cbe_tmp__46 = llvm_cbe_tmp__45;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__45);
  goto llvm_cbe_tmp__119;

llvm_cbe_tmp__114:
if (AESL_DEBUG_TRACE)
printf("\n  %%57 = getelementptr inbounds [50 x i32]* %%data_b, i64 0, i64 %%28, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_138_count);
  llvm_cbe_tmp__47 = (signed int *)(&llvm_cbe_data_b[(((signed long long )llvm_cbe_tmp__24))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__24));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__24) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_b' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%58 = load i32* %%57, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_139_count);
  llvm_cbe_tmp__48 = (unsigned int )*llvm_cbe_tmp__47;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__48);
if (AESL_DEBUG_TRACE)
printf("\n  %%59 = sdiv i32 %%58, 2, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_140_count);
  llvm_cbe_tmp__49 = (unsigned int )((signed int )(((signed int )llvm_cbe_tmp__48) / ((signed int )2u)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__49));
if (AESL_DEBUG_TRACE)
printf("\n  %%60 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 %%28, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_141_count);
  llvm_cbe_tmp__50 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__24))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__24));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__24) < 10 && "Write access out of array 'data_result' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%59, i32* %%60, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_142_count);
  *llvm_cbe_tmp__50 = llvm_cbe_tmp__49;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__49);
  goto llvm_cbe_tmp__119;

llvm_cbe_tmp__115:
if (AESL_DEBUG_TRACE)
printf("\n  %%62 = getelementptr inbounds [50 x i32]* %%data_a, i64 0, i64 %%28, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_144_count);
  llvm_cbe_tmp__51 = (signed int *)(&llvm_cbe_data_a[(((signed long long )llvm_cbe_tmp__24))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__24));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__24) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_a' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%63 = load i32* %%62, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_145_count);
  llvm_cbe_tmp__52 = (unsigned int )*llvm_cbe_tmp__51;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__52);
if (AESL_DEBUG_TRACE)
printf("\n  %%64 = getelementptr inbounds [50 x i32]* %%data_b, i64 0, i64 %%28, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_146_count);
  llvm_cbe_tmp__53 = (signed int *)(&llvm_cbe_data_b[(((signed long long )llvm_cbe_tmp__24))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__24));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__24) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_b' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%65 = load i32* %%64, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_147_count);
  llvm_cbe_tmp__54 = (unsigned int )*llvm_cbe_tmp__53;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__54);
if (AESL_DEBUG_TRACE)
printf("\n  %%66 = add nsw i32 %%65, %%63, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_148_count);
  llvm_cbe_tmp__55 = (unsigned int )((unsigned int )(llvm_cbe_tmp__54&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__52&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__55&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%67 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 %%28, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_149_count);
  llvm_cbe_tmp__56 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__24))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__24));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__24) < 10 && "Write access out of array 'data_result' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%66, i32* %%67, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_150_count);
  *llvm_cbe_tmp__56 = llvm_cbe_tmp__55;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__55);
  goto llvm_cbe_tmp__119;

llvm_cbe_tmp__116:
if (AESL_DEBUG_TRACE)
printf("\n  %%69 = getelementptr inbounds [50 x i32]* %%data_a, i64 0, i64 %%28, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_152_count);
  llvm_cbe_tmp__57 = (signed int *)(&llvm_cbe_data_a[(((signed long long )llvm_cbe_tmp__24))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__24));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__24) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_a' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%70 = load i32* %%69, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_153_count);
  llvm_cbe_tmp__58 = (unsigned int )*llvm_cbe_tmp__57;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__58);
if (AESL_DEBUG_TRACE)
printf("\n  %%71 = getelementptr inbounds [50 x i32]* %%data_b, i64 0, i64 %%28, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_154_count);
  llvm_cbe_tmp__59 = (signed int *)(&llvm_cbe_data_b[(((signed long long )llvm_cbe_tmp__24))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__24));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__24) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_b' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%72 = load i32* %%71, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_155_count);
  llvm_cbe_tmp__60 = (unsigned int )*llvm_cbe_tmp__59;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__60);
if (AESL_DEBUG_TRACE)
printf("\n  %%73 = sub nsw i32 %%70, %%72, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_156_count);
  llvm_cbe_tmp__61 = (unsigned int )((unsigned int )(llvm_cbe_tmp__58&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__60&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__61&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%74 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 %%28, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_157_count);
  llvm_cbe_tmp__62 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__24))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__24));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__24) < 10 && "Write access out of array 'data_result' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%73, i32* %%74, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_158_count);
  *llvm_cbe_tmp__62 = llvm_cbe_tmp__61;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__61);
  goto llvm_cbe_tmp__119;

llvm_cbe_tmp__117:
if (AESL_DEBUG_TRACE)
printf("\n  %%76 = getelementptr inbounds [50 x i32]* %%data_a, i64 0, i64 %%28, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_160_count);
  llvm_cbe_tmp__63 = (signed int *)(&llvm_cbe_data_a[(((signed long long )llvm_cbe_tmp__24))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__24));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__24) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_a' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%77 = load i32* %%76, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_161_count);
  llvm_cbe_tmp__64 = (unsigned int )*llvm_cbe_tmp__63;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__64);
if (AESL_DEBUG_TRACE)
printf("\n  %%78 = getelementptr inbounds [50 x i32]* %%data_b, i64 0, i64 %%28, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_162_count);
  llvm_cbe_tmp__65 = (signed int *)(&llvm_cbe_data_b[(((signed long long )llvm_cbe_tmp__24))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__24));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__24) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_b' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%79 = load i32* %%78, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_163_count);
  llvm_cbe_tmp__66 = (unsigned int )*llvm_cbe_tmp__65;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__66);
if (AESL_DEBUG_TRACE)
printf("\n  %%80 = mul nsw i32 %%79, %%77, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_164_count);
  llvm_cbe_tmp__67 = (unsigned int )((unsigned int )(llvm_cbe_tmp__66&4294967295ull)) * ((unsigned int )(llvm_cbe_tmp__64&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__67&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%81 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 %%28, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_165_count);
  llvm_cbe_tmp__68 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__24))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__24));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__24) < 10 && "Write access out of array 'data_result' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%80, i32* %%81, align 4, !dbg !8 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_166_count);
  *llvm_cbe_tmp__68 = llvm_cbe_tmp__67;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__67);
  goto llvm_cbe_tmp__119;

llvm_cbe_tmp__118:
if (AESL_DEBUG_TRACE)
printf("\n  %%83 = getelementptr inbounds [50 x i32]* %%data_a, i64 0, i64 %%28, !dbg !9 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_168_count);
  llvm_cbe_tmp__69 = (signed int *)(&llvm_cbe_data_a[(((signed long long )llvm_cbe_tmp__24))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__24));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__24) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_a' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%84 = load i32* %%83, align 4, !dbg !9 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_169_count);
  llvm_cbe_tmp__70 = (unsigned int )*llvm_cbe_tmp__69;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__70);
if (AESL_DEBUG_TRACE)
printf("\n  %%85 = getelementptr inbounds [50 x i32]* %%data_b, i64 0, i64 %%28, !dbg !9 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_170_count);
  llvm_cbe_tmp__71 = (signed int *)(&llvm_cbe_data_b[(((signed long long )llvm_cbe_tmp__24))
#ifdef AESL_BC_SIM
 % 50
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__24));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__24) < 50)) fprintf(stderr, "%s:%d: warning: Read access out of array 'data_b' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%86 = load i32* %%85, align 4, !dbg !9 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_171_count);
  llvm_cbe_tmp__72 = (unsigned int )*llvm_cbe_tmp__71;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__72);
if (AESL_DEBUG_TRACE)
printf("\n  %%87 = sdiv i32 %%84, %%86, !dbg !9 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_172_count);
  llvm_cbe_tmp__73 = (unsigned int )((signed int )(((signed int )llvm_cbe_tmp__70) / ((signed int )llvm_cbe_tmp__72)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__73));
if (AESL_DEBUG_TRACE)
printf("\n  %%88 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 %%28, !dbg !9 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_173_count);
  llvm_cbe_tmp__74 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__24))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__24));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__24) < 10 && "Write access out of array 'data_result' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%87, i32* %%88, align 4, !dbg !9 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_174_count);
  *llvm_cbe_tmp__74 = llvm_cbe_tmp__73;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__73);
  goto llvm_cbe_tmp__119;

llvm_cbe_tmp__108:
if (AESL_DEBUG_TRACE)
printf("\n  %%90 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 %%28, !dbg !9 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_176_count);
  llvm_cbe_tmp__75 = (signed int *)(&llvm_cbe_data_result[(((signed long long )llvm_cbe_tmp__24))
#ifdef AESL_BC_SIM
 % 10
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__24));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__24) < 10 && "Write access out of array 'data_result' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* %%90, align 4, !dbg !9 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_177_count);
  *llvm_cbe_tmp__75 = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
  goto llvm_cbe_tmp__119;

  } while (1); /* end of syntactic loop '.preheader6' */
llvm_cbe__2e_loopexit7:
if (AESL_DEBUG_TRACE)
printf("\n  %%93 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 0, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_215_count);
  llvm_cbe_tmp__77 = (signed int *)(&llvm_cbe_data_result[(((signed long long )0ull))
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
printf("\n  %%94 = load i32* %%93, align 16, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_216_count);
  llvm_cbe_tmp__78 = (unsigned int )*llvm_cbe_tmp__77;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__78);
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%94, i32* %%c, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_217_count);
  *((unsigned int volatile*)llvm_cbe_c) = llvm_cbe_tmp__78;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__78);
if (AESL_DEBUG_TRACE)
printf("\n  %%95 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 1, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_223_count);
  llvm_cbe_tmp__79 = (signed int *)(&llvm_cbe_data_result[(((signed long long )1ull))
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
printf("\n  %%96 = load i32* %%95, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_224_count);
  llvm_cbe_tmp__80 = (unsigned int )*llvm_cbe_tmp__79;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__80);
if (AESL_DEBUG_TRACE)
printf("\n  %%97 = getelementptr inbounds i32* %%c, i64 1, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_225_count);
  llvm_cbe_tmp__81 = (signed int *)(&llvm_cbe_c[(((signed long long )1ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%96, i32* %%97, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_226_count);
  *((unsigned int volatile*)llvm_cbe_tmp__81) = llvm_cbe_tmp__80;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__80);
if (AESL_DEBUG_TRACE)
printf("\n  %%98 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 2, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_232_count);
  llvm_cbe_tmp__82 = (signed int *)(&llvm_cbe_data_result[(((signed long long )2ull))
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
printf("\n  %%99 = load i32* %%98, align 8, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_233_count);
  llvm_cbe_tmp__83 = (unsigned int )*llvm_cbe_tmp__82;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__83);
if (AESL_DEBUG_TRACE)
printf("\n  %%100 = getelementptr inbounds i32* %%c, i64 2, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_234_count);
  llvm_cbe_tmp__84 = (signed int *)(&llvm_cbe_c[(((signed long long )2ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%99, i32* %%100, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_235_count);
  *((unsigned int volatile*)llvm_cbe_tmp__84) = llvm_cbe_tmp__83;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__83);
if (AESL_DEBUG_TRACE)
printf("\n  %%101 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 3, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_241_count);
  llvm_cbe_tmp__85 = (signed int *)(&llvm_cbe_data_result[(((signed long long )3ull))
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
printf("\n  %%102 = load i32* %%101, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_242_count);
  llvm_cbe_tmp__86 = (unsigned int )*llvm_cbe_tmp__85;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__86);
if (AESL_DEBUG_TRACE)
printf("\n  %%103 = getelementptr inbounds i32* %%c, i64 3, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_243_count);
  llvm_cbe_tmp__87 = (signed int *)(&llvm_cbe_c[(((signed long long )3ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%102, i32* %%103, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_244_count);
  *((unsigned int volatile*)llvm_cbe_tmp__87) = llvm_cbe_tmp__86;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__86);
if (AESL_DEBUG_TRACE)
printf("\n  %%104 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_250_count);
  llvm_cbe_tmp__88 = (signed int *)(&llvm_cbe_data_result[(((signed long long )4ull))
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
printf("\n  %%105 = load i32* %%104, align 16, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_251_count);
  llvm_cbe_tmp__89 = (unsigned int )*llvm_cbe_tmp__88;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__89);
if (AESL_DEBUG_TRACE)
printf("\n  %%106 = getelementptr inbounds i32* %%c, i64 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_252_count);
  llvm_cbe_tmp__90 = (signed int *)(&llvm_cbe_c[(((signed long long )4ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%105, i32* %%106, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_253_count);
  *((unsigned int volatile*)llvm_cbe_tmp__90) = llvm_cbe_tmp__89;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__89);
if (AESL_DEBUG_TRACE)
printf("\n  %%107 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 5, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_259_count);
  llvm_cbe_tmp__91 = (signed int *)(&llvm_cbe_data_result[(((signed long long )5ull))
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
printf("\n  %%108 = load i32* %%107, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_260_count);
  llvm_cbe_tmp__92 = (unsigned int )*llvm_cbe_tmp__91;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__92);
if (AESL_DEBUG_TRACE)
printf("\n  %%109 = getelementptr inbounds i32* %%c, i64 5, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_261_count);
  llvm_cbe_tmp__93 = (signed int *)(&llvm_cbe_c[(((signed long long )5ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%108, i32* %%109, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_262_count);
  *((unsigned int volatile*)llvm_cbe_tmp__93) = llvm_cbe_tmp__92;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__92);
if (AESL_DEBUG_TRACE)
printf("\n  %%110 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 6, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_268_count);
  llvm_cbe_tmp__94 = (signed int *)(&llvm_cbe_data_result[(((signed long long )6ull))
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
printf("\n  %%111 = load i32* %%110, align 8, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_269_count);
  llvm_cbe_tmp__95 = (unsigned int )*llvm_cbe_tmp__94;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__95);
if (AESL_DEBUG_TRACE)
printf("\n  %%112 = getelementptr inbounds i32* %%c, i64 6, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_270_count);
  llvm_cbe_tmp__96 = (signed int *)(&llvm_cbe_c[(((signed long long )6ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%111, i32* %%112, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_271_count);
  *((unsigned int volatile*)llvm_cbe_tmp__96) = llvm_cbe_tmp__95;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__95);
if (AESL_DEBUG_TRACE)
printf("\n  %%113 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 7, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_277_count);
  llvm_cbe_tmp__97 = (signed int *)(&llvm_cbe_data_result[(((signed long long )7ull))
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
printf("\n  %%114 = load i32* %%113, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_278_count);
  llvm_cbe_tmp__98 = (unsigned int )*llvm_cbe_tmp__97;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__98);
if (AESL_DEBUG_TRACE)
printf("\n  %%115 = getelementptr inbounds i32* %%c, i64 7, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_279_count);
  llvm_cbe_tmp__99 = (signed int *)(&llvm_cbe_c[(((signed long long )7ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%114, i32* %%115, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_280_count);
  *((unsigned int volatile*)llvm_cbe_tmp__99) = llvm_cbe_tmp__98;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__98);
if (AESL_DEBUG_TRACE)
printf("\n  %%116 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 8, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_286_count);
  llvm_cbe_tmp__100 = (signed int *)(&llvm_cbe_data_result[(((signed long long )8ull))
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
printf("\n  %%117 = load i32* %%116, align 16, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_287_count);
  llvm_cbe_tmp__101 = (unsigned int )*llvm_cbe_tmp__100;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__101);
if (AESL_DEBUG_TRACE)
printf("\n  %%118 = getelementptr inbounds i32* %%c, i64 8, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_288_count);
  llvm_cbe_tmp__102 = (signed int *)(&llvm_cbe_c[(((signed long long )8ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%117, i32* %%118, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_289_count);
  *((unsigned int volatile*)llvm_cbe_tmp__102) = llvm_cbe_tmp__101;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__101);
if (AESL_DEBUG_TRACE)
printf("\n  %%119 = getelementptr inbounds [10 x i32]* %%data_result, i64 0, i64 9, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_295_count);
  llvm_cbe_tmp__103 = (signed int *)(&llvm_cbe_data_result[(((signed long long )9ull))
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
printf("\n  %%120 = load i32* %%119, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_296_count);
  llvm_cbe_tmp__104 = (unsigned int )*llvm_cbe_tmp__103;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__104);
if (AESL_DEBUG_TRACE)
printf("\n  %%121 = getelementptr inbounds i32* %%c, i64 9, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_297_count);
  llvm_cbe_tmp__105 = (signed int *)(&llvm_cbe_c[(((signed long long )9ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%120, i32* %%121, align 4, !dbg !3 for 0x%I64xth hint within @dec_MIMD  --> \n", ++aesl_llvm_cbe_298_count);
  *((unsigned int volatile*)llvm_cbe_tmp__105) = llvm_cbe_tmp__104;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__104);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @dec_MIMD}\n");
  return;
}

