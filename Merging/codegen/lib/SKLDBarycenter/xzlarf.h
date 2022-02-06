/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: xzlarf.h
 *
 * MATLAB Coder version            : 5.2
 * C/C++ source code generated on  : 31-Jan-2022 14:36:42
 */

#ifndef XZLARF_H
#define XZLARF_H

/* Include Files */
#include "SKLDBarycenter_types.h"
#include "rtwtypes.h"
#include <stddef.h>
#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Function Declarations */
void b_xzlarf(int m, int n, int iv0, const creal_T tau, emxArray_creal_T *C,
              int ic0, int ldc, emxArray_creal_T *work);

void xzlarf(int m, int n, int iv0, double tau, emxArray_real_T *C, int ic0,
            int ldc, emxArray_real_T *work);

#ifdef __cplusplus
}
#endif

#endif
/*
 * File trailer for xzlarf.h
 *
 * [EOF]
 */
