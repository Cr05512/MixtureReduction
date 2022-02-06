/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * FKLDBarycenter.c
 *
 * Code generation for function 'FKLDBarycenter'
 *
 */

/* Include files */
#include "FKLDBarycenter.h"
#include "alphaJDBarycenter_data.h"
#include "alphaJDBarycenter_emxutil.h"
#include "alphaJDBarycenter_mexutil.h"
#include "alphaJDBarycenter_types.h"
#include "paramsFromMixture.h"
#include "rt_nonfinite.h"
#include "sum.h"

/* Variable Definitions */
static emlrtRSInfo
    vd_emlrtRSI =
        {
            12,               /* lineNo */
            "FKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    wd_emlrtRSI =
        {
            16,               /* lineNo */
            "FKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pathName */
};

static emlrtMCInfo
    g_emlrtMCI =
        {
            10,               /* lineNo */
            1,                /* colNo */
            "FKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pName */
};

static emlrtBCInfo p_emlrtBCI =
    {
        -1,               /* iFirst */
        -1,               /* iLast */
        20,               /* lineNo */
        23,               /* colNo */
        "w",              /* aName */
        "FKLDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/FKLDBarycenter.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtBCInfo q_emlrtBCI =
    {
        -1,               /* iFirst */
        -1,               /* iLast */
        20,               /* lineNo */
        31,               /* colNo */
        "mu",             /* aName */
        "FKLDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/FKLDBarycenter.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtECInfo
    o_emlrtECI =
        {
            -1,               /* nDims */
            20,               /* lineNo */
            13,               /* colNo */
            "FKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pName */
};

static emlrtBCInfo r_emlrtBCI =
    {
        -1,               /* iFirst */
        -1,               /* iLast */
        27,               /* lineNo */
        29,               /* colNo */
        "w",              /* aName */
        "FKLDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/FKLDBarycenter.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtBCInfo s_emlrtBCI =
    {
        -1,               /* iFirst */
        -1,               /* iLast */
        27,               /* lineNo */
        43,               /* colNo */
        "Sigma",          /* aName */
        "FKLDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/FKLDBarycenter.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtBCInfo t_emlrtBCI =
    {
        -1,               /* iFirst */
        -1,               /* iLast */
        27,               /* lineNo */
        52,               /* colNo */
        "mu",             /* aName */
        "FKLDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/FKLDBarycenter.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtECInfo
    p_emlrtECI =
        {
            -1,               /* nDims */
            27,               /* lineNo */
            47,               /* colNo */
            "FKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pName */
};

static emlrtBCInfo u_emlrtBCI =
    {
        -1,               /* iFirst */
        -1,               /* iLast */
        27,               /* lineNo */
        70,               /* colNo */
        "mu",             /* aName */
        "FKLDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/FKLDBarycenter.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtECInfo
    q_emlrtECI =
        {
            -1,               /* nDims */
            27,               /* lineNo */
            65,               /* colNo */
            "FKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pName */
};

static emlrtECInfo
    r_emlrtECI =
        {
            2,                /* nDims */
            27,               /* lineNo */
            33,               /* colNo */
            "FKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pName */
};

static emlrtECInfo
    s_emlrtECI =
        {
            2,                /* nDims */
            27,               /* lineNo */
            16,               /* colNo */
            "FKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    kd_emlrtRTEI =
        {
            18,               /* lineNo */
            1,                /* colNo */
            "FKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    ld_emlrtRTEI =
        {
            24,               /* lineNo */
            1,                /* colNo */
            "FKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    md_emlrtRTEI =
        {
            20,               /* lineNo */
            21,               /* colNo */
            "FKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    nd_emlrtRTEI =
        {
            31,               /* lineNo */
            46,               /* colNo */
            "FKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    od_emlrtRTEI =
        {
            27,               /* lineNo */
            47,               /* colNo */
            "FKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    pd_emlrtRTEI =
        {
            27,               /* lineNo */
            65,               /* colNo */
            "FKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    qd_emlrtRTEI =
        {
            27,               /* lineNo */
            46,               /* colNo */
            "FKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    rd_emlrtRTEI =
        {
            27,               /* lineNo */
            27,               /* colNo */
            "FKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    sd_emlrtRTEI =
        {
            1,                /* lineNo */
            20,               /* colNo */
            "FKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pName */
};

static emlrtRSInfo
    ch_emlrtRSI =
        {
            10,               /* lineNo */
            "FKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pathName */
};

/* Function Definitions */
void FKLDBarycenter(const emlrtStack *sp, const emxArray_struct0_T *comps,
                    real_T *FKLDBar_w, emxArray_real_T *FKLDBar_mu,
                    emxArray_real_T *FKLDBar_Sigma)
{
  static const int32_T iv[2] = {1, 66};
  emlrtStack st;
  emxArray_real_T *Sigma;
  emxArray_real_T *Sigmabar;
  emxArray_real_T *b_mu;
  emxArray_real_T *c_mu;
  emxArray_real_T *mu;
  emxArray_real_T *r;
  emxArray_real_T *w;
  const mxArray *m;
  const mxArray *y;
  real_T a;
  real_T wbar;
  int32_T iv1[2];
  int32_T iv2[2];
  int32_T iv3[2];
  int32_T b_i;
  int32_T b_loop_ub;
  int32_T c_loop_ub;
  int32_T d_loop_ub;
  int32_T e_loop_ub;
  int32_T i;
  int32_T i1;
  int32_T i2;
  int32_T i3;
  int32_T i4;
  int32_T i5;
  int32_T i6;
  int32_T i7;
  int32_T loop_ub;
  st.prev = sp;
  st.tls = sp->tls;
  emlrtHeapReferenceStackEnterFcnR2012b((emlrtCTX)sp);
  /*  KLDBar = KLDBarycenter(comps): */
  /*  INPUTS: */
  /*  - comps, a vector of weighted Gaussian components (numComps x 1 vector).
   */
  /*  OUTPUTS: */
  /*  - KLDBar, the moment preserving merge of the input components (weighted
   * Gaussian density). */
  /*  This function takes as input a vecot of Gaussian components and returns */
  /*  their moment-preseving merge (KLD-barycenter). */
  if (comps->size[0] <= 0) {
    y = NULL;
    m = emlrtCreateCharArray(2, &iv[0]);
    emlrtInitCharArrayR2013a((emlrtCTX)sp, 66, m, &cv[0]);
    emlrtAssign(&y, m);
    st.site = &ch_emlrtRSI;
    error(&st, y, &g_emlrtMCI);
  }
  emxInit_real_T(sp, &w, 1, &sd_emlrtRTEI, true);
  emxInit_real_T(sp, &mu, 2, &sd_emlrtRTEI, true);
  emxInit_real_T(sp, &Sigma, 3, &sd_emlrtRTEI, true);
  st.site = &vd_emlrtRSI;
  paramsFromMixture(&st, comps, w, mu, Sigma);
  st.site = &wd_emlrtRSI;
  wbar = sum(&st, w);
  loop_ub = mu->size[0];
  i = FKLDBar_mu->size[0];
  FKLDBar_mu->size[0] = mu->size[0];
  emxEnsureCapacity_real_T(sp, FKLDBar_mu, i, &kd_emlrtRTEI);
  for (i = 0; i < loop_ub; i++) {
    FKLDBar_mu->data[i] = 0.0;
  }
  i = comps->size[0];
  emxInit_real_T(sp, &b_mu, 1, &od_emlrtRTEI, true);
  for (b_i = 0; b_i < i; b_i++) {
    if (b_i + 1 > w->size[0]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, w->size[0], &p_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    if (b_i + 1 > mu->size[1]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, mu->size[1], &q_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    loop_ub = mu->size[0];
    i1 = b_mu->size[0];
    b_mu->size[0] = mu->size[0];
    emxEnsureCapacity_real_T(sp, b_mu, i1, &md_emlrtRTEI);
    for (i1 = 0; i1 < loop_ub; i1++) {
      b_mu->data[i1] = w->data[b_i] * mu->data[i1 + mu->size[0] * b_i];
    }
    loop_ub = FKLDBar_mu->size[0];
    if (FKLDBar_mu->size[0] != b_mu->size[0]) {
      emlrtSizeEqCheck1DR2012b(FKLDBar_mu->size[0], b_mu->size[0], &o_emlrtECI,
                               (emlrtCTX)sp);
    }
    for (i1 = 0; i1 < loop_ub; i1++) {
      FKLDBar_mu->data[i1] += b_mu->data[i1];
    }
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b((emlrtCTX)sp);
    }
  }
  a = 1.0 / wbar;
  loop_ub = FKLDBar_mu->size[0];
  for (i = 0; i < loop_ub; i++) {
    FKLDBar_mu->data[i] *= a;
  }
  emxInit_real_T(sp, &Sigmabar, 2, &ld_emlrtRTEI, true);
  i = Sigmabar->size[0] * Sigmabar->size[1];
  Sigmabar->size[0] = mu->size[0];
  Sigmabar->size[1] = mu->size[0];
  emxEnsureCapacity_real_T(sp, Sigmabar, i, &ld_emlrtRTEI);
  loop_ub = mu->size[0] * mu->size[0];
  for (i = 0; i < loop_ub; i++) {
    Sigmabar->data[i] = 0.0;
  }
  i = comps->size[0];
  if (0 <= comps->size[0] - 1) {
    i2 = mu->size[0];
    i3 = mu->size[0];
    i4 = mu->size[0];
    b_loop_ub = mu->size[0];
    i5 = mu->size[0];
    iv1[0] = Sigma->size[0];
    iv1[1] = Sigma->size[1];
    c_loop_ub = Sigma->size[0];
    i6 = Sigma->size[1];
    d_loop_ub = Sigma->size[1];
  }
  emxInit_real_T(sp, &r, 2, &sd_emlrtRTEI, true);
  emxInit_real_T(sp, &c_mu, 2, &pd_emlrtRTEI, true);
  for (b_i = 0; b_i < i; b_i++) {
    if (b_i + 1 > mu->size[1]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, mu->size[1], &t_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    if (i2 != FKLDBar_mu->size[0]) {
      emlrtSizeEqCheck1DR2012b(i2, FKLDBar_mu->size[0], &p_emlrtECI,
                               (emlrtCTX)sp);
    }
    if (b_i + 1 > mu->size[1]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, mu->size[1], &u_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    if (i3 != FKLDBar_mu->size[0]) {
      emlrtSizeEqCheck1DR2012b(i3, FKLDBar_mu->size[0], &q_emlrtECI,
                               (emlrtCTX)sp);
    }
    if (b_i + 1 > Sigma->size[2]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, Sigma->size[2], &s_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    i1 = b_mu->size[0];
    b_mu->size[0] = i4;
    emxEnsureCapacity_real_T(sp, b_mu, i1, &od_emlrtRTEI);
    i1 = c_mu->size[0] * c_mu->size[1];
    c_mu->size[0] = 1;
    c_mu->size[1] = i5;
    emxEnsureCapacity_real_T(sp, c_mu, i1, &pd_emlrtRTEI);
    for (i1 = 0; i1 < b_loop_ub; i1++) {
      a = mu->data[i1 + mu->size[0] * b_i] - FKLDBar_mu->data[i1];
      b_mu->data[i1] = a;
      c_mu->data[i1] = a;
    }
    i1 = r->size[0] * r->size[1];
    r->size[0] = b_mu->size[0];
    r->size[1] = c_mu->size[1];
    emxEnsureCapacity_real_T(sp, r, i1, &qd_emlrtRTEI);
    loop_ub = c_mu->size[1];
    for (i1 = 0; i1 < loop_ub; i1++) {
      e_loop_ub = b_mu->size[0];
      for (i7 = 0; i7 < e_loop_ub; i7++) {
        r->data[i7 + r->size[0] * i1] = b_mu->data[i7] * c_mu->data[i1];
      }
    }
    iv2[0] = (*(int32_T(*)[2])r->size)[0];
    iv2[1] = (*(int32_T(*)[2])r->size)[1];
    emlrtSizeEqCheckNDR2012b(&iv1[0], &iv2[0], &r_emlrtECI, (emlrtCTX)sp);
    if (b_i + 1 > w->size[0]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, w->size[0], &r_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    i1 = r->size[0] * r->size[1];
    r->size[0] = c_loop_ub;
    r->size[1] = i6;
    emxEnsureCapacity_real_T(sp, r, i1, &rd_emlrtRTEI);
    for (i1 = 0; i1 < d_loop_ub; i1++) {
      for (i7 = 0; i7 < c_loop_ub; i7++) {
        r->data[i7 + r->size[0] * i1] =
            w->data[b_i] * (Sigma->data[(i7 + Sigma->size[0] * i1) +
                                        Sigma->size[0] * Sigma->size[1] * b_i] +
                            r->data[i7 + r->size[0] * i1]);
      }
    }
    iv2[0] = (*(int32_T(*)[2])Sigmabar->size)[0];
    iv2[1] = (*(int32_T(*)[2])Sigmabar->size)[1];
    iv3[0] = (*(int32_T(*)[2])r->size)[0];
    iv3[1] = (*(int32_T(*)[2])r->size)[1];
    emlrtSizeEqCheckNDR2012b(&iv2[0], &iv3[0], &s_emlrtECI, (emlrtCTX)sp);
    loop_ub = Sigmabar->size[0] * Sigmabar->size[1];
    for (i1 = 0; i1 < loop_ub; i1++) {
      Sigmabar->data[i1] += r->data[i1];
    }
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b((emlrtCTX)sp);
    }
  }
  emxFree_real_T(&c_mu);
  emxFree_real_T(&b_mu);
  emxFree_real_T(&r);
  emxFree_real_T(&Sigma);
  emxFree_real_T(&mu);
  emxFree_real_T(&w);
  i = FKLDBar_Sigma->size[0] * FKLDBar_Sigma->size[1];
  FKLDBar_Sigma->size[0] = Sigmabar->size[0];
  FKLDBar_Sigma->size[1] = Sigmabar->size[1];
  emxEnsureCapacity_real_T(sp, FKLDBar_Sigma, i, &nd_emlrtRTEI);
  loop_ub = Sigmabar->size[0] * Sigmabar->size[1];
  for (i = 0; i < loop_ub; i++) {
    FKLDBar_Sigma->data[i] = Sigmabar->data[i] / wbar;
  }
  emxFree_real_T(&Sigmabar);
  *FKLDBar_w = wbar;
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtCTX)sp);
}

/* End of code generation (FKLDBarycenter.c) */
