/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: sqrtm.h
 *
 * MATLAB Coder version            : 5.2
 * C/C++ source code generated on  : 31-Jan-2022 14:36:42
 */

#ifndef SQRTM_H
#define SQRTM_H

/* Include Files */
#include "SKLDBarycenter_types.h"
#include "rtwtypes.h"
#include <stddef.h>
#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Function Declarations */
void b_sqrtm(const emxArray_creal_T *A, emxArray_creal_T *X);

void sqrtm(const emxArray_real_T *A, emxArray_creal_T *X);

#ifdef __cplusplus
}
#endif

#endif
/*
 * File trailer for sqrtm.h
 *
 * [EOF]
 */
