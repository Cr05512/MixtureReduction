/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * SKLDBarycenter_initialize.c
 *
 * Code generation for function 'SKLDBarycenter_initialize'
 *
 */

/* Include files */
#include "SKLDBarycenter_initialize.h"
#include "SKLDBarycenter_data.h"
#include "_coder_SKLDBarycenter_mex.h"
#include "rt_nonfinite.h"

/* Function Definitions */
void SKLDBarycenter_initialize(void)
{
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  mex_InitInfAndNan();
  mexFunctionCreateRootTLS();
  emlrtBreakCheckR2012bFlagVar = emlrtGetBreakCheckFlagAddressR2012b();
  st.tls = emlrtRootTLSGlobal;
  emlrtClearAllocCountR2012b(&st, false, 0U, NULL);
  emlrtEnterRtStackR2012b(&st);
  emlrtFirstTimeR2012b(emlrtRootTLSGlobal);
}

/* End of code generation (SKLDBarycenter_initialize.c) */
