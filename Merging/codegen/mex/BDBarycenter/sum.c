/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * sum.c
 *
 * Code generation for function 'sum'
 *
 */

/* Include files */
#include "sum.h"
#include "BDBarycenter_types.h"
#include "rt_nonfinite.h"
#include "sumMatrixIncludeNaN.h"

/* Variable Definitions */
static emlrtRSInfo k_emlrtRSI = {
    20,                                                       /* lineNo */
    "sum",                                                    /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/sum.m" /* pathName */
};

static emlrtRSInfo l_emlrtRSI = {
    99,        /* lineNo */
    "sumprod", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/sumprod.m" /* pathName
                                                                           */
};

static emlrtRSInfo m_emlrtRSI = {
    74,                      /* lineNo */
    "combineVectorElements", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/"
    "combineVectorElements.m" /* pathName */
};

static emlrtRSInfo n_emlrtRSI = {
    107,                /* lineNo */
    "blockedSummation", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/"
    "blockedSummation.m" /* pathName */
};

static emlrtRSInfo o_emlrtRSI = {
    22,                    /* lineNo */
    "sumMatrixIncludeNaN", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/"
    "sumMatrixIncludeNaN.m" /* pathName */
};

static emlrtRSInfo p_emlrtRSI = {
    42,                 /* lineNo */
    "sumMatrixColumns", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/"
    "sumMatrixIncludeNaN.m" /* pathName */
};

static emlrtRSInfo q_emlrtRSI = {
    57,                 /* lineNo */
    "sumMatrixColumns", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/"
    "sumMatrixIncludeNaN.m" /* pathName */
};

/* Function Definitions */
real_T sum(const emlrtStack *sp, const emxArray_real_T *x)
{
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack d_st;
  emlrtStack e_st;
  emlrtStack f_st;
  emlrtStack st;
  real_T y;
  int32_T ib;
  int32_T inb;
  int32_T nfb;
  int32_T nleft;
  st.prev = sp;
  st.tls = sp->tls;
  st.site = &k_emlrtRSI;
  b_st.prev = &st;
  b_st.tls = st.tls;
  c_st.prev = &b_st;
  c_st.tls = b_st.tls;
  d_st.prev = &c_st;
  d_st.tls = c_st.tls;
  e_st.prev = &d_st;
  e_st.tls = d_st.tls;
  f_st.prev = &e_st;
  f_st.tls = e_st.tls;
  b_st.site = &l_emlrtRSI;
  c_st.site = &m_emlrtRSI;
  d_st.site = &n_emlrtRSI;
  e_st.site = &o_emlrtRSI;
  if (x->size[0] < 4096) {
    f_st.site = &p_emlrtRSI;
    y = sumColumnB(&f_st, x, x->size[0]);
  } else {
    nfb = x->size[0] / 4096;
    inb = nfb << 12;
    nleft = x->size[0] - inb;
    y = sumColumnB4(x, 1);
    for (ib = 2; ib <= nfb; ib++) {
      y += sumColumnB4(x, ((ib - 1) << 12) + 1);
    }
    if (nleft > 0) {
      f_st.site = &q_emlrtRSI;
      y += b_sumColumnB(&f_st, x, nleft, inb + 1);
    }
  }
  return y;
}

/* End of code generation (sum.c) */
