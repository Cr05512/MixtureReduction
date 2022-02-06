/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * SKLDBarycenter.c
 *
 * Code generation for function 'SKLDBarycenter'
 *
 */

/* Include files */
#include "SKLDBarycenter.h"
#include "FKLDBarycenter.h"
#include "RKLDBarycenter.h"
#include "alphaJDBarycenter_data.h"
#include "alphaJDBarycenter_emxutil.h"
#include "alphaJDBarycenter_mexutil.h"
#include "alphaJDBarycenter_types.h"
#include "eml_mtimes_helper.h"
#include "eye.h"
#include "mrdivide_helper.h"
#include "mtimes.h"
#include "paramsFromMixture.h"
#include "rt_nonfinite.h"
#include "sqrtm.h"
#include "sum.h"
#include "trace.h"
#include "blas.h"
#include "mwmathutil.h"
#include <stddef.h>

/* Variable Definitions */
static emlrtRSInfo
    xd_emlrtRSI =
        {
            11,               /* lineNo */
            "SKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    yd_emlrtRSI =
        {
            20,               /* lineNo */
            "SKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    ae_emlrtRSI =
        {
            21,               /* lineNo */
            "SKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    be_emlrtRSI =
        {
            22,               /* lineNo */
            "SKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    ce_emlrtRSI =
        {
            23,               /* lineNo */
            "SKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    de_emlrtRSI =
        {
            24,               /* lineNo */
            "SKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    ee_emlrtRSI =
        {
            25,               /* lineNo */
            "SKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    fe_emlrtRSI =
        {
            26,               /* lineNo */
            "SKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    ge_emlrtRSI =
        {
            33,               /* lineNo */
            "SKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    he_emlrtRSI =
        {
            35,               /* lineNo */
            "SKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    ie_emlrtRSI =
        {
            45,               /* lineNo */
            "SKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    je_emlrtRSI =
        {
            52,               /* lineNo */
            "SKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo lg_emlrtRSI = {
    16,       /* lineNo */
    "SKLDij", /* fcnName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/SKLDij.m" /* pathName */
};

static emlrtRSInfo mg_emlrtRSI = {
    17,       /* lineNo */
    "SKLDij", /* fcnName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/SKLDij.m" /* pathName */
};

static emlrtRSInfo ng_emlrtRSI = {
    20,       /* lineNo */
    "SKLDij", /* fcnName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/SKLDij.m" /* pathName */
};

static emlrtMCInfo
    h_emlrtMCI =
        {
            59,               /* lineNo */
            5,                /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtBCInfo v_emlrtBCI =
    {
        -1,               /* iFirst */
        -1,               /* iLast */
        18,               /* lineNo */
        16,               /* colNo */
        "comps",          /* aName */
        "SKLDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/SKLDBarycenter.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtECInfo
    t_emlrtECI =
        {
            2,                /* nDims */
            35,               /* lineNo */
            19,               /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtECInfo
    u_emlrtECI =
        {
            -1,               /* nDims */
            35,               /* lineNo */
            40,               /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtBCInfo w_emlrtBCI =
    {
        -1,               /* iFirst */
        -1,               /* iLast */
        41,               /* lineNo */
        22,               /* colNo */
        "mui",            /* aName */
        "SKLDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/SKLDBarycenter.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtECInfo
    v_emlrtECI =
        {
            -1,               /* nDims */
            41,               /* lineNo */
            16,               /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtBCInfo x_emlrtBCI =
    {
        -1,               /* iFirst */
        -1,               /* iLast */
        42,               /* lineNo */
        30,               /* colNo */
        "wi",             /* aName */
        "SKLDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/SKLDBarycenter.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtBCInfo y_emlrtBCI =
    {
        -1,               /* iFirst */
        -1,               /* iLast */
        42,               /* lineNo */
        45,               /* colNo */
        "Sigmai",         /* aName */
        "SKLDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/SKLDBarycenter.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtECInfo
    w_emlrtECI =
        {
            2,                /* nDims */
            42,               /* lineNo */
            34,               /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtECInfo
    x_emlrtECI =
        {
            2,                /* nDims */
            42,               /* lineNo */
            18,               /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtECInfo y_emlrtECI = {
    -1,       /* nDims */
    12,       /* lineNo */
    8,        /* colNo */
    "SKLDij", /* fName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/SKLDij.m" /* pName */
};

static emlrtECInfo ab_emlrtECI = {
    2,        /* nDims */
    20,       /* lineNo */
    73,       /* colNo */
    "SKLDij", /* fName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/SKLDij.m" /* pName */
};

static emlrtRTEInfo
    td_emlrtRTEI =
        {
            12,               /* lineNo */
            1,                /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    ud_emlrtRTEI =
        {
            31,               /* lineNo */
            5,                /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    vd_emlrtRTEI =
        {
            35,               /* lineNo */
            19,               /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    wd_emlrtRTEI =
        {
            35,               /* lineNo */
            40,               /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    xd_emlrtRTEI =
        {
            38,               /* lineNo */
            5,                /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    yd_emlrtRTEI =
        {
            41,               /* lineNo */
            9,                /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    ae_emlrtRTEI =
        {
            42,               /* lineNo */
            50,               /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo be_emlrtRTEI = {
    88,                  /* lineNo */
    9,                   /* colNo */
    "eml_mtimes_helper", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/ops/eml_mtimes_helper.m" /* pName
                                                                         */
};

static emlrtRTEInfo
    ce_emlrtRTEI =
        {
            42,               /* lineNo */
            27,               /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    de_emlrtRTEI =
        {
            49,               /* lineNo */
            5,                /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo ee_emlrtRTEI = {
    12,       /* lineNo */
    1,        /* colNo */
    "SKLDij", /* fName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/SKLDij.m" /* pName */
};

static emlrtRTEInfo fe_emlrtRTEI = {
    91,                  /* lineNo */
    5,                   /* colNo */
    "eml_mtimes_helper", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/ops/eml_mtimes_helper.m" /* pName
                                                                         */
};

static emlrtRTEInfo
    ge_emlrtRTEI =
        {
            22,               /* lineNo */
            1,                /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    he_emlrtRTEI =
        {
            23,               /* lineNo */
            1,                /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    ie_emlrtRTEI =
        {
            24,               /* lineNo */
            1,                /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    je_emlrtRTEI =
        {
            25,               /* lineNo */
            1,                /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    ke_emlrtRTEI =
        {
            26,               /* lineNo */
            1,                /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    le_emlrtRTEI =
        {
            33,               /* lineNo */
            5,                /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    me_emlrtRTEI =
        {
            1,                /* lineNo */
            16,               /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    ne_emlrtRTEI =
        {
            32,               /* lineNo */
            5,                /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    oe_emlrtRTEI =
        {
            23,               /* lineNo */
            12,               /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    pe_emlrtRTEI =
        {
            35,               /* lineNo */
            11,               /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    qe_emlrtRTEI =
        {
            45,               /* lineNo */
            27,               /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    re_emlrtRTEI =
        {
            45,               /* lineNo */
            21,               /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo se_emlrtRTEI = {
    16,       /* lineNo */
    1,        /* colNo */
    "SKLDij", /* fName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/SKLDij.m" /* pName */
};

static emlrtRTEInfo te_emlrtRTEI = {
    17,       /* lineNo */
    1,        /* colNo */
    "SKLDij", /* fName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/SKLDij.m" /* pName */
};

static emlrtRTEInfo ue_emlrtRTEI = {
    20,       /* lineNo */
    66,       /* colNo */
    "SKLDij", /* fName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/SKLDij.m" /* pName */
};

static emlrtRSInfo
    ah_emlrtRSI =
        {
            59,               /* lineNo */
            "SKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pathName */
};

/* Function Definitions */
void SKLDBarycenter(const emlrtStack *sp, const emxArray_struct0_T *comps,
                    real_T *bar_w, emxArray_real_T *bar_mu,
                    emxArray_real_T *bar_Sigma)
{
  static const int32_T iv2[2] = {1, 66};
  static const char_T u[66] = {
      'T', 'h', 'e', ' ', 'S', 'K', 'L', 'D', ' ', 'F', 'P', 'I', ' ', 'a',
      'l', 'g', 'o', 'r', 'i', 't', 'h', 'm', ' ', 'd', 'i', 'd', ' ', 'n',
      'o', 't', ' ', 'c', 'o', 'n', 'v', 'e', 'r', 'g', 'e', ' ', 'i', 'n',
      ' ', 't', 'h', 'e', ' ', 'a', 'l', 'l', 'o', 'w', 'e', 'd', ' ', 'i',
      't', 'e', 'r', 'a', 't', 'i', 'o', 'n', 's', '.'};
  ptrdiff_t k_t;
  ptrdiff_t lda_t;
  ptrdiff_t ldb_t;
  ptrdiff_t ldc_t;
  ptrdiff_t m_t;
  ptrdiff_t n_t;
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack d_st;
  emlrtStack e_st;
  emlrtStack st;
  emxArray_creal_T *Sigma;
  emxArray_creal_T *b;
  emxArray_creal_T *srPsiCI;
  emxArray_creal_T *srPsiCIinv;
  emxArray_creal_T *y;
  emxArray_real_T *A;
  emxArray_real_T *PsiCIinv;
  emxArray_real_T *Sigmai;
  emxArray_real_T *Sigmaiinv;
  emxArray_real_T *Sigmainv;
  emxArray_real_T *Sigmajinv;
  emxArray_real_T *Y;
  emxArray_real_T *b_y;
  emxArray_real_T *barRKLD_Sigma;
  emxArray_real_T *barRKLD_mu;
  emxArray_real_T *diff;
  emxArray_real_T *muCI;
  emxArray_real_T *muMPM;
  emxArray_real_T *mui;
  emxArray_real_T *wi;
  const mxArray *c_y;
  const mxArray *m;
  real_T alpha1;
  real_T beta1;
  real_T sumWi;
  int32_T iv[2];
  int32_T iv1[2];
  int32_T iv3[2];
  int32_T b_i;
  int32_T b_loop_ub;
  int32_T c_loop_ub;
  int32_T d;
  int32_T d_loop_ub;
  int32_T e_loop_ub;
  int32_T i;
  int32_T i1;
  int32_T i2;
  int32_T i3;
  int32_T i4;
  int32_T i5;
  int32_T k;
  int32_T loop_ub;
  int32_T numIter;
  char_T TRANSA1;
  char_T TRANSB1;
  boolean_T exitg1;
  boolean_T guard1 = false;
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
  emxInit_real_T(sp, &muMPM, 1, &td_emlrtRTEI, true);
  st.site = &xd_emlrtRSI;
  FKLDBarycenter(&st, comps, bar_w, bar_mu, bar_Sigma);
  i = muMPM->size[0];
  muMPM->size[0] = bar_mu->size[0];
  emxEnsureCapacity_real_T(sp, muMPM, i, &td_emlrtRTEI);
  loop_ub = bar_mu->size[0];
  for (i = 0; i < loop_ub; i++) {
    muMPM->data[i] = bar_mu->data[i];
  }
  /*       [~,idx] = max([comps.w]); */
  /*       bar = comps(idx); */
  /*       bar.w = sum([comps.w]); */
  if (1 > comps->size[0]) {
    emlrtDynamicBoundsCheckR2012b(1, 1, comps->size[0], &v_emlrtBCI,
                                  (emlrtCTX)sp);
  }
  emxInit_real_T(sp, &barRKLD_mu, 1, &ge_emlrtRTEI, true);
  emxInit_real_T(sp, &barRKLD_Sigma, 2, &ge_emlrtRTEI, true);
  emxInit_real_T(sp, &wi, 1, &me_emlrtRTEI, true);
  emxInit_real_T(sp, &mui, 2, &me_emlrtRTEI, true);
  emxInit_real_T(sp, &Sigmai, 3, &me_emlrtRTEI, true);
  emxInit_real_T(sp, &A, 2, &oe_emlrtRTEI, true);
  d = comps->data[0].mu->size[0];
  st.site = &yd_emlrtRSI;
  paramsFromMixture(&st, comps, wi, mui, Sigmai);
  st.site = &ae_emlrtRSI;
  sumWi = sum(&st, wi);
  st.site = &be_emlrtRSI;
  RKLDBarycenter(&st, comps, &alpha1, barRKLD_mu, barRKLD_Sigma);
  st.site = &ce_emlrtRSI;
  b_st.site = &ce_emlrtRSI;
  eye(&b_st, comps->data[0].mu->size[0], A);
  if (barRKLD_Sigma->size[1] != A->size[1]) {
    emlrtErrorWithMessageIdR2018a(&st, &b_emlrtRTEI, "MATLAB:dimagree",
                                  "MATLAB:dimagree", 0);
  }
  emxInit_real_T(&st, &PsiCIinv, 2, &he_emlrtRTEI, true);
  emxInit_real_T(&st, &muCI, 1, &ie_emlrtRTEI, true);
  emxInit_creal_T(&st, &srPsiCIinv, 2, &je_emlrtRTEI, true);
  b_st.site = &pb_emlrtRSI;
  mrdiv(&b_st, A, barRKLD_Sigma, PsiCIinv);
  st.site = &de_emlrtRSI;
  b_st.site = &id_emlrtRSI;
  dynamic_size_checks(&b_st, PsiCIinv, barRKLD_mu, PsiCIinv->size[1],
                      barRKLD_mu->size[0]);
  b_st.site = &hd_emlrtRSI;
  mtimes(&b_st, PsiCIinv, barRKLD_mu, muCI);
  st.site = &ee_emlrtRSI;
  sqrtm(&st, PsiCIinv, srPsiCIinv);
  st.site = &fe_emlrtRSI;
  b_st.site = &fe_emlrtRSI;
  eye(&b_st, comps->data[0].mu->size[0], A);
  if (srPsiCIinv->size[1] != A->size[1]) {
    emlrtErrorWithMessageIdR2018a(&st, &b_emlrtRTEI, "MATLAB:dimagree",
                                  "MATLAB:dimagree", 0);
  }
  emxInit_creal_T(&st, &srPsiCI, 2, &ke_emlrtRTEI, true);
  b_st.site = &pb_emlrtRSI;
  b_mrdiv(&b_st, A, srPsiCIinv, srPsiCI);
  numIter = 0;
  k = 0;
  emxInit_real_T(sp, &Sigmainv, 2, &le_emlrtRTEI, true);
  emxInit_real_T(sp, &diff, 1, &yd_emlrtRTEI, true);
  emxInit_creal_T(sp, &Sigma, 2, &ne_emlrtRTEI, true);
  emxInit_real_T(sp, &Y, 2, &pe_emlrtRTEI, true);
  emxInit_creal_T(sp, &y, 2, &qe_emlrtRTEI, true);
  emxInit_creal_T(sp, &b, 2, &re_emlrtRTEI, true);
  emxInit_real_T(sp, &Sigmaiinv, 2, &se_emlrtRTEI, true);
  emxInit_real_T(sp, &Sigmajinv, 2, &te_emlrtRTEI, true);
  emxInit_real_T(sp, &b_y, 2, &ue_emlrtRTEI, true);
  exitg1 = false;
  while ((!exitg1) && (k < 500)) {
    i = barRKLD_mu->size[0];
    barRKLD_mu->size[0] = bar_mu->size[0];
    emxEnsureCapacity_real_T(sp, barRKLD_mu, i, &ud_emlrtRTEI);
    loop_ub = bar_mu->size[0];
    for (i = 0; i < loop_ub; i++) {
      barRKLD_mu->data[i] = bar_mu->data[i];
    }
    i = barRKLD_Sigma->size[0] * barRKLD_Sigma->size[1];
    barRKLD_Sigma->size[0] = bar_Sigma->size[0];
    barRKLD_Sigma->size[1] = bar_Sigma->size[1];
    emxEnsureCapacity_real_T(sp, barRKLD_Sigma, i, &ud_emlrtRTEI);
    loop_ub = bar_Sigma->size[0] * bar_Sigma->size[1];
    for (i = 0; i < loop_ub; i++) {
      barRKLD_Sigma->data[i] = bar_Sigma->data[i];
    }
    st.site = &ge_emlrtRSI;
    b_st.site = &ge_emlrtRSI;
    eye(&b_st, d, A);
    if (bar_Sigma->size[1] != A->size[1]) {
      emlrtErrorWithMessageIdR2018a(&st, &b_emlrtRTEI, "MATLAB:dimagree",
                                    "MATLAB:dimagree", 0);
    }
    b_st.site = &pb_emlrtRSI;
    mrdiv(&b_st, A, bar_Sigma, Sigmainv);
    iv[0] = (*(int32_T(*)[2])PsiCIinv->size)[0];
    iv[1] = (*(int32_T(*)[2])PsiCIinv->size)[1];
    iv1[0] = (*(int32_T(*)[2])Sigmainv->size)[0];
    iv1[1] = (*(int32_T(*)[2])Sigmainv->size)[1];
    emlrtSizeEqCheckNDR2012b(&iv[0], &iv1[0], &t_emlrtECI, (emlrtCTX)sp);
    st.site = &he_emlrtRSI;
    b_st.site = &id_emlrtRSI;
    dynamic_size_checks(&b_st, Sigmainv, muMPM, Sigmainv->size[1],
                        muMPM->size[0]);
    b_st.site = &hd_emlrtRSI;
    mtimes(&b_st, Sigmainv, muMPM, diff);
    if (muCI->size[0] != diff->size[0]) {
      emlrtSizeEqCheck1DR2012b(muCI->size[0], diff->size[0], &u_emlrtECI,
                               (emlrtCTX)sp);
    }
    st.site = &he_emlrtRSI;
    b_st.site = &he_emlrtRSI;
    eye(&b_st, d, A);
    loop_ub = PsiCIinv->size[0] * PsiCIinv->size[1];
    i = Sigmainv->size[0] * Sigmainv->size[1];
    Sigmainv->size[0] = PsiCIinv->size[0];
    Sigmainv->size[1] = PsiCIinv->size[1];
    emxEnsureCapacity_real_T(&st, Sigmainv, i, &vd_emlrtRTEI);
    for (i = 0; i < loop_ub; i++) {
      Sigmainv->data[i] += PsiCIinv->data[i];
    }
    if (Sigmainv->size[1] != A->size[1]) {
      emlrtErrorWithMessageIdR2018a(&st, &b_emlrtRTEI, "MATLAB:dimagree",
                                    "MATLAB:dimagree", 0);
    }
    b_st.site = &pb_emlrtRSI;
    mrdiv(&b_st, A, Sigmainv, Y);
    st.site = &he_emlrtRSI;
    i = diff->size[0];
    diff->size[0] = muCI->size[0];
    emxEnsureCapacity_real_T(&st, diff, i, &wd_emlrtRTEI);
    loop_ub = muCI->size[0];
    for (i = 0; i < loop_ub; i++) {
      diff->data[i] += muCI->data[i];
    }
    b_st.site = &id_emlrtRSI;
    dynamic_size_checks(&b_st, Y, diff, Y->size[1], diff->size[0]);
    b_st.site = &hd_emlrtRSI;
    mtimes(&b_st, Y, diff, bar_mu);
    i = Sigmainv->size[0] * Sigmainv->size[1];
    Sigmainv->size[0] = d;
    Sigmainv->size[1] = d;
    emxEnsureCapacity_real_T(sp, Sigmainv, i, &xd_emlrtRTEI);
    loop_ub = d * d;
    for (i = 0; i < loop_ub; i++) {
      Sigmainv->data[i] = 0.0;
    }
    i = comps->size[0];
    if (0 <= comps->size[0] - 1) {
      i1 = mui->size[0];
      i2 = mui->size[0];
      b_loop_ub = mui->size[0];
      iv3[0] = Sigmai->size[0];
      iv3[1] = Sigmai->size[1];
      c_loop_ub = Sigmai->size[0];
      i3 = Sigmai->size[1];
      d_loop_ub = Sigmai->size[1];
    }
    for (b_i = 0; b_i < i; b_i++) {
      if (b_i + 1 > mui->size[1]) {
        emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, mui->size[1], &w_emlrtBCI,
                                      (emlrtCTX)sp);
      }
      if (i1 != bar_mu->size[0]) {
        emlrtSizeEqCheck1DR2012b(i1, bar_mu->size[0], &v_emlrtECI,
                                 (emlrtCTX)sp);
      }
      i4 = diff->size[0];
      diff->size[0] = i2;
      emxEnsureCapacity_real_T(sp, diff, i4, &yd_emlrtRTEI);
      for (i4 = 0; i4 < b_loop_ub; i4++) {
        diff->data[i4] = mui->data[i4 + mui->size[0] * b_i] - bar_mu->data[i4];
      }
      if (b_i + 1 > Sigmai->size[2]) {
        emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, Sigmai->size[2], &y_emlrtBCI,
                                      (emlrtCTX)sp);
      }
      i4 = Y->size[0] * Y->size[1];
      Y->size[0] = diff->size[0];
      Y->size[1] = diff->size[0];
      emxEnsureCapacity_real_T(sp, Y, i4, &ae_emlrtRTEI);
      loop_ub = diff->size[0];
      for (i4 = 0; i4 < loop_ub; i4++) {
        e_loop_ub = diff->size[0];
        for (i5 = 0; i5 < e_loop_ub; i5++) {
          Y->data[i5 + Y->size[0] * i4] = diff->data[i5] * diff->data[i4];
        }
      }
      iv[0] = (*(int32_T(*)[2])Y->size)[0];
      iv[1] = (*(int32_T(*)[2])Y->size)[1];
      emlrtSizeEqCheckNDR2012b(&iv3[0], &iv[0], &w_emlrtECI, (emlrtCTX)sp);
      if (b_i + 1 > wi->size[0]) {
        emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, wi->size[0], &x_emlrtBCI,
                                      (emlrtCTX)sp);
      }
      i4 = Y->size[0] * Y->size[1];
      Y->size[0] = c_loop_ub;
      Y->size[1] = i3;
      emxEnsureCapacity_real_T(sp, Y, i4, &ce_emlrtRTEI);
      for (i4 = 0; i4 < d_loop_ub; i4++) {
        for (i5 = 0; i5 < c_loop_ub; i5++) {
          Y->data[i5 + Y->size[0] * i4] =
              wi->data[b_i] *
              (Sigmai->data[(i5 + Sigmai->size[0] * i4) +
                            Sigmai->size[0] * Sigmai->size[1] * b_i] +
               Y->data[i5 + Y->size[0] * i4]);
        }
      }
      iv[0] = (*(int32_T(*)[2])Sigmainv->size)[0];
      iv[1] = (*(int32_T(*)[2])Sigmainv->size)[1];
      iv1[0] = (*(int32_T(*)[2])Y->size)[0];
      iv1[1] = (*(int32_T(*)[2])Y->size)[1];
      emlrtSizeEqCheckNDR2012b(&iv[0], &iv1[0], &x_emlrtECI, (emlrtCTX)sp);
      loop_ub = Sigmainv->size[0] * Sigmainv->size[1];
      for (i4 = 0; i4 < loop_ub; i4++) {
        Sigmainv->data[i4] += Y->data[i4];
      }
      if (*emlrtBreakCheckR2012bFlagVar != 0) {
        emlrtBreakCheckR2012b((emlrtCTX)sp);
      }
    }
    loop_ub = Sigmainv->size[0] * Sigmainv->size[1];
    for (i = 0; i < loop_ub; i++) {
      Sigmainv->data[i] /= sumWi;
    }
    st.site = &ie_emlrtRSI;
    b_st.site = &id_emlrtRSI;
    if (Sigmainv->size[0] != srPsiCIinv->size[1]) {
      if (((srPsiCIinv->size[0] == 1) && (srPsiCIinv->size[1] == 1)) ||
          ((Sigmainv->size[0] == 1) && (Sigmainv->size[1] == 1))) {
        emlrtErrorWithMessageIdR2018a(
            &b_st, &d_emlrtRTEI,
            "Coder:toolbox:mtimes_noDynamicScalarExpansion",
            "Coder:toolbox:mtimes_noDynamicScalarExpansion", 0);
      } else {
        emlrtErrorWithMessageIdR2018a(&b_st, &c_emlrtRTEI, "MATLAB:innerdim",
                                      "MATLAB:innerdim", 0);
      }
    }
    i = Sigma->size[0] * Sigma->size[1];
    Sigma->size[0] = Sigmainv->size[0];
    Sigma->size[1] = Sigmainv->size[1];
    emxEnsureCapacity_creal_T(&st, Sigma, i, &cb_emlrtRTEI);
    loop_ub = Sigmainv->size[0] * Sigmainv->size[1];
    for (i = 0; i < loop_ub; i++) {
      Sigma->data[i].re = Sigmainv->data[i];
      Sigma->data[i].im = 0.0;
    }
    i = y->size[0] * y->size[1];
    y->size[0] = srPsiCIinv->size[0];
    y->size[1] = Sigma->size[1];
    emxEnsureCapacity_creal_T(&st, y, i, &be_emlrtRTEI);
    loop_ub = srPsiCIinv->size[0];
    for (i = 0; i < loop_ub; i++) {
      e_loop_ub = Sigma->size[1];
      for (i4 = 0; i4 < e_loop_ub; i4++) {
        y->data[i + y->size[0] * i4].re = 0.0;
        y->data[i + y->size[0] * i4].im = 0.0;
        b_i = srPsiCIinv->size[1];
        for (i5 = 0; i5 < b_i; i5++) {
          y->data[i + y->size[0] * i4].re +=
              srPsiCIinv->data[i + srPsiCIinv->size[0] * i5].re *
                  Sigma->data[i5 + Sigma->size[0] * i4].re -
              srPsiCIinv->data[i + srPsiCIinv->size[0] * i5].im *
                  Sigma->data[i5 + Sigma->size[0] * i4].im;
          y->data[i + y->size[0] * i4].im +=
              srPsiCIinv->data[i + srPsiCIinv->size[0] * i5].re *
                  Sigma->data[i5 + Sigma->size[0] * i4].im +
              srPsiCIinv->data[i + srPsiCIinv->size[0] * i5].im *
                  Sigma->data[i5 + Sigma->size[0] * i4].re;
        }
      }
    }
    st.site = &ie_emlrtRSI;
    b_st.site = &id_emlrtRSI;
    b_dynamic_size_checks(&b_st, y, srPsiCIinv, y->size[1],
                          srPsiCIinv->size[0]);
    b_st.site = &hd_emlrtRSI;
    b_mtimes(&b_st, y, srPsiCIinv, Sigma);
    st.site = &ie_emlrtRSI;
    b_st.site = &ie_emlrtRSI;
    b_sqrtm(&b_st, Sigma, b);
    b_st.site = &id_emlrtRSI;
    b_dynamic_size_checks(&b_st, srPsiCI, b, srPsiCI->size[1], b->size[0]);
    b_st.site = &hd_emlrtRSI;
    b_mtimes(&b_st, srPsiCI, b, y);
    st.site = &ie_emlrtRSI;
    b_st.site = &id_emlrtRSI;
    b_dynamic_size_checks(&b_st, y, srPsiCI, y->size[1], srPsiCI->size[0]);
    b_st.site = &hd_emlrtRSI;
    b_mtimes(&b_st, y, srPsiCI, Sigma);
    /* Sigma = sqrtm(PsiMPM)*srPsiCI; */
    i = bar_Sigma->size[0] * bar_Sigma->size[1];
    bar_Sigma->size[0] = Sigma->size[0];
    bar_Sigma->size[1] = Sigma->size[1];
    emxEnsureCapacity_real_T(sp, bar_Sigma, i, &de_emlrtRTEI);
    loop_ub = Sigma->size[0] * Sigma->size[1];
    for (i = 0; i < loop_ub; i++) {
      bar_Sigma->data[i] = Sigma->data[i].re;
    }
    guard1 = false;
    if (muDoubleScalarRem((real_T)k + 1.0, 3.0) == 0.0) {
      st.site = &je_emlrtRSI;
      /*  sKLD = SKLDij(pdfh,pdfr): */
      /*  INPUTS: */
      /*  - pdfh, pdfr, two Gaussian densities. */
      /*  OUTPUTS: */
      /*  - sKLD, resulting symmetrization of the Kullback-Leibler divergence
       * (scalar). */
      /*  This function computes the KLD symmetrization between two multivariate
       * Gaussians. It is */
      /*  not suitable for other kind of distributions. */
      if (bar_mu->size[0] != barRKLD_mu->size[0]) {
        emlrtSizeEqCheck1DR2012b(bar_mu->size[0], barRKLD_mu->size[0],
                                 &y_emlrtECI, &st);
      }
      i = diff->size[0];
      diff->size[0] = bar_mu->size[0];
      emxEnsureCapacity_real_T(&st, diff, i, &ee_emlrtRTEI);
      loop_ub = bar_mu->size[0];
      for (i = 0; i < loop_ub; i++) {
        diff->data[i] = bar_mu->data[i] - barRKLD_mu->data[i];
      }
      b_st.site = &lg_emlrtRSI;
      c_st.site = &lg_emlrtRSI;
      eye(&c_st, bar_mu->size[0], A);
      if (bar_Sigma->size[1] != A->size[1]) {
        emlrtErrorWithMessageIdR2018a(&b_st, &b_emlrtRTEI, "MATLAB:dimagree",
                                      "MATLAB:dimagree", 0);
      }
      c_st.site = &pb_emlrtRSI;
      mrdiv(&c_st, A, bar_Sigma, Sigmaiinv);
      b_st.site = &mg_emlrtRSI;
      c_st.site = &mg_emlrtRSI;
      eye(&c_st, bar_mu->size[0], A);
      if (barRKLD_Sigma->size[1] != A->size[1]) {
        emlrtErrorWithMessageIdR2018a(&b_st, &b_emlrtRTEI, "MATLAB:dimagree",
                                      "MATLAB:dimagree", 0);
      }
      c_st.site = &pb_emlrtRSI;
      mrdiv(&c_st, A, barRKLD_Sigma, Sigmajinv);
      /* sKLD = 0.5*(KLDij(pdfi,pdfj) + KLDij(pdfj,pdfi)); */
      iv[0] = (*(int32_T(*)[2])Sigmaiinv->size)[0];
      iv[1] = (*(int32_T(*)[2])Sigmaiinv->size)[1];
      iv1[0] = (*(int32_T(*)[2])Sigmajinv->size)[0];
      iv1[1] = (*(int32_T(*)[2])Sigmajinv->size)[1];
      emlrtSizeEqCheckNDR2012b(&iv[0], &iv1[0], &ab_emlrtECI, &st);
      b_st.site = &ng_emlrtRSI;
      c_st.site = &id_emlrtRSI;
      d_dynamic_size_checks(&c_st, Sigmajinv, bar_Sigma, Sigmajinv->size[1],
                            bar_Sigma->size[0]);
      c_st.site = &hd_emlrtRSI;
      d_mtimes(&c_st, Sigmajinv, bar_Sigma, Sigmainv);
      b_st.site = &ng_emlrtRSI;
      c_st.site = &id_emlrtRSI;
      d_dynamic_size_checks(&c_st, Sigmaiinv, barRKLD_Sigma, Sigmaiinv->size[1],
                            barRKLD_Sigma->size[0]);
      c_st.site = &hd_emlrtRSI;
      d_mtimes(&c_st, Sigmaiinv, barRKLD_Sigma, Y);
      b_st.site = &ng_emlrtRSI;
      loop_ub = Sigmaiinv->size[0] * Sigmaiinv->size[1];
      for (i = 0; i < loop_ub; i++) {
        Sigmaiinv->data[i] += Sigmajinv->data[i];
      }
      c_st.site = &id_emlrtRSI;
      if (diff->size[0] != Sigmaiinv->size[0]) {
        if ((diff->size[0] == 1) ||
            ((Sigmaiinv->size[0] == 1) && (Sigmaiinv->size[1] == 1))) {
          emlrtErrorWithMessageIdR2018a(
              &c_st, &d_emlrtRTEI,
              "Coder:toolbox:mtimes_noDynamicScalarExpansion",
              "Coder:toolbox:mtimes_noDynamicScalarExpansion", 0);
        } else {
          emlrtErrorWithMessageIdR2018a(&c_st, &c_emlrtRTEI, "MATLAB:innerdim",
                                        "MATLAB:innerdim", 0);
        }
      }
      c_st.site = &hd_emlrtRSI;
      if ((diff->size[0] == 0) || (Sigmaiinv->size[0] == 0) ||
          (Sigmaiinv->size[1] == 0)) {
        i = b_y->size[0] * b_y->size[1];
        b_y->size[0] = 1;
        b_y->size[1] = Sigmaiinv->size[1];
        emxEnsureCapacity_real_T(&c_st, b_y, i, &fe_emlrtRTEI);
        loop_ub = Sigmaiinv->size[1];
        for (i = 0; i < loop_ub; i++) {
          b_y->data[i] = 0.0;
        }
      } else {
        d_st.site = &jd_emlrtRSI;
        e_st.site = &kd_emlrtRSI;
        TRANSB1 = 'N';
        TRANSA1 = 'T';
        alpha1 = 1.0;
        beta1 = 0.0;
        m_t = (ptrdiff_t)1;
        n_t = (ptrdiff_t)Sigmaiinv->size[1];
        k_t = (ptrdiff_t)diff->size[0];
        lda_t = (ptrdiff_t)diff->size[0];
        ldb_t = (ptrdiff_t)Sigmaiinv->size[0];
        ldc_t = (ptrdiff_t)1;
        i = b_y->size[0] * b_y->size[1];
        b_y->size[0] = 1;
        b_y->size[1] = Sigmaiinv->size[1];
        emxEnsureCapacity_real_T(&e_st, b_y, i, &jd_emlrtRTEI);
        dgemm(&TRANSA1, &TRANSB1, &m_t, &n_t, &k_t, &alpha1, &diff->data[0],
              &lda_t, &Sigmaiinv->data[0], &ldb_t, &beta1, &b_y->data[0],
              &ldc_t);
      }
      b_st.site = &ng_emlrtRSI;
      c_st.site = &id_emlrtRSI;
      if (diff->size[0] != b_y->size[1]) {
        if ((b_y->size[1] == 1) || (diff->size[0] == 1)) {
          emlrtErrorWithMessageIdR2018a(
              &c_st, &d_emlrtRTEI,
              "Coder:toolbox:mtimes_noDynamicScalarExpansion",
              "Coder:toolbox:mtimes_noDynamicScalarExpansion", 0);
        } else {
          emlrtErrorWithMessageIdR2018a(&c_st, &c_emlrtRTEI, "MATLAB:innerdim",
                                        "MATLAB:innerdim", 0);
        }
      }
      if (b_y->size[1] < 1) {
        alpha1 = 0.0;
      } else {
        n_t = (ptrdiff_t)b_y->size[1];
        m_t = (ptrdiff_t)1;
        k_t = (ptrdiff_t)1;
        alpha1 = ddot(&n_t, &b_y->data[0], &m_t, &diff->data[0], &k_t);
      }
      b_st.site = &ng_emlrtRSI;
      alpha1 = 0.25 * (((trace(&b_st, Sigmainv) + trace(&b_st, Y)) + alpha1) -
                       2.0 * (real_T)bar_mu->size[0]);
      if (alpha1 < 1.0E-9) {
        exitg1 = true;
      } else {
        guard1 = true;
      }
    } else {
      guard1 = true;
    }
    if (guard1) {
      numIter = k + 1;
      k++;
      if (*emlrtBreakCheckR2012bFlagVar != 0) {
        emlrtBreakCheckR2012b((emlrtCTX)sp);
      }
    }
  }
  emxFree_real_T(&b_y);
  emxFree_real_T(&Sigmajinv);
  emxFree_real_T(&Sigmaiinv);
  emxFree_creal_T(&b);
  emxFree_creal_T(&y);
  emxFree_real_T(&Y);
  emxFree_real_T(&A);
  emxFree_creal_T(&Sigma);
  emxFree_real_T(&Sigmai);
  emxFree_real_T(&mui);
  emxFree_real_T(&wi);
  emxFree_real_T(&diff);
  emxFree_real_T(&Sigmainv);
  emxFree_creal_T(&srPsiCI);
  emxFree_creal_T(&srPsiCIinv);
  emxFree_real_T(&muCI);
  emxFree_real_T(&PsiCIinv);
  emxFree_real_T(&barRKLD_Sigma);
  emxFree_real_T(&barRKLD_mu);
  emxFree_real_T(&muMPM);
  if (numIter == 500) {
    c_y = NULL;
    m = emlrtCreateCharArray(2, &iv2[0]);
    emlrtInitCharArrayR2013a((emlrtCTX)sp, 66, m, &u[0]);
    emlrtAssign(&c_y, m);
    st.site = &ah_emlrtRSI;
    disp(&st, c_y, &h_emlrtMCI);
  }
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtCTX)sp);
}

/* End of code generation (SKLDBarycenter.c) */
