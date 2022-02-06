/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: xgerc.h
 *
 * MATLAB Coder version            : 5.2
 * C/C++ source code generated on  : 31-Jan-2022 14:36:42
 */

#ifndef XGERC_H
#define XGERC_H

/* Include Files */
#include "SKLDBarycenter_types.h"
#include "rtwtypes.h"
#include <stddef.h>
#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Function Declarations */
void b_xgerc(int m, int n, const creal_T alpha1, int ix0,
             const emxArray_creal_T *y, emxArray_creal_T *A, int ia0, int lda);

void xgerc(int m, int n, double alpha1, int ix0, const emxArray_real_T *y,
           emxArray_real_T *A, int ia0, int lda);

#ifdef __cplusplus
}
#endif

#endif
/*
 * File trailer for xgerc.h
 *
 * [EOF]
 */
