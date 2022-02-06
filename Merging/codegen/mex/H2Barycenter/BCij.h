/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * BCij.h
 *
 * Code generation for function 'BCij'
 *
 */

#pragma once

/* Include files */
#include "H2Barycenter_types.h"
#include "rtwtypes.h"
#include "emlrt.h"
#include "mex.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Function Declarations */
real_T BCij(const emlrtStack *sp, const emxArray_real_T *pdfi_mu,
            const emxArray_real_T *pdfi_Sigma, const emxArray_real_T *pdfj_mu,
            const emxArray_real_T *pdfj_Sigma);

/* End of code generation (BCij.h) */
