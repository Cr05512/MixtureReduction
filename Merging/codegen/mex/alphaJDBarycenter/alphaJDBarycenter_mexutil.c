/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * alphaJDBarycenter_mexutil.c
 *
 * Code generation for function 'alphaJDBarycenter_mexutil'
 *
 */

/* Include files */
#include "alphaJDBarycenter_mexutil.h"
#include "rt_nonfinite.h"

/* Function Definitions */
void disp(const emlrtStack *sp, const mxArray *b, emlrtMCInfo *location)
{
  const mxArray *pArray;
  pArray = b;
  emlrtCallMATLABR2012b((emlrtCTX)sp, 0, NULL, 1, &pArray,
                        (const char_T *)"disp", true, location);
}

void error(const emlrtStack *sp, const mxArray *b, emlrtMCInfo *location)
{
  const mxArray *pArray;
  pArray = b;
  emlrtCallMATLABR2012b((emlrtCTX)sp, 0, NULL, 1, &pArray,
                        (const char_T *)"error", true, location);
}

/* End of code generation (alphaJDBarycenter_mexutil.c) */
