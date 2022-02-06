/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * schur.c
 *
 * Code generation for function 'schur'
 *
 */

/* Include files */
#include "schur.h"
#include "SKLDBarycenter_data.h"
#include "SKLDBarycenter_emxutil.h"
#include "SKLDBarycenter_types.h"
#include "eml_int_forloop_overflow_check.h"
#include "rsf2csf.h"
#include "rt_nonfinite.h"
#include "warning.h"
#include "lapacke.h"
#include "mwmathutil.h"
#include <stddef.h>

/* Variable Definitions */
static emlrtRSInfo be_emlrtRSI = {
    35,                                                        /* lineNo */
    "schur",                                                   /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/schur.m" /* pathName */
};

static emlrtRSInfo ce_emlrtRSI = {
    39,                                                        /* lineNo */
    "schur",                                                   /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/schur.m" /* pathName */
};

static emlrtRSInfo de_emlrtRSI = {
    66,                                                        /* lineNo */
    "schur",                                                   /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/schur.m" /* pathName */
};

static emlrtRSInfo ee_emlrtRSI = {
    72,                                                        /* lineNo */
    "schur",                                                   /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/schur.m" /* pathName */
};

static emlrtRSInfo fe_emlrtRSI = {
    73,                                                        /* lineNo */
    "schur",                                                   /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/schur.m" /* pathName */
};

static emlrtRSInfo ge_emlrtRSI = {
    74,                                                        /* lineNo */
    "schur",                                                   /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/schur.m" /* pathName */
};

static emlrtRSInfo he_emlrtRSI = {
    83,                                                        /* lineNo */
    "schur",                                                   /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/schur.m" /* pathName */
};

static emlrtRSInfo ie_emlrtRSI = {
    29,             /* lineNo */
    "anyNonFinite", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/anyNonFinite.m" /* pathName
                                                                          */
};

static emlrtRSInfo je_emlrtRSI = {
    44,          /* lineNo */
    "vAllOrAny", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/vAllOrAny.m" /* pathName
                                                                       */
};

static emlrtRSInfo ke_emlrtRSI = {
    103,                  /* lineNo */
    "flatVectorAllOrAny", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/vAllOrAny.m" /* pathName
                                                                       */
};

static emlrtRSInfo le_emlrtRSI = {
    48,                                                      /* lineNo */
    "triu",                                                  /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/elmat/triu.m" /* pathName */
};

static emlrtRSInfo me_emlrtRSI = {
    47,                                                      /* lineNo */
    "triu",                                                  /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/elmat/triu.m" /* pathName */
};

static emlrtRSInfo ne_emlrtRSI = {
    15,       /* lineNo */
    "xgehrd", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgehrd.m" /* pathName
                                                                            */
};

static emlrtRSInfo oe_emlrtRSI = {
    85,             /* lineNo */
    "ceval_xgehrd", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgehrd.m" /* pathName
                                                                            */
};

static emlrtRSInfo pe_emlrtRSI =
    {
        69,                /* lineNo */
        "ceval_xungorghr", /* fcnName */
        "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/"
        "xungorghr.m" /* pathName */
};

static emlrtRSInfo qe_emlrtRSI =
    {
        11,          /* lineNo */
        "xungorghr", /* fcnName */
        "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/"
        "xungorghr.m" /* pathName */
};

static emlrtRSInfo re_emlrtRSI = {
    17,       /* lineNo */
    "xhseqr", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xhseqr.m" /* pathName
                                                                            */
};

static emlrtRSInfo se_emlrtRSI = {
    128,            /* lineNo */
    "ceval_xhseqr", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xhseqr.m" /* pathName
                                                                            */
};

static emlrtRSInfo nf_emlrtRSI = {
    43,                                                        /* lineNo */
    "schur",                                                   /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/schur.m" /* pathName */
};

static emlrtRSInfo of_emlrtRSI = {
    77,                                                        /* lineNo */
    "schur",                                                   /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/schur.m" /* pathName */
};

static emlrtRSInfo pf_emlrtRSI = {
    78,                                                        /* lineNo */
    "schur",                                                   /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/schur.m" /* pathName */
};

static emlrtRTEInfo j_emlrtRTEI = {
    18,                                                        /* lineNo */
    15,                                                        /* colNo */
    "schur",                                                   /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/schur.m" /* pName */
};

static emlrtRTEInfo ld_emlrtRTEI = {
    1,        /* lineNo */
    27,       /* colNo */
    "xgehrd", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgehrd.m" /* pName
                                                                            */
};

static emlrtRTEInfo md_emlrtRTEI = {
    38,                                                        /* lineNo */
    9,                                                         /* colNo */
    "schur",                                                   /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/schur.m" /* pName */
};

static emlrtRTEInfo nd_emlrtRTEI = {
    76,       /* lineNo */
    22,       /* colNo */
    "xgehrd", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgehrd.m" /* pName
                                                                            */
};

static emlrtRTEInfo od_emlrtRTEI = {
    72,                                                        /* lineNo */
    13,                                                        /* colNo */
    "schur",                                                   /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/schur.m" /* pName */
};

static emlrtRTEInfo pd_emlrtRTEI = {
    46,                                                        /* lineNo */
    9,                                                         /* colNo */
    "schur",                                                   /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/schur.m" /* pName */
};

static emlrtRTEInfo qd_emlrtRTEI = {
    86,       /* lineNo */
    9,        /* colNo */
    "xgehrd", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgehrd.m" /* pName
                                                                            */
};

static emlrtRTEInfo rd_emlrtRTEI = {
    87,       /* lineNo */
    9,        /* colNo */
    "xgehrd", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgehrd.m" /* pName
                                                                            */
};

static emlrtRTEInfo sd_emlrtRTEI = {
    111,      /* lineNo */
    29,       /* colNo */
    "xhseqr", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xhseqr.m" /* pName
                                                                            */
};

static emlrtRTEInfo td_emlrtRTEI = {
    112,      /* lineNo */
    29,       /* colNo */
    "xhseqr", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xhseqr.m" /* pName
                                                                            */
};

static emlrtRTEInfo ud_emlrtRTEI = {
    129,      /* lineNo */
    9,        /* colNo */
    "xhseqr", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xhseqr.m" /* pName
                                                                            */
};

static emlrtRTEInfo vd_emlrtRTEI = {
    130,      /* lineNo */
    9,        /* colNo */
    "xhseqr", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xhseqr.m" /* pName
                                                                            */
};

static emlrtRTEInfo wd_emlrtRTEI = {
    56,                                                        /* lineNo */
    14,                                                        /* colNo */
    "schur",                                                   /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/schur.m" /* pName */
};

static emlrtRTEInfo xd_emlrtRTEI = {
    1,                                                         /* lineNo */
    18,                                                        /* colNo */
    "schur",                                                   /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/schur.m" /* pName */
};

static emlrtRTEInfo yd_emlrtRTEI = {
    111,      /* lineNo */
    9,        /* colNo */
    "xhseqr", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xhseqr.m" /* pName
                                                                            */
};

static emlrtRTEInfo ae_emlrtRTEI = {
    112,      /* lineNo */
    9,        /* colNo */
    "xhseqr", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xhseqr.m" /* pName
                                                                            */
};

static emlrtRTEInfo fe_emlrtRTEI = {
    42,                                                        /* lineNo */
    9,                                                         /* colNo */
    "schur",                                                   /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/schur.m" /* pName */
};

static emlrtRTEInfo ge_emlrtRTEI = {
    77,                                                        /* lineNo */
    9,                                                         /* colNo */
    "schur",                                                   /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/schur.m" /* pName */
};

static emlrtRTEInfo he_emlrtRTEI = {
    101,      /* lineNo */
    28,       /* colNo */
    "xhseqr", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xhseqr.m" /* pName
                                                                            */
};

static emlrtRTEInfo ie_emlrtRTEI = {
    101,      /* lineNo */
    9,        /* colNo */
    "xhseqr", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xhseqr.m" /* pName
                                                                            */
};

/* Function Definitions */
void b_schur(const emlrtStack *sp, const emxArray_creal_T *A,
             emxArray_creal_T *V, emxArray_creal_T *T)
{
  static const char_T b_fname[14] = {'L', 'A', 'P', 'A', 'C', 'K', 'E',
                                     '_', 'z', 'u', 'n', 'g', 'h', 'r'};
  static const char_T c_fname[14] = {'L', 'A', 'P', 'A', 'C', 'K', 'E',
                                     '_', 'z', 'h', 's', 'e', 'q', 'r'};
  static const char_T fname[14] = {'L', 'A', 'P', 'A', 'C', 'K', 'E',
                                   '_', 'z', 'g', 'e', 'h', 'r', 'd'};
  ptrdiff_t info_t;
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack d_st;
  emlrtStack e_st;
  emlrtStack st;
  emxArray_creal_T *tau;
  emxArray_creal_T *w;
  int32_T i;
  int32_T istart;
  int32_T j;
  int32_T jend;
  int32_T nx;
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
  if (A->size[0] != A->size[1]) {
    emlrtErrorWithMessageIdR2018a(sp, &j_emlrtRTEI, "Coder:MATLAB:square",
                                  "Coder:MATLAB:square", 0);
  }
  st.site = &be_emlrtRSI;
  b_st.site = &ie_emlrtRSI;
  c_st.site = &je_emlrtRSI;
  nx = A->size[0] * A->size[1];
  p = true;
  d_st.site = &ke_emlrtRSI;
  if ((1 <= nx) && (nx > 2147483646)) {
    e_st.site = &bb_emlrtRSI;
    check_forloop_overflow_error(&e_st);
  }
  for (istart = 0; istart < nx; istart++) {
    if ((!p) || (muDoubleScalarIsInf(A->data[istart].re) ||
                 muDoubleScalarIsInf(A->data[istart].im) ||
                 (muDoubleScalarIsNaN(A->data[istart].re) ||
                  muDoubleScalarIsNaN(A->data[istart].im)))) {
      p = false;
    }
  }
  if (!p) {
    j = V->size[0] * V->size[1];
    V->size[0] = A->size[0];
    V->size[1] = A->size[1];
    emxEnsureCapacity_creal_T(sp, V, j, &fe_emlrtRTEI);
    nx = A->size[0] * A->size[1];
    for (j = 0; j < nx; j++) {
      V->data[j].re = rtNaN;
      V->data[j].im = 0.0;
    }
    st.site = &nf_emlrtRSI;
    nx = V->size[0];
    if ((V->size[0] != 0) && (V->size[1] != 0) && (1 < V->size[0])) {
      istart = 2;
      if (V->size[0] - 2 < V->size[1] - 1) {
        jend = V->size[0] - 1;
      } else {
        jend = V->size[1];
      }
      b_st.site = &me_emlrtRSI;
      if (jend > 2147483646) {
        c_st.site = &bb_emlrtRSI;
        check_forloop_overflow_error(&c_st);
      }
      for (j = 0; j < jend; j++) {
        b_st.site = &le_emlrtRSI;
        if ((istart <= nx) && (nx > 2147483646)) {
          c_st.site = &bb_emlrtRSI;
          check_forloop_overflow_error(&c_st);
        }
        for (i = istart; i <= nx; i++) {
          V->data[(i + V->size[0] * j) - 1].re = 0.0;
          V->data[(i + V->size[0] * j) - 1].im = 0.0;
        }
        istart++;
      }
    }
    j = T->size[0] * T->size[1];
    T->size[0] = A->size[0];
    T->size[1] = A->size[1];
    emxEnsureCapacity_creal_T(sp, T, j, &pd_emlrtRTEI);
    nx = A->size[0] * A->size[1];
    for (j = 0; j < nx; j++) {
      T->data[j].re = rtNaN;
      T->data[j].im = 0.0;
    }
  } else {
    st.site = &de_emlrtRSI;
    j = T->size[0] * T->size[1];
    T->size[0] = A->size[0];
    T->size[1] = A->size[1];
    emxEnsureCapacity_creal_T(&st, T, j, &ld_emlrtRTEI);
    nx = A->size[0] * A->size[1];
    for (j = 0; j < nx; j++) {
      T->data[j] = A->data[j];
    }
    emxInit_creal_T(&st, &tau, 1, &xd_emlrtRTEI, true);
    b_st.site = &ne_emlrtRSI;
    nx = T->size[0];
    j = tau->size[0];
    if (T->size[0] < 1) {
      tau->size[0] = 0;
    } else {
      tau->size[0] = T->size[0] - 1;
    }
    emxEnsureCapacity_creal_T(&b_st, tau, j, &nd_emlrtRTEI);
    if (T->size[0] > 1) {
      info_t = LAPACKE_zgehrd(102, (ptrdiff_t)T->size[0], (ptrdiff_t)1,
                              (ptrdiff_t)T->size[0],
                              (lapack_complex_double *)&T->data[0],
                              (ptrdiff_t)muIntScalarMax_sint32(1, nx),
                              (lapack_complex_double *)&tau->data[0]);
      jend = (int32_T)info_t;
      c_st.site = &oe_emlrtRSI;
      if (jend != 0) {
        p = true;
        if (jend != -5) {
          if (jend == -1010) {
            emlrtErrorWithMessageIdR2018a(&c_st, &f_emlrtRTEI, "MATLAB:nomem",
                                          "MATLAB:nomem", 0);
          } else {
            emlrtErrorWithMessageIdR2018a(&c_st, &e_emlrtRTEI,
                                          "Coder:toolbox:LAPACKCallErrorInfo",
                                          "Coder:toolbox:LAPACKCallErrorInfo",
                                          5, 4, 14, &fname[0], 12, jend);
          }
        }
      } else {
        p = false;
      }
      if (p) {
        nx = T->size[0];
        istart = T->size[1];
        j = T->size[0] * T->size[1];
        T->size[0] = nx;
        T->size[1] = istart;
        emxEnsureCapacity_creal_T(&b_st, T, j, &qd_emlrtRTEI);
        nx *= istart;
        for (j = 0; j < nx; j++) {
          T->data[j].re = rtNaN;
          T->data[j].im = 0.0;
        }
        nx = tau->size[0];
        j = tau->size[0];
        tau->size[0] = nx;
        emxEnsureCapacity_creal_T(&b_st, tau, j, &rd_emlrtRTEI);
        for (j = 0; j < nx; j++) {
          tau->data[j].re = rtNaN;
          tau->data[j].im = 0.0;
        }
      }
    }
    st.site = &of_emlrtRSI;
    j = V->size[0] * V->size[1];
    V->size[0] = T->size[0];
    V->size[1] = T->size[1];
    emxEnsureCapacity_creal_T(&st, V, j, &ge_emlrtRTEI);
    nx = T->size[0] * T->size[1];
    for (j = 0; j < nx; j++) {
      V->data[j] = T->data[j];
    }
    b_st.site = &qe_emlrtRSI;
    if ((V->size[0] != 0) && (V->size[1] != 0)) {
      info_t = LAPACKE_zunghr(
          102, (ptrdiff_t)A->size[0], (ptrdiff_t)1, (ptrdiff_t)A->size[0],
          (lapack_complex_double *)&V->data[0], (ptrdiff_t)A->size[0],
          (lapack_complex_double *)&tau->data[0]);
      jend = (int32_T)info_t;
      c_st.site = &pe_emlrtRSI;
      if (jend != 0) {
        p = true;
        b_p = false;
        if (jend == -5) {
          b_p = true;
        } else if (jend == -7) {
          b_p = true;
        }
        if (!b_p) {
          if (jend == -1010) {
            emlrtErrorWithMessageIdR2018a(&c_st, &f_emlrtRTEI, "MATLAB:nomem",
                                          "MATLAB:nomem", 0);
          } else {
            emlrtErrorWithMessageIdR2018a(&c_st, &e_emlrtRTEI,
                                          "Coder:toolbox:LAPACKCallErrorInfo",
                                          "Coder:toolbox:LAPACKCallErrorInfo",
                                          5, 4, 14, &b_fname[0], 12, jend);
          }
        }
      } else {
        p = false;
      }
      if (p) {
        nx = V->size[0];
        istart = V->size[1];
        j = V->size[0] * V->size[1];
        V->size[0] = nx;
        V->size[1] = istart;
        emxEnsureCapacity_creal_T(&b_st, V, j, &ge_emlrtRTEI);
        nx *= istart;
        for (j = 0; j < nx; j++) {
          V->data[j].re = rtNaN;
          V->data[j].im = 0.0;
        }
      }
    }
    emxFree_creal_T(&tau);
    st.site = &pf_emlrtRSI;
    b_st.site = &re_emlrtRSI;
    nx = T->size[0];
    info_t = (ptrdiff_t)T->size[0];
    if ((T->size[0] != 0) && (T->size[1] != 0)) {
      emxInit_creal_T(&b_st, &w, 2, &ie_emlrtRTEI, true);
      j = w->size[0] * w->size[1];
      w->size[0] = 1;
      w->size[1] = T->size[0];
      emxEnsureCapacity_creal_T(&b_st, w, j, &he_emlrtRTEI);
      info_t = LAPACKE_zhseqr(102, 'S', 'V', info_t, (ptrdiff_t)1,
                              (ptrdiff_t)T->size[0],
                              (lapack_complex_double *)&T->data[0], info_t,
                              (lapack_complex_double *)&w->data[0],
                              (lapack_complex_double *)&V->data[0],
                              (ptrdiff_t)muIntScalarMax_sint32(1, nx));
      jend = (int32_T)info_t;
      c_st.site = &se_emlrtRSI;
      emxFree_creal_T(&w);
      if (jend < 0) {
        p = true;
        b_p = false;
        if (jend == -7) {
          b_p = true;
        } else if (jend == -10) {
          b_p = true;
        }
        if (!b_p) {
          if (jend == -1010) {
            emlrtErrorWithMessageIdR2018a(&c_st, &f_emlrtRTEI, "MATLAB:nomem",
                                          "MATLAB:nomem", 0);
          } else {
            emlrtErrorWithMessageIdR2018a(&c_st, &e_emlrtRTEI,
                                          "Coder:toolbox:LAPACKCallErrorInfo",
                                          "Coder:toolbox:LAPACKCallErrorInfo",
                                          5, 4, 14, &c_fname[0], 12, jend);
          }
        }
      } else {
        p = false;
      }
      if (p) {
        nx = T->size[0];
        istart = T->size[1];
        j = T->size[0] * T->size[1];
        T->size[0] = nx;
        T->size[1] = istart;
        emxEnsureCapacity_creal_T(&b_st, T, j, &ud_emlrtRTEI);
        nx *= istart;
        for (j = 0; j < nx; j++) {
          T->data[j].re = rtNaN;
          T->data[j].im = 0.0;
        }
        nx = V->size[0];
        istart = V->size[1];
        j = V->size[0] * V->size[1];
        V->size[0] = nx;
        V->size[1] = istart;
        emxEnsureCapacity_creal_T(&b_st, V, j, &vd_emlrtRTEI);
        nx *= istart;
        for (j = 0; j < nx; j++) {
          V->data[j].re = rtNaN;
          V->data[j].im = 0.0;
        }
      }
    } else {
      jend = 0;
    }
    if (jend != 0) {
      st.site = &he_emlrtRSI;
      c_warning(&st);
    }
  }
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtCTX)sp);
}

void schur(const emlrtStack *sp, const emxArray_real_T *A, emxArray_creal_T *V,
           emxArray_creal_T *T)
{
  static const char_T b_fname[14] = {'L', 'A', 'P', 'A', 'C', 'K', 'E',
                                     '_', 'd', 'o', 'r', 'g', 'h', 'r'};
  static const char_T c_fname[14] = {'L', 'A', 'P', 'A', 'C', 'K', 'E',
                                     '_', 'd', 'h', 's', 'e', 'q', 'r'};
  static const char_T fname[14] = {'L', 'A', 'P', 'A', 'C', 'K', 'E',
                                   '_', 'd', 'g', 'e', 'h', 'r', 'd'};
  ptrdiff_t info_t;
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack d_st;
  emlrtStack e_st;
  emlrtStack st;
  emxArray_real_T *Vr;
  emxArray_real_T *b_A;
  emxArray_real_T *tau;
  emxArray_real_T *wi;
  emxArray_real_T *wr;
  int32_T i;
  int32_T istart;
  int32_T j;
  int32_T jend;
  int32_T nx;
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
  if (A->size[0] != A->size[1]) {
    emlrtErrorWithMessageIdR2018a(sp, &j_emlrtRTEI, "Coder:MATLAB:square",
                                  "Coder:MATLAB:square", 0);
  }
  st.site = &be_emlrtRSI;
  b_st.site = &ie_emlrtRSI;
  c_st.site = &je_emlrtRSI;
  nx = A->size[0] * A->size[1];
  p = true;
  d_st.site = &ke_emlrtRSI;
  if ((1 <= nx) && (nx > 2147483646)) {
    e_st.site = &bb_emlrtRSI;
    check_forloop_overflow_error(&e_st);
  }
  for (istart = 0; istart < nx; istart++) {
    if ((!p) || (muDoubleScalarIsInf(A->data[istart]) ||
                 muDoubleScalarIsNaN(A->data[istart]))) {
      p = false;
    }
  }
  if (!p) {
    j = V->size[0] * V->size[1];
    V->size[0] = A->size[0];
    V->size[1] = A->size[1];
    emxEnsureCapacity_creal_T(sp, V, j, &md_emlrtRTEI);
    nx = A->size[0] * A->size[1];
    for (j = 0; j < nx; j++) {
      V->data[j].re = rtNaN;
      V->data[j].im = 0.0;
    }
    st.site = &ce_emlrtRSI;
    nx = V->size[0];
    if ((V->size[0] != 0) && (V->size[1] != 0) && (2 < V->size[0])) {
      istart = 3;
      if (V->size[0] - 3 < V->size[1] - 1) {
        jend = V->size[0] - 2;
      } else {
        jend = V->size[1];
      }
      b_st.site = &me_emlrtRSI;
      if (jend > 2147483646) {
        c_st.site = &bb_emlrtRSI;
        check_forloop_overflow_error(&c_st);
      }
      for (j = 0; j < jend; j++) {
        b_st.site = &le_emlrtRSI;
        if ((istart <= nx) && (nx > 2147483646)) {
          c_st.site = &bb_emlrtRSI;
          check_forloop_overflow_error(&c_st);
        }
        for (i = istart; i <= nx; i++) {
          V->data[(i + V->size[0] * j) - 1].re = 0.0;
          V->data[(i + V->size[0] * j) - 1].im = 0.0;
        }
        istart++;
      }
    }
    j = T->size[0] * T->size[1];
    T->size[0] = A->size[0];
    T->size[1] = A->size[1];
    emxEnsureCapacity_creal_T(sp, T, j, &pd_emlrtRTEI);
    nx = A->size[0] * A->size[1];
    for (j = 0; j < nx; j++) {
      T->data[j].re = rtNaN;
      T->data[j].im = 0.0;
    }
  } else {
    emxInit_real_T(sp, &b_A, 2, &xd_emlrtRTEI, true);
    st.site = &de_emlrtRSI;
    j = b_A->size[0] * b_A->size[1];
    b_A->size[0] = A->size[0];
    b_A->size[1] = A->size[1];
    emxEnsureCapacity_real_T(&st, b_A, j, &ld_emlrtRTEI);
    nx = A->size[0] * A->size[1];
    for (j = 0; j < nx; j++) {
      b_A->data[j] = A->data[j];
    }
    emxInit_real_T(&st, &tau, 1, &xd_emlrtRTEI, true);
    b_st.site = &ne_emlrtRSI;
    nx = b_A->size[0];
    j = tau->size[0];
    if (b_A->size[0] < 1) {
      tau->size[0] = 0;
    } else {
      tau->size[0] = b_A->size[0] - 1;
    }
    emxEnsureCapacity_real_T(&b_st, tau, j, &nd_emlrtRTEI);
    if (b_A->size[0] > 1) {
      info_t = LAPACKE_dgehrd(102, (ptrdiff_t)b_A->size[0], (ptrdiff_t)1,
                              (ptrdiff_t)b_A->size[0], &b_A->data[0],
                              (ptrdiff_t)muIntScalarMax_sint32(1, nx),
                              &tau->data[0]);
      jend = (int32_T)info_t;
      c_st.site = &oe_emlrtRSI;
      if (jend != 0) {
        p = true;
        if (jend != -5) {
          if (jend == -1010) {
            emlrtErrorWithMessageIdR2018a(&c_st, &f_emlrtRTEI, "MATLAB:nomem",
                                          "MATLAB:nomem", 0);
          } else {
            emlrtErrorWithMessageIdR2018a(&c_st, &e_emlrtRTEI,
                                          "Coder:toolbox:LAPACKCallErrorInfo",
                                          "Coder:toolbox:LAPACKCallErrorInfo",
                                          5, 4, 14, &fname[0], 12, jend);
          }
        }
      } else {
        p = false;
      }
      if (p) {
        nx = b_A->size[0];
        istart = b_A->size[1];
        j = b_A->size[0] * b_A->size[1];
        b_A->size[0] = nx;
        b_A->size[1] = istart;
        emxEnsureCapacity_real_T(&b_st, b_A, j, &qd_emlrtRTEI);
        nx *= istart;
        for (j = 0; j < nx; j++) {
          b_A->data[j] = rtNaN;
        }
        nx = tau->size[0];
        j = tau->size[0];
        tau->size[0] = nx;
        emxEnsureCapacity_real_T(&b_st, tau, j, &rd_emlrtRTEI);
        for (j = 0; j < nx; j++) {
          tau->data[j] = rtNaN;
        }
      }
    }
    emxInit_real_T(&b_st, &Vr, 2, &wd_emlrtRTEI, true);
    st.site = &ee_emlrtRSI;
    j = Vr->size[0] * Vr->size[1];
    Vr->size[0] = b_A->size[0];
    Vr->size[1] = b_A->size[1];
    emxEnsureCapacity_real_T(&st, Vr, j, &od_emlrtRTEI);
    nx = b_A->size[0] * b_A->size[1];
    for (j = 0; j < nx; j++) {
      Vr->data[j] = b_A->data[j];
    }
    b_st.site = &qe_emlrtRSI;
    if ((Vr->size[0] != 0) && (Vr->size[1] != 0)) {
      info_t = LAPACKE_dorghr(102, (ptrdiff_t)A->size[0], (ptrdiff_t)1,
                              (ptrdiff_t)A->size[0], &Vr->data[0],
                              (ptrdiff_t)A->size[0], &tau->data[0]);
      jend = (int32_T)info_t;
      c_st.site = &pe_emlrtRSI;
      if (jend != 0) {
        p = true;
        b_p = false;
        if (jend == -5) {
          b_p = true;
        } else if (jend == -7) {
          b_p = true;
        }
        if (!b_p) {
          if (jend == -1010) {
            emlrtErrorWithMessageIdR2018a(&c_st, &f_emlrtRTEI, "MATLAB:nomem",
                                          "MATLAB:nomem", 0);
          } else {
            emlrtErrorWithMessageIdR2018a(&c_st, &e_emlrtRTEI,
                                          "Coder:toolbox:LAPACKCallErrorInfo",
                                          "Coder:toolbox:LAPACKCallErrorInfo",
                                          5, 4, 14, &b_fname[0], 12, jend);
          }
        }
      } else {
        p = false;
      }
      if (p) {
        nx = Vr->size[0];
        istart = Vr->size[1];
        j = Vr->size[0] * Vr->size[1];
        Vr->size[0] = nx;
        Vr->size[1] = istart;
        emxEnsureCapacity_real_T(&b_st, Vr, j, &od_emlrtRTEI);
        nx *= istart;
        for (j = 0; j < nx; j++) {
          Vr->data[j] = rtNaN;
        }
      }
    }
    emxFree_real_T(&tau);
    st.site = &fe_emlrtRSI;
    b_st.site = &re_emlrtRSI;
    nx = b_A->size[0];
    info_t = (ptrdiff_t)b_A->size[0];
    if ((b_A->size[0] != 0) && (b_A->size[1] != 0)) {
      emxInit_real_T(&b_st, &wr, 2, &yd_emlrtRTEI, true);
      emxInit_real_T(&b_st, &wi, 2, &ae_emlrtRTEI, true);
      j = wr->size[0] * wr->size[1];
      wr->size[0] = 1;
      wr->size[1] = b_A->size[0];
      emxEnsureCapacity_real_T(&b_st, wr, j, &sd_emlrtRTEI);
      j = wi->size[0] * wi->size[1];
      wi->size[0] = 1;
      wi->size[1] = b_A->size[0];
      emxEnsureCapacity_real_T(&b_st, wi, j, &td_emlrtRTEI);
      info_t = LAPACKE_dhseqr(102, 'S', 'V', info_t, (ptrdiff_t)1,
                              (ptrdiff_t)b_A->size[0], &b_A->data[0], info_t,
                              &wr->data[0], &wi->data[0], &Vr->data[0],
                              (ptrdiff_t)muIntScalarMax_sint32(1, nx));
      jend = (int32_T)info_t;
      c_st.site = &se_emlrtRSI;
      emxFree_real_T(&wi);
      emxFree_real_T(&wr);
      if (jend < 0) {
        p = true;
        b_p = false;
        if (jend == -7) {
          b_p = true;
        } else if (jend == -11) {
          b_p = true;
        }
        if (!b_p) {
          if (jend == -1010) {
            emlrtErrorWithMessageIdR2018a(&c_st, &f_emlrtRTEI, "MATLAB:nomem",
                                          "MATLAB:nomem", 0);
          } else {
            emlrtErrorWithMessageIdR2018a(&c_st, &e_emlrtRTEI,
                                          "Coder:toolbox:LAPACKCallErrorInfo",
                                          "Coder:toolbox:LAPACKCallErrorInfo",
                                          5, 4, 14, &c_fname[0], 12, jend);
          }
        }
      } else {
        p = false;
      }
      if (p) {
        nx = b_A->size[0];
        istart = b_A->size[1];
        j = b_A->size[0] * b_A->size[1];
        b_A->size[0] = nx;
        b_A->size[1] = istart;
        emxEnsureCapacity_real_T(&b_st, b_A, j, &ud_emlrtRTEI);
        nx *= istart;
        for (j = 0; j < nx; j++) {
          b_A->data[j] = rtNaN;
        }
        nx = Vr->size[0];
        istart = Vr->size[1];
        j = Vr->size[0] * Vr->size[1];
        Vr->size[0] = nx;
        Vr->size[1] = istart;
        emxEnsureCapacity_real_T(&b_st, Vr, j, &vd_emlrtRTEI);
        nx *= istart;
        for (j = 0; j < nx; j++) {
          Vr->data[j] = rtNaN;
        }
      }
    } else {
      jend = 0;
    }
    st.site = &ge_emlrtRSI;
    rsf2csf(&st, Vr, b_A, V, T);
    emxFree_real_T(&b_A);
    emxFree_real_T(&Vr);
    if (jend != 0) {
      st.site = &he_emlrtRSI;
      c_warning(&st);
    }
  }
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtCTX)sp);
}

/* End of code generation (schur.c) */
