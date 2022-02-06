/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * RKLDBarycenter.c
 *
 * Code generation for function 'RKLDBarycenter'
 *
 */

/* Include files */
#include "RKLDBarycenter.h"
#include "alphaJDBarycenter_data.h"
#include "alphaJDBarycenter_emxutil.h"
#include "alphaJDBarycenter_mexutil.h"
#include "alphaJDBarycenter_types.h"
#include "eml_int_forloop_overflow_check.h"
#include "eye.h"
#include "mrdivide_helper.h"
#include "mtimes.h"
#include "paramsFromMixture.h"
#include "rt_nonfinite.h"
#include "sum.h"

/* Variable Definitions */
static emlrtRSInfo
    p_emlrtRSI =
        {
            12,               /* lineNo */
            "RKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    q_emlrtRSI =
        {
            16,               /* lineNo */
            "RKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    r_emlrtRSI =
        {
            21,               /* lineNo */
            "RKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    s_emlrtRSI =
        {
            22,               /* lineNo */
            "RKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    t_emlrtRSI =
        {
            25,               /* lineNo */
            "RKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    u_emlrtRSI =
        {
            27,               /* lineNo */
            "RKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    v_emlrtRSI =
        {
            29,               /* lineNo */
            "RKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo ld_emlrtRSI = {
    112,                /* lineNo */
    "blockedSummation", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/"
    "blockedSummation.m" /* pathName */
};

static emlrtRSInfo md_emlrtRSI = {
    168,                /* lineNo */
    "colMajorFlatIter", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/"
    "blockedSummation.m" /* pathName */
};

static emlrtRSInfo nd_emlrtRSI = {
    173,                /* lineNo */
    "colMajorFlatIter", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/"
    "blockedSummation.m" /* pathName */
};

static emlrtRSInfo od_emlrtRSI = {
    190,                /* lineNo */
    "colMajorFlatIter", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/"
    "blockedSummation.m" /* pathName */
};

static emlrtRSInfo pd_emlrtRSI = {
    192,                /* lineNo */
    "colMajorFlatIter", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/"
    "blockedSummation.m" /* pathName */
};

static emlrtRSInfo qd_emlrtRSI = {
    204,                /* lineNo */
    "colMajorFlatIter", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/"
    "blockedSummation.m" /* pathName */
};

static emlrtRSInfo rd_emlrtRSI = {
    207,                /* lineNo */
    "colMajorFlatIter", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/"
    "blockedSummation.m" /* pathName */
};

static emlrtRSInfo sd_emlrtRSI = {
    225,                /* lineNo */
    "colMajorFlatIter", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/"
    "blockedSummation.m" /* pathName */
};

static emlrtRSInfo td_emlrtRSI = {
    227,                /* lineNo */
    "colMajorFlatIter", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/"
    "blockedSummation.m" /* pathName */
};

static emlrtRSInfo ud_emlrtRSI = {
    238,                /* lineNo */
    "colMajorFlatIter", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/"
    "blockedSummation.m" /* pathName */
};

static emlrtMCInfo
    b_emlrtMCI =
        {
            10,               /* lineNo */
            1,                /* colNo */
            "RKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pName */
};

static emlrtECInfo
    k_emlrtECI =
        {
            -1,               /* nDims */
            22,               /* lineNo */
            13,               /* colNo */
            "RKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pName */
};

static emlrtBCInfo e_emlrtBCI =
    {
        -1,               /* iFirst */
        -1,               /* iLast */
        22,               /* lineNo */
        43,               /* colNo */
        "mu",             /* aName */
        "RKLDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/RKLDBarycenter.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtBCInfo f_emlrtBCI =
    {
        -1,               /* iFirst */
        -1,               /* iLast */
        22,               /* lineNo */
        35,               /* colNo */
        "wSigmainv",      /* aName */
        "RKLDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/RKLDBarycenter.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtECInfo
    l_emlrtECI =
        {
            -1,               /* nDims */
            21,               /* lineNo */
            5,                /* colNo */
            "RKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pName */
};

static emlrtBCInfo g_emlrtBCI =
    {
        -1,               /* iFirst */
        -1,               /* iLast */
        21,               /* lineNo */
        19,               /* colNo */
        "wSigmainv",      /* aName */
        "RKLDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/RKLDBarycenter.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtBCInfo h_emlrtBCI =
    {
        -1,               /* iFirst */
        -1,               /* iLast */
        21,               /* lineNo */
        46,               /* colNo */
        "Sigma",          /* aName */
        "RKLDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/RKLDBarycenter.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtBCInfo i_emlrtBCI =
    {
        -1,               /* iFirst */
        -1,               /* iLast */
        21,               /* lineNo */
        26,               /* colNo */
        "w",              /* aName */
        "RKLDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/RKLDBarycenter.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtRTEInfo
    tb_emlrtRTEI =
        {
            18,               /* lineNo */
            1,                /* colNo */
            "RKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    ub_emlrtRTEI =
        {
            19,               /* lineNo */
            13,               /* colNo */
            "RKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    vb_emlrtRTEI =
        {
            25,               /* lineNo */
            1,                /* colNo */
            "RKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo wb_emlrtRTEI = {
    146,                /* lineNo */
    24,                 /* colNo */
    "blockedSummation", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/"
    "blockedSummation.m" /* pName */
};

static emlrtRTEInfo xb_emlrtRTEI = {
    153,                /* lineNo */
    23,                 /* colNo */
    "blockedSummation", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/"
    "blockedSummation.m" /* pName */
};

static emlrtRTEInfo
    yb_emlrtRTEI =
        {
            21,               /* lineNo */
            36,               /* colNo */
            "RKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    ac_emlrtRTEI =
        {
            33,               /* lineNo */
            46,               /* colNo */
            "RKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    bc_emlrtRTEI =
        {
            22,               /* lineNo */
            21,               /* colNo */
            "RKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    cc_emlrtRTEI =
        {
            22,               /* lineNo */
            38,               /* colNo */
            "RKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    dc_emlrtRTEI =
        {
            19,               /* lineNo */
            1,                /* colNo */
            "RKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    ec_emlrtRTEI =
        {
            27,               /* lineNo */
            1,                /* colNo */
            "RKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    fc_emlrtRTEI =
        {
            1,                /* lineNo */
            20,               /* colNo */
            "RKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    gc_emlrtRTEI =
        {
            21,               /* lineNo */
            29,               /* colNo */
            "RKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo hc_emlrtRTEI = {
    153,                /* lineNo */
    1,                  /* colNo */
    "blockedSummation", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/"
    "blockedSummation.m" /* pName */
};

static emlrtRSInfo
    eh_emlrtRSI =
        {
            10,               /* lineNo */
            "RKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pathName */
};

/* Function Definitions */
void RKLDBarycenter(const emlrtStack *sp, const emxArray_struct0_T *comps,
                    real_T *RKLDBar_w, emxArray_real_T *RKLDBar_mu,
                    emxArray_real_T *RKLDBar_Sigma)
{
  static const int32_T iv[2] = {1, 66};
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack d_st;
  emlrtStack e_st;
  emlrtStack f_st;
  emlrtStack g_st;
  emlrtStack st;
  emxArray_real_T *Sigma;
  emxArray_real_T *Sigmabar;
  emxArray_real_T *b;
  emxArray_real_T *b_mu;
  emxArray_real_T *bsum;
  emxArray_real_T *mu;
  emxArray_real_T *mubar;
  emxArray_real_T *r;
  emxArray_real_T *wCovSum;
  emxArray_real_T *wSigmainv;
  const mxArray *m;
  const mxArray *y;
  real_T wbar;
  int32_T b_wSigmainv[2];
  int32_T bvstride;
  int32_T firstBlockLength;
  int32_T ib;
  int32_T k;
  int32_T lastBlockLength;
  int32_T nblocks;
  int32_T vstride;
  int32_T xblockoffset;
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
  g_st.prev = &f_st;
  g_st.tls = f_st.tls;
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
    st.site = &eh_emlrtRSI;
    error(&st, y, &b_emlrtMCI);
  }
  emxInit_real_T(sp, &mubar, 1, &tb_emlrtRTEI, true);
  emxInit_real_T(sp, &mu, 2, &fc_emlrtRTEI, true);
  emxInit_real_T(sp, &Sigma, 3, &fc_emlrtRTEI, true);
  emxInit_real_T(sp, &bsum, 1, &hc_emlrtRTEI, true);
  st.site = &p_emlrtRSI;
  paramsFromMixture(&st, comps, bsum, mu, Sigma);
  st.site = &q_emlrtRSI;
  wbar = sum(&st, bsum);
  firstBlockLength = mu->size[0];
  ib = mubar->size[0];
  mubar->size[0] = mu->size[0];
  emxEnsureCapacity_real_T(sp, mubar, ib, &tb_emlrtRTEI);
  for (ib = 0; ib < firstBlockLength; ib++) {
    mubar->data[ib] = 0.0;
  }
  emxInit_real_T(sp, &wSigmainv, 3, &dc_emlrtRTEI, true);
  ib = wSigmainv->size[0] * wSigmainv->size[1] * wSigmainv->size[2];
  wSigmainv->size[0] = mu->size[0];
  wSigmainv->size[1] = mu->size[0];
  wSigmainv->size[2] = comps->size[0];
  emxEnsureCapacity_real_T(sp, wSigmainv, ib, &ub_emlrtRTEI);
  ib = comps->size[0];
  emxInit_real_T(sp, &wCovSum, 2, &vb_emlrtRTEI, true);
  emxInit_real_T(sp, &Sigmabar, 2, &ec_emlrtRTEI, true);
  emxInit_real_T(sp, &r, 1, &fc_emlrtRTEI, true);
  emxInit_real_T(sp, &b, 2, &gc_emlrtRTEI, true);
  emxInit_real_T(sp, &b_mu, 1, &cc_emlrtRTEI, true);
  for (nblocks = 0; nblocks < ib; nblocks++) {
    if (nblocks + 1 > wSigmainv->size[2]) {
      emlrtDynamicBoundsCheckR2012b(nblocks + 1, 1, wSigmainv->size[2],
                                    &g_emlrtBCI, (emlrtCTX)sp);
    }
    if (nblocks + 1 > bsum->size[0]) {
      emlrtDynamicBoundsCheckR2012b(nblocks + 1, 1, bsum->size[0], &i_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    st.site = &r_emlrtRSI;
    eye(&st, mu->size[0], b);
    firstBlockLength = b->size[0] * b->size[1];
    for (lastBlockLength = 0; lastBlockLength < firstBlockLength;
         lastBlockLength++) {
      b->data[lastBlockLength] *= bsum->data[nblocks];
    }
    st.site = &r_emlrtRSI;
    if (nblocks + 1 > Sigma->size[2]) {
      emlrtDynamicBoundsCheckR2012b(nblocks + 1, 1, Sigma->size[2], &h_emlrtBCI,
                                    &st);
    }
    firstBlockLength = Sigma->size[1];
    if (Sigma->size[1] != b->size[1]) {
      emlrtErrorWithMessageIdR2018a(&st, &b_emlrtRTEI, "MATLAB:dimagree",
                                    "MATLAB:dimagree", 0);
    }
    xblockoffset = Sigma->size[0];
    lastBlockLength = wCovSum->size[0] * wCovSum->size[1];
    wCovSum->size[0] = Sigma->size[0];
    wCovSum->size[1] = Sigma->size[1];
    emxEnsureCapacity_real_T(&st, wCovSum, lastBlockLength, &yb_emlrtRTEI);
    for (lastBlockLength = 0; lastBlockLength < firstBlockLength;
         lastBlockLength++) {
      for (xoffset = 0; xoffset < xblockoffset; xoffset++) {
        wCovSum->data[xoffset + wCovSum->size[0] * lastBlockLength] =
            Sigma->data[(xoffset + Sigma->size[0] * lastBlockLength) +
                        Sigma->size[0] * Sigma->size[1] * nblocks];
      }
    }
    b_st.site = &pb_emlrtRSI;
    mrdiv(&b_st, b, wCovSum, Sigmabar);
    b_wSigmainv[0] = wSigmainv->size[0];
    b_wSigmainv[1] = wSigmainv->size[1];
    emlrtSubAssignSizeCheckR2012b(&b_wSigmainv[0], 2, &Sigmabar->size[0], 2,
                                  &l_emlrtECI, (emlrtCTX)sp);
    firstBlockLength = Sigmabar->size[1];
    for (lastBlockLength = 0; lastBlockLength < firstBlockLength;
         lastBlockLength++) {
      xblockoffset = Sigmabar->size[0];
      for (xoffset = 0; xoffset < xblockoffset; xoffset++) {
        wSigmainv->data[(xoffset + wSigmainv->size[0] * lastBlockLength) +
                        wSigmainv->size[0] * wSigmainv->size[1] * nblocks] =
            Sigmabar->data[xoffset + Sigmabar->size[0] * lastBlockLength];
      }
    }
    st.site = &s_emlrtRSI;
    if (nblocks + 1 > wSigmainv->size[2]) {
      emlrtDynamicBoundsCheckR2012b(nblocks + 1, 1, wSigmainv->size[2],
                                    &f_emlrtBCI, &st);
    }
    if (nblocks + 1 > mu->size[1]) {
      emlrtDynamicBoundsCheckR2012b(nblocks + 1, 1, mu->size[1], &e_emlrtBCI,
                                    &st);
    }
    b_st.site = &id_emlrtRSI;
    firstBlockLength = wSigmainv->size[1];
    if (mu->size[0] != wSigmainv->size[1]) {
      if (((wSigmainv->size[0] == 1) && (wSigmainv->size[1] == 1)) ||
          (mu->size[0] == 1)) {
        emlrtErrorWithMessageIdR2018a(
            &b_st, &d_emlrtRTEI,
            "Coder:toolbox:mtimes_noDynamicScalarExpansion",
            "Coder:toolbox:mtimes_noDynamicScalarExpansion", 0);
      } else {
        emlrtErrorWithMessageIdR2018a(&b_st, &c_emlrtRTEI, "MATLAB:innerdim",
                                      "MATLAB:innerdim", 0);
      }
    }
    xblockoffset = wSigmainv->size[0];
    lastBlockLength = wCovSum->size[0] * wCovSum->size[1];
    wCovSum->size[0] = wSigmainv->size[0];
    wCovSum->size[1] = wSigmainv->size[1];
    emxEnsureCapacity_real_T(&st, wCovSum, lastBlockLength, &bc_emlrtRTEI);
    for (lastBlockLength = 0; lastBlockLength < firstBlockLength;
         lastBlockLength++) {
      for (xoffset = 0; xoffset < xblockoffset; xoffset++) {
        wCovSum->data[xoffset + wCovSum->size[0] * lastBlockLength] =
            wSigmainv->data[(xoffset + wSigmainv->size[0] * lastBlockLength) +
                            wSigmainv->size[0] * wSigmainv->size[1] * nblocks];
      }
    }
    firstBlockLength = mu->size[0];
    lastBlockLength = b_mu->size[0];
    b_mu->size[0] = mu->size[0];
    emxEnsureCapacity_real_T(&st, b_mu, lastBlockLength, &cc_emlrtRTEI);
    for (lastBlockLength = 0; lastBlockLength < firstBlockLength;
         lastBlockLength++) {
      b_mu->data[lastBlockLength] =
          mu->data[lastBlockLength + mu->size[0] * nblocks];
    }
    b_st.site = &hd_emlrtRSI;
    mtimes(&b_st, wCovSum, b_mu, r);
    firstBlockLength = mubar->size[0];
    if (mubar->size[0] != r->size[0]) {
      emlrtSizeEqCheck1DR2012b(mubar->size[0], r->size[0], &k_emlrtECI,
                               (emlrtCTX)sp);
    }
    for (lastBlockLength = 0; lastBlockLength < firstBlockLength;
         lastBlockLength++) {
      mubar->data[lastBlockLength] += r->data[lastBlockLength];
    }
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b((emlrtCTX)sp);
    }
  }
  emxFree_real_T(&b_mu);
  emxFree_real_T(&r);
  emxFree_real_T(&Sigma);
  st.site = &t_emlrtRSI;
  b_st.site = &w_emlrtRSI;
  c_st.site = &x_emlrtRSI;
  d_st.site = &y_emlrtRSI;
  if ((wSigmainv->size[0] == 0) || (wSigmainv->size[1] == 0) ||
      (wSigmainv->size[2] == 0)) {
    ib = wCovSum->size[0] * wCovSum->size[1];
    wCovSum->size[0] = wSigmainv->size[0];
    wCovSum->size[1] = wSigmainv->size[1];
    emxEnsureCapacity_real_T(&d_st, wCovSum, ib, &vb_emlrtRTEI);
    firstBlockLength = wSigmainv->size[0] * wSigmainv->size[1];
    for (ib = 0; ib < firstBlockLength; ib++) {
      wCovSum->data[ib] = 0.0;
    }
  } else {
    e_st.site = &ld_emlrtRSI;
    if (wSigmainv->size[2] == 1) {
      vstride = wSigmainv->size[0] * wSigmainv->size[1] * wSigmainv->size[2];
    } else {
      vstride = wSigmainv->size[0] * wSigmainv->size[1];
    }
    bvstride = vstride << 10;
    ib = wCovSum->size[0] * wCovSum->size[1];
    wCovSum->size[0] = wSigmainv->size[0];
    wCovSum->size[1] = wSigmainv->size[1];
    emxEnsureCapacity_real_T(&e_st, wCovSum, ib, &wb_emlrtRTEI);
    ib = bsum->size[0];
    bsum->size[0] = vstride;
    emxEnsureCapacity_real_T(&e_st, bsum, ib, &xb_emlrtRTEI);
    if (wSigmainv->size[2] <= 1024) {
      firstBlockLength = wSigmainv->size[2];
      lastBlockLength = 0;
      nblocks = 1;
    } else {
      firstBlockLength = 1024;
      nblocks = wSigmainv->size[2] / 1024;
      lastBlockLength = wSigmainv->size[2] - (nblocks << 10);
      if (lastBlockLength > 0) {
        nblocks++;
      } else {
        lastBlockLength = 1024;
      }
    }
    f_st.site = &md_emlrtRSI;
    f_st.site = &nd_emlrtRSI;
    if ((1 <= vstride) && (vstride > 2147483646)) {
      g_st.site = &lb_emlrtRSI;
      check_forloop_overflow_error(&g_st);
    }
    for (xj = 0; xj < vstride; xj++) {
      wCovSum->data[xj] = wSigmainv->data[xj];
      bsum->data[xj] = 0.0;
    }
    f_st.site = &od_emlrtRSI;
    for (k = 2; k <= firstBlockLength; k++) {
      xoffset = (k - 1) * vstride;
      f_st.site = &pd_emlrtRSI;
      for (xj = 0; xj < vstride; xj++) {
        wCovSum->data[xj] += wSigmainv->data[xoffset + xj];
      }
    }
    f_st.site = &qd_emlrtRSI;
    for (ib = 2; ib <= nblocks; ib++) {
      xblockoffset = (ib - 1) * bvstride;
      f_st.site = &rd_emlrtRSI;
      for (xj = 0; xj < vstride; xj++) {
        bsum->data[xj] = wSigmainv->data[xblockoffset + xj];
      }
      if (ib == nblocks) {
        firstBlockLength = lastBlockLength;
      } else {
        firstBlockLength = 1024;
      }
      f_st.site = &sd_emlrtRSI;
      if ((2 <= firstBlockLength) && (firstBlockLength > 2147483646)) {
        g_st.site = &lb_emlrtRSI;
        check_forloop_overflow_error(&g_st);
      }
      for (k = 2; k <= firstBlockLength; k++) {
        xoffset = xblockoffset + (k - 1) * vstride;
        f_st.site = &td_emlrtRSI;
        for (xj = 0; xj < vstride; xj++) {
          bsum->data[xj] += wSigmainv->data[xoffset + xj];
        }
      }
      f_st.site = &ud_emlrtRSI;
      for (xj = 0; xj < vstride; xj++) {
        wCovSum->data[xj] += bsum->data[xj];
      }
    }
  }
  emxFree_real_T(&bsum);
  emxFree_real_T(&wSigmainv);
  st.site = &u_emlrtRSI;
  b_st.site = &u_emlrtRSI;
  eye(&b_st, mu->size[0], b);
  emxFree_real_T(&mu);
  if (wCovSum->size[1] != b->size[1]) {
    emlrtErrorWithMessageIdR2018a(&st, &b_emlrtRTEI, "MATLAB:dimagree",
                                  "MATLAB:dimagree", 0);
  }
  b_st.site = &pb_emlrtRSI;
  mrdiv(&b_st, b, wCovSum, Sigmabar);
  st.site = &v_emlrtRSI;
  b_st.site = &id_emlrtRSI;
  emxFree_real_T(&b);
  emxFree_real_T(&wCovSum);
  if (mubar->size[0] != Sigmabar->size[1]) {
    if (((Sigmabar->size[0] == 1) && (Sigmabar->size[1] == 1)) ||
        (mubar->size[0] == 1)) {
      emlrtErrorWithMessageIdR2018a(
          &b_st, &d_emlrtRTEI, "Coder:toolbox:mtimes_noDynamicScalarExpansion",
          "Coder:toolbox:mtimes_noDynamicScalarExpansion", 0);
    } else {
      emlrtErrorWithMessageIdR2018a(&b_st, &c_emlrtRTEI, "MATLAB:innerdim",
                                    "MATLAB:innerdim", 0);
    }
  }
  b_st.site = &hd_emlrtRSI;
  mtimes(&b_st, Sigmabar, mubar, RKLDBar_mu);
  ib = RKLDBar_Sigma->size[0] * RKLDBar_Sigma->size[1];
  RKLDBar_Sigma->size[0] = Sigmabar->size[0];
  RKLDBar_Sigma->size[1] = Sigmabar->size[1];
  emxEnsureCapacity_real_T(sp, RKLDBar_Sigma, ib, &ac_emlrtRTEI);
  firstBlockLength = Sigmabar->size[0] * Sigmabar->size[1];
  emxFree_real_T(&mubar);
  for (ib = 0; ib < firstBlockLength; ib++) {
    RKLDBar_Sigma->data[ib] = wbar * Sigmabar->data[ib];
  }
  emxFree_real_T(&Sigmabar);
  *RKLDBar_w = wbar;
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtCTX)sp);
}

/* End of code generation (RKLDBarycenter.c) */
