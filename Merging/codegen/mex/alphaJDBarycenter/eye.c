/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * eye.c
 *
 * Code generation for function 'eye'
 *
 */

/* Include files */
#include "eye.h"
#include "alphaJDBarycenter_data.h"
#include "alphaJDBarycenter_emxutil.h"
#include "alphaJDBarycenter_types.h"
#include "eml_int_forloop_overflow_check.h"
#include "rt_nonfinite.h"

/* Variable Definitions */
static emlrtRSInfo mb_emlrtRSI = {
    50,                                                     /* lineNo */
    "eye",                                                  /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/elmat/eye.m" /* pathName */
};

static emlrtRSInfo nb_emlrtRSI = {
    96,                                                     /* lineNo */
    "eye",                                                  /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/elmat/eye.m" /* pathName */
};

static emlrtRSInfo ob_emlrtRSI = {
    21,                           /* lineNo */
    "checkAndSaturateExpandSize", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/"
    "checkAndSaturateExpandSize.m" /* pathName */
};

static emlrtRTEInfo g_emlrtRTEI =
    {
        58,                   /* lineNo */
        23,                   /* colNo */
        "assertValidSizeArg", /* fName */
        "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/"
        "assertValidSizeArg.m" /* pName */
};

static emlrtRTEInfo lc_emlrtRTEI = {
    94,                                                     /* lineNo */
    5,                                                      /* colNo */
    "eye",                                                  /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/elmat/eye.m" /* pName */
};

/* Function Definitions */
void eye(const emlrtStack *sp, real_T varargin_1, emxArray_real_T *b_I)
{
  emlrtStack b_st;
  emlrtStack st;
  int32_T i;
  int32_T loop_ub;
  int32_T m_tmp_tmp;
  st.prev = sp;
  st.tls = sp->tls;
  st.site = &mb_emlrtRSI;
  b_st.prev = &st;
  b_st.tls = st.tls;
  b_st.site = &ob_emlrtRSI;
  if (varargin_1 != varargin_1) {
    emlrtErrorWithMessageIdR2018a(
        &b_st, &g_emlrtRTEI, "Coder:MATLAB:NonIntegerInput",
        "Coder:MATLAB:NonIntegerInput", 4, 12, MIN_int32_T, 12, MAX_int32_T);
  }
  m_tmp_tmp = (int32_T)varargin_1;
  i = b_I->size[0] * b_I->size[1];
  b_I->size[0] = (int32_T)varargin_1;
  b_I->size[1] = (int32_T)varargin_1;
  emxEnsureCapacity_real_T(sp, b_I, i, &lc_emlrtRTEI);
  loop_ub = (int32_T)varargin_1 * (int32_T)varargin_1;
  for (i = 0; i < loop_ub; i++) {
    b_I->data[i] = 0.0;
  }
  if ((int32_T)varargin_1 > 0) {
    st.site = &nb_emlrtRSI;
    if ((1 <= (int32_T)varargin_1) && ((int32_T)varargin_1 > 2147483646)) {
      b_st.site = &lb_emlrtRSI;
      check_forloop_overflow_error(&b_st);
    }
    for (loop_ub = 0; loop_ub < m_tmp_tmp; loop_ub++) {
      b_I->data[loop_ub + b_I->size[0] * loop_ub] = 1.0;
    }
  }
}

/* End of code generation (eye.c) */
