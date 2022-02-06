/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * qrsolve.c
 *
 * Code generation for function 'qrsolve'
 *
 */

/* Include files */
#include "qrsolve.h"
#include "SKLDBarycenter_data.h"
#include "SKLDBarycenter_emxutil.h"
#include "SKLDBarycenter_types.h"
#include "eml_int_forloop_overflow_check.h"
#include "rt_nonfinite.h"
#include "warning.h"
#include "lapacke.h"
#include "mwmathutil.h"
#include <stddef.h>

/* Variable Definitions */
static emlrtRSInfo ec_emlrtRSI = {
    61,        /* lineNo */
    "qrsolve", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/qrsolve.m" /* pathName
                                                                     */
};

static emlrtRSInfo fc_emlrtRSI = {
    72,        /* lineNo */
    "qrsolve", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/qrsolve.m" /* pathName
                                                                     */
};

static emlrtRSInfo gc_emlrtRSI = {
    85,        /* lineNo */
    "qrsolve", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/qrsolve.m" /* pathName
                                                                     */
};

static emlrtRSInfo hc_emlrtRSI = {
    63,       /* lineNo */
    "xgeqp3", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgeqp3.m" /* pathName
                                                                            */
};

static emlrtRSInfo ic_emlrtRSI = {
    98,             /* lineNo */
    "ceval_xgeqp3", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgeqp3.m" /* pathName
                                                                            */
};

static emlrtRSInfo jc_emlrtRSI = {
    138,            /* lineNo */
    "ceval_xgeqp3", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgeqp3.m" /* pathName
                                                                            */
};

static emlrtRSInfo kc_emlrtRSI = {
    141,            /* lineNo */
    "ceval_xgeqp3", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgeqp3.m" /* pathName
                                                                            */
};

static emlrtRSInfo lc_emlrtRSI = {
    143,            /* lineNo */
    "ceval_xgeqp3", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgeqp3.m" /* pathName
                                                                            */
};

static emlrtRSInfo mc_emlrtRSI = {
    148,            /* lineNo */
    "ceval_xgeqp3", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgeqp3.m" /* pathName
                                                                            */
};

static emlrtRSInfo nc_emlrtRSI = {
    151,            /* lineNo */
    "ceval_xgeqp3", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgeqp3.m" /* pathName
                                                                            */
};

static emlrtRSInfo oc_emlrtRSI = {
    154,            /* lineNo */
    "ceval_xgeqp3", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgeqp3.m" /* pathName
                                                                            */
};

static emlrtRSInfo pc_emlrtRSI = {
    158,            /* lineNo */
    "ceval_xgeqp3", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgeqp3.m" /* pathName
                                                                            */
};

static emlrtRSInfo qc_emlrtRSI = {
    173,          /* lineNo */
    "rankFromQR", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/qrsolve.m" /* pathName
                                                                     */
};

static emlrtRSInfo rc_emlrtRSI = {
    172,          /* lineNo */
    "rankFromQR", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/qrsolve.m" /* pathName
                                                                     */
};

static emlrtRSInfo sc_emlrtRSI = {
    119,         /* lineNo */
    "LSQFromQR", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/qrsolve.m" /* pathName
                                                                     */
};

static emlrtRSInfo tc_emlrtRSI = {
    126,         /* lineNo */
    "LSQFromQR", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/qrsolve.m" /* pathName
                                                                     */
};

static emlrtRSInfo uc_emlrtRSI = {
    128,         /* lineNo */
    "LSQFromQR", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/qrsolve.m" /* pathName
                                                                     */
};

static emlrtRSInfo vc_emlrtRSI = {
    138,         /* lineNo */
    "LSQFromQR", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/qrsolve.m" /* pathName
                                                                     */
};

static emlrtRSInfo
    wc_emlrtRSI =
        {
            31,         /* lineNo */
            "xunormqr", /* fcnName */
            "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/"
            "xunormqr.m" /* pathName */
};

static emlrtRSInfo
    xc_emlrtRSI =
        {
            102,              /* lineNo */
            "ceval_xunormqr", /* fcnName */
            "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/"
            "xunormqr.m" /* pathName */
};

static emlrtRSInfo
    yc_emlrtRSI =
        {
            108,              /* lineNo */
            "ceval_xunormqr", /* fcnName */
            "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/"
            "xunormqr.m" /* pathName */
};

static emlrtRSInfo ad_emlrtRSI =
    {
        18,          /* lineNo */
        "xzunormqr", /* fcnName */
        "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+reflapack/"
        "xzunormqr.m" /* pathName */
};

static emlrtRSInfo bd_emlrtRSI =
    {
        21,          /* lineNo */
        "xzunormqr", /* fcnName */
        "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+reflapack/"
        "xzunormqr.m" /* pathName */
};

static emlrtRSInfo cd_emlrtRSI =
    {
        23,          /* lineNo */
        "xzunormqr", /* fcnName */
        "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+reflapack/"
        "xzunormqr.m" /* pathName */
};

static emlrtRSInfo dd_emlrtRSI =
    {
        29,          /* lineNo */
        "xzunormqr", /* fcnName */
        "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+reflapack/"
        "xzunormqr.m" /* pathName */
};

static emlrtRSInfo mf_emlrtRSI = {
    116,         /* lineNo */
    "LSQFromQR", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/qrsolve.m" /* pathName
                                                                     */
};

static emlrtMCInfo g_emlrtMCI = {
    53,                                                             /* lineNo */
    19,                                                             /* colNo */
    "flt2str",                                                      /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/flt2str.m" /* pName */
};

static emlrtRTEInfo rc_emlrtRTEI = {
    1,        /* lineNo */
    32,       /* colNo */
    "xgeqp3", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgeqp3.m" /* pName
                                                                            */
};

static emlrtRTEInfo sc_emlrtRTEI = {
    61,       /* lineNo */
    9,        /* colNo */
    "xgeqp3", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgeqp3.m" /* pName
                                                                            */
};

static emlrtRTEInfo tc_emlrtRTEI = {
    92,       /* lineNo */
    22,       /* colNo */
    "xgeqp3", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgeqp3.m" /* pName
                                                                            */
};

static emlrtRTEInfo uc_emlrtRTEI = {
    105,      /* lineNo */
    1,        /* colNo */
    "xgeqp3", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgeqp3.m" /* pName
                                                                            */
};

static emlrtRTEInfo vc_emlrtRTEI = {
    97,       /* lineNo */
    5,        /* colNo */
    "xgeqp3", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgeqp3.m" /* pName
                                                                            */
};

static emlrtRTEInfo wc_emlrtRTEI = {
    85,                                                             /* lineNo */
    26,                                                             /* colNo */
    "qrsolve",                                                      /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/qrsolve.m" /* pName */
};

static emlrtRTEInfo xc_emlrtRTEI = {
    1,                                                              /* lineNo */
    24,                                                             /* colNo */
    "qrsolve",                                                      /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/qrsolve.m" /* pName */
};

static emlrtRTEInfo yc_emlrtRTEI = {
    109,                                                            /* lineNo */
    1,                                                              /* colNo */
    "qrsolve",                                                      /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/qrsolve.m" /* pName */
};

static emlrtRTEInfo ad_emlrtRTEI = {
    119,                                                            /* lineNo */
    5,                                                              /* colNo */
    "qrsolve",                                                      /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/qrsolve.m" /* pName */
};

static emlrtRTEInfo de_emlrtRTEI = {
    115,                                                            /* lineNo */
    5,                                                              /* colNo */
    "qrsolve",                                                      /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/qrsolve.m" /* pName */
};

static emlrtRTEInfo ee_emlrtRTEI = {
    116,                                                            /* lineNo */
    5,                                                              /* colNo */
    "qrsolve",                                                      /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/qrsolve.m" /* pName */
};

static emlrtRSInfo yf_emlrtRSI = {
    53,        /* lineNo */
    "flt2str", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/flt2str.m" /* pathName
                                                                     */
};

/* Function Declarations */
static void LSQFromQR(const emlrtStack *sp, const emxArray_real_T *A,
                      const emxArray_real_T *tau, const emxArray_int32_T *jpvt,
                      emxArray_real_T *B, int32_T rankA, emxArray_real_T *Y);

static void b_LSQFromQR(const emlrtStack *sp, const emxArray_creal_T *A,
                        const emxArray_creal_T *tau,
                        const emxArray_int32_T *jpvt, const emxArray_real_T *B,
                        int32_T rankA, emxArray_creal_T *Y);

static void b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               char_T y[14]);

static const mxArray *b_sprintf(const emlrtStack *sp, const mxArray *b,
                                const mxArray *c, emlrtMCInfo *location);

static void emlrt_marshallIn(const emlrtStack *sp,
                             const mxArray *a__output_of_sprintf_,
                             const char_T *identifier, char_T y[14]);

static void i_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                               const emlrtMsgIdentifier *msgId, char_T ret[14]);

/* Function Definitions */
static void LSQFromQR(const emlrtStack *sp, const emxArray_real_T *A,
                      const emxArray_real_T *tau, const emxArray_int32_T *jpvt,
                      emxArray_real_T *B, int32_T rankA, emxArray_real_T *Y)
{
  static const char_T fname[14] = {'L', 'A', 'P', 'A', 'C', 'K', 'E',
                                   '_', 'd', 'o', 'r', 'm', 'q', 'r'};
  ptrdiff_t nrc_t;
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack d_st;
  emlrtStack e_st;
  emlrtStack st;
  real_T wj;
  int32_T a_tmp;
  int32_T b_nb;
  int32_T i;
  int32_T info;
  int32_T j;
  int32_T k;
  int32_T mn;
  int32_T nb;
  boolean_T b_p;
  boolean_T p;
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
  nb = B->size[1];
  mn = Y->size[0] * Y->size[1];
  Y->size[0] = A->size[1];
  Y->size[1] = B->size[1];
  emxEnsureCapacity_real_T(sp, Y, mn, &yc_emlrtRTEI);
  info = A->size[1] * B->size[1];
  for (mn = 0; mn < info; mn++) {
    Y->data[mn] = 0.0;
  }
  st.site = &sc_emlrtRSI;
  b_st.site = &wc_emlrtRSI;
  if ((A->size[0] != 0) && (A->size[1] != 0) &&
      ((B->size[0] != 0) && (B->size[1] != 0))) {
    nrc_t = (ptrdiff_t)B->size[0];
    nrc_t = LAPACKE_dormqr(
        102, 'L', 'T', nrc_t, (ptrdiff_t)B->size[1],
        (ptrdiff_t)muIntScalarMin_sint32(A->size[0], A->size[1]), &A->data[0],
        (ptrdiff_t)A->size[0], &tau->data[0], &B->data[0], nrc_t);
    info = (int32_T)nrc_t;
    c_st.site = &xc_emlrtRSI;
    if (info != 0) {
      p = true;
      b_p = false;
      if (info == -7) {
        b_p = true;
      } else if (info == -9) {
        b_p = true;
      } else if (info == -10) {
        b_p = true;
      }
      if (!b_p) {
        if (info == -1010) {
          emlrtErrorWithMessageIdR2018a(&c_st, &f_emlrtRTEI, "MATLAB:nomem",
                                        "MATLAB:nomem", 0);
        } else {
          emlrtErrorWithMessageIdR2018a(&c_st, &e_emlrtRTEI,
                                        "Coder:toolbox:LAPACKCallErrorInfo",
                                        "Coder:toolbox:LAPACKCallErrorInfo", 5,
                                        4, 14, &fname[0], 12, info);
        }
      }
    } else {
      p = false;
    }
    if (p) {
      if ((info == -10) && (B->size[1] > 1)) {
        c_st.site = &yc_emlrtRSI;
        info = A->size[0];
        b_nb = B->size[1];
        mn = muIntScalarMin_sint32(A->size[0], A->size[1]);
        d_st.site = &ad_emlrtRSI;
        if (mn > 2147483646) {
          e_st.site = &bb_emlrtRSI;
          check_forloop_overflow_error(&e_st);
        }
        for (j = 0; j < mn; j++) {
          if (tau->data[j] != 0.0) {
            d_st.site = &bd_emlrtRSI;
            if (b_nb > 2147483646) {
              e_st.site = &bb_emlrtRSI;
              check_forloop_overflow_error(&e_st);
            }
            for (k = 0; k < b_nb; k++) {
              wj = B->data[j + B->size[0] * k];
              a_tmp = j + 2;
              d_st.site = &cd_emlrtRSI;
              if ((j + 2 <= info) && (info > 2147483646)) {
                e_st.site = &bb_emlrtRSI;
                check_forloop_overflow_error(&e_st);
              }
              for (i = a_tmp; i <= info; i++) {
                wj += A->data[(i + A->size[0] * j) - 1] *
                      B->data[(i + B->size[0] * k) - 1];
              }
              wj *= tau->data[j];
              if (wj != 0.0) {
                B->data[j + B->size[0] * k] -= wj;
                d_st.site = &dd_emlrtRSI;
                for (i = a_tmp; i <= info; i++) {
                  B->data[(i + B->size[0] * k) - 1] -=
                      A->data[(i + A->size[0] * j) - 1] * wj;
                }
              }
            }
          }
        }
      } else {
        info = B->size[0];
        b_nb = B->size[1];
        mn = B->size[0] * B->size[1];
        B->size[0] = info;
        B->size[1] = b_nb;
        emxEnsureCapacity_real_T(&b_st, B, mn, &ad_emlrtRTEI);
        info *= b_nb;
        for (mn = 0; mn < info; mn++) {
          B->data[mn] = rtNaN;
        }
      }
    }
  }
  st.site = &tc_emlrtRSI;
  if ((1 <= nb) && (nb > 2147483646)) {
    b_st.site = &bb_emlrtRSI;
    check_forloop_overflow_error(&b_st);
  }
  for (k = 0; k < nb; k++) {
    st.site = &uc_emlrtRSI;
    if ((1 <= rankA) && (rankA > 2147483646)) {
      b_st.site = &bb_emlrtRSI;
      check_forloop_overflow_error(&b_st);
    }
    for (i = 0; i < rankA; i++) {
      Y->data[(jpvt->data[i] + Y->size[0] * k) - 1] =
          B->data[i + B->size[0] * k];
    }
    for (j = rankA; j >= 1; j--) {
      mn = jpvt->data[j - 1];
      Y->data[(mn + Y->size[0] * k) - 1] /=
          A->data[(j + A->size[0] * (j - 1)) - 1];
      st.site = &vc_emlrtRSI;
      for (i = 0; i <= j - 2; i++) {
        Y->data[(jpvt->data[i] + Y->size[0] * k) - 1] -=
            Y->data[(jpvt->data[j - 1] + Y->size[0] * k) - 1] *
            A->data[i + A->size[0] * (j - 1)];
      }
    }
  }
}

static void b_LSQFromQR(const emlrtStack *sp, const emxArray_creal_T *A,
                        const emxArray_creal_T *tau,
                        const emxArray_int32_T *jpvt, const emxArray_real_T *B,
                        int32_T rankA, emxArray_creal_T *Y)
{
  static const char_T fname[14] = {'L', 'A', 'P', 'A', 'C', 'K', 'E',
                                   '_', 'z', 'u', 'n', 'm', 'q', 'r'};
  ptrdiff_t nrc_t;
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack d_st;
  emlrtStack e_st;
  emlrtStack st;
  emxArray_creal_T *CB;
  real_T ai;
  real_T ar;
  real_T brm;
  real_T re;
  real_T tauj_im;
  real_T tauj_re;
  real_T wj_im;
  real_T wj_re;
  int32_T a_tmp;
  int32_T b_nb;
  int32_T i;
  int32_T info;
  int32_T j;
  int32_T k;
  int32_T mn;
  int32_T nb;
  boolean_T b_p;
  boolean_T p;
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
  emlrtHeapReferenceStackEnterFcnR2012b((emlrtCTX)sp);
  nb = B->size[1];
  mn = Y->size[0] * Y->size[1];
  Y->size[0] = A->size[1];
  Y->size[1] = B->size[1];
  emxEnsureCapacity_creal_T(sp, Y, mn, &yc_emlrtRTEI);
  info = A->size[1] * B->size[1];
  for (mn = 0; mn < info; mn++) {
    Y->data[mn].re = 0.0;
    Y->data[mn].im = 0.0;
  }
  emxInit_creal_T(sp, &CB, 2, &de_emlrtRTEI, true);
  mn = CB->size[0] * CB->size[1];
  CB->size[0] = B->size[0];
  CB->size[1] = B->size[1];
  emxEnsureCapacity_creal_T(sp, CB, mn, &de_emlrtRTEI);
  info = B->size[0] * B->size[1];
  for (mn = 0; mn < info; mn++) {
    CB->data[mn].re = B->data[mn];
    CB->data[mn].im = 0.0;
  }
  st.site = &mf_emlrtRSI;
  b_st.site = &wc_emlrtRSI;
  if ((A->size[0] != 0) && (A->size[1] != 0) &&
      ((CB->size[0] != 0) && (CB->size[1] != 0))) {
    nrc_t = (ptrdiff_t)CB->size[0];
    nrc_t = LAPACKE_zunmqr(
        102, 'L', 'C', nrc_t, (ptrdiff_t)CB->size[1],
        (ptrdiff_t)muIntScalarMin_sint32(A->size[0], A->size[1]),
        (lapack_complex_double *)&A->data[0], (ptrdiff_t)A->size[0],
        (lapack_complex_double *)&tau->data[0],
        (lapack_complex_double *)&CB->data[0], nrc_t);
    info = (int32_T)nrc_t;
    c_st.site = &xc_emlrtRSI;
    if (info != 0) {
      p = true;
      b_p = false;
      if (info == -7) {
        b_p = true;
      } else if (info == -9) {
        b_p = true;
      } else if (info == -10) {
        b_p = true;
      }
      if (!b_p) {
        if (info == -1010) {
          emlrtErrorWithMessageIdR2018a(&c_st, &f_emlrtRTEI, "MATLAB:nomem",
                                        "MATLAB:nomem", 0);
        } else {
          emlrtErrorWithMessageIdR2018a(&c_st, &e_emlrtRTEI,
                                        "Coder:toolbox:LAPACKCallErrorInfo",
                                        "Coder:toolbox:LAPACKCallErrorInfo", 5,
                                        4, 14, &fname[0], 12, info);
        }
      }
    } else {
      p = false;
    }
    if (p) {
      if ((info == -10) && (CB->size[1] > 1)) {
        c_st.site = &yc_emlrtRSI;
        info = A->size[0];
        b_nb = CB->size[1];
        mn = muIntScalarMin_sint32(A->size[0], A->size[1]);
        d_st.site = &ad_emlrtRSI;
        if (mn > 2147483646) {
          e_st.site = &bb_emlrtRSI;
          check_forloop_overflow_error(&e_st);
        }
        for (j = 0; j < mn; j++) {
          tauj_re = tau->data[j].re;
          tauj_im = -tau->data[j].im;
          if ((tauj_re != 0.0) || (tauj_im != 0.0)) {
            d_st.site = &bd_emlrtRSI;
            if (b_nb > 2147483646) {
              e_st.site = &bb_emlrtRSI;
              check_forloop_overflow_error(&e_st);
            }
            for (k = 0; k < b_nb; k++) {
              wj_re = CB->data[j + CB->size[0] * k].re;
              wj_im = CB->data[j + CB->size[0] * k].im;
              a_tmp = j + 2;
              d_st.site = &cd_emlrtRSI;
              if ((j + 2 <= info) && (info > 2147483646)) {
                e_st.site = &bb_emlrtRSI;
                check_forloop_overflow_error(&e_st);
              }
              for (i = a_tmp; i <= info; i++) {
                wj_re += A->data[(i + A->size[0] * j) - 1].re *
                             CB->data[(i + CB->size[0] * k) - 1].re +
                         A->data[(i + A->size[0] * j) - 1].im *
                             CB->data[(i + CB->size[0] * k) - 1].im;
                wj_im += A->data[(i + A->size[0] * j) - 1].re *
                             CB->data[(i + CB->size[0] * k) - 1].im -
                         A->data[(i + A->size[0] * j) - 1].im *
                             CB->data[(i + CB->size[0] * k) - 1].re;
              }
              re = tauj_re * wj_re - tauj_im * wj_im;
              wj_re = tauj_re * wj_im + tauj_im * wj_re;
              if ((re != 0.0) || (wj_re != 0.0)) {
                CB->data[j + CB->size[0] * k].re -= re;
                CB->data[j + CB->size[0] * k].im -= wj_re;
                d_st.site = &dd_emlrtRSI;
                for (i = a_tmp; i <= info; i++) {
                  CB->data[(i + CB->size[0] * k) - 1].re -=
                      A->data[(i + A->size[0] * j) - 1].re * re -
                      A->data[(i + A->size[0] * j) - 1].im * wj_re;
                  CB->data[(i + CB->size[0] * k) - 1].im -=
                      A->data[(i + A->size[0] * j) - 1].re * wj_re +
                      A->data[(i + A->size[0] * j) - 1].im * re;
                }
              }
            }
          }
        }
      } else {
        info = CB->size[0];
        b_nb = CB->size[1];
        mn = CB->size[0] * CB->size[1];
        CB->size[0] = info;
        CB->size[1] = b_nb;
        emxEnsureCapacity_creal_T(&b_st, CB, mn, &ee_emlrtRTEI);
        info *= b_nb;
        for (mn = 0; mn < info; mn++) {
          CB->data[mn].re = rtNaN;
          CB->data[mn].im = 0.0;
        }
      }
    }
  }
  st.site = &tc_emlrtRSI;
  if ((1 <= B->size[1]) && (B->size[1] > 2147483646)) {
    b_st.site = &bb_emlrtRSI;
    check_forloop_overflow_error(&b_st);
  }
  for (k = 0; k < nb; k++) {
    st.site = &uc_emlrtRSI;
    if ((1 <= rankA) && (rankA > 2147483646)) {
      b_st.site = &bb_emlrtRSI;
      check_forloop_overflow_error(&b_st);
    }
    for (i = 0; i < rankA; i++) {
      Y->data[(jpvt->data[i] + Y->size[0] * k) - 1] =
          CB->data[i + CB->size[0] * k];
    }
    for (j = rankA; j >= 1; j--) {
      mn = jpvt->data[j - 1];
      ar = Y->data[(mn + Y->size[0] * k) - 1].re;
      ai = Y->data[(mn + Y->size[0] * k) - 1].im;
      tauj_re = A->data[(j + A->size[0] * (j - 1)) - 1].re;
      tauj_im = A->data[(j + A->size[0] * (j - 1)) - 1].im;
      if (tauj_im == 0.0) {
        if (ai == 0.0) {
          re = ar / tauj_re;
          wj_re = 0.0;
        } else if (ar == 0.0) {
          re = 0.0;
          wj_re = ai / tauj_re;
        } else {
          re = ar / tauj_re;
          wj_re = ai / tauj_re;
        }
      } else if (tauj_re == 0.0) {
        if (ar == 0.0) {
          re = ai / tauj_im;
          wj_re = 0.0;
        } else if (ai == 0.0) {
          re = 0.0;
          wj_re = -(ar / tauj_im);
        } else {
          re = ai / tauj_im;
          wj_re = -(ar / tauj_im);
        }
      } else {
        brm = muDoubleScalarAbs(tauj_re);
        wj_re = muDoubleScalarAbs(tauj_im);
        if (brm > wj_re) {
          wj_im = tauj_im / tauj_re;
          wj_re = tauj_re + wj_im * tauj_im;
          re = (ar + wj_im * ai) / wj_re;
          wj_re = (ai - wj_im * ar) / wj_re;
        } else if (wj_re == brm) {
          if (tauj_re > 0.0) {
            wj_im = 0.5;
          } else {
            wj_im = -0.5;
          }
          if (tauj_im > 0.0) {
            wj_re = 0.5;
          } else {
            wj_re = -0.5;
          }
          re = (ar * wj_im + ai * wj_re) / brm;
          wj_re = (ai * wj_im - ar * wj_re) / brm;
        } else {
          wj_im = tauj_re / tauj_im;
          wj_re = tauj_im + wj_im * tauj_re;
          re = (wj_im * ar + ai) / wj_re;
          wj_re = (wj_im * ai - ar) / wj_re;
        }
      }
      Y->data[(mn + Y->size[0] * k) - 1].re = re;
      Y->data[(mn + Y->size[0] * k) - 1].im = wj_re;
      st.site = &vc_emlrtRSI;
      for (i = 0; i <= j - 2; i++) {
        wj_re = Y->data[(jpvt->data[j - 1] + Y->size[0] * k) - 1].re *
                    A->data[i + A->size[0] * (j - 1)].im +
                Y->data[(jpvt->data[j - 1] + Y->size[0] * k) - 1].im *
                    A->data[i + A->size[0] * (j - 1)].re;
        Y->data[(jpvt->data[i] + Y->size[0] * k) - 1].re -=
            Y->data[(jpvt->data[j - 1] + Y->size[0] * k) - 1].re *
                A->data[i + A->size[0] * (j - 1)].re -
            Y->data[(jpvt->data[j - 1] + Y->size[0] * k) - 1].im *
                A->data[i + A->size[0] * (j - 1)].im;
        Y->data[(jpvt->data[i] + Y->size[0] * k) - 1].im -= wj_re;
      }
    }
  }
  emxFree_creal_T(&CB);
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtCTX)sp);
}

static void b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId, char_T y[14])
{
  i_emlrt_marshallIn(sp, emlrtAlias(u), parentId, y);
  emlrtDestroyArray(&u);
}

static const mxArray *b_sprintf(const emlrtStack *sp, const mxArray *b,
                                const mxArray *c, emlrtMCInfo *location)
{
  const mxArray *pArrays[2];
  const mxArray *m;
  pArrays[0] = b;
  pArrays[1] = c;
  return emlrtCallMATLABR2012b((emlrtCTX)sp, 1, &m, 2, &pArrays[0],
                               (const char_T *)"sprintf", true, location);
}

static void emlrt_marshallIn(const emlrtStack *sp,
                             const mxArray *a__output_of_sprintf_,
                             const char_T *identifier, char_T y[14])
{
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = (const char_T *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  b_emlrt_marshallIn(sp, emlrtAlias(a__output_of_sprintf_), &thisId, y);
  emlrtDestroyArray(&a__output_of_sprintf_);
}

static void i_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                               const emlrtMsgIdentifier *msgId, char_T ret[14])
{
  static const int32_T dims[2] = {1, 14};
  emlrtCheckBuiltInR2012b((emlrtCTX)sp, msgId, src, (const char_T *)"char",
                          false, 2U, (void *)&dims[0]);
  emlrtImportCharArrayR2015b((emlrtCTX)sp, src, &ret[0], 14);
  emlrtDestroyArray(&src);
}

void b_qrsolve(const emlrtStack *sp, const emxArray_creal_T *A,
               const emxArray_real_T *B, emxArray_creal_T *Y)
{
  static const int32_T iv[2] = {1, 6};
  static const char_T fname[14] = {'L', 'A', 'P', 'A', 'C', 'K', 'E',
                                   '_', 'z', 'g', 'e', 'q', 'p', '3'};
  static const char_T rfmt[6] = {'%', '1', '4', '.', '6', 'e'};
  ptrdiff_t info_t;
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack d_st;
  emlrtStack st;
  emxArray_creal_T *b_A;
  emxArray_creal_T *tau;
  emxArray_int32_T *jpvt;
  emxArray_ptrdiff_t *jpvt_t;
  const mxArray *b_y;
  const mxArray *m;
  const mxArray *y;
  real_T tol;
  int32_T b_i;
  int32_T b_na;
  int32_T i;
  int32_T ma;
  int32_T maxmn;
  int32_T minmn;
  int32_T na;
  char_T str[14];
  boolean_T p;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  c_st.prev = &b_st;
  c_st.tls = b_st.tls;
  d_st.prev = &c_st;
  d_st.tls = c_st.tls;
  emlrtHeapReferenceStackEnterFcnR2012b((emlrtCTX)sp);
  emxInit_creal_T(sp, &b_A, 2, &xc_emlrtRTEI, true);
  st.site = &ec_emlrtRSI;
  i = b_A->size[0] * b_A->size[1];
  b_A->size[0] = A->size[0];
  b_A->size[1] = A->size[1];
  emxEnsureCapacity_creal_T(&st, b_A, i, &rc_emlrtRTEI);
  maxmn = A->size[0] * A->size[1];
  for (i = 0; i < maxmn; i++) {
    b_A->data[i] = A->data[i];
  }
  emxInit_int32_T(&st, &jpvt, 2, &xc_emlrtRTEI, true);
  minmn = b_A->size[0];
  na = b_A->size[1];
  i = jpvt->size[0] * jpvt->size[1];
  jpvt->size[0] = 1;
  jpvt->size[1] = b_A->size[1];
  emxEnsureCapacity_int32_T(&st, jpvt, i, &sc_emlrtRTEI);
  maxmn = b_A->size[1];
  for (i = 0; i < maxmn; i++) {
    jpvt->data[i] = 0;
  }
  emxInit_creal_T(&st, &tau, 1, &xc_emlrtRTEI, true);
  b_st.site = &hc_emlrtRSI;
  ma = b_A->size[0];
  b_na = b_A->size[1];
  b_na = muIntScalarMin_sint32(ma, b_na);
  i = tau->size[0];
  tau->size[0] = b_na;
  emxEnsureCapacity_creal_T(&b_st, tau, i, &tc_emlrtRTEI);
  if ((b_A->size[0] == 0) || (b_A->size[1] == 0)) {
    i = tau->size[0];
    tau->size[0] = b_na;
    emxEnsureCapacity_creal_T(&b_st, tau, i, &vc_emlrtRTEI);
    for (i = 0; i < b_na; i++) {
      tau->data[i].re = 0.0;
      tau->data[i].im = 0.0;
    }
    c_st.site = &ic_emlrtRSI;
    if ((1 <= b_A->size[1]) && (b_A->size[1] > 2147483646)) {
      d_st.site = &bb_emlrtRSI;
      check_forloop_overflow_error(&d_st);
    }
    for (ma = 0; ma < na; ma++) {
      jpvt->data[ma] = ma + 1;
    }
  } else {
    emxInit_ptrdiff_t(&b_st, &jpvt_t, 1, &uc_emlrtRTEI, true);
    i = jpvt_t->size[0];
    jpvt_t->size[0] = b_A->size[1];
    emxEnsureCapacity_ptrdiff_t(&b_st, jpvt_t, i, &uc_emlrtRTEI);
    maxmn = b_A->size[1];
    for (i = 0; i < maxmn; i++) {
      jpvt_t->data[i] = (ptrdiff_t)0;
    }
    info_t = LAPACKE_zgeqp3(
        102, (ptrdiff_t)b_A->size[0], (ptrdiff_t)b_A->size[1],
        (lapack_complex_double *)&b_A->data[0], (ptrdiff_t)b_A->size[0],
        &jpvt_t->data[0], (lapack_complex_double *)&tau->data[0]);
    maxmn = (int32_T)info_t;
    c_st.site = &jc_emlrtRSI;
    if (maxmn != 0) {
      p = true;
      if (maxmn != -4) {
        if (maxmn == -1010) {
          emlrtErrorWithMessageIdR2018a(&c_st, &f_emlrtRTEI, "MATLAB:nomem",
                                        "MATLAB:nomem", 0);
        } else {
          emlrtErrorWithMessageIdR2018a(&c_st, &e_emlrtRTEI,
                                        "Coder:toolbox:LAPACKCallErrorInfo",
                                        "Coder:toolbox:LAPACKCallErrorInfo", 5,
                                        4, 14, &fname[0], 12, maxmn);
        }
      }
    } else {
      p = false;
    }
    if (p) {
      c_st.site = &kc_emlrtRSI;
      if ((1 <= na) && (na > 2147483646)) {
        d_st.site = &bb_emlrtRSI;
        check_forloop_overflow_error(&d_st);
      }
      for (maxmn = 0; maxmn < na; maxmn++) {
        c_st.site = &lc_emlrtRSI;
        if ((1 <= minmn) && (minmn > 2147483646)) {
          d_st.site = &bb_emlrtRSI;
          check_forloop_overflow_error(&d_st);
        }
        for (b_i = 0; b_i < minmn; b_i++) {
          i = maxmn * ma + b_i;
          b_A->data[i].re = rtNaN;
          b_A->data[i].im = 0.0;
        }
      }
      minmn = muIntScalarMin_sint32(minmn, na);
      c_st.site = &mc_emlrtRSI;
      for (ma = 0; ma < minmn; ma++) {
        tau->data[ma].re = rtNaN;
        tau->data[ma].im = 0.0;
      }
      maxmn = minmn + 1;
      c_st.site = &nc_emlrtRSI;
      if ((minmn + 1 <= b_na) && (b_na > 2147483646)) {
        d_st.site = &bb_emlrtRSI;
        check_forloop_overflow_error(&d_st);
      }
      for (ma = maxmn; ma <= b_na; ma++) {
        tau->data[ma - 1].re = 0.0;
        tau->data[ma - 1].im = 0.0;
      }
      c_st.site = &oc_emlrtRSI;
      for (ma = 0; ma < na; ma++) {
        jpvt->data[ma] = ma + 1;
      }
    } else {
      c_st.site = &pc_emlrtRSI;
      if ((1 <= na) && (na > 2147483646)) {
        d_st.site = &bb_emlrtRSI;
        check_forloop_overflow_error(&d_st);
      }
      for (ma = 0; ma < na; ma++) {
        jpvt->data[ma] = (int32_T)jpvt_t->data[ma];
      }
    }
    emxFree_ptrdiff_t(&jpvt_t);
  }
  st.site = &fc_emlrtRSI;
  b_na = 0;
  tol = 0.0;
  if (b_A->size[0] < b_A->size[1]) {
    minmn = b_A->size[0];
    maxmn = b_A->size[1];
  } else {
    minmn = b_A->size[1];
    maxmn = b_A->size[0];
  }
  if (minmn > 0) {
    tol = muDoubleScalarMin(1.4901161193847656E-8,
                            2.2204460492503131E-15 * (real_T)maxmn) *
          muDoubleScalarHypot(b_A->data[0].re, b_A->data[0].im);
    while ((b_na < minmn) &&
           (!(muDoubleScalarHypot(b_A->data[b_na + b_A->size[0] * b_na].re,
                                  b_A->data[b_na + b_A->size[0] * b_na].im) <=
              tol))) {
      b_na++;
    }
  }
  if (b_na < minmn) {
    b_st.site = &qc_emlrtRSI;
    y = NULL;
    m = emlrtCreateCharArray(2, &iv[0]);
    emlrtInitCharArrayR2013a(&b_st, 6, m, &rfmt[0]);
    emlrtAssign(&y, m);
    b_y = NULL;
    m = emlrtCreateDoubleScalar(tol);
    emlrtAssign(&b_y, m);
    c_st.site = &yf_emlrtRSI;
    emlrt_marshallIn(&c_st, b_sprintf(&c_st, y, b_y, &g_emlrtMCI),
                     "<output of sprintf>", str);
    b_st.site = &rc_emlrtRSI;
    b_warning(&b_st, b_na, str);
  }
  st.site = &gc_emlrtRSI;
  b_LSQFromQR(&st, b_A, tau, jpvt, B, b_na, Y);
  emxFree_creal_T(&tau);
  emxFree_int32_T(&jpvt);
  emxFree_creal_T(&b_A);
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtCTX)sp);
}

void qrsolve(const emlrtStack *sp, const emxArray_real_T *A,
             const emxArray_real_T *B, emxArray_real_T *Y)
{
  static const int32_T iv[2] = {1, 6};
  static const char_T fname[14] = {'L', 'A', 'P', 'A', 'C', 'K', 'E',
                                   '_', 'd', 'g', 'e', 'q', 'p', '3'};
  static const char_T rfmt[6] = {'%', '1', '4', '.', '6', 'e'};
  ptrdiff_t info_t;
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack d_st;
  emlrtStack st;
  emxArray_int32_T *jpvt;
  emxArray_ptrdiff_t *jpvt_t;
  emxArray_real_T *b_A;
  emxArray_real_T *b_B;
  emxArray_real_T *tau;
  const mxArray *b_y;
  const mxArray *m;
  const mxArray *y;
  real_T tol;
  int32_T b_na;
  int32_T i;
  int32_T ma;
  int32_T minmana;
  int32_T na;
  int32_T rankA;
  char_T str[14];
  boolean_T p;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  c_st.prev = &b_st;
  c_st.tls = b_st.tls;
  d_st.prev = &c_st;
  d_st.tls = c_st.tls;
  emlrtHeapReferenceStackEnterFcnR2012b((emlrtCTX)sp);
  emxInit_real_T(sp, &b_A, 2, &xc_emlrtRTEI, true);
  st.site = &ec_emlrtRSI;
  i = b_A->size[0] * b_A->size[1];
  b_A->size[0] = A->size[0];
  b_A->size[1] = A->size[1];
  emxEnsureCapacity_real_T(&st, b_A, i, &rc_emlrtRTEI);
  na = A->size[0] * A->size[1];
  for (i = 0; i < na; i++) {
    b_A->data[i] = A->data[i];
  }
  emxInit_int32_T(&st, &jpvt, 2, &xc_emlrtRTEI, true);
  rankA = b_A->size[0];
  b_na = b_A->size[1];
  i = jpvt->size[0] * jpvt->size[1];
  jpvt->size[0] = 1;
  jpvt->size[1] = b_A->size[1];
  emxEnsureCapacity_int32_T(&st, jpvt, i, &sc_emlrtRTEI);
  na = b_A->size[1];
  for (i = 0; i < na; i++) {
    jpvt->data[i] = 0;
  }
  emxInit_real_T(&st, &tau, 1, &xc_emlrtRTEI, true);
  b_st.site = &hc_emlrtRSI;
  ma = b_A->size[0];
  na = b_A->size[1];
  minmana = muIntScalarMin_sint32(ma, na);
  i = tau->size[0];
  tau->size[0] = minmana;
  emxEnsureCapacity_real_T(&b_st, tau, i, &tc_emlrtRTEI);
  if ((b_A->size[0] == 0) || (b_A->size[1] == 0)) {
    i = tau->size[0];
    tau->size[0] = minmana;
    emxEnsureCapacity_real_T(&b_st, tau, i, &vc_emlrtRTEI);
    for (i = 0; i < minmana; i++) {
      tau->data[i] = 0.0;
    }
    c_st.site = &ic_emlrtRSI;
    if ((1 <= b_A->size[1]) && (b_A->size[1] > 2147483646)) {
      d_st.site = &bb_emlrtRSI;
      check_forloop_overflow_error(&d_st);
    }
    for (rankA = 0; rankA < b_na; rankA++) {
      jpvt->data[rankA] = rankA + 1;
    }
  } else {
    emxInit_ptrdiff_t(&b_st, &jpvt_t, 1, &uc_emlrtRTEI, true);
    i = jpvt_t->size[0];
    jpvt_t->size[0] = b_A->size[1];
    emxEnsureCapacity_ptrdiff_t(&b_st, jpvt_t, i, &uc_emlrtRTEI);
    na = b_A->size[1];
    for (i = 0; i < na; i++) {
      jpvt_t->data[i] = (ptrdiff_t)0;
    }
    info_t = LAPACKE_dgeqp3(
        102, (ptrdiff_t)b_A->size[0], (ptrdiff_t)b_A->size[1], &b_A->data[0],
        (ptrdiff_t)b_A->size[0], &jpvt_t->data[0], &tau->data[0]);
    na = (int32_T)info_t;
    c_st.site = &jc_emlrtRSI;
    if (na != 0) {
      p = true;
      if (na != -4) {
        if (na == -1010) {
          emlrtErrorWithMessageIdR2018a(&c_st, &f_emlrtRTEI, "MATLAB:nomem",
                                        "MATLAB:nomem", 0);
        } else {
          emlrtErrorWithMessageIdR2018a(
              &c_st, &e_emlrtRTEI, "Coder:toolbox:LAPACKCallErrorInfo",
              "Coder:toolbox:LAPACKCallErrorInfo", 5, 4, 14, &fname[0], 12, na);
        }
      }
    } else {
      p = false;
    }
    if (p) {
      c_st.site = &kc_emlrtRSI;
      if ((1 <= b_na) && (b_na > 2147483646)) {
        d_st.site = &bb_emlrtRSI;
        check_forloop_overflow_error(&d_st);
      }
      for (na = 0; na < b_na; na++) {
        c_st.site = &lc_emlrtRSI;
        if ((1 <= rankA) && (rankA > 2147483646)) {
          d_st.site = &bb_emlrtRSI;
          check_forloop_overflow_error(&d_st);
        }
        for (i = 0; i < rankA; i++) {
          b_A->data[na * ma + i] = rtNaN;
        }
      }
      ma = muIntScalarMin_sint32(rankA, b_na);
      c_st.site = &mc_emlrtRSI;
      for (rankA = 0; rankA < ma; rankA++) {
        tau->data[rankA] = rtNaN;
      }
      na = ma + 1;
      c_st.site = &nc_emlrtRSI;
      if ((ma + 1 <= minmana) && (minmana > 2147483646)) {
        d_st.site = &bb_emlrtRSI;
        check_forloop_overflow_error(&d_st);
      }
      for (rankA = na; rankA <= minmana; rankA++) {
        tau->data[rankA - 1] = 0.0;
      }
      c_st.site = &oc_emlrtRSI;
      for (rankA = 0; rankA < b_na; rankA++) {
        jpvt->data[rankA] = rankA + 1;
      }
    } else {
      c_st.site = &pc_emlrtRSI;
      if ((1 <= b_na) && (b_na > 2147483646)) {
        d_st.site = &bb_emlrtRSI;
        check_forloop_overflow_error(&d_st);
      }
      for (rankA = 0; rankA < b_na; rankA++) {
        jpvt->data[rankA] = (int32_T)jpvt_t->data[rankA];
      }
    }
    emxFree_ptrdiff_t(&jpvt_t);
  }
  st.site = &fc_emlrtRSI;
  rankA = 0;
  tol = 0.0;
  if (b_A->size[0] < b_A->size[1]) {
    ma = b_A->size[0];
    na = b_A->size[1];
  } else {
    ma = b_A->size[1];
    na = b_A->size[0];
  }
  if (ma > 0) {
    tol = muDoubleScalarMin(1.4901161193847656E-8,
                            2.2204460492503131E-15 * (real_T)na) *
          muDoubleScalarAbs(b_A->data[0]);
    while ((rankA < ma) &&
           (!(muDoubleScalarAbs(b_A->data[rankA + b_A->size[0] * rankA]) <=
              tol))) {
      rankA++;
    }
  }
  if (rankA < ma) {
    b_st.site = &qc_emlrtRSI;
    y = NULL;
    m = emlrtCreateCharArray(2, &iv[0]);
    emlrtInitCharArrayR2013a(&b_st, 6, m, &rfmt[0]);
    emlrtAssign(&y, m);
    b_y = NULL;
    m = emlrtCreateDoubleScalar(tol);
    emlrtAssign(&b_y, m);
    c_st.site = &yf_emlrtRSI;
    emlrt_marshallIn(&c_st, b_sprintf(&c_st, y, b_y, &g_emlrtMCI),
                     "<output of sprintf>", str);
    b_st.site = &rc_emlrtRSI;
    b_warning(&b_st, rankA, str);
  }
  emxInit_real_T(&st, &b_B, 2, &wc_emlrtRTEI, true);
  i = b_B->size[0] * b_B->size[1];
  b_B->size[0] = B->size[0];
  b_B->size[1] = B->size[1];
  emxEnsureCapacity_real_T(sp, b_B, i, &wc_emlrtRTEI);
  na = B->size[0] * B->size[1] - 1;
  for (i = 0; i <= na; i++) {
    b_B->data[i] = B->data[i];
  }
  st.site = &gc_emlrtRSI;
  LSQFromQR(&st, b_A, tau, jpvt, b_B, rankA, Y);
  emxFree_real_T(&b_B);
  emxFree_real_T(&tau);
  emxFree_int32_T(&jpvt);
  emxFree_real_T(&b_A);
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtCTX)sp);
}

/* End of code generation (qrsolve.c) */
