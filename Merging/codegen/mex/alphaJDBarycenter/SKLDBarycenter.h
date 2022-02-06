/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * SKLDBarycenter.h
 *
 * Code generation for function 'SKLDBarycenter'
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
void SKLDBarycenter(const emlrtStack *sp, const emxArray_struct0_T *comps,
                    real_T *bar_w, emxArray_real_T *bar_mu,
                    emxArray_real_T *bar_Sigma);

/* End of code generation (SKLDBarycenter.h) */
