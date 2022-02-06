/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * BCij.c
 *
 * Code generation for function 'BCij'
 *
 */

/* Include files */
#include "BCij.h"
#include "H2Barycenter_data.h"
#include "H2Barycenter_emxutil.h"
#include "H2Barycenter_types.h"
#include "det.h"
#include "eml_int_forloop_overflow_check.h"
#include "infocheck.h"
#include "qrsolve.h"
#include "repmat.h"
#include "rt_nonfinite.h"
#include "warning.h"
#include "xgeqp3.h"
#include "blas.h"
#include "lapacke.h"
#include "mwmathutil.h"
#include <stddef.h>

/* Variable Definitions */
static emlrtRSInfo xc_emlrtRSI = {
    9,      /* lineNo */
    "BCij", /* fcnName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/BCij.m" /* pathName */
};

static emlrtRSInfo yc_emlrtRSI = {
    13,         /* lineNo */
    "alphaCij", /* fcnName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/alphaCij.m" /* pathName
                                                                    */
};

static emlrtRSInfo bd_emlrtRSI = {
    44,                                                      /* lineNo */
    "mpower",                                                /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/ops/mpower.m" /* pathName */
};

static emlrtRSInfo cd_emlrtRSI = {
    71,                                                     /* lineNo */
    "power",                                                /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/ops/power.m" /* pathName */
};

static emlrtRSInfo dd_emlrtRSI = {
    80,                                                     /* lineNo */
    "fltpower",                                             /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/ops/power.m" /* pathName */
};

static emlrtRSInfo ed_emlrtRSI = {
    42,                                                           /* lineNo */
    "ixfun",                                                      /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/ixfun.m" /* pathName */
};

static emlrtRSInfo fd_emlrtRSI = {
    140,                                                    /* lineNo */
    "scalar_float_power",                                   /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/ops/power.m" /* pathName */
};

static emlrtRSInfo gd_emlrtRSI = {
    20,                                                        /* lineNo */
    "mldivide",                                                /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/ops/mldivide.m" /* pathName */
};

static emlrtRSInfo hd_emlrtRSI = {
    42,                                                        /* lineNo */
    "mldiv",                                                   /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/ops/mldivide.m" /* pathName */
};

static emlrtRSInfo id_emlrtRSI = {
    44,                                                        /* lineNo */
    "mldiv",                                                   /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/ops/mldivide.m" /* pathName */
};

static emlrtRSInfo jd_emlrtRSI = {
    109,          /* lineNo */
    "lusolveNxN", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/lusolve.m" /* pathName
                                                                     */
};

static emlrtRSInfo kd_emlrtRSI = {
    124,          /* lineNo */
    "InvAtimesX", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/lusolve.m" /* pathName
                                                                     */
};

static emlrtRSInfo
    ld_emlrtRSI =
        {
            19,        /* lineNo */
            "xgetrfs", /* fcnName */
            "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/"
            "xgetrfs.m" /* pathName */
};

static emlrtRSInfo
    md_emlrtRSI =
        {
            108,      /* lineNo */
            "cmldiv", /* fcnName */
            "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/"
            "xgetrfs.m" /* pathName */
};

static emlrtRSInfo
    nd_emlrtRSI =
        {
            70,       /* lineNo */
            "cmldiv", /* fcnName */
            "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/"
            "xgetrfs.m" /* pathName */
};

static emlrtECInfo q_emlrtECI = {
    2,          /* nDims */
    11,         /* lineNo */
    14,         /* colNo */
    "alphaCij", /* fName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/alphaCij.m" /* pName */
};

static emlrtECInfo r_emlrtECI = {
    -1,         /* nDims */
    13,         /* lineNo */
    104,        /* colNo */
    "alphaCij", /* fName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/alphaCij.m" /* pName */
};

static emlrtECInfo s_emlrtECI = {
    -1,         /* nDims */
    13,         /* lineNo */
    127,        /* colNo */
    "alphaCij", /* fName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/alphaCij.m" /* pName */
};

static emlrtRTEInfo j_emlrtRTEI = {
    13,                                                      /* lineNo */
    9,                                                       /* colNo */
    "sqrt",                                                  /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/elfun/sqrt.m" /* pName */
};

static emlrtRTEInfo k_emlrtRTEI = {
    16,                                                        /* lineNo */
    19,                                                        /* colNo */
    "mldivide",                                                /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/ops/mldivide.m" /* pName */
};

static emlrtRTEInfo wb_emlrtRTEI = {
    11,         /* lineNo */
    14,         /* colNo */
    "alphaCij", /* fName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/alphaCij.m" /* pName */
};

static emlrtRTEInfo xb_emlrtRTEI = {
    11,         /* lineNo */
    29,         /* colNo */
    "alphaCij", /* fName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/alphaCij.m" /* pName */
};

static emlrtRTEInfo yb_emlrtRTEI = {
    13,         /* lineNo */
    104,        /* colNo */
    "alphaCij", /* fName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/alphaCij.m" /* pName */
};

static emlrtRTEInfo ac_emlrtRTEI = {
    75,                  /* lineNo */
    9,                   /* colNo */
    "eml_mtimes_helper", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/ops/eml_mtimes_helper.m" /* pName
                                                                         */
};

static emlrtRTEInfo bc_emlrtRTEI = {
    13,         /* lineNo */
    115,        /* colNo */
    "alphaCij", /* fName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/alphaCij.m" /* pName */
};

static emlrtRTEInfo
    dc_emlrtRTEI =
        {
            48,        /* lineNo */
            37,        /* colNo */
            "xgetrfs", /* fName */
            "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/"
            "xgetrfs.m" /* pName */
};

static emlrtRTEInfo
    ec_emlrtRTEI =
        {
            70,        /* lineNo */
            23,        /* colNo */
            "xgetrfs", /* fName */
            "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/"
            "xgetrfs.m" /* pName */
};

static emlrtRTEInfo gc_emlrtRTEI = {
    11,         /* lineNo */
    1,          /* colNo */
    "alphaCij", /* fName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/alphaCij.m" /* pName */
};

static emlrtRTEInfo hc_emlrtRTEI = {
    13,         /* lineNo */
    82,         /* colNo */
    "alphaCij", /* fName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/alphaCij.m" /* pName */
};

static emlrtRTEInfo ic_emlrtRTEI = {
    1,      /* lineNo */
    19,     /* colNo */
    "BCij", /* fName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/BCij.m" /* pName */
};

static emlrtRTEInfo
    jc_emlrtRTEI =
        {
            70,        /* lineNo */
            1,         /* colNo */
            "xgetrfs", /* fName */
            "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/"
            "xgetrfs.m" /* pName */
};

/* Function Definitions */
real_T BCij(const emlrtStack *sp, const emxArray_real_T *pdfi_mu,
            const emxArray_real_T *pdfi_Sigma, const emxArray_real_T *pdfj_mu,
            const emxArray_real_T *pdfj_Sigma)
{
  ptrdiff_t INFO;
  ptrdiff_t LDA;
  ptrdiff_t nrc_t;
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack d_st;
  emlrtStack e_st;
  emlrtStack f_st;
  emlrtStack g_st;
  emlrtStack h_st;
  emlrtStack i_st;
  emlrtStack j_st;
  emlrtStack st;
  emxArray_int32_T *jpvt;
  emxArray_ptrdiff_t *IPIV;
  emxArray_ptrdiff_t *r;
  emxArray_real_T *A;
  emxArray_real_T *B;
  emxArray_real_T *X;
  emxArray_real_T *alphaSigma;
  emxArray_real_T *tau;
  emxArray_real_T *y;
  real_T CBhatt;
  real_T a;
  real_T b_a;
  real_T b_x;
  real_T x;
  int32_T iv[2];
  int32_T iv1[2];
  int32_T i;
  int32_T ma;
  int32_T mb;
  int32_T na;
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
  g_st.prev = &f_st;
  g_st.tls = f_st.tls;
  h_st.prev = &g_st;
  h_st.tls = g_st.tls;
  i_st.prev = &h_st;
  i_st.tls = h_st.tls;
  j_st.prev = &i_st;
  j_st.tls = i_st.tls;
  emlrtHeapReferenceStackEnterFcnR2012b((emlrtCTX)sp);
  emxInit_real_T(sp, &alphaSigma, 2, &gc_emlrtRTEI, true);
  /*  CBhatt = bhattCij(pdfi,pdfj): */
  /*  INPUT: */
  /*  - pdfi, pdfj, two Gaussian densities. */
  /*  OUTPUT: */
  /*  - CBhatt, the Bhattacharyya coefficient value (scalar). */
  /*  This function implements the Bhattacharyya coefficient computation for two
   * Gaussian densities. */
  st.site = &xc_emlrtRSI;
  i = alphaSigma->size[0] * alphaSigma->size[1];
  alphaSigma->size[0] = pdfj_Sigma->size[0];
  alphaSigma->size[1] = pdfj_Sigma->size[1];
  emxEnsureCapacity_real_T(&st, alphaSigma, i, &wb_emlrtRTEI);
  na = pdfj_Sigma->size[0] * pdfj_Sigma->size[1];
  for (i = 0; i < na; i++) {
    alphaSigma->data[i] = 0.5 * pdfj_Sigma->data[i];
  }
  emxInit_real_T(&st, &A, 2, &ic_emlrtRTEI, true);
  i = A->size[0] * A->size[1];
  A->size[0] = pdfi_Sigma->size[0];
  A->size[1] = pdfi_Sigma->size[1];
  emxEnsureCapacity_real_T(&st, A, i, &xb_emlrtRTEI);
  na = pdfi_Sigma->size[0] * pdfi_Sigma->size[1];
  for (i = 0; i < na; i++) {
    A->data[i] = 0.5 * pdfi_Sigma->data[i];
  }
  iv[0] = (*(int32_T(*)[2])alphaSigma->size)[0];
  iv[1] = (*(int32_T(*)[2])alphaSigma->size)[1];
  iv1[0] = (*(int32_T(*)[2])A->size)[0];
  iv1[1] = (*(int32_T(*)[2])A->size)[1];
  emlrtSizeEqCheckNDR2012b(&iv[0], &iv1[0], &q_emlrtECI, &st);
  na = alphaSigma->size[0] * alphaSigma->size[1];
  for (i = 0; i < na; i++) {
    alphaSigma->data[i] += A->data[i];
  }
  if (pdfi_mu->size[0] != pdfj_mu->size[0]) {
    emlrtSizeEqCheck1DR2012b(pdfi_mu->size[0], pdfj_mu->size[0], &r_emlrtECI,
                             &st);
  }
  emxInit_real_T(&st, &B, 1, &yb_emlrtRTEI, true);
  i = B->size[0];
  B->size[0] = pdfi_mu->size[0];
  emxEnsureCapacity_real_T(&st, B, i, &yb_emlrtRTEI);
  na = pdfi_mu->size[0];
  for (i = 0; i < na; i++) {
    B->data[i] = pdfi_mu->data[i] - pdfj_mu->data[i];
  }
  if (pdfi_mu->size[0] != pdfj_mu->size[0]) {
    emlrtSizeEqCheck1DR2012b(pdfi_mu->size[0], pdfj_mu->size[0], &s_emlrtECI,
                             &st);
  }
  b_st.site = &yc_emlrtRSI;
  c_st.site = &yc_emlrtRSI;
  a = det(&c_st, pdfj_Sigma);
  c_st.site = &bd_emlrtRSI;
  d_st.site = &cd_emlrtRSI;
  e_st.site = &dd_emlrtRSI;
  f_st.site = &ed_emlrtRSI;
  g_st.site = &fd_emlrtRSI;
  if (a < 0.0) {
    emlrtErrorWithMessageIdR2018a(
        &g_st, &j_emlrtRTEI, "Coder:toolbox:ElFunDomainError",
        "Coder:toolbox:ElFunDomainError", 3, 4, 4, "sqrt");
  }
  b_st.site = &yc_emlrtRSI;
  c_st.site = &yc_emlrtRSI;
  b_a = det(&c_st, pdfi_Sigma);
  c_st.site = &bd_emlrtRSI;
  d_st.site = &cd_emlrtRSI;
  e_st.site = &dd_emlrtRSI;
  f_st.site = &ed_emlrtRSI;
  g_st.site = &fd_emlrtRSI;
  if (b_a < 0.0) {
    emlrtErrorWithMessageIdR2018a(
        &g_st, &j_emlrtRTEI, "Coder:toolbox:ElFunDomainError",
        "Coder:toolbox:ElFunDomainError", 3, 4, 4, "sqrt");
  }
  emxInit_real_T(&g_st, &y, 2, &hc_emlrtRTEI, true);
  i = y->size[0] * y->size[1];
  y->size[0] = 1;
  y->size[1] = B->size[0];
  emxEnsureCapacity_real_T(&st, y, i, &ac_emlrtRTEI);
  na = B->size[0];
  for (i = 0; i < na; i++) {
    y->data[i] = -0.125 * B->data[i];
  }
  b_st.site = &yc_emlrtRSI;
  c_st.site = &yc_emlrtRSI;
  if (B->size[0] != alphaSigma->size[0]) {
    emlrtErrorWithMessageIdR2018a(&c_st, &k_emlrtRTEI, "MATLAB:dimagree",
                                  "MATLAB:dimagree", 0);
  }
  d_st.site = &gd_emlrtRSI;
  emxInit_real_T(&d_st, &tau, 1, &ic_emlrtRTEI, true);
  emxInit_int32_T(&d_st, &jpvt, 2, &ic_emlrtRTEI, true);
  emxInit_real_T(&d_st, &X, 1, &ic_emlrtRTEI, true);
  emxInit_ptrdiff_t(&d_st, &IPIV, 1, &jc_emlrtRTEI, true);
  emxInit_ptrdiff_t(&d_st, &r, 1, &ec_emlrtRTEI, true);
  if ((alphaSigma->size[0] == 0) || (alphaSigma->size[1] == 0) ||
      (B->size[0] == 0)) {
    i = X->size[0];
    X->size[0] = alphaSigma->size[1];
    emxEnsureCapacity_real_T(&d_st, X, i, &bc_emlrtRTEI);
    na = alphaSigma->size[1];
    for (i = 0; i < na; i++) {
      X->data[i] = 0.0;
    }
  } else if (alphaSigma->size[0] == alphaSigma->size[1]) {
    e_st.site = &hd_emlrtRSI;
    f_st.site = &fb_emlrtRSI;
    i = X->size[0];
    X->size[0] = B->size[0];
    emxEnsureCapacity_real_T(&f_st, X, i, &bc_emlrtRTEI);
    na = B->size[0];
    for (i = 0; i < na; i++) {
      X->data[i] = B->data[i];
    }
    g_st.site = &jd_emlrtRSI;
    h_st.site = &kd_emlrtRSI;
    ma = alphaSigma->size[0];
    na = alphaSigma->size[1];
    mb = X->size[0];
    i = muIntScalarMin_sint32(ma, na);
    ma = muIntScalarMin_sint32(mb, i);
    i_st.site = &ld_emlrtRSI;
    i = A->size[0] * A->size[1];
    A->size[0] = alphaSigma->size[0];
    A->size[1] = alphaSigma->size[1];
    emxEnsureCapacity_real_T(&i_st, A, i, &dc_emlrtRTEI);
    na = alphaSigma->size[0] * alphaSigma->size[1];
    for (i = 0; i < na; i++) {
      A->data[i] = alphaSigma->data[i];
    }
    j_st.site = &nd_emlrtRSI;
    repmat(&j_st, (ptrdiff_t)0.0, ma, r);
    i = IPIV->size[0];
    IPIV->size[0] = r->size[0];
    emxEnsureCapacity_ptrdiff_t(&i_st, IPIV, i, &ec_emlrtRTEI);
    nrc_t = (ptrdiff_t)ma;
    LDA = (ptrdiff_t)A->size[0];
    INFO = LAPACKE_dgetrf_work(102, nrc_t, nrc_t, &A->data[0], LDA,
                               &IPIV->data[0]);
    ma = (int32_T)INFO;
    j_st.site = &md_emlrtRSI;
    if (ma < 0) {
      if (ma == -1010) {
        emlrtErrorWithMessageIdR2018a(&j_st, &h_emlrtRTEI, "MATLAB:nomem",
                                      "MATLAB:nomem", 0);
      } else {
        emlrtErrorWithMessageIdR2018a(
            &j_st, &i_emlrtRTEI, "Coder:toolbox:LAPACKCallErrorInfo",
            "Coder:toolbox:LAPACKCallErrorInfo", 5, 4, 19, &cv[0], 12, ma);
      }
    }
    LAPACKE_dgetrs_work(102, 'N', nrc_t, (ptrdiff_t)1, &A->data[0], LDA,
                        &IPIV->data[0], &X->data[0], (ptrdiff_t)X->size[0]);
    if (((alphaSigma->size[0] != 1) || (alphaSigma->size[1] != 1)) &&
        (ma > 0)) {
      g_st.site = &gb_emlrtRSI;
      h_st.site = &sb_emlrtRSI;
      warning(&h_st);
    }
  } else {
    e_st.site = &id_emlrtRSI;
    i = A->size[0] * A->size[1];
    A->size[0] = alphaSigma->size[0];
    A->size[1] = alphaSigma->size[1];
    emxEnsureCapacity_real_T(&e_st, A, i, &cc_emlrtRTEI);
    na = alphaSigma->size[0] * alphaSigma->size[1];
    for (i = 0; i < na; i++) {
      A->data[i] = alphaSigma->data[i];
    }
    f_st.site = &tb_emlrtRSI;
    xgeqp3(&f_st, A, tau, jpvt);
    f_st.site = &ub_emlrtRSI;
    mb = rankFromQR(&f_st, A);
    f_st.site = &vb_emlrtRSI;
    i = X->size[0];
    X->size[0] = A->size[1];
    emxEnsureCapacity_real_T(&f_st, X, i, &bc_emlrtRTEI);
    na = A->size[1];
    for (i = 0; i < na; i++) {
      X->data[i] = 0.0;
    }
    g_st.site = &ic_emlrtRSI;
    h_st.site = &mc_emlrtRSI;
    if ((A->size[0] != 0) && (A->size[1] != 0)) {
      nrc_t = (ptrdiff_t)B->size[0];
      nrc_t = LAPACKE_dormqr(
          102, 'L', 'T', nrc_t, (ptrdiff_t)1,
          (ptrdiff_t)muIntScalarMin_sint32(A->size[0], A->size[1]), &A->data[0],
          (ptrdiff_t)A->size[0], &tau->data[0], &B->data[0], nrc_t);
      i_st.site = &nc_emlrtRSI;
      if (infocheck(&i_st, (int32_T)nrc_t)) {
        ma = B->size[0];
        i = B->size[0];
        B->size[0] = ma;
        emxEnsureCapacity_real_T(&h_st, B, i, &fc_emlrtRTEI);
        for (i = 0; i < ma; i++) {
          B->data[i] = rtNaN;
        }
      }
    }
    g_st.site = &kc_emlrtRSI;
    if ((1 <= mb) && (mb > 2147483646)) {
      h_st.site = &x_emlrtRSI;
      check_forloop_overflow_error(&h_st);
    }
    for (ma = 0; ma < mb; ma++) {
      X->data[jpvt->data[ma] - 1] = B->data[ma];
    }
    for (na = mb; na >= 1; na--) {
      i = jpvt->data[na - 1];
      X->data[i - 1] /= A->data[(na + A->size[0] * (na - 1)) - 1];
      g_st.site = &lc_emlrtRSI;
      for (ma = 0; ma <= na - 2; ma++) {
        X->data[jpvt->data[ma] - 1] -= X->data[jpvt->data[na - 1] - 1] *
                                       A->data[ma + A->size[0] * (na - 1)];
      }
    }
  }
  emxFree_ptrdiff_t(&r);
  emxFree_real_T(&B);
  emxFree_ptrdiff_t(&IPIV);
  emxFree_int32_T(&jpvt);
  emxFree_real_T(&tau);
  emxFree_real_T(&A);
  c_st.site = &uc_emlrtRSI;
  if (X->size[0] != y->size[1]) {
    if ((y->size[1] == 1) || (X->size[0] == 1)) {
      emlrtErrorWithMessageIdR2018a(
          &c_st, &d_emlrtRTEI, "Coder:toolbox:mtimes_noDynamicScalarExpansion",
          "Coder:toolbox:mtimes_noDynamicScalarExpansion", 0);
    } else {
      emlrtErrorWithMessageIdR2018a(&c_st, &c_emlrtRTEI, "MATLAB:innerdim",
                                    "MATLAB:innerdim", 0);
    }
  }
  if (y->size[1] < 1) {
    x = 0.0;
  } else {
    nrc_t = (ptrdiff_t)y->size[1];
    LDA = (ptrdiff_t)1;
    INFO = (ptrdiff_t)1;
    x = ddot(&nrc_t, &y->data[0], &LDA, &X->data[0], &INFO);
  }
  emxFree_real_T(&X);
  emxFree_real_T(&y);
  b_st.site = &yc_emlrtRSI;
  b_st.site = &yc_emlrtRSI;
  c_st.site = &yc_emlrtRSI;
  b_x = det(&c_st, alphaSigma);
  emxFree_real_T(&alphaSigma);
  if (b_x < 0.0) {
    emlrtErrorWithMessageIdR2018a(
        &b_st, &j_emlrtRTEI, "Coder:toolbox:ElFunDomainError",
        "Coder:toolbox:ElFunDomainError", 3, 4, 4, "sqrt");
  }
  b_x = muDoubleScalarSqrt(b_x);
  x = muDoubleScalarExp(x);
  CBhatt = muDoubleScalarSqrt(muDoubleScalarSqrt(a) * muDoubleScalarSqrt(b_a)) /
           b_x * x;
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtCTX)sp);
  return CBhatt;
}

/* End of code generation (BCij.c) */
