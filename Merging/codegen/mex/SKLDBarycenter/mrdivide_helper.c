/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * mrdivide_helper.c
 *
 * Code generation for function 'mrdivide_helper'
 *
 */

/* Include files */
#include "mrdivide_helper.h"
#include "SKLDBarycenter_data.h"
#include "SKLDBarycenter_emxutil.h"
#include "SKLDBarycenter_types.h"
#include "eml_int_forloop_overflow_check.h"
#include "qrsolve.h"
#include "repmat.h"
#include "rt_nonfinite.h"
#include "warning.h"
#include "blas.h"
#include "lapacke.h"
#include "mwmathutil.h"
#include <stddef.h>

/* Variable Definitions */
static emlrtRSInfo
    nb_emlrtRSI =
        {
            42,      /* lineNo */
            "mrdiv", /* fcnName */
            "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/"
            "mrdivide_helper.m" /* pathName */
};

static emlrtRSInfo
    ob_emlrtRSI =
        {
            44,      /* lineNo */
            "mrdiv", /* fcnName */
            "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/"
            "mrdivide_helper.m" /* pathName */
};

static emlrtRSInfo pb_emlrtRSI = {
    67,        /* lineNo */
    "lusolve", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/lusolve.m" /* pathName
                                                                     */
};

static emlrtRSInfo qb_emlrtRSI = {
    112,          /* lineNo */
    "lusolveNxN", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/lusolve.m" /* pathName
                                                                     */
};

static emlrtRSInfo rb_emlrtRSI = {
    107,          /* lineNo */
    "lusolveNxN", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/lusolve.m" /* pathName
                                                                     */
};

static emlrtRSInfo sb_emlrtRSI = {
    135,          /* lineNo */
    "XtimesInvA", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/lusolve.m" /* pathName
                                                                     */
};

static emlrtRSInfo tb_emlrtRSI = {
    140,          /* lineNo */
    "XtimesInvA", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/lusolve.m" /* pathName
                                                                     */
};

static emlrtRSInfo ub_emlrtRSI = {
    142,          /* lineNo */
    "XtimesInvA", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/lusolve.m" /* pathName
                                                                     */
};

static emlrtRSInfo vb_emlrtRSI = {
    147,          /* lineNo */
    "XtimesInvA", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/lusolve.m" /* pathName
                                                                     */
};

static emlrtRSInfo wb_emlrtRSI = {
    27,       /* lineNo */
    "xgetrf", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgetrf.m" /* pathName
                                                                            */
};

static emlrtRSInfo xb_emlrtRSI = {
    91,             /* lineNo */
    "ceval_xgetrf", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgetrf.m" /* pathName
                                                                            */
};

static emlrtRSInfo yb_emlrtRSI = {
    58,             /* lineNo */
    "ceval_xgetrf", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgetrf.m" /* pathName
                                                                            */
};

static emlrtRSInfo bc_emlrtRSI = {
    67,      /* lineNo */
    "xtrsm", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+blas/xtrsm.m" /* pathName
                                                                         */
};

static emlrtRSInfo dc_emlrtRSI = {
    90,              /* lineNo */
    "warn_singular", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/lusolve.m" /* pathName
                                                                     */
};

static emlrtRTEInfo
    fc_emlrtRTEI =
        {
            31,                /* lineNo */
            5,                 /* colNo */
            "mrdivide_helper", /* fName */
            "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/"
            "mrdivide_helper.m" /* pName */
};

static emlrtRTEInfo
    gc_emlrtRTEI =
        {
            44,                /* lineNo */
            32,                /* colNo */
            "mrdivide_helper", /* fName */
            "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/"
            "mrdivide_helper.m" /* pName */
};

static emlrtRTEInfo
    hc_emlrtRTEI =
        {
            42,                /* lineNo */
            5,                 /* colNo */
            "mrdivide_helper", /* fName */
            "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/"
            "mrdivide_helper.m" /* pName */
};

static emlrtRTEInfo
    ic_emlrtRTEI =
        {
            44,                /* lineNo */
            35,                /* colNo */
            "mrdivide_helper", /* fName */
            "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/"
            "mrdivide_helper.m" /* pName */
};

static emlrtRTEInfo jc_emlrtRTEI = {
    1,        /* lineNo */
    37,       /* colNo */
    "xgetrf", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgetrf.m" /* pName
                                                                            */
};

static emlrtRTEInfo
    kc_emlrtRTEI =
        {
            44,                /* lineNo */
            5,                 /* colNo */
            "mrdivide_helper", /* fName */
            "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/"
            "mrdivide_helper.m" /* pName */
};

static emlrtRTEInfo lc_emlrtRTEI = {
    58,       /* lineNo */
    29,       /* colNo */
    "xgetrf", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgetrf.m" /* pName
                                                                            */
};

static emlrtRTEInfo mc_emlrtRTEI = {
    89,       /* lineNo */
    27,       /* colNo */
    "xgetrf", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgetrf.m" /* pName
                                                                            */
};

static emlrtRTEInfo
    nc_emlrtRTEI =
        {
            44,                /* lineNo */
            9,                 /* colNo */
            "mrdivide_helper", /* fName */
            "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/"
            "mrdivide_helper.m" /* pName */
};

static emlrtRTEInfo
    oc_emlrtRTEI =
        {
            25,                /* lineNo */
            14,                /* colNo */
            "mrdivide_helper", /* fName */
            "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/"
            "mrdivide_helper.m" /* pName */
};

static emlrtRTEInfo pc_emlrtRTEI = {
    58,       /* lineNo */
    5,        /* colNo */
    "xgetrf", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgetrf.m" /* pName
                                                                            */
};

/* Function Definitions */
void b_mrdiv(const emlrtStack *sp, const emxArray_real_T *A,
             const emxArray_creal_T *B, emxArray_creal_T *Y)
{
  static const char_T fname[19] = {'L', 'A', 'P', 'A', 'C', 'K', 'E',
                                   '_', 'z', 'g', 'e', 't', 'r', 'f',
                                   '_', 'w', 'o', 'r', 'k'};
  ptrdiff_t info_t;
  ptrdiff_t lda_t;
  ptrdiff_t ldb_t;
  ptrdiff_t n_t;
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack d_st;
  emlrtStack e_st;
  emlrtStack f_st;
  emlrtStack st;
  emxArray_creal_T *b_A;
  emxArray_creal_T *b_B;
  emxArray_int32_T *ipiv;
  emxArray_ptrdiff_t *ipiv_t;
  emxArray_ptrdiff_t *r;
  emxArray_real_T *c_A;
  real_T temp_im;
  real_T temp_re;
  int32_T b_i;
  int32_T i;
  int32_T i1;
  int32_T j;
  int32_T loop_ub;
  int32_T n;
  char_T DIAGA1;
  char_T SIDE1;
  char_T TRANSA1;
  char_T UPLO1;
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
  emxInit_creal_T(sp, &b_A, 2, &nc_emlrtRTEI, true);
  emxInit_int32_T(sp, &ipiv, 2, &oc_emlrtRTEI, true);
  emxInit_ptrdiff_t(sp, &ipiv_t, 1, &pc_emlrtRTEI, true);
  emxInit_ptrdiff_t(sp, &r, 1, &lc_emlrtRTEI, true);
  emxInit_creal_T(sp, &b_B, 2, &gc_emlrtRTEI, true);
  emxInit_real_T(sp, &c_A, 2, &ic_emlrtRTEI, true);
  if ((A->size[0] == 0) || (A->size[1] == 0) ||
      ((B->size[0] == 0) || (B->size[1] == 0))) {
    i = Y->size[0] * Y->size[1];
    Y->size[0] = A->size[0];
    Y->size[1] = B->size[0];
    emxEnsureCapacity_creal_T(sp, Y, i, &fc_emlrtRTEI);
    loop_ub = A->size[0] * B->size[0];
    for (i = 0; i < loop_ub; i++) {
      Y->data[i].re = 0.0;
      Y->data[i].im = 0.0;
    }
  } else if (B->size[0] == B->size[1]) {
    st.site = &nb_emlrtRSI;
    b_st.site = &pb_emlrtRSI;
    i = Y->size[0] * Y->size[1];
    Y->size[0] = A->size[0];
    Y->size[1] = A->size[1];
    emxEnsureCapacity_creal_T(&b_st, Y, i, &hc_emlrtRTEI);
    loop_ub = A->size[0] * A->size[1];
    for (i = 0; i < loop_ub; i++) {
      Y->data[i].re = A->data[i];
      Y->data[i].im = 0.0;
    }
    c_st.site = &rb_emlrtRSI;
    n = B->size[1];
    d_st.site = &sb_emlrtRSI;
    i = b_A->size[0] * b_A->size[1];
    b_A->size[0] = B->size[0];
    b_A->size[1] = B->size[1];
    emxEnsureCapacity_creal_T(&d_st, b_A, i, &jc_emlrtRTEI);
    loop_ub = B->size[0] * B->size[1];
    for (i = 0; i < loop_ub; i++) {
      b_A->data[i] = B->data[i];
    }
    e_st.site = &wb_emlrtRSI;
    f_st.site = &yb_emlrtRSI;
    repmat(&f_st, (ptrdiff_t)0.0, muIntScalarMin_sint32(n, n), r);
    i = ipiv_t->size[0];
    ipiv_t->size[0] = r->size[0];
    emxEnsureCapacity_ptrdiff_t(&e_st, ipiv_t, i, &lc_emlrtRTEI);
    info_t =
        LAPACKE_zgetrf_work(102, (ptrdiff_t)B->size[1], (ptrdiff_t)B->size[1],
                            (lapack_complex_double *)&b_A->data[0],
                            (ptrdiff_t)B->size[1], &ipiv_t->data[0]);
    loop_ub = (int32_T)info_t;
    i = ipiv->size[0] * ipiv->size[1];
    ipiv->size[0] = 1;
    ipiv->size[1] = ipiv_t->size[0];
    emxEnsureCapacity_int32_T(&e_st, ipiv, i, &mc_emlrtRTEI);
    f_st.site = &xb_emlrtRSI;
    if (loop_ub < 0) {
      if (loop_ub == -1010) {
        emlrtErrorWithMessageIdR2018a(&f_st, &f_emlrtRTEI, "MATLAB:nomem",
                                      "MATLAB:nomem", 0);
      } else {
        emlrtErrorWithMessageIdR2018a(&f_st, &e_emlrtRTEI,
                                      "Coder:toolbox:LAPACKCallErrorInfo",
                                      "Coder:toolbox:LAPACKCallErrorInfo", 5, 4,
                                      19, &fname[0], 12, loop_ub);
      }
    }
    i = ipiv_t->size[0] - 1;
    for (n = 0; n <= i; n++) {
      ipiv->data[n] = (int32_T)ipiv_t->data[n];
    }
    n = Y->size[0];
    d_st.site = &tb_emlrtRSI;
    e_st.site = &bc_emlrtRSI;
    DIAGA1 = 'N';
    TRANSA1 = 'N';
    UPLO1 = 'U';
    SIDE1 = 'R';
    info_t = (ptrdiff_t)Y->size[0];
    n_t = (ptrdiff_t)B->size[1];
    lda_t = (ptrdiff_t)B->size[1];
    ldb_t = (ptrdiff_t)Y->size[0];
    ztrsm(&SIDE1, &UPLO1, &TRANSA1, &DIAGA1, &info_t, &n_t, (real_T *)&dc1,
          (real_T *)&b_A->data[0], &lda_t, (real_T *)&Y->data[0], &ldb_t);
    d_st.site = &ub_emlrtRSI;
    e_st.site = &bc_emlrtRSI;
    DIAGA1 = 'U';
    TRANSA1 = 'N';
    UPLO1 = 'L';
    SIDE1 = 'R';
    info_t = (ptrdiff_t)n;
    n_t = (ptrdiff_t)B->size[1];
    lda_t = (ptrdiff_t)B->size[1];
    ldb_t = (ptrdiff_t)n;
    ztrsm(&SIDE1, &UPLO1, &TRANSA1, &DIAGA1, &info_t, &n_t, (real_T *)&dc1,
          (real_T *)&b_A->data[0], &lda_t, (real_T *)&Y->data[0], &ldb_t);
    i = B->size[1] - 1;
    for (j = i; j >= 1; j--) {
      i1 = ipiv->data[j - 1];
      if (i1 != j) {
        d_st.site = &vb_emlrtRSI;
        if (n > 2147483646) {
          e_st.site = &bb_emlrtRSI;
          check_forloop_overflow_error(&e_st);
        }
        for (b_i = 0; b_i < n; b_i++) {
          temp_re = Y->data[b_i + Y->size[0] * (j - 1)].re;
          temp_im = Y->data[b_i + Y->size[0] * (j - 1)].im;
          Y->data[b_i + Y->size[0] * (j - 1)] =
              Y->data[b_i + Y->size[0] * (i1 - 1)];
          Y->data[b_i + Y->size[0] * (i1 - 1)].re = temp_re;
          Y->data[b_i + Y->size[0] * (i1 - 1)].im = temp_im;
        }
      }
    }
    if (((B->size[0] != 1) || (B->size[1] != 1)) && (loop_ub > 0)) {
      c_st.site = &qb_emlrtRSI;
      d_st.site = &dc_emlrtRSI;
      warning(&d_st);
    }
  } else {
    i = b_B->size[0] * b_B->size[1];
    b_B->size[0] = B->size[1];
    b_B->size[1] = B->size[0];
    emxEnsureCapacity_creal_T(sp, b_B, i, &gc_emlrtRTEI);
    loop_ub = B->size[0];
    for (i = 0; i < loop_ub; i++) {
      n = B->size[1];
      for (i1 = 0; i1 < n; i1++) {
        b_B->data[i1 + b_B->size[0] * i].re = B->data[i + B->size[0] * i1].re;
        b_B->data[i1 + b_B->size[0] * i].im = -B->data[i + B->size[0] * i1].im;
      }
    }
    i = c_A->size[0] * c_A->size[1];
    c_A->size[0] = A->size[1];
    c_A->size[1] = A->size[0];
    emxEnsureCapacity_real_T(sp, c_A, i, &ic_emlrtRTEI);
    loop_ub = A->size[0];
    for (i = 0; i < loop_ub; i++) {
      n = A->size[1];
      for (i1 = 0; i1 < n; i1++) {
        c_A->data[i1 + c_A->size[0] * i] = A->data[i + A->size[0] * i1];
      }
    }
    st.site = &ob_emlrtRSI;
    b_qrsolve(&st, b_B, c_A, b_A);
    i = Y->size[0] * Y->size[1];
    Y->size[0] = b_A->size[1];
    Y->size[1] = b_A->size[0];
    emxEnsureCapacity_creal_T(sp, Y, i, &kc_emlrtRTEI);
    loop_ub = b_A->size[0];
    for (i = 0; i < loop_ub; i++) {
      n = b_A->size[1];
      for (i1 = 0; i1 < n; i1++) {
        Y->data[i1 + Y->size[0] * i].re = b_A->data[i + b_A->size[0] * i1].re;
        Y->data[i1 + Y->size[0] * i].im = -b_A->data[i + b_A->size[0] * i1].im;
      }
    }
  }
  emxFree_real_T(&c_A);
  emxFree_creal_T(&b_B);
  emxFree_ptrdiff_t(&r);
  emxFree_ptrdiff_t(&ipiv_t);
  emxFree_int32_T(&ipiv);
  emxFree_creal_T(&b_A);
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtCTX)sp);
}

void mrdiv(const emlrtStack *sp, const emxArray_real_T *A,
           const emxArray_real_T *B, emxArray_real_T *Y)
{
  static const char_T fname[19] = {'L', 'A', 'P', 'A', 'C', 'K', 'E',
                                   '_', 'd', 'g', 'e', 't', 'r', 'f',
                                   '_', 'w', 'o', 'r', 'k'};
  ptrdiff_t info_t;
  ptrdiff_t lda_t;
  ptrdiff_t ldb_t;
  ptrdiff_t n_t;
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack d_st;
  emlrtStack e_st;
  emlrtStack f_st;
  emlrtStack st;
  emxArray_int32_T *ipiv;
  emxArray_ptrdiff_t *ipiv_t;
  emxArray_ptrdiff_t *r;
  emxArray_real_T *b_A;
  emxArray_real_T *b_B;
  emxArray_real_T *c_A;
  real_T temp;
  int32_T b_i;
  int32_T i;
  int32_T i1;
  int32_T j;
  int32_T loop_ub;
  int32_T n;
  char_T DIAGA1;
  char_T SIDE1;
  char_T TRANSA1;
  char_T UPLO1;
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
  emxInit_real_T(sp, &b_A, 2, &nc_emlrtRTEI, true);
  emxInit_int32_T(sp, &ipiv, 2, &oc_emlrtRTEI, true);
  emxInit_ptrdiff_t(sp, &ipiv_t, 1, &pc_emlrtRTEI, true);
  emxInit_ptrdiff_t(sp, &r, 1, &lc_emlrtRTEI, true);
  emxInit_real_T(sp, &b_B, 2, &gc_emlrtRTEI, true);
  emxInit_real_T(sp, &c_A, 2, &ic_emlrtRTEI, true);
  if ((A->size[0] == 0) || (A->size[1] == 0) ||
      ((B->size[0] == 0) || (B->size[1] == 0))) {
    i = Y->size[0] * Y->size[1];
    Y->size[0] = A->size[0];
    Y->size[1] = B->size[0];
    emxEnsureCapacity_real_T(sp, Y, i, &fc_emlrtRTEI);
    loop_ub = A->size[0] * B->size[0];
    for (i = 0; i < loop_ub; i++) {
      Y->data[i] = 0.0;
    }
  } else if (B->size[0] == B->size[1]) {
    st.site = &nb_emlrtRSI;
    b_st.site = &pb_emlrtRSI;
    i = Y->size[0] * Y->size[1];
    Y->size[0] = A->size[0];
    Y->size[1] = A->size[1];
    emxEnsureCapacity_real_T(&b_st, Y, i, &hc_emlrtRTEI);
    loop_ub = A->size[0] * A->size[1];
    for (i = 0; i < loop_ub; i++) {
      Y->data[i] = A->data[i];
    }
    c_st.site = &rb_emlrtRSI;
    n = B->size[1];
    d_st.site = &sb_emlrtRSI;
    i = b_A->size[0] * b_A->size[1];
    b_A->size[0] = B->size[0];
    b_A->size[1] = B->size[1];
    emxEnsureCapacity_real_T(&d_st, b_A, i, &jc_emlrtRTEI);
    loop_ub = B->size[0] * B->size[1];
    for (i = 0; i < loop_ub; i++) {
      b_A->data[i] = B->data[i];
    }
    e_st.site = &wb_emlrtRSI;
    f_st.site = &yb_emlrtRSI;
    repmat(&f_st, (ptrdiff_t)0.0, muIntScalarMin_sint32(n, n), r);
    i = ipiv_t->size[0];
    ipiv_t->size[0] = r->size[0];
    emxEnsureCapacity_ptrdiff_t(&e_st, ipiv_t, i, &lc_emlrtRTEI);
    info_t = LAPACKE_dgetrf_work(102, (ptrdiff_t)B->size[1],
                                 (ptrdiff_t)B->size[1], &b_A->data[0],
                                 (ptrdiff_t)B->size[1], &ipiv_t->data[0]);
    loop_ub = (int32_T)info_t;
    i = ipiv->size[0] * ipiv->size[1];
    ipiv->size[0] = 1;
    ipiv->size[1] = ipiv_t->size[0];
    emxEnsureCapacity_int32_T(&e_st, ipiv, i, &mc_emlrtRTEI);
    f_st.site = &xb_emlrtRSI;
    if (loop_ub < 0) {
      if (loop_ub == -1010) {
        emlrtErrorWithMessageIdR2018a(&f_st, &f_emlrtRTEI, "MATLAB:nomem",
                                      "MATLAB:nomem", 0);
      } else {
        emlrtErrorWithMessageIdR2018a(&f_st, &e_emlrtRTEI,
                                      "Coder:toolbox:LAPACKCallErrorInfo",
                                      "Coder:toolbox:LAPACKCallErrorInfo", 5, 4,
                                      19, &fname[0], 12, loop_ub);
      }
    }
    i = ipiv_t->size[0] - 1;
    for (n = 0; n <= i; n++) {
      ipiv->data[n] = (int32_T)ipiv_t->data[n];
    }
    n = Y->size[0];
    d_st.site = &tb_emlrtRSI;
    e_st.site = &bc_emlrtRSI;
    temp = 1.0;
    DIAGA1 = 'N';
    TRANSA1 = 'N';
    UPLO1 = 'U';
    SIDE1 = 'R';
    info_t = (ptrdiff_t)Y->size[0];
    n_t = (ptrdiff_t)B->size[1];
    lda_t = (ptrdiff_t)B->size[1];
    ldb_t = (ptrdiff_t)Y->size[0];
    dtrsm(&SIDE1, &UPLO1, &TRANSA1, &DIAGA1, &info_t, &n_t, &temp,
          &b_A->data[0], &lda_t, &Y->data[0], &ldb_t);
    d_st.site = &ub_emlrtRSI;
    e_st.site = &bc_emlrtRSI;
    temp = 1.0;
    DIAGA1 = 'U';
    TRANSA1 = 'N';
    UPLO1 = 'L';
    SIDE1 = 'R';
    info_t = (ptrdiff_t)n;
    n_t = (ptrdiff_t)B->size[1];
    lda_t = (ptrdiff_t)B->size[1];
    ldb_t = (ptrdiff_t)n;
    dtrsm(&SIDE1, &UPLO1, &TRANSA1, &DIAGA1, &info_t, &n_t, &temp,
          &b_A->data[0], &lda_t, &Y->data[0], &ldb_t);
    i = B->size[1] - 1;
    for (j = i; j >= 1; j--) {
      i1 = ipiv->data[j - 1];
      if (i1 != j) {
        d_st.site = &vb_emlrtRSI;
        if (n > 2147483646) {
          e_st.site = &bb_emlrtRSI;
          check_forloop_overflow_error(&e_st);
        }
        for (b_i = 0; b_i < n; b_i++) {
          temp = Y->data[b_i + Y->size[0] * (j - 1)];
          Y->data[b_i + Y->size[0] * (j - 1)] =
              Y->data[b_i + Y->size[0] * (i1 - 1)];
          Y->data[b_i + Y->size[0] * (i1 - 1)] = temp;
        }
      }
    }
    if (((B->size[0] != 1) || (B->size[1] != 1)) && (loop_ub > 0)) {
      c_st.site = &qb_emlrtRSI;
      d_st.site = &dc_emlrtRSI;
      warning(&d_st);
    }
  } else {
    i = b_B->size[0] * b_B->size[1];
    b_B->size[0] = B->size[1];
    b_B->size[1] = B->size[0];
    emxEnsureCapacity_real_T(sp, b_B, i, &gc_emlrtRTEI);
    loop_ub = B->size[0];
    for (i = 0; i < loop_ub; i++) {
      n = B->size[1];
      for (i1 = 0; i1 < n; i1++) {
        b_B->data[i1 + b_B->size[0] * i] = B->data[i + B->size[0] * i1];
      }
    }
    i = c_A->size[0] * c_A->size[1];
    c_A->size[0] = A->size[1];
    c_A->size[1] = A->size[0];
    emxEnsureCapacity_real_T(sp, c_A, i, &ic_emlrtRTEI);
    loop_ub = A->size[0];
    for (i = 0; i < loop_ub; i++) {
      n = A->size[1];
      for (i1 = 0; i1 < n; i1++) {
        c_A->data[i1 + c_A->size[0] * i] = A->data[i + A->size[0] * i1];
      }
    }
    st.site = &ob_emlrtRSI;
    qrsolve(&st, b_B, c_A, b_A);
    i = Y->size[0] * Y->size[1];
    Y->size[0] = b_A->size[1];
    Y->size[1] = b_A->size[0];
    emxEnsureCapacity_real_T(sp, Y, i, &kc_emlrtRTEI);
    loop_ub = b_A->size[0];
    for (i = 0; i < loop_ub; i++) {
      n = b_A->size[1];
      for (i1 = 0; i1 < n; i1++) {
        Y->data[i1 + Y->size[0] * i] = b_A->data[i + b_A->size[0] * i1];
      }
    }
  }
  emxFree_real_T(&c_A);
  emxFree_real_T(&b_B);
  emxFree_ptrdiff_t(&r);
  emxFree_ptrdiff_t(&ipiv_t);
  emxFree_int32_T(&ipiv);
  emxFree_real_T(&b_A);
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtCTX)sp);
}

/* End of code generation (mrdivide_helper.c) */
