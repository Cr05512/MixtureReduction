/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: mrdivide_helper.h
 *
 * MATLAB Coder version            : 5.2
 * C/C++ source code generated on  : 31-Jan-2022 14:36:42
 */

#ifndef MRDIVIDE_HELPER_H
#define MRDIVIDE_HELPER_H

/* Include Files */
#include "SKLDBarycenter_types.h"
#include "rtwtypes.h"
#include <stddef.h>
#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Function Declarations */
void b_mrdiv(const emxArray_real_T *A, const emxArray_creal_T *B,
             emxArray_creal_T *Y);

void mrdiv(const emxArray_real_T *A, const emxArray_real_T *B,
           emxArray_real_T *Y);

#ifdef __cplusplus
}
#endif

#endif
/*
 * File trailer for mrdivide_helper.h
 *
 * [EOF]
 */
