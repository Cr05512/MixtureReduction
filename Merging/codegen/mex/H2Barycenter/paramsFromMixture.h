/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * paramsFromMixture.h
 *
 * Code generation for function 'paramsFromMixture'
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
void paramsFromMixture(const emlrtStack *sp, const emxArray_struct0_T *gm,
                       emxArray_real_T *w, emxArray_real_T *mu,
                       emxArray_real_T *Sigma);

/* End of code generation (paramsFromMixture.h) */
