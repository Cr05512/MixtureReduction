/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * sqrtm.h
 *
 * Code generation for function 'sqrtm'
 *
 */

#pragma once

/* Include files */
#include "alphaJDBarycenter_types.h"
#include "rtwtypes.h"
#include "emlrt.h"
#include "mex.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Function Declarations */
void b_sqrtm(const emlrtStack *sp, const emxArray_creal_T *A,
             emxArray_creal_T *X);

void sqrtm(const emlrtStack *sp, const emxArray_real_T *A, emxArray_creal_T *X);

/* End of code generation (sqrtm.h) */
