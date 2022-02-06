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
#include "SKLDBarycenter_data.h"
#include "SKLDBarycenter_emxutil.h"
#include "SKLDBarycenter_types.h"
#include "eml_int_forloop_overflow_check.h"
#include "rt_nonfinite.h"
#include "sumMatrixIncludeNaN.h"

/* Variable Definitions */
static emlrtRSInfo o_emlrtRSI = {
    20,                                                       /* lineNo */
    "sum",                                                    /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/sum.m" /* pathName */
};

static emlrtRSInfo p_emlrtRSI = {
    99,        /* lineNo */
    "sumprod", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/sumprod.m" /* pathName
                                                                           */
};

static emlrtRSInfo q_emlrtRSI = {
    74,                      /* lineNo */
    "combineVectorElements", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/"
    "combineVectorElements.m" /* pathName */
};

static emlrtRSInfo r_emlrtRSI = {
    107,                /* lineNo */
    "blockedSummation", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/"
    "blockedSummation.m" /* pathName */
};

static emlrtRSInfo s_emlrtRSI = {
    22,                    /* lineNo */
    "sumMatrixIncludeNaN", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/"
    "sumMatrixIncludeNaN.m" /* pathName */
};

static emlrtRSInfo t_emlrtRSI = {
    42,                 /* lineNo */
    "sumMatrixColumns", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/"
    "sumMatrixIncludeNaN.m" /* pathName */
};

static emlrtRSInfo u_emlrtRSI = {
    57,                 /* lineNo */
    "sumMatrixColumns", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/"
    "sumMatrixIncludeNaN.m" /* pathName */
};

static emlrtRSInfo id_emlrtRSI = {
    112,                /* lineNo */
    "blockedSummation", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/"
    "blockedSummation.m" /* pathName */
};

static emlrtRSInfo jd_emlrtRSI = {
    168,                /* lineNo */
    "colMajorFlatIter", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/"
    "blockedSummation.m" /* pathName */
};

static emlrtRSInfo kd_emlrtRSI = {
    173,                /* lineNo */
    "colMajorFlatIter", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/"
    "blockedSummation.m" /* pathName */
};

static emlrtRSInfo ld_emlrtRSI = {
    192,                /* lineNo */
    "colMajorFlatIter", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/"
    "blockedSummation.m" /* pathName */
};

static emlrtRSInfo md_emlrtRSI = {
    207,                /* lineNo */
    "colMajorFlatIter", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/"
    "blockedSummation.m" /* pathName */
};

static emlrtRSInfo nd_emlrtRSI = {
    227,                /* lineNo */
    "colMajorFlatIter", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/"
    "blockedSummation.m" /* pathName */
};

static emlrtRSInfo od_emlrtRSI = {
    238,                /* lineNo */
    "colMajorFlatIter", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/"
    "blockedSummation.m" /* pathName */
};

static emlrtRTEInfo dd_emlrtRTEI = {
    20,                                                       /* lineNo */
    1,                                                        /* colNo */
    "sum",                                                    /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/sum.m" /* pName */
};

static emlrtRTEInfo ed_emlrtRTEI = {
    146,                /* lineNo */
    24,                 /* colNo */
    "blockedSummation", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/"
    "blockedSummation.m" /* pName */
};

static emlrtRTEInfo fd_emlrtRTEI = {
    153,                /* lineNo */
    23,                 /* colNo */
    "blockedSummation", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/"
    "blockedSummation.m" /* pName */
};

static emlrtRTEInfo gd_emlrtRTEI = {
    153,                /* lineNo */
    1,                  /* colNo */
    "blockedSummation", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/"
    "blockedSummation.m" /* pName */
};

/* Function Definitions */
void b_sum(const emlrtStack *sp, const emxArray_real_T *x, emxArray_real_T *y)
{
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack d_st;
  emlrtStack e_st;
  emlrtStack f_st;
  emlrtStack st;
  emxArray_real_T *bsum;
  int32_T bvstride;
  int32_T firstBlockLength;
  int32_T hi;
  int32_T ib;
  int32_T k;
  int32_T lastBlockLength;
  int32_T nblocks;
  int32_T vstride;
  int32_T xj;
  int32_T xoffset;
  st.prev = sp;
  st.tls = sp->tls;
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
  emlrtHeapReferenceStackEnterFcnR2012b((emlrtCTX)sp);
  st.site = &o_emlrtRSI;
  b_st.site = &p_emlrtRSI;
  c_st.site = &q_emlrtRSI;
  if ((x->size[0] == 0) || (x->size[1] == 0) || (x->size[2] == 0)) {
    hi = y->size[0] * y->size[1];
    y->size[0] = x->size[0];
    y->size[1] = x->size[1];
    emxEnsureCapacity_real_T(&c_st, y, hi, &dd_emlrtRTEI);
    firstBlockLength = x->size[0] * x->size[1];
    for (hi = 0; hi < firstBlockLength; hi++) {
      y->data[hi] = 0.0;
    }
  } else {
    d_st.site = &id_emlrtRSI;
    if (x->size[2] == 1) {
      vstride = x->size[0] * x->size[1] * x->size[2];
    } else {
      vstride = x->size[0] * x->size[1];
    }
    emxInit_real_T(&d_st, &bsum, 1, &gd_emlrtRTEI, true);
    bvstride = vstride << 10;
    hi = y->size[0] * y->size[1];
    y->size[0] = x->size[0];
    y->size[1] = x->size[1];
    emxEnsureCapacity_real_T(&d_st, y, hi, &ed_emlrtRTEI);
    hi = bsum->size[0];
    bsum->size[0] = vstride;
    emxEnsureCapacity_real_T(&d_st, bsum, hi, &fd_emlrtRTEI);
    if (x->size[2] <= 1024) {
      firstBlockLength = x->size[2];
      lastBlockLength = 0;
      nblocks = 1;
    } else {
      firstBlockLength = 1024;
      nblocks = x->size[2] / 1024;
      lastBlockLength = x->size[2] - (nblocks << 10);
      if (lastBlockLength > 0) {
        nblocks++;
      } else {
        lastBlockLength = 1024;
      }
    }
    e_st.site = &jd_emlrtRSI;
    e_st.site = &kd_emlrtRSI;
    if ((1 <= vstride) && (vstride > 2147483646)) {
      f_st.site = &bb_emlrtRSI;
      check_forloop_overflow_error(&f_st);
    }
    for (xj = 0; xj < vstride; xj++) {
      y->data[xj] = x->data[xj];
      bsum->data[xj] = 0.0;
    }
    for (k = 2; k <= firstBlockLength; k++) {
      xoffset = (k - 1) * vstride;
      e_st.site = &ld_emlrtRSI;
      for (xj = 0; xj < vstride; xj++) {
        y->data[xj] += x->data[xoffset + xj];
      }
    }
    for (ib = 2; ib <= nblocks; ib++) {
      firstBlockLength = (ib - 1) * bvstride;
      e_st.site = &md_emlrtRSI;
      for (xj = 0; xj < vstride; xj++) {
        bsum->data[xj] = x->data[firstBlockLength + xj];
      }
      if (ib == nblocks) {
        hi = lastBlockLength;
      } else {
        hi = 1024;
      }
      for (k = 2; k <= hi; k++) {
        xoffset = firstBlockLength + (k - 1) * vstride;
        e_st.site = &nd_emlrtRSI;
        for (xj = 0; xj < vstride; xj++) {
          bsum->data[xj] += x->data[xoffset + xj];
        }
      }
      e_st.site = &od_emlrtRSI;
      for (xj = 0; xj < vstride; xj++) {
        y->data[xj] += bsum->data[xj];
      }
    }
    emxFree_real_T(&bsum);
  }
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtCTX)sp);
}

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
  st.site = &o_emlrtRSI;
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
  b_st.site = &p_emlrtRSI;
  c_st.site = &q_emlrtRSI;
  d_st.site = &r_emlrtRSI;
  e_st.site = &s_emlrtRSI;
  if (x->size[0] < 4096) {
    f_st.site = &t_emlrtRSI;
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
      f_st.site = &u_emlrtRSI;
      y += b_sumColumnB(&f_st, x, nleft, inb + 1);
    }
  }
  return y;
}

/* End of code generation (sum.c) */
