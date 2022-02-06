/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * paramsFromMixture.c
 *
 * Code generation for function 'paramsFromMixture'
 *
 */

/* Include files */
#include "paramsFromMixture.h"
#include "BDBarycenter_data.h"
#include "BDBarycenter_emxutil.h"
#include "BDBarycenter_mexutil.h"
#include "BDBarycenter_types.h"
#include "rt_nonfinite.h"

/* Variable Definitions */
static emlrtMCInfo
    c_emlrtMCI =
        {
            10,                  /* lineNo */
            1,                   /* colNo */
            "paramsFromMixture", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Misc/paramsFromMixture.m" /* pName */
};

static emlrtBCInfo u_emlrtBCI =
    {
        -1,                  /* iFirst */
        -1,                  /* iLast */
        21,                  /* lineNo */
        18,                  /* colNo */
        "gm",                /* aName */
        "paramsFromMixture", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Misc/paramsFromMixture.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtBCInfo v_emlrtBCI =
    {
        -1,                  /* iFirst */
        -1,                  /* iLast */
        22,                  /* lineNo */
        23,                  /* colNo */
        "gm",                /* aName */
        "paramsFromMixture", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Misc/paramsFromMixture.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtBCInfo w_emlrtBCI =
    {
        -1,                  /* iFirst */
        -1,                  /* iLast */
        21,                  /* lineNo */
        10,                  /* colNo */
        "mu",                /* aName */
        "paramsFromMixture", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Misc/paramsFromMixture.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtECInfo
    q_emlrtECI =
        {
            -1,                  /* nDims */
            21,                  /* lineNo */
            5,                   /* colNo */
            "paramsFromMixture", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Misc/paramsFromMixture.m" /* pName */
};

static emlrtBCInfo x_emlrtBCI =
    {
        -1,                  /* iFirst */
        -1,                  /* iLast */
        22,                  /* lineNo */
        15,                  /* colNo */
        "Sigma",             /* aName */
        "paramsFromMixture", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Misc/paramsFromMixture.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtECInfo
    r_emlrtECI =
        {
            -1,                  /* nDims */
            22,                  /* lineNo */
            5,                   /* colNo */
            "paramsFromMixture", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Misc/paramsFromMixture.m" /* pName */
};

static emlrtBCInfo y_emlrtBCI =
    {
        -1,                  /* iFirst */
        -1,                  /* iLast */
        20,                  /* lineNo */
        12,                  /* colNo */
        "gm",                /* aName */
        "paramsFromMixture", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Misc/paramsFromMixture.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtBCInfo ab_emlrtBCI =
    {
        -1,                  /* iFirst */
        -1,                  /* iLast */
        20,                  /* lineNo */
        5,                   /* colNo */
        "w",                 /* aName */
        "paramsFromMixture", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Misc/paramsFromMixture.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtRTEInfo
    rb_emlrtRTEI =
        {
            15,                  /* lineNo */
            5,                   /* colNo */
            "paramsFromMixture", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Misc/paramsFromMixture.m" /* pName */
};

static emlrtRTEInfo
    sb_emlrtRTEI =
        {
            16,                  /* lineNo */
            6,                   /* colNo */
            "paramsFromMixture", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Misc/paramsFromMixture.m" /* pName */
};

static emlrtRTEInfo
    tb_emlrtRTEI =
        {
            17,                  /* lineNo */
            9,                   /* colNo */
            "paramsFromMixture", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Misc/paramsFromMixture.m" /* pName */
};

static emlrtRSInfo
    id_emlrtRSI =
        {
            10,                  /* lineNo */
            "paramsFromMixture", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Misc/paramsFromMixture.m" /* pathName */
};

/* Function Definitions */
void paramsFromMixture(const emlrtStack *sp, const emxArray_struct0_T *gm,
                       emxArray_real_T *w, emxArray_real_T *mu,
                       emxArray_real_T *Sigma)
{
  static const int32_T iv[2] = {1, 32};
  static const char_T u[32] = {'T', 'h', 'e', ' ', 'm', 'i', 'x', 't',
                               'u', 'r', 'e', ' ', 'h', 'a', 's', ' ',
                               't', 'o', ' ', 'b', 'e', ' ', 'n', 'o',
                               'n', ' ', 'e', 'm', 'p', 't', 'y', '.'};
  emlrtStack st;
  const mxArray *m;
  const mxArray *y;
  int32_T b_Sigma[2];
  int32_T b_i;
  int32_T b_loop_ub;
  int32_T i;
  int32_T i1;
  int32_T i2;
  int32_T loop_ub;
  st.prev = sp;
  st.tls = sp->tls;
  /*  [w,mu,Sigma] = paramsFromMixture(gm): */
  /*  INPUT: */
  /*  - gm, a Gaussian Mixture. */
  /*  OUTPUT: */
  /*  - w, weight vector (size N x 1), */
  /*  - mu, mean vector (size d x N), */
  /*  - Sigma, covariance 3D matrix (size d x d x N). */
  /*  This function returns the mixture parameters in separate data structures.
   */
  if (gm->size[0] == 0) {
    y = NULL;
    m = emlrtCreateCharArray(2, &iv[0]);
    emlrtInitCharArrayR2013a((emlrtCTX)sp, 32, m, &u[0]);
    emlrtAssign(&y, m);
    st.site = &id_emlrtRSI;
    error(&st, y, &c_emlrtMCI);
  }
  i = w->size[0];
  w->size[0] = gm->size[0];
  emxEnsureCapacity_real_T(sp, w, i, &rb_emlrtRTEI);
  i = mu->size[0] * mu->size[1];
  mu->size[0] = gm->data[0].mu->size[0];
  mu->size[1] = gm->size[0];
  emxEnsureCapacity_real_T(sp, mu, i, &sb_emlrtRTEI);
  i = Sigma->size[0] * Sigma->size[1] * Sigma->size[2];
  Sigma->size[0] = gm->data[0].mu->size[0];
  Sigma->size[1] = gm->data[0].mu->size[0];
  Sigma->size[2] = gm->size[0];
  emxEnsureCapacity_real_T(sp, Sigma, i, &tb_emlrtRTEI);
  i = gm->size[0];
  for (b_i = 0; b_i < i; b_i++) {
    if (b_i + 1 > gm->size[0]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, gm->size[0], &y_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    if (b_i + 1 > w->size[0]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, w->size[0], &ab_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    w->data[b_i] = gm->data[b_i].w;
    if (b_i + 1 > mu->size[1]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, mu->size[1], &w_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    if (b_i + 1 > gm->size[0]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, gm->size[0], &u_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    emlrtSubAssignSizeCheckR2012b(&mu->size[0], 1, &gm->data[b_i].mu->size[0],
                                  1, &q_emlrtECI, (emlrtCTX)sp);
    loop_ub = gm->data[b_i].mu->size[0];
    for (i1 = 0; i1 < loop_ub; i1++) {
      mu->data[i1 + mu->size[0] * b_i] = gm->data[b_i].mu->data[i1];
    }
    if (b_i + 1 > Sigma->size[2]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, Sigma->size[2], &x_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    if (b_i + 1 > gm->size[0]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, gm->size[0], &v_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    b_Sigma[0] = Sigma->size[0];
    b_Sigma[1] = Sigma->size[1];
    emlrtSubAssignSizeCheckR2012b(&b_Sigma[0], 2, &gm->data[b_i].Sigma->size[0],
                                  2, &r_emlrtECI, (emlrtCTX)sp);
    loop_ub = gm->data[b_i].Sigma->size[1];
    for (i1 = 0; i1 < loop_ub; i1++) {
      b_loop_ub = gm->data[b_i].Sigma->size[0];
      for (i2 = 0; i2 < b_loop_ub; i2++) {
        Sigma->data[(i2 + Sigma->size[0] * i1) +
                    Sigma->size[0] * Sigma->size[1] * b_i] =
            gm->data[b_i].Sigma->data[i2 + gm->data[b_i].Sigma->size[0] * i1];
      }
    }
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b((emlrtCTX)sp);
    }
  }
}

/* End of code generation (paramsFromMixture.c) */
