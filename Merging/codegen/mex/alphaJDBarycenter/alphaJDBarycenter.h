/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * alphaJDBarycenter.h
 *
 * Code generation for function 'alphaJDBarycenter'
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
void alphaJDBarycenter(const emlrtStack *sp, const emxArray_struct0_T *comps,
                       real_T alpha, real_T maxiter, real_T tol,
                       struct0_T *bar);

/* End of code generation (alphaJDBarycenter.h) */
