/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * FKLDBarycenter.h
 *
 * Code generation for function 'FKLDBarycenter'
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
void FKLDBarycenter(const emlrtStack *sp, const emxArray_struct0_T *comps,
                    real_T *FKLDBar_w, emxArray_real_T *FKLDBar_mu,
                    emxArray_real_T *FKLDBar_Sigma);

/* End of code generation (FKLDBarycenter.h) */
