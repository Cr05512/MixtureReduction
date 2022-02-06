/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: xzlarfg.h
 *
 * MATLAB Coder version            : 5.2
 * C/C++ source code generated on  : 31-Jan-2022 14:36:42
 */

#ifndef XZLARFG_H
#define XZLARFG_H

/* Include Files */
#include "SKLDBarycenter_types.h"
#include "rtwtypes.h"
#include <stddef.h>
#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Function Declarations */
double b_xzlarfg(int n, double *alpha1, double x[3]);

creal_T c_xzlarfg(int n, creal_T *alpha1, emxArray_creal_T *x, int ix0);

creal_T d_xzlarfg(creal_T *alpha1, creal_T *x);

double xzlarfg(int n, double *alpha1, emxArray_real_T *x, int ix0);

#ifdef __cplusplus
}
#endif

#endif
/*
 * File trailer for xzlarfg.h
 *
 * [EOF]
 */
