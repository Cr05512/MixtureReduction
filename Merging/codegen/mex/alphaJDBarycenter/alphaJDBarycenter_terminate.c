/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * alphaJDBarycenter_terminate.c
 *
 * Code generation for function 'alphaJDBarycenter_terminate'
 *
 */

/* Include files */
#include "alphaJDBarycenter_terminate.h"
#include "_coder_alphaJDBarycenter_mex.h"
#include "alphaJDBarycenter_data.h"
#include "rt_nonfinite.h"

/* Function Definitions */
void alphaJDBarycenter_atexit(void)
{
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  mexFunctionCreateRootTLS();
  st.tls = emlrtRootTLSGlobal;
  emlrtEnterRtStackR2012b(&st);
  emlrtLeaveRtStackR2012b(&st);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
  emlrtExitTimeCleanup(&emlrtContextGlobal);
}

void alphaJDBarycenter_terminate(void)
{
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  st.tls = emlrtRootTLSGlobal;
  emlrtLeaveRtStackR2012b(&st);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
}

/* End of code generation (alphaJDBarycenter_terminate.c) */
