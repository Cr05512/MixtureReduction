/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_BDBarycenter_mex.c
 *
 * Code generation for function '_coder_BDBarycenter_mex'
 *
 */

/* Include files */
#include "_coder_BDBarycenter_mex.h"
#include "BDBarycenter_data.h"
#include "BDBarycenter_initialize.h"
#include "BDBarycenter_terminate.h"
#include "_coder_BDBarycenter_api.h"
#include "rt_nonfinite.h"

/* Function Definitions */
void BDBarycenter_mexFunction(int32_T nlhs, mxArray *plhs[1], int32_T nrhs,
                              const mxArray *prhs[3])
{
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  const mxArray *outputs;
  st.tls = emlrtRootTLSGlobal;
  /* Check for proper number of arguments. */
  if (nrhs != 3) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:WrongNumberOfInputs", 5, 12, 3, 4,
                        12, "BDBarycenter");
  }
  if (nlhs > 1) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:TooManyOutputArguments", 3, 4, 12,
                        "BDBarycenter");
  }
  /* Call the function. */
  BDBarycenter_api(prhs, &outputs);
  /* Copy over outputs to the caller. */
  emlrtReturnArrays(1, &plhs[0], &outputs);
}

void mexFunction(int32_T nlhs, mxArray *plhs[], int32_T nrhs,
                 const mxArray *prhs[])
{
  mexAtExit(&BDBarycenter_atexit);
  /* Module initialization. */
  BDBarycenter_initialize();
  /* Dispatch the entry-point. */
  BDBarycenter_mexFunction(nlhs, plhs, nrhs, prhs);
  /* Module termination. */
  BDBarycenter_terminate();
}

emlrtCTX mexFunctionCreateRootTLS(void)
{
  emlrtCreateRootTLSR2021a(&emlrtRootTLSGlobal, &emlrtContextGlobal, NULL, 1,
                           NULL);
  return emlrtRootTLSGlobal;
}

/* End of code generation (_coder_BDBarycenter_mex.c) */
