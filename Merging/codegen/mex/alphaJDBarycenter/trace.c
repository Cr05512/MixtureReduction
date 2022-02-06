/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * trace.c
 *
 * Code generation for function 'trace'
 *
 */

/* Include files */
#include "trace.h"
#include "alphaJDBarycenter_types.h"
#include "rt_nonfinite.h"

/* Variable Definitions */
static emlrtRTEInfo l_emlrtRTEI = {
    11,                                                        /* lineNo */
    15,                                                        /* colNo */
    "trace",                                                   /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/trace.m" /* pName */
};

/* Function Definitions */
real_T trace(const emlrtStack *sp, const emxArray_real_T *a)
{
  real_T t;
  int32_T i;
  int32_T k;
  if (a->size[0] != a->size[1]) {
    emlrtErrorWithMessageIdR2018a(sp, &l_emlrtRTEI, "Coder:MATLAB:square",
                                  "Coder:MATLAB:square", 0);
  }
  t = 0.0;
  i = a->size[0];
  for (k = 0; k < i; k++) {
    t += a->data[k + a->size[0] * k];
  }
  return t;
}

/* End of code generation (trace.c) */
