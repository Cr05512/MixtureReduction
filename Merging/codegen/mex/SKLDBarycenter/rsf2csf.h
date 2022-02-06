/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * rsf2csf.h
 *
 * Code generation for function 'rsf2csf'
 *
 */

#pragma once

/* Include files */
#include "SKLDBarycenter_types.h"
#include "rtwtypes.h"
#include "emlrt.h"
#include "mex.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Function Declarations */
void rsf2csf(const emlrtStack *sp, const emxArray_real_T *Ur,
             const emxArray_real_T *Tr, emxArray_creal_T *U,
             emxArray_creal_T *T);

/* End of code generation (rsf2csf.h) */
