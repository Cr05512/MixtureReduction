/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_alphaJDBarycenter_mex.c
 *
 * Code generation for function '_coder_alphaJDBarycenter_mex'
 *
 */

/* Include files */
#include "_coder_alphaJDBarycenter_mex.h"
#include "_coder_alphaJDBarycenter_api.h"
#include "alphaJDBarycenter_data.h"
#include "alphaJDBarycenter_initialize.h"
#include "alphaJDBarycenter_terminate.h"
#include "rt_nonfinite.h"

/* Function Definitions */
void alphaJDBarycenter_mexFunction(int32_T nlhs, mxArray *plhs[1], int32_T nrhs,
                                   const mxArray *prhs[4])
{
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  const mxArray *outputs;
  st.tls = emlrtRootTLSGlobal;
  /* Check for proper number of arguments. */
  if (nrhs != 4) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:WrongNumberOfInputs", 5, 12, 4, 4,
                        17, "alphaJDBarycenter");
  }
  if (nlhs > 1) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:TooManyOutputArguments", 3, 4, 17,
                        "alphaJDBarycenter");
  }
  /* Call the function. */
  alphaJDBarycenter_api(prhs, &outputs);
  /* Copy over outputs to the caller. */
  emlrtReturnArrays(1, &plhs[0], &outputs);
}

void mexFunction(int32_T nlhs, mxArray *plhs[], int32_T nrhs,
                 const mxArray *prhs[])
{
  mexAtExit(&alphaJDBarycenter_atexit);
  /* Module initialization. */
  alphaJDBarycenter_initialize();
  /* Dispatch the entry-point. */
  alphaJDBarycenter_mexFunction(nlhs, plhs, nrhs, prhs);
  /* Module termination. */
  alphaJDBarycenter_terminate();
}

emlrtCTX mexFunctionCreateRootTLS(void)
{
  emlrtCreateRootTLSR2021a(&emlrtRootTLSGlobal, &emlrtContextGlobal, NULL, 1,
                           NULL);
  return emlrtRootTLSGlobal;
}

/* End of code generation (_coder_alphaJDBarycenter_mex.c) */
