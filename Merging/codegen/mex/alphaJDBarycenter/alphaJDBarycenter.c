/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * alphaJDBarycenter.c
 *
 * Code generation for function 'alphaJDBarycenter'
 *
 */

/* Include files */
#include "alphaJDBarycenter.h"
#include "FKLDBarycenter.h"
#include "RKLDBarycenter.h"
#include "SKLDBarycenter.h"
#include "alphaJDBarycenter_data.h"
#include "alphaJDBarycenter_emxutil.h"
#include "alphaJDBarycenter_mexutil.h"
#include "alphaJDBarycenter_types.h"
#include "chol.h"
#include "det.h"
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
static emlrtRSInfo emlrtRSI =
    {
        15,                  /* lineNo */
        "alphaJDBarycenter", /* fcnName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pathName */
};

static emlrtRSInfo b_emlrtRSI =
    {
        17,                  /* lineNo */
        "alphaJDBarycenter", /* fcnName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pathName */
};

static emlrtRSInfo c_emlrtRSI =
    {
        19,                  /* lineNo */
        "alphaJDBarycenter", /* fcnName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pathName */
};

static emlrtRSInfo d_emlrtRSI =
    {
        22,                  /* lineNo */
        "alphaJDBarycenter", /* fcnName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pathName */
};

static emlrtRSInfo e_emlrtRSI =
    {
        29,                  /* lineNo */
        "alphaJDBarycenter", /* fcnName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pathName */
};

static emlrtRSInfo f_emlrtRSI =
    {
        30,                  /* lineNo */
        "alphaJDBarycenter", /* fcnName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pathName */
};

static emlrtRSInfo g_emlrtRSI =
    {
        31,                  /* lineNo */
        "alphaJDBarycenter", /* fcnName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pathName */
};

static emlrtRSInfo h_emlrtRSI =
    {
        32,                  /* lineNo */
        "alphaJDBarycenter", /* fcnName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pathName */
};

static emlrtRSInfo i_emlrtRSI =
    {
        33,                  /* lineNo */
        "alphaJDBarycenter", /* fcnName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pathName */
};

static emlrtRSInfo j_emlrtRSI =
    {
        38,                  /* lineNo */
        "alphaJDBarycenter", /* fcnName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pathName */
};

static emlrtRSInfo k_emlrtRSI =
    {
        42,                  /* lineNo */
        "alphaJDBarycenter", /* fcnName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pathName */
};

static emlrtRSInfo l_emlrtRSI =
    {
        55,                  /* lineNo */
        "alphaJDBarycenter", /* fcnName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pathName */
};

static emlrtRSInfo m_emlrtRSI =
    {
        56,                  /* lineNo */
        "alphaJDBarycenter", /* fcnName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pathName */
};

static emlrtRSInfo n_emlrtRSI =
    {
        58,                  /* lineNo */
        "alphaJDBarycenter", /* fcnName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pathName */
};

static emlrtRSInfo o_emlrtRSI =
    {
        64,                  /* lineNo */
        "alphaJDBarycenter", /* fcnName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pathName */
};

static emlrtRSInfo og_emlrtRSI = {
    34,                                                       /* lineNo */
    "chol",                                                   /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/chol.m" /* pathName */
};

static emlrtRSInfo ug_emlrtRSI = {
    10,          /* lineNo */
    "alphaJDij", /* fcnName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/alphaJDij.m" /* pathName
                                                                     */
};

static emlrtRSInfo vg_emlrtRSI = {
    11,          /* lineNo */
    "alphaJDij", /* fcnName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/alphaJDij.m" /* pathName
                                                                     */
};

static emlrtRSInfo wg_emlrtRSI = {
    13,          /* lineNo */
    "alphaJDij", /* fcnName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/alphaJDij.m" /* pathName
                                                                     */
};

static emlrtRSInfo xg_emlrtRSI = {
    14,          /* lineNo */
    "alphaJDij", /* fcnName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/alphaJDij.m" /* pathName
                                                                     */
};

static emlrtMCInfo emlrtMCI =
    {
        71,                  /* lineNo */
        9,                   /* colNo */
        "alphaJDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pName */
};

static emlrtBCInfo emlrtBCI =
    {
        -1,                  /* iFirst */
        -1,                  /* iLast */
        26,                  /* lineNo */
        20,                  /* colNo */
        "comps",             /* aName */
        "alphaJDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m", /* pName */
        0 /* checkKind */
};

static emlrtRTEInfo emlrtRTEI =
    {
        35,                  /* lineNo */
        11,                  /* colNo */
        "alphaJDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pName */
};

static emlrtECInfo emlrtECI =
    {
        2,                   /* nDims */
        40,                  /* lineNo */
        19,                  /* colNo */
        "alphaJDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pName */
};

static emlrtECInfo b_emlrtECI =
    {
        -1,                  /* nDims */
        42,                  /* lineNo */
        34,                  /* colNo */
        "alphaJDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pName */
};

static emlrtBCInfo b_emlrtBCI =
    {
        -1,                  /* iFirst */
        -1,                  /* iLast */
        47,                  /* lineNo */
        26,                  /* colNo */
        "mui",               /* aName */
        "alphaJDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m", /* pName */
        0 /* checkKind */
};

static emlrtECInfo c_emlrtECI =
    {
        -1,                  /* nDims */
        47,                  /* lineNo */
        20,                  /* colNo */
        "alphaJDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pName */
};

static emlrtBCInfo c_emlrtBCI =
    {
        -1,                  /* iFirst */
        -1,                  /* iLast */
        48,                  /* lineNo */
        34,                  /* colNo */
        "wi",                /* aName */
        "alphaJDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m", /* pName */
        0 /* checkKind */
};

static emlrtBCInfo d_emlrtBCI =
    {
        -1,                  /* iFirst */
        -1,                  /* iLast */
        48,                  /* lineNo */
        49,                  /* colNo */
        "Sigmai",            /* aName */
        "alphaJDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m", /* pName */
        0 /* checkKind */
};

static emlrtECInfo d_emlrtECI =
    {
        2,                   /* nDims */
        48,                  /* lineNo */
        38,                  /* colNo */
        "alphaJDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pName */
};

static emlrtECInfo e_emlrtECI =
    {
        2,                   /* nDims */
        48,                  /* lineNo */
        22,                  /* colNo */
        "alphaJDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pName */
};

static emlrtECInfo f_emlrtECI =
    {
        2,                   /* nDims */
        53,                  /* lineNo */
        20,                  /* colNo */
        "alphaJDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pName */
};

static emlrtECInfo g_emlrtECI = {
    -1,          /* nDims */
    12,          /* lineNo */
    8,           /* colNo */
    "alphaJDij", /* fName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/alphaJDij.m" /* pName */
};

static emlrtECInfo h_emlrtECI = {
    2,           /* nDims */
    13,          /* lineNo */
    18,          /* colNo */
    "alphaJDij", /* fName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/alphaJDij.m" /* pName */
};

static emlrtECInfo i_emlrtECI = {
    2,           /* nDims */
    14,          /* lineNo */
    22,          /* colNo */
    "alphaJDij", /* fName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/alphaJDij.m" /* pName */
};

static emlrtECInfo j_emlrtECI = {
    -1,          /* nDims */
    14,          /* lineNo */
    60,          /* colNo */
    "alphaJDij", /* fName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/alphaJDij.m" /* pName */
};

static emlrtRTEInfo e_emlrtRTEI = {
    14,                                                     /* lineNo */
    9,                                                      /* colNo */
    "log",                                                  /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/elfun/log.m" /* pName */
};

static emlrtRTEInfo p_emlrtRTEI =
    {
        23,                  /* lineNo */
        5,                   /* colNo */
        "alphaJDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pName */
};

static emlrtRTEInfo q_emlrtRTEI =
    {
        36,                  /* lineNo */
        9,                   /* colNo */
        "alphaJDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pName */
};

static emlrtRTEInfo r_emlrtRTEI =
    {
        40,                  /* lineNo */
        30,                  /* colNo */
        "alphaJDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pName */
};

static emlrtRTEInfo s_emlrtRTEI =
    {
        40,                  /* lineNo */
        9,                   /* colNo */
        "alphaJDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pName */
};

static emlrtRTEInfo t_emlrtRTEI =
    {
        42,                  /* lineNo */
        34,                  /* colNo */
        "alphaJDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pName */
};

static emlrtRTEInfo u_emlrtRTEI =
    {
        44,                  /* lineNo */
        9,                   /* colNo */
        "alphaJDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pName */
};

static emlrtRTEInfo v_emlrtRTEI =
    {
        47,                  /* lineNo */
        13,                  /* colNo */
        "alphaJDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pName */
};

static emlrtRTEInfo w_emlrtRTEI =
    {
        53,                  /* lineNo */
        39,                  /* colNo */
        "alphaJDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pName */
};

static emlrtRTEInfo x_emlrtRTEI =
    {
        48,                  /* lineNo */
        54,                  /* colNo */
        "alphaJDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pName */
};

static emlrtRTEInfo y_emlrtRTEI =
    {
        48,                  /* lineNo */
        31,                  /* colNo */
        "alphaJDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pName */
};

static emlrtRTEInfo ab_emlrtRTEI = {
    86,                  /* lineNo */
    13,                  /* colNo */
    "eml_mtimes_helper", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/ops/eml_mtimes_helper.m" /* pName
                                                                         */
};

static emlrtRTEInfo bb_emlrtRTEI = {
    86,                  /* lineNo */
    9,                   /* colNo */
    "eml_mtimes_helper", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/ops/eml_mtimes_helper.m" /* pName
                                                                         */
};

static emlrtRTEInfo db_emlrtRTEI =
    {
        61,                  /* lineNo */
        9,                   /* colNo */
        "alphaJDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pName */
};

static emlrtRTEInfo eb_emlrtRTEI = {
    12,          /* lineNo */
    8,           /* colNo */
    "alphaJDij", /* fName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/alphaJDij.m" /* pName */
};

static emlrtRTEInfo fb_emlrtRTEI = {
    77,                  /* lineNo */
    9,                   /* colNo */
    "eml_mtimes_helper", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/ops/eml_mtimes_helper.m" /* pName
                                                                         */
};

static emlrtRTEInfo gb_emlrtRTEI = {
    14,          /* lineNo */
    15,          /* colNo */
    "alphaJDij", /* fName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/alphaJDij.m" /* pName */
};

static emlrtRTEInfo hb_emlrtRTEI = {
    13,          /* lineNo */
    18,          /* colNo */
    "alphaJDij", /* fName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/alphaJDij.m" /* pName */
};

static emlrtRTEInfo ib_emlrtRTEI =
    {
        31,                  /* lineNo */
        5,                   /* colNo */
        "alphaJDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pName */
};

static emlrtRTEInfo jb_emlrtRTEI =
    {
        32,                  /* lineNo */
        5,                   /* colNo */
        "alphaJDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pName */
};

static emlrtRTEInfo kb_emlrtRTEI =
    {
        33,                  /* lineNo */
        5,                   /* colNo */
        "alphaJDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pName */
};

static emlrtRTEInfo lb_emlrtRTEI =
    {
        38,                  /* lineNo */
        9,                   /* colNo */
        "alphaJDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pName */
};

static emlrtRTEInfo mb_emlrtRTEI =
    {
        56,                  /* lineNo */
        9,                   /* colNo */
        "alphaJDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pName */
};

static emlrtRTEInfo nb_emlrtRTEI =
    {
        1,                   /* lineNo */
        16,                  /* colNo */
        "alphaJDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pName */
};

static emlrtRTEInfo ob_emlrtRTEI =
    {
        32,                  /* lineNo */
        23,                  /* colNo */
        "alphaJDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pName */
};

static emlrtRTEInfo pb_emlrtRTEI =
    {
        58,                  /* lineNo */
        37,                  /* colNo */
        "alphaJDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pName */
};

static emlrtRTEInfo qb_emlrtRTEI =
    {
        58,                  /* lineNo */
        17,                  /* colNo */
        "alphaJDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pName */
};

static emlrtRTEInfo rb_emlrtRTEI =
    {
        58,                  /* lineNo */
        31,                  /* colNo */
        "alphaJDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pName */
};

static emlrtRTEInfo sb_emlrtRTEI = {
    14,          /* lineNo */
    14,          /* colNo */
    "alphaJDij", /* fName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/alphaJDij.m" /* pName */
};

static emlrtRSInfo bh_emlrtRSI =
    {
        71,                  /* lineNo */
        "alphaJDBarycenter", /* fcnName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/alphaJDBarycenter.m" /* pathName */
};

/* Function Definitions */
void alphaJDBarycenter(const emlrtStack *sp, const emxArray_struct0_T *comps,
                       real_T alpha, real_T maxiter, real_T tol, struct0_T *bar)
{
  static const int32_T iv[2] = {1, 64};
  static const char_T u[64] = {
      'T', 'h', 'e', ' ', 'J', 'D', ' ', 'F', 'P', 'I', ' ', 'a', 'l',
      'g', 'o', 'r', 'i', 't', 'h', 'm', ' ', 'd', 'i', 'd', ' ', 'n',
      'o', 't', ' ', 'c', 'o', 'n', 'v', 'e', 'r', 'g', 'e', ' ', 'i',
      'n', ' ', 't', 'h', 'e', ' ', 'a', 'l', 'l', 'o', 'w', 'e', 'd',
      ' ', 'i', 't', 'e', 'r', 'a', 't', 'i', 'o', 'n', 's', '.'};
  ptrdiff_t incx_t;
  ptrdiff_t incy_t;
  ptrdiff_t n_t;
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack st;
  emxArray_creal_T *b;
  emxArray_creal_T *b_srGammaCIinv;
  emxArray_creal_T *b_y;
  emxArray_real_T *A;
  emxArray_real_T *PsiCIinv;
  emxArray_real_T *Sigmai;
  emxArray_real_T *Sigmainv;
  emxArray_real_T *b_diff;
  emxArray_real_T *barRKLD_Sigma;
  emxArray_real_T *barRKLD_mu;
  emxArray_real_T *c_y;
  emxArray_real_T *diff;
  emxArray_real_T *gammaCI;
  emxArray_real_T *muCI;
  emxArray_real_T *muMPM;
  emxArray_real_T *mui;
  emxArray_real_T *srGammaCIinv;
  emxArray_real_T *wi;
  emxArray_real_T *y;
  const mxArray *d_y;
  const mxArray *m;
  real_T expl_temp;
  real_T numIter;
  real_T sumWi;
  real_T x;
  int32_T iv1[2];
  int32_T iv2[2];
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
  boolean_T exitg1;
  boolean_T guard1 = false;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  c_st.prev = &b_st;
  c_st.tls = b_st.tls;
  emlrtHeapReferenceStackEnterFcnR2012b((emlrtCTX)sp);
  if (alpha == 0.0) {
    st.site = &emlrtRSI;
    RKLDBarycenter(&st, comps, &bar->w, bar->mu, bar->Sigma);
  } else if (alpha == 1.0) {
    st.site = &b_emlrtRSI;
    FKLDBarycenter(&st, comps, &bar->w, bar->mu, bar->Sigma);
  } else if (alpha == 0.5) {
    st.site = &c_emlrtRSI;
    SKLDBarycenter(&st, comps, &bar->w, bar->mu, bar->Sigma);
  } else {
    emxInit_real_T(sp, &muMPM, 1, &p_emlrtRTEI, true);
    st.site = &d_emlrtRSI;
    FKLDBarycenter(&st, comps, &bar->w, bar->mu, bar->Sigma);
    i = muMPM->size[0];
    muMPM->size[0] = bar->mu->size[0];
    emxEnsureCapacity_real_T(sp, muMPM, i, &p_emlrtRTEI);
    loop_ub = bar->mu->size[0];
    for (i = 0; i < loop_ub; i++) {
      muMPM->data[i] = (1.0 - alpha) * bar->mu->data[i];
    }
    if (1 > comps->size[0]) {
      emlrtDynamicBoundsCheckR2012b(1, 1, comps->size[0], &emlrtBCI,
                                    (emlrtCTX)sp);
    }
    emxInit_real_T(sp, &barRKLD_mu, 1, &ib_emlrtRTEI, true);
    emxInit_real_T(sp, &barRKLD_Sigma, 2, &ib_emlrtRTEI, true);
    emxInit_real_T(sp, &PsiCIinv, 2, &jb_emlrtRTEI, true);
    emxInit_real_T(sp, &wi, 1, &nb_emlrtRTEI, true);
    emxInit_real_T(sp, &mui, 2, &nb_emlrtRTEI, true);
    emxInit_real_T(sp, &Sigmai, 3, &nb_emlrtRTEI, true);
    emxInit_real_T(sp, &A, 2, &ob_emlrtRTEI, true);
    d = comps->data[0].mu->size[0];
    st.site = &e_emlrtRSI;
    paramsFromMixture(&st, comps, wi, mui, Sigmai);
    st.site = &f_emlrtRSI;
    sumWi = sum(&st, wi);
    st.site = &g_emlrtRSI;
    RKLDBarycenter(&st, comps, &expl_temp, barRKLD_mu, barRKLD_Sigma);
    st.site = &h_emlrtRSI;
    b_st.site = &h_emlrtRSI;
    eye(&b_st, comps->data[0].mu->size[0], A);
    if (barRKLD_Sigma->size[1] != A->size[1]) {
      emlrtErrorWithMessageIdR2018a(&st, &b_emlrtRTEI, "MATLAB:dimagree",
                                    "MATLAB:dimagree", 0);
    }
    b_st.site = &pb_emlrtRSI;
    mrdiv(&b_st, A, barRKLD_Sigma, PsiCIinv);
    loop_ub = PsiCIinv->size[0] * PsiCIinv->size[1];
    for (i = 0; i < loop_ub; i++) {
      PsiCIinv->data[i] *= alpha;
    }
    emxInit_real_T(sp, &muCI, 1, &kb_emlrtRTEI, true);
    st.site = &i_emlrtRSI;
    b_st.site = &id_emlrtRSI;
    dynamic_size_checks(&b_st, PsiCIinv, barRKLD_mu, PsiCIinv->size[1],
                        barRKLD_mu->size[0]);
    b_st.site = &hd_emlrtRSI;
    mtimes(&b_st, PsiCIinv, barRKLD_mu, muCI);
    numIter = 0.0;
    emlrtForLoopVectorCheckR2021a(1.0, 1.0, maxiter, mxDOUBLE_CLASS,
                                  (int32_T)maxiter, &emlrtRTEI, (emlrtCTX)sp);
    k = 0;
    emxInit_real_T(sp, &Sigmainv, 2, &lb_emlrtRTEI, true);
    emxInit_real_T(sp, &gammaCI, 2, &s_emlrtRTEI, true);
    emxInit_real_T(sp, &diff, 1, &v_emlrtRTEI, true);
    emxInit_real_T(sp, &srGammaCIinv, 2, &mb_emlrtRTEI, true);
    emxInit_real_T(sp, &y, 2, &pb_emlrtRTEI, true);
    emxInit_creal_T(sp, &b_y, 2, &qb_emlrtRTEI, true);
    emxInit_creal_T(sp, &b, 2, &rb_emlrtRTEI, true);
    emxInit_real_T(sp, &c_y, 2, &sb_emlrtRTEI, true);
    emxInit_creal_T(sp, &b_srGammaCIinv, 2, &ab_emlrtRTEI, true);
    emxInit_real_T(sp, &b_diff, 2, &gb_emlrtRTEI, true);
    exitg1 = false;
    while ((!exitg1) && (k <= (int32_T)maxiter - 1)) {
      i = barRKLD_mu->size[0];
      barRKLD_mu->size[0] = bar->mu->size[0];
      emxEnsureCapacity_real_T(sp, barRKLD_mu, i, &q_emlrtRTEI);
      loop_ub = bar->mu->size[0];
      for (i = 0; i < loop_ub; i++) {
        barRKLD_mu->data[i] = bar->mu->data[i];
      }
      i = barRKLD_Sigma->size[0] * barRKLD_Sigma->size[1];
      barRKLD_Sigma->size[0] = bar->Sigma->size[0];
      barRKLD_Sigma->size[1] = bar->Sigma->size[1];
      emxEnsureCapacity_real_T(sp, barRKLD_Sigma, i, &q_emlrtRTEI);
      loop_ub = bar->Sigma->size[0] * bar->Sigma->size[1];
      for (i = 0; i < loop_ub; i++) {
        barRKLD_Sigma->data[i] = bar->Sigma->data[i];
      }
      st.site = &j_emlrtRSI;
      b_st.site = &j_emlrtRSI;
      eye(&b_st, d, A);
      if (bar->Sigma->size[1] != A->size[1]) {
        emlrtErrorWithMessageIdR2018a(&st, &b_emlrtRTEI, "MATLAB:dimagree",
                                      "MATLAB:dimagree", 0);
      }
      b_st.site = &pb_emlrtRSI;
      mrdiv(&b_st, A, bar->Sigma, Sigmainv);
      i = gammaCI->size[0] * gammaCI->size[1];
      gammaCI->size[0] = Sigmainv->size[0];
      gammaCI->size[1] = Sigmainv->size[1];
      emxEnsureCapacity_real_T(sp, gammaCI, i, &r_emlrtRTEI);
      loop_ub = Sigmainv->size[0] * Sigmainv->size[1];
      for (i = 0; i < loop_ub; i++) {
        gammaCI->data[i] = (1.0 - alpha) * Sigmainv->data[i];
      }
      iv1[0] = (*(int32_T(*)[2])PsiCIinv->size)[0];
      iv1[1] = (*(int32_T(*)[2])PsiCIinv->size)[1];
      iv2[0] = (*(int32_T(*)[2])gammaCI->size)[0];
      iv2[1] = (*(int32_T(*)[2])gammaCI->size)[1];
      emlrtSizeEqCheckNDR2012b(&iv1[0], &iv2[0], &emlrtECI, (emlrtCTX)sp);
      loop_ub = PsiCIinv->size[0] * PsiCIinv->size[1];
      i = gammaCI->size[0] * gammaCI->size[1];
      gammaCI->size[0] = PsiCIinv->size[0];
      gammaCI->size[1] = PsiCIinv->size[1];
      emxEnsureCapacity_real_T(sp, gammaCI, i, &s_emlrtRTEI);
      for (i = 0; i < loop_ub; i++) {
        gammaCI->data[i] += PsiCIinv->data[i];
      }
      st.site = &k_emlrtRSI;
      b_st.site = &id_emlrtRSI;
      dynamic_size_checks(&b_st, Sigmainv, muMPM, Sigmainv->size[1],
                          muMPM->size[0]);
      b_st.site = &hd_emlrtRSI;
      mtimes(&b_st, Sigmainv, muMPM, diff);
      if (muCI->size[0] != diff->size[0]) {
        emlrtSizeEqCheck1DR2012b(muCI->size[0], diff->size[0], &b_emlrtECI,
                                 (emlrtCTX)sp);
      }
      st.site = &k_emlrtRSI;
      b_st.site = &k_emlrtRSI;
      eye(&b_st, d, A);
      if (gammaCI->size[1] != A->size[1]) {
        emlrtErrorWithMessageIdR2018a(&st, &b_emlrtRTEI, "MATLAB:dimagree",
                                      "MATLAB:dimagree", 0);
      }
      b_st.site = &pb_emlrtRSI;
      mrdiv(&b_st, A, gammaCI, Sigmainv);
      st.site = &k_emlrtRSI;
      i = diff->size[0];
      diff->size[0] = muCI->size[0];
      emxEnsureCapacity_real_T(&st, diff, i, &t_emlrtRTEI);
      loop_ub = muCI->size[0];
      for (i = 0; i < loop_ub; i++) {
        diff->data[i] += muCI->data[i];
      }
      b_st.site = &id_emlrtRSI;
      dynamic_size_checks(&b_st, Sigmainv, diff, Sigmainv->size[1],
                          diff->size[0]);
      b_st.site = &hd_emlrtRSI;
      mtimes(&b_st, Sigmainv, diff, bar->mu);
      i = Sigmainv->size[0] * Sigmainv->size[1];
      Sigmainv->size[0] = d;
      Sigmainv->size[1] = d;
      emxEnsureCapacity_real_T(sp, Sigmainv, i, &u_emlrtRTEI);
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
          emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, mui->size[1], &b_emlrtBCI,
                                        (emlrtCTX)sp);
        }
        if (i1 != bar->mu->size[0]) {
          emlrtSizeEqCheck1DR2012b(i1, bar->mu->size[0], &c_emlrtECI,
                                   (emlrtCTX)sp);
        }
        i4 = diff->size[0];
        diff->size[0] = i2;
        emxEnsureCapacity_real_T(sp, diff, i4, &v_emlrtRTEI);
        for (i4 = 0; i4 < b_loop_ub; i4++) {
          diff->data[i4] =
              mui->data[i4 + mui->size[0] * b_i] - bar->mu->data[i4];
        }
        if (b_i + 1 > Sigmai->size[2]) {
          emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, Sigmai->size[2],
                                        &d_emlrtBCI, (emlrtCTX)sp);
        }
        i4 = A->size[0] * A->size[1];
        A->size[0] = diff->size[0];
        A->size[1] = diff->size[0];
        emxEnsureCapacity_real_T(sp, A, i4, &x_emlrtRTEI);
        loop_ub = diff->size[0];
        for (i4 = 0; i4 < loop_ub; i4++) {
          e_loop_ub = diff->size[0];
          for (i5 = 0; i5 < e_loop_ub; i5++) {
            A->data[i5 + A->size[0] * i4] = diff->data[i5] * diff->data[i4];
          }
        }
        iv1[0] = (*(int32_T(*)[2])A->size)[0];
        iv1[1] = (*(int32_T(*)[2])A->size)[1];
        emlrtSizeEqCheckNDR2012b(&iv3[0], &iv1[0], &d_emlrtECI, (emlrtCTX)sp);
        if (b_i + 1 > wi->size[0]) {
          emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, wi->size[0], &c_emlrtBCI,
                                        (emlrtCTX)sp);
        }
        i4 = A->size[0] * A->size[1];
        A->size[0] = c_loop_ub;
        A->size[1] = i3;
        emxEnsureCapacity_real_T(sp, A, i4, &y_emlrtRTEI);
        for (i4 = 0; i4 < d_loop_ub; i4++) {
          for (i5 = 0; i5 < c_loop_ub; i5++) {
            A->data[i5 + A->size[0] * i4] =
                wi->data[b_i] *
                (Sigmai->data[(i5 + Sigmai->size[0] * i4) +
                              Sigmai->size[0] * Sigmai->size[1] * b_i] +
                 A->data[i5 + A->size[0] * i4]);
          }
        }
        iv1[0] = (*(int32_T(*)[2])Sigmainv->size)[0];
        iv1[1] = (*(int32_T(*)[2])Sigmainv->size)[1];
        iv2[0] = (*(int32_T(*)[2])A->size)[0];
        iv2[1] = (*(int32_T(*)[2])A->size)[1];
        emlrtSizeEqCheckNDR2012b(&iv1[0], &iv2[0], &e_emlrtECI, (emlrtCTX)sp);
        loop_ub = Sigmainv->size[0] * Sigmainv->size[1];
        for (i4 = 0; i4 < loop_ub; i4++) {
          Sigmainv->data[i4] += A->data[i4];
        }
        if (*emlrtBreakCheckR2012bFlagVar != 0) {
          emlrtBreakCheckR2012b((emlrtCTX)sp);
        }
      }
      loop_ub = Sigmainv->size[0] * Sigmainv->size[1];
      for (i = 0; i < loop_ub; i++) {
        Sigmainv->data[i] /= sumWi;
      }
      loop_ub = Sigmainv->size[0] * Sigmainv->size[1];
      for (i = 0; i < loop_ub; i++) {
        Sigmainv->data[i] *= 1.0 - alpha;
      }
      i = A->size[0] * A->size[1];
      A->size[0] = bar->Sigma->size[0];
      A->size[1] = bar->Sigma->size[1];
      emxEnsureCapacity_real_T(sp, A, i, &w_emlrtRTEI);
      loop_ub = bar->Sigma->size[0] * bar->Sigma->size[1];
      for (i = 0; i < loop_ub; i++) {
        A->data[i] = alpha * bar->Sigma->data[i];
      }
      iv1[0] = (*(int32_T(*)[2])Sigmainv->size)[0];
      iv1[1] = (*(int32_T(*)[2])Sigmainv->size)[1];
      iv2[0] = (*(int32_T(*)[2])A->size)[0];
      iv2[1] = (*(int32_T(*)[2])A->size)[1];
      emlrtSizeEqCheckNDR2012b(&iv1[0], &iv2[0], &f_emlrtECI, (emlrtCTX)sp);
      loop_ub = Sigmainv->size[0] * Sigmainv->size[1];
      for (i = 0; i < loop_ub; i++) {
        Sigmainv->data[i] += A->data[i];
      }
      st.site = &l_emlrtRSI;
      b_st.site = &og_emlrtRSI;
      cholesky(&b_st, gammaCI);
      st.site = &m_emlrtRSI;
      b_st.site = &m_emlrtRSI;
      eye(&b_st, d, A);
      if (gammaCI->size[1] != A->size[1]) {
        emlrtErrorWithMessageIdR2018a(&st, &b_emlrtRTEI, "MATLAB:dimagree",
                                      "MATLAB:dimagree", 0);
      }
      b_st.site = &pb_emlrtRSI;
      mrdiv(&b_st, A, gammaCI, srGammaCIinv);
      st.site = &n_emlrtRSI;
      b_st.site = &id_emlrtRSI;
      d_dynamic_size_checks(&b_st, gammaCI, Sigmainv, gammaCI->size[0],
                            Sigmainv->size[0]);
      b_st.site = &hd_emlrtRSI;
      e_mtimes(&b_st, gammaCI, Sigmainv, y);
      st.site = &n_emlrtRSI;
      b_st.site = &id_emlrtRSI;
      d_dynamic_size_checks(&b_st, y, gammaCI, y->size[1], gammaCI->size[0]);
      b_st.site = &hd_emlrtRSI;
      d_mtimes(&b_st, y, gammaCI, Sigmainv);
      st.site = &n_emlrtRSI;
      b_st.site = &n_emlrtRSI;
      sqrtm(&b_st, Sigmainv, b);
      b_st.site = &id_emlrtRSI;
      if (srGammaCIinv->size[0] != b->size[0]) {
        if (((srGammaCIinv->size[0] == 1) && (srGammaCIinv->size[1] == 1)) ||
            ((b->size[0] == 1) && (b->size[1] == 1))) {
          emlrtErrorWithMessageIdR2018a(
              &b_st, &d_emlrtRTEI,
              "Coder:toolbox:mtimes_noDynamicScalarExpansion",
              "Coder:toolbox:mtimes_noDynamicScalarExpansion", 0);
        } else {
          emlrtErrorWithMessageIdR2018a(&b_st, &c_emlrtRTEI, "MATLAB:innerdim",
                                        "MATLAB:innerdim", 0);
        }
      }
      i = b_srGammaCIinv->size[0] * b_srGammaCIinv->size[1];
      b_srGammaCIinv->size[0] = srGammaCIinv->size[1];
      b_srGammaCIinv->size[1] = srGammaCIinv->size[0];
      emxEnsureCapacity_creal_T(&st, b_srGammaCIinv, i, &ab_emlrtRTEI);
      loop_ub = srGammaCIinv->size[0];
      for (i = 0; i < loop_ub; i++) {
        e_loop_ub = srGammaCIinv->size[1];
        for (i4 = 0; i4 < e_loop_ub; i4++) {
          b_srGammaCIinv->data[i4 + b_srGammaCIinv->size[0] * i].re =
              srGammaCIinv->data[i + srGammaCIinv->size[0] * i4];
          b_srGammaCIinv->data[i4 + b_srGammaCIinv->size[0] * i].im = 0.0;
        }
      }
      i = b_y->size[0] * b_y->size[1];
      b_y->size[0] = b_srGammaCIinv->size[0];
      b_y->size[1] = b->size[1];
      emxEnsureCapacity_creal_T(&st, b_y, i, &bb_emlrtRTEI);
      loop_ub = b_srGammaCIinv->size[0];
      for (i = 0; i < loop_ub; i++) {
        e_loop_ub = b->size[1];
        for (i4 = 0; i4 < e_loop_ub; i4++) {
          b_y->data[i + b_y->size[0] * i4].re = 0.0;
          b_y->data[i + b_y->size[0] * i4].im = 0.0;
          b_i = b_srGammaCIinv->size[1];
          for (i5 = 0; i5 < b_i; i5++) {
            b_y->data[i + b_y->size[0] * i4].re +=
                b_srGammaCIinv->data[i + b_srGammaCIinv->size[0] * i5].re *
                    b->data[i5 + b->size[0] * i4].re -
                b_srGammaCIinv->data[i + b_srGammaCIinv->size[0] * i5].im *
                    b->data[i5 + b->size[0] * i4].im;
            b_y->data[i + b_y->size[0] * i4].im +=
                b_srGammaCIinv->data[i + b_srGammaCIinv->size[0] * i5].re *
                    b->data[i5 + b->size[0] * i4].im +
                b_srGammaCIinv->data[i + b_srGammaCIinv->size[0] * i5].im *
                    b->data[i5 + b->size[0] * i4].re;
          }
        }
      }
      st.site = &n_emlrtRSI;
      b_st.site = &id_emlrtRSI;
      c_dynamic_size_checks(&b_st, b_y, srGammaCIinv, b_y->size[1],
                            srGammaCIinv->size[0]);
      i = b_srGammaCIinv->size[0] * b_srGammaCIinv->size[1];
      b_srGammaCIinv->size[0] = srGammaCIinv->size[0];
      b_srGammaCIinv->size[1] = srGammaCIinv->size[1];
      emxEnsureCapacity_creal_T(sp, b_srGammaCIinv, i, &cb_emlrtRTEI);
      loop_ub = srGammaCIinv->size[0] * srGammaCIinv->size[1];
      for (i = 0; i < loop_ub; i++) {
        b_srGammaCIinv->data[i].re = srGammaCIinv->data[i];
        b_srGammaCIinv->data[i].im = 0.0;
      }
      i = bar->Sigma->size[0] * bar->Sigma->size[1];
      bar->Sigma->size[0] = b_y->size[0];
      bar->Sigma->size[1] = b_srGammaCIinv->size[1];
      emxEnsureCapacity_real_T(sp, bar->Sigma, i, &db_emlrtRTEI);
      loop_ub = b_y->size[0];
      for (i = 0; i < loop_ub; i++) {
        e_loop_ub = b_srGammaCIinv->size[1];
        for (i4 = 0; i4 < e_loop_ub; i4++) {
          expl_temp = 0.0;
          b_i = b_y->size[1];
          for (i5 = 0; i5 < b_i; i5++) {
            expl_temp +=
                b_y->data[i + b_y->size[0] * i5].re *
                    b_srGammaCIinv->data[i5 + b_srGammaCIinv->size[0] * i4].re -
                b_y->data[i + b_y->size[0] * i5].im *
                    b_srGammaCIinv->data[i5 + b_srGammaCIinv->size[0] * i4].im;
          }
          bar->Sigma->data[i + bar->Sigma->size[0] * i4] = expl_temp;
        }
      }
      guard1 = false;
      if (muDoubleScalarRem((real_T)k + 1.0, 3.0) == 0.0) {
        st.site = &o_emlrtRSI;
        b_st.site = &ug_emlrtRSI;
        c_st.site = &ug_emlrtRSI;
        eye(&c_st, bar->mu->size[0], A);
        if (bar->Sigma->size[1] != A->size[1]) {
          emlrtErrorWithMessageIdR2018a(&b_st, &b_emlrtRTEI, "MATLAB:dimagree",
                                        "MATLAB:dimagree", 0);
        }
        c_st.site = &pb_emlrtRSI;
        mrdiv(&c_st, A, bar->Sigma, srGammaCIinv);
        b_st.site = &vg_emlrtRSI;
        c_st.site = &vg_emlrtRSI;
        eye(&c_st, bar->mu->size[0], A);
        if (barRKLD_Sigma->size[1] != A->size[1]) {
          emlrtErrorWithMessageIdR2018a(&b_st, &b_emlrtRTEI, "MATLAB:dimagree",
                                        "MATLAB:dimagree", 0);
        }
        c_st.site = &pb_emlrtRSI;
        mrdiv(&c_st, A, barRKLD_Sigma, gammaCI);
        if (bar->mu->size[0] != barRKLD_mu->size[0]) {
          emlrtSizeEqCheck1DR2012b(bar->mu->size[0], barRKLD_mu->size[0],
                                   &g_emlrtECI, &st);
        }
        i = diff->size[0];
        diff->size[0] = bar->mu->size[0];
        emxEnsureCapacity_real_T(&st, diff, i, &eb_emlrtRTEI);
        loop_ub = bar->mu->size[0];
        for (i = 0; i < loop_ub; i++) {
          diff->data[i] = bar->mu->data[i] - barRKLD_mu->data[i];
        }
        i = y->size[0] * y->size[1];
        y->size[0] = gammaCI->size[0];
        y->size[1] = gammaCI->size[1];
        emxEnsureCapacity_real_T(&st, y, i, &fb_emlrtRTEI);
        loop_ub = gammaCI->size[0] * gammaCI->size[1];
        for (i = 0; i < loop_ub; i++) {
          y->data[i] = (1.0 - alpha) * gammaCI->data[i];
        }
        b_st.site = &wg_emlrtRSI;
        c_st.site = &id_emlrtRSI;
        d_dynamic_size_checks(&c_st, y, bar->Sigma, y->size[1],
                              bar->Sigma->size[0]);
        c_st.site = &hd_emlrtRSI;
        d_mtimes(&c_st, y, bar->Sigma, A);
        i = y->size[0] * y->size[1];
        y->size[0] = srGammaCIinv->size[0];
        y->size[1] = srGammaCIinv->size[1];
        emxEnsureCapacity_real_T(&st, y, i, &fb_emlrtRTEI);
        loop_ub = srGammaCIinv->size[0] * srGammaCIinv->size[1];
        for (i = 0; i < loop_ub; i++) {
          y->data[i] = alpha * srGammaCIinv->data[i];
        }
        b_st.site = &wg_emlrtRSI;
        c_st.site = &id_emlrtRSI;
        d_dynamic_size_checks(&c_st, y, barRKLD_Sigma, y->size[1],
                              barRKLD_Sigma->size[0]);
        c_st.site = &hd_emlrtRSI;
        d_mtimes(&c_st, y, barRKLD_Sigma, Sigmainv);
        iv1[0] = (*(int32_T(*)[2])A->size)[0];
        iv1[1] = (*(int32_T(*)[2])A->size)[1];
        iv2[0] = (*(int32_T(*)[2])Sigmainv->size)[0];
        iv2[1] = (*(int32_T(*)[2])Sigmainv->size)[1];
        emlrtSizeEqCheckNDR2012b(&iv1[0], &iv2[0], &h_emlrtECI, &st);
        loop_ub = srGammaCIinv->size[0] * srGammaCIinv->size[1];
        for (i = 0; i < loop_ub; i++) {
          srGammaCIinv->data[i] *= alpha;
        }
        loop_ub = gammaCI->size[0] * gammaCI->size[1];
        for (i = 0; i < loop_ub; i++) {
          gammaCI->data[i] *= 1.0 - alpha;
        }
        iv1[0] = (*(int32_T(*)[2])srGammaCIinv->size)[0];
        iv1[1] = (*(int32_T(*)[2])srGammaCIinv->size)[1];
        iv2[0] = (*(int32_T(*)[2])gammaCI->size)[0];
        iv2[1] = (*(int32_T(*)[2])gammaCI->size)[1];
        emlrtSizeEqCheckNDR2012b(&iv1[0], &iv2[0], &i_emlrtECI, &st);
        if (bar->mu->size[0] != barRKLD_mu->size[0]) {
          emlrtSizeEqCheck1DR2012b(bar->mu->size[0], barRKLD_mu->size[0],
                                   &j_emlrtECI, &st);
        }
        b_st.site = &xg_emlrtRSI;
        loop_ub = srGammaCIinv->size[0] * srGammaCIinv->size[1];
        for (i = 0; i < loop_ub; i++) {
          srGammaCIinv->data[i] += gammaCI->data[i];
        }
        c_st.site = &id_emlrtRSI;
        if (srGammaCIinv->size[0] != diff->size[0]) {
          if ((diff->size[0] == 1) ||
              ((srGammaCIinv->size[0] == 1) && (srGammaCIinv->size[1] == 1))) {
            emlrtErrorWithMessageIdR2018a(
                &c_st, &d_emlrtRTEI,
                "Coder:toolbox:mtimes_noDynamicScalarExpansion",
                "Coder:toolbox:mtimes_noDynamicScalarExpansion", 0);
          } else {
            emlrtErrorWithMessageIdR2018a(
                &c_st, &c_emlrtRTEI, "MATLAB:innerdim", "MATLAB:innerdim", 0);
          }
        }
        i = b_diff->size[0] * b_diff->size[1];
        b_diff->size[0] = 1;
        b_diff->size[1] = diff->size[0];
        emxEnsureCapacity_real_T(&b_st, b_diff, i, &gb_emlrtRTEI);
        loop_ub = diff->size[0];
        for (i = 0; i < loop_ub; i++) {
          b_diff->data[i] = diff->data[i];
        }
        c_st.site = &hd_emlrtRSI;
        f_mtimes(&c_st, b_diff, srGammaCIinv, c_y);
        b_st.site = &xg_emlrtRSI;
        c_st.site = &id_emlrtRSI;
        if (diff->size[0] != c_y->size[1]) {
          if ((c_y->size[1] == 1) || (diff->size[0] == 1)) {
            emlrtErrorWithMessageIdR2018a(
                &c_st, &d_emlrtRTEI,
                "Coder:toolbox:mtimes_noDynamicScalarExpansion",
                "Coder:toolbox:mtimes_noDynamicScalarExpansion", 0);
          } else {
            emlrtErrorWithMessageIdR2018a(
                &c_st, &c_emlrtRTEI, "MATLAB:innerdim", "MATLAB:innerdim", 0);
          }
        }
        if (c_y->size[1] < 1) {
          expl_temp = 0.0;
        } else {
          n_t = (ptrdiff_t)c_y->size[1];
          incx_t = (ptrdiff_t)1;
          incy_t = (ptrdiff_t)1;
          expl_temp =
              ddot(&n_t, &c_y->data[0], &incx_t, &diff->data[0], &incy_t);
        }
        b_st.site = &xg_emlrtRSI;
        c_st.site = &xg_emlrtRSI;
        x = det(&c_st, barRKLD_Sigma) / det(&c_st, bar->Sigma);
        if (x < 0.0) {
          emlrtErrorWithMessageIdR2018a(
              &b_st, &e_emlrtRTEI, "Coder:toolbox:ElFunDomainError",
              "Coder:toolbox:ElFunDomainError", 3, 4, 3, "log");
        }
        x = muDoubleScalarLog(x);
        i = barRKLD_Sigma->size[0] * barRKLD_Sigma->size[1];
        barRKLD_Sigma->size[0] = A->size[0];
        barRKLD_Sigma->size[1] = A->size[1];
        emxEnsureCapacity_real_T(&st, barRKLD_Sigma, i, &hb_emlrtRTEI);
        loop_ub = A->size[0] * A->size[1];
        for (i = 0; i < loop_ub; i++) {
          barRKLD_Sigma->data[i] = A->data[i] + Sigmainv->data[i];
        }
        b_st.site = &wg_emlrtRSI;
        expl_temp = 0.5 * (((trace(&b_st, barRKLD_Sigma) + expl_temp) -
                            (real_T)bar->mu->size[0]) +
                           (1.0 - 2.0 * alpha) * x);
        if (expl_temp < tol) {
          exitg1 = true;
        } else {
          guard1 = true;
        }
      } else {
        guard1 = true;
      }
      if (guard1) {
        numIter = (real_T)k + 1.0;
        k++;
        if (*emlrtBreakCheckR2012bFlagVar != 0) {
          emlrtBreakCheckR2012b((emlrtCTX)sp);
        }
      }
    }
    emxFree_real_T(&b_diff);
    emxFree_creal_T(&b_srGammaCIinv);
    emxFree_real_T(&c_y);
    emxFree_creal_T(&b);
    emxFree_creal_T(&b_y);
    emxFree_real_T(&y);
    emxFree_real_T(&A);
    emxFree_real_T(&Sigmai);
    emxFree_real_T(&mui);
    emxFree_real_T(&wi);
    emxFree_real_T(&srGammaCIinv);
    emxFree_real_T(&diff);
    emxFree_real_T(&gammaCI);
    emxFree_real_T(&Sigmainv);
    emxFree_real_T(&muCI);
    emxFree_real_T(&PsiCIinv);
    emxFree_real_T(&barRKLD_Sigma);
    emxFree_real_T(&barRKLD_mu);
    emxFree_real_T(&muMPM);
    if (numIter == maxiter) {
      d_y = NULL;
      m = emlrtCreateCharArray(2, &iv[0]);
      emlrtInitCharArrayR2013a((emlrtCTX)sp, 64, m, &u[0]);
      emlrtAssign(&d_y, m);
      st.site = &bh_emlrtRSI;
      disp(&st, d_y, &emlrtMCI);
    }
  }
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtCTX)sp);
}

/* End of code generation (alphaJDBarycenter.c) */
