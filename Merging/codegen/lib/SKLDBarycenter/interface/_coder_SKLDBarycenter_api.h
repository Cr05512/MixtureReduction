/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_SKLDBarycenter_api.h
 *
 * MATLAB Coder version            : 5.2
 * C/C++ source code generated on  : 31-Jan-2022 14:36:42
 */

#ifndef _CODER_SKLDBARYCENTER_API_H
#define _CODER_SKLDBARYCENTER_API_H

/* Include Files */
#include "emlrt.h"
#include "tmwtypes.h"
#include <string.h>

/* Type Definitions */
#ifndef struct_emxArray_real_T
#define struct_emxArray_real_T
struct emxArray_real_T {
  real_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};
#endif /* struct_emxArray_real_T */
#ifndef typedef_emxArray_real_T
#define typedef_emxArray_real_T
typedef struct emxArray_real_T emxArray_real_T;
#endif /* typedef_emxArray_real_T */

#ifndef typedef_struct0_T
#define typedef_struct0_T
typedef struct {
  real_T w;
  emxArray_real_T *mu;
  emxArray_real_T *Sigma;
} struct0_T;
#endif /* typedef_struct0_T */

#ifndef typedef_emxArray_struct0_T
#define typedef_emxArray_struct0_T
typedef struct {
  struct0_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
} emxArray_struct0_T;
#endif /* typedef_emxArray_struct0_T */

/* Variable Declarations */
extern emlrtCTX emlrtRootTLSGlobal;
extern emlrtContext emlrtContextGlobal;

#ifdef __cplusplus
extern "C" {
#endif

/* Function Declarations */
void SKLDBarycenter(emxArray_struct0_T *comps, real_T maxiter, real_T tol,
                    struct0_T *bar);

void SKLDBarycenter_api(const mxArray *const prhs[3], const mxArray **plhs);

void SKLDBarycenter_atexit(void);

void SKLDBarycenter_initialize(void);

void SKLDBarycenter_terminate(void);

void SKLDBarycenter_xil_shutdown(void);

void SKLDBarycenter_xil_terminate(void);

#ifdef __cplusplus
}
#endif

#endif
/*
 * File trailer for _coder_SKLDBarycenter_api.h
 *
 * [EOF]
 */
