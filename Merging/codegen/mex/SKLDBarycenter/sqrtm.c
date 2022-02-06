/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * sqrtm.c
 *
 * Code generation for function 'sqrtm'
 *
 */

/* Include files */
#include "sqrtm.h"
#include "SKLDBarycenter_data.h"
#include "SKLDBarycenter_emxutil.h"
#include "SKLDBarycenter_types.h"
#include "eml_int_forloop_overflow_check.h"
#include "mtimes.h"
#include "rt_nonfinite.h"
#include "schur.h"
#include "sqrt.h"
#include "warning.h"
#include "mwmathutil.h"

/* Variable Definitions */
static emlrtRSInfo pd_emlrtRSI = {
    14,                                                        /* lineNo */
    "sqrtm",                                                   /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/sqrtm.m" /* pathName */
};

static emlrtRSInfo qd_emlrtRSI = {
    17,                                                        /* lineNo */
    "sqrtm",                                                   /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/sqrtm.m" /* pathName */
};

static emlrtRSInfo rd_emlrtRSI = {
    19,                                                        /* lineNo */
    "sqrtm",                                                   /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/sqrtm.m" /* pathName */
};

static emlrtRSInfo sd_emlrtRSI = {
    24,                                                        /* lineNo */
    "sqrtm",                                                   /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/sqrtm.m" /* pathName */
};

static emlrtRSInfo td_emlrtRSI = {
    34,                                                        /* lineNo */
    "sqrtm",                                                   /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/sqrtm.m" /* pathName */
};

static emlrtRSInfo ud_emlrtRSI = {
    41,                                                        /* lineNo */
    "sqrtm",                                                   /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/sqrtm.m" /* pathName */
};

static emlrtRSInfo vd_emlrtRSI = {
    45,                                                        /* lineNo */
    "sqrtm",                                                   /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/sqrtm.m" /* pathName */
};

static emlrtRSInfo wd_emlrtRSI = {
    49,                                                        /* lineNo */
    "sqrtm",                                                   /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/sqrtm.m" /* pathName */
};

static emlrtRSInfo xd_emlrtRSI = {
    54,                                                        /* lineNo */
    "sqrtm",                                                   /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/sqrtm.m" /* pathName */
};

static emlrtRSInfo yd_emlrtRSI = {
    85,                                                        /* lineNo */
    "sqrtm",                                                   /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/sqrtm.m" /* pathName */
};

static emlrtRSInfo ae_emlrtRSI = {
    86,                                                        /* lineNo */
    "sqrtm",                                                   /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/sqrtm.m" /* pathName */
};

static emlrtRSInfo gf_emlrtRSI = {
    161,                                                       /* lineNo */
    "isUTmatD",                                                /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/sqrtm.m" /* pathName */
};

static emlrtRSInfo hf_emlrtRSI = {
    162,                                                       /* lineNo */
    "isUTmatD",                                                /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/sqrtm.m" /* pathName */
};

static emlrtRSInfo if_emlrtRSI = {
    182,                                                       /* lineNo */
    "check_for_cancellation",                                  /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/sqrtm.m" /* pathName */
};

static emlrtRSInfo jf_emlrtRSI = {
    183,                                                       /* lineNo */
    "check_for_cancellation",                                  /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/sqrtm.m" /* pathName */
};

static emlrtRSInfo kf_emlrtRSI = {
    185,                                                       /* lineNo */
    "check_for_cancellation",                                  /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/sqrtm.m" /* pathName */
};

static emlrtRSInfo lf_emlrtRSI = {
    187,                                                       /* lineNo */
    "check_for_cancellation",                                  /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/sqrtm.m" /* pathName */
};

static emlrtRTEInfo i_emlrtRTEI = {
    12,                                                        /* lineNo */
    15,                                                        /* colNo */
    "sqrtm",                                                   /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/sqrtm.m" /* pName */
};

static emlrtRTEInfo hd_emlrtRTEI = {
    16,                                                        /* lineNo */
    1,                                                         /* colNo */
    "sqrtm",                                                   /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/sqrtm.m" /* pName */
};

static emlrtRTEInfo id_emlrtRTEI = {
    83,                                                        /* lineNo */
    22,                                                        /* colNo */
    "sqrtm",                                                   /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/sqrtm.m" /* pName */
};

static emlrtRTEInfo jd_emlrtRTEI = {
    1,                                                         /* lineNo */
    29,                                                        /* colNo */
    "sqrtm",                                                   /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/sqrtm.m" /* pName */
};

static emlrtRTEInfo kd_emlrtRTEI = {
    41,                                                        /* lineNo */
    5,                                                         /* colNo */
    "sqrtm",                                                   /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/sqrtm.m" /* pName */
};

/* Function Declarations */
static void check_for_cancellation(const emlrtStack *sp,
                                   const emxArray_creal_T *R);

static boolean_T isUTmatD(const emlrtStack *sp, const emxArray_creal_T *T);

/* Function Definitions */
static void check_for_cancellation(const emlrtStack *sp,
                                   const emxArray_creal_T *R)
{
  emlrtStack b_st;
  emlrtStack st;
  int32_T exitg1;
  int32_T i;
  int32_T j;
  int32_T n;
  boolean_T exitg2;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  n = R->size[1];
  st.site = &if_emlrtRSI;
  j = 0;
  exitg2 = false;
  while ((!exitg2) && (j <= n - 2)) {
    st.site = &jf_emlrtRSI;
    if ((j + 2 <= n) && (n > 2147483646)) {
      b_st.site = &bb_emlrtRSI;
      check_forloop_overflow_error(&b_st);
    }
    i = j + 1;
    do {
      exitg1 = 0;
      if (i + 1 <= n) {
        st.site = &kf_emlrtRSI;
        if (muDoubleScalarAbs(R->data[i + R->size[0] * i].re +
                              R->data[j + R->size[0] * j].re) +
                muDoubleScalarAbs(R->data[i + R->size[0] * i].im +
                                  R->data[j + R->size[0] * j].im) <=
            1.4901161193847656E-7 *
                ((muDoubleScalarAbs(R->data[i + R->size[0] * i].re) +
                  muDoubleScalarAbs(R->data[i + R->size[0] * i].im)) +
                 (muDoubleScalarAbs(R->data[j + R->size[0] * j].re) +
                  muDoubleScalarAbs(R->data[j + R->size[0] * j].im)))) {
          st.site = &lf_emlrtRSI;
          e_warning(&st);
          exitg1 = 1;
        } else {
          i++;
        }
      } else {
        j++;
        exitg1 = 2;
      }
    } while (exitg1 == 0);
    if (exitg1 == 1) {
      exitg2 = true;
    }
  }
}

static boolean_T isUTmatD(const emlrtStack *sp, const emxArray_creal_T *T)
{
  emlrtStack b_st;
  emlrtStack st;
  int32_T exitg1;
  int32_T exitg2;
  int32_T i;
  int32_T j;
  boolean_T p;
  st.prev = sp;
  st.tls = sp->tls;
  st.site = &gf_emlrtRSI;
  b_st.prev = &st;
  b_st.tls = st.tls;
  if ((1 <= T->size[1]) && (T->size[1] > 2147483646)) {
    b_st.site = &bb_emlrtRSI;
    check_forloop_overflow_error(&b_st);
  }
  j = -1;
  do {
    exitg2 = 0;
    if (j + 1 <= T->size[1] - 1) {
      st.site = &hf_emlrtRSI;
      i = 0;
      do {
        exitg1 = 0;
        if (i <= j) {
          if ((T->data[i + T->size[0] * (j + 1)].re != 0.0) ||
              (T->data[i + T->size[0] * (j + 1)].im != 0.0)) {
            p = false;
            exitg1 = 1;
          } else {
            i++;
          }
        } else {
          j++;
          exitg1 = 2;
        }
      } while (exitg1 == 0);
      if (exitg1 == 1) {
        exitg2 = 1;
      }
    } else {
      p = true;
      exitg2 = 1;
    }
  } while (exitg2 == 0);
  return p;
}

void b_sqrtm(const emlrtStack *sp, const emxArray_creal_T *A,
             emxArray_creal_T *X)
{
  emlrtStack b_st;
  emlrtStack st;
  emxArray_creal_T *Q;
  emxArray_creal_T *R;
  emxArray_creal_T *T;
  emxArray_creal_T *y;
  real_T ai;
  real_T ar;
  real_T bi;
  real_T br;
  real_T brm;
  real_T re;
  real_T s_im;
  real_T s_re;
  int32_T i;
  int32_T j;
  int32_T k;
  int32_T loop_ub;
  int32_T n;
  boolean_T exitg1;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  emlrtHeapReferenceStackEnterFcnR2012b((emlrtCTX)sp);
  if (A->size[0] != A->size[1]) {
    emlrtErrorWithMessageIdR2018a(sp, &i_emlrtRTEI, "Coder:MATLAB:square",
                                  "Coder:MATLAB:square", 0);
  }
  emxInit_creal_T(sp, &R, 2, &hd_emlrtRTEI, true);
  emxInit_creal_T(sp, &Q, 2, &jd_emlrtRTEI, true);
  emxInit_creal_T(sp, &T, 2, &jd_emlrtRTEI, true);
  st.site = &pd_emlrtRSI;
  b_schur(&st, A, Q, T);
  n = A->size[0] - 1;
  j = R->size[0] * R->size[1];
  R->size[0] = T->size[0];
  R->size[1] = T->size[1];
  emxEnsureCapacity_creal_T(sp, R, j, &hd_emlrtRTEI);
  loop_ub = T->size[0] * T->size[1];
  for (j = 0; j < loop_ub; j++) {
    R->data[j].re = 0.0;
    R->data[j].im = 0.0;
  }
  st.site = &qd_emlrtRSI;
  if (isUTmatD(&st, T)) {
    st.site = &rd_emlrtRSI;
    if ((1 <= A->size[0]) && (A->size[0] > 2147483646)) {
      b_st.site = &bb_emlrtRSI;
      check_forloop_overflow_error(&b_st);
    }
    for (j = 0; j <= n; j++) {
      R->data[j + R->size[0] * j] = T->data[j + T->size[0] * j];
      b_sqrt(&R->data[j + R->size[0] * j]);
    }
  } else {
    st.site = &sd_emlrtRSI;
    if ((1 <= A->size[0]) && (A->size[0] > 2147483646)) {
      b_st.site = &bb_emlrtRSI;
      check_forloop_overflow_error(&b_st);
    }
    for (j = 0; j <= n; j++) {
      R->data[j + R->size[0] * j] = T->data[j + T->size[0] * j];
      b_sqrt(&R->data[j + R->size[0] * j]);
      for (i = j; i >= 1; i--) {
        s_re = 0.0;
        s_im = 0.0;
        loop_ub = i + 1;
        st.site = &td_emlrtRSI;
        for (k = loop_ub; k <= j; k++) {
          s_re += R->data[(i + R->size[0] * (k - 1)) - 1].re *
                      R->data[(k + R->size[0] * j) - 1].re -
                  R->data[(i + R->size[0] * (k - 1)) - 1].im *
                      R->data[(k + R->size[0] * j) - 1].im;
          s_im += R->data[(i + R->size[0] * (k - 1)) - 1].re *
                      R->data[(k + R->size[0] * j) - 1].im +
                  R->data[(i + R->size[0] * (k - 1)) - 1].im *
                      R->data[(k + R->size[0] * j) - 1].re;
        }
        ar = T->data[(i + T->size[0] * j) - 1].re - s_re;
        ai = T->data[(i + T->size[0] * j) - 1].im - s_im;
        br = R->data[(i + R->size[0] * (i - 1)) - 1].re +
             R->data[j + R->size[0] * j].re;
        bi = R->data[(i + R->size[0] * (i - 1)) - 1].im +
             R->data[j + R->size[0] * j].im;
        if (bi == 0.0) {
          if (ai == 0.0) {
            re = ar / br;
            s_re = 0.0;
          } else if (ar == 0.0) {
            re = 0.0;
            s_re = ai / br;
          } else {
            re = ar / br;
            s_re = ai / br;
          }
        } else if (br == 0.0) {
          if (ar == 0.0) {
            re = ai / bi;
            s_re = 0.0;
          } else if (ai == 0.0) {
            re = 0.0;
            s_re = -(ar / bi);
          } else {
            re = ai / bi;
            s_re = -(ar / bi);
          }
        } else {
          brm = muDoubleScalarAbs(br);
          s_re = muDoubleScalarAbs(bi);
          if (brm > s_re) {
            s_im = bi / br;
            s_re = br + s_im * bi;
            re = (ar + s_im * ai) / s_re;
            s_re = (ai - s_im * ar) / s_re;
          } else if (s_re == brm) {
            if (br > 0.0) {
              s_im = 0.5;
            } else {
              s_im = -0.5;
            }
            if (bi > 0.0) {
              s_re = 0.5;
            } else {
              s_re = -0.5;
            }
            re = (ar * s_im + ai * s_re) / brm;
            s_re = (ai * s_im - ar * s_re) / brm;
          } else {
            s_im = br / bi;
            s_re = bi + s_im * br;
            re = (s_im * ar + ai) / s_re;
            s_re = (s_im * ai - ar) / s_re;
          }
        }
        R->data[(i + R->size[0] * j) - 1].re = re;
        R->data[(i + R->size[0] * j) - 1].im = s_re;
      }
    }
  }
  emxInit_creal_T(sp, &y, 2, &kd_emlrtRTEI, true);
  st.site = &ud_emlrtRSI;
  b_st.site = &fd_emlrtRSI;
  if (R->size[0] != Q->size[1]) {
    if (((Q->size[0] == 1) && (Q->size[1] == 1)) ||
        ((R->size[0] == 1) && (R->size[1] == 1))) {
      emlrtErrorWithMessageIdR2018a(
          &b_st, &h_emlrtRTEI, "Coder:toolbox:mtimes_noDynamicScalarExpansion",
          "Coder:toolbox:mtimes_noDynamicScalarExpansion", 0);
    } else {
      emlrtErrorWithMessageIdR2018a(&b_st, &g_emlrtRTEI, "MATLAB:innerdim",
                                    "MATLAB:innerdim", 0);
    }
  }
  b_st.site = &ed_emlrtRSI;
  b_mtimes(&b_st, Q, R, y);
  st.site = &ud_emlrtRSI;
  b_st.site = &fd_emlrtRSI;
  if (y->size[1] != Q->size[1]) {
    if (((y->size[0] == 1) && (y->size[1] == 1)) ||
        ((Q->size[0] == 1) && (Q->size[1] == 1))) {
      emlrtErrorWithMessageIdR2018a(
          &b_st, &h_emlrtRTEI, "Coder:toolbox:mtimes_noDynamicScalarExpansion",
          "Coder:toolbox:mtimes_noDynamicScalarExpansion", 0);
    } else {
      emlrtErrorWithMessageIdR2018a(&b_st, &g_emlrtRTEI, "MATLAB:innerdim",
                                    "MATLAB:innerdim", 0);
    }
  }
  b_st.site = &ed_emlrtRSI;
  c_mtimes(&b_st, y, Q, X);
  st.site = &vd_emlrtRSI;
  k = 0;
  emxFree_creal_T(&y);
  emxFree_creal_T(&Q);
  exitg1 = false;
  while ((!exitg1) && (k <= n)) {
    if ((T->data[k + T->size[0] * k].re == 0.0) &&
        (T->data[k + T->size[0] * k].im == 0.0)) {
      st.site = &wd_emlrtRSI;
      d_warning(&st);
      exitg1 = true;
    } else {
      k++;
    }
  }
  emxFree_creal_T(&T);
  st.site = &xd_emlrtRSI;
  check_for_cancellation(&st, R);
  emxFree_creal_T(&R);
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtCTX)sp);
}

void sqrtm(const emlrtStack *sp, const emxArray_real_T *A, emxArray_creal_T *X)
{
  emlrtStack b_st;
  emlrtStack st;
  emxArray_creal_T *Q;
  emxArray_creal_T *R;
  emxArray_creal_T *T;
  emxArray_creal_T *y;
  emxArray_real_T *x;
  real_T ai;
  real_T ar;
  real_T bi;
  real_T brm;
  real_T re;
  real_T s_im;
  real_T s_re;
  int32_T b_i;
  int32_T i;
  int32_T j;
  int32_T k;
  int32_T loop_ub;
  int32_T n;
  boolean_T exitg1;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  emlrtHeapReferenceStackEnterFcnR2012b((emlrtCTX)sp);
  if (A->size[0] != A->size[1]) {
    emlrtErrorWithMessageIdR2018a(sp, &i_emlrtRTEI, "Coder:MATLAB:square",
                                  "Coder:MATLAB:square", 0);
  }
  emxInit_creal_T(sp, &R, 2, &hd_emlrtRTEI, true);
  emxInit_creal_T(sp, &Q, 2, &jd_emlrtRTEI, true);
  emxInit_creal_T(sp, &T, 2, &jd_emlrtRTEI, true);
  st.site = &pd_emlrtRSI;
  schur(&st, A, Q, T);
  n = A->size[0] - 1;
  i = R->size[0] * R->size[1];
  R->size[0] = T->size[0];
  R->size[1] = T->size[1];
  emxEnsureCapacity_creal_T(sp, R, i, &hd_emlrtRTEI);
  loop_ub = T->size[0] * T->size[1];
  for (i = 0; i < loop_ub; i++) {
    R->data[i].re = 0.0;
    R->data[i].im = 0.0;
  }
  st.site = &qd_emlrtRSI;
  if (isUTmatD(&st, T)) {
    st.site = &rd_emlrtRSI;
    if ((1 <= A->size[0]) && (A->size[0] > 2147483646)) {
      b_st.site = &bb_emlrtRSI;
      check_forloop_overflow_error(&b_st);
    }
    for (j = 0; j <= n; j++) {
      R->data[j + R->size[0] * j] = T->data[j + T->size[0] * j];
      b_sqrt(&R->data[j + R->size[0] * j]);
    }
  } else {
    st.site = &sd_emlrtRSI;
    if ((1 <= A->size[0]) && (A->size[0] > 2147483646)) {
      b_st.site = &bb_emlrtRSI;
      check_forloop_overflow_error(&b_st);
    }
    for (j = 0; j <= n; j++) {
      R->data[j + R->size[0] * j] = T->data[j + T->size[0] * j];
      b_sqrt(&R->data[j + R->size[0] * j]);
      for (b_i = j; b_i >= 1; b_i--) {
        s_re = 0.0;
        s_im = 0.0;
        loop_ub = b_i + 1;
        st.site = &td_emlrtRSI;
        for (k = loop_ub; k <= j; k++) {
          s_re += R->data[(b_i + R->size[0] * (k - 1)) - 1].re *
                      R->data[(k + R->size[0] * j) - 1].re -
                  R->data[(b_i + R->size[0] * (k - 1)) - 1].im *
                      R->data[(k + R->size[0] * j) - 1].im;
          s_im += R->data[(b_i + R->size[0] * (k - 1)) - 1].re *
                      R->data[(k + R->size[0] * j) - 1].im +
                  R->data[(b_i + R->size[0] * (k - 1)) - 1].im *
                      R->data[(k + R->size[0] * j) - 1].re;
        }
        ar = T->data[(b_i + T->size[0] * j) - 1].re - s_re;
        ai = T->data[(b_i + T->size[0] * j) - 1].im - s_im;
        s_im = R->data[(b_i + R->size[0] * (b_i - 1)) - 1].re +
               R->data[j + R->size[0] * j].re;
        bi = R->data[(b_i + R->size[0] * (b_i - 1)) - 1].im +
             R->data[j + R->size[0] * j].im;
        if (bi == 0.0) {
          if (ai == 0.0) {
            re = ar / s_im;
            s_re = 0.0;
          } else if (ar == 0.0) {
            re = 0.0;
            s_re = ai / s_im;
          } else {
            re = ar / s_im;
            s_re = ai / s_im;
          }
        } else if (s_im == 0.0) {
          if (ar == 0.0) {
            re = ai / bi;
            s_re = 0.0;
          } else if (ai == 0.0) {
            re = 0.0;
            s_re = -(ar / bi);
          } else {
            re = ai / bi;
            s_re = -(ar / bi);
          }
        } else {
          brm = muDoubleScalarAbs(s_im);
          s_re = muDoubleScalarAbs(bi);
          if (brm > s_re) {
            brm = bi / s_im;
            s_re = s_im + brm * bi;
            re = (ar + brm * ai) / s_re;
            s_re = (ai - brm * ar) / s_re;
          } else if (s_re == brm) {
            if (s_im > 0.0) {
              s_im = 0.5;
            } else {
              s_im = -0.5;
            }
            if (bi > 0.0) {
              s_re = 0.5;
            } else {
              s_re = -0.5;
            }
            re = (ar * s_im + ai * s_re) / brm;
            s_re = (ai * s_im - ar * s_re) / brm;
          } else {
            brm = s_im / bi;
            s_re = bi + brm * s_im;
            re = (brm * ar + ai) / s_re;
            s_re = (brm * ai - ar) / s_re;
          }
        }
        R->data[(b_i + R->size[0] * j) - 1].re = re;
        R->data[(b_i + R->size[0] * j) - 1].im = s_re;
      }
    }
  }
  emxInit_creal_T(sp, &y, 2, &kd_emlrtRTEI, true);
  st.site = &ud_emlrtRSI;
  b_st.site = &fd_emlrtRSI;
  if (R->size[0] != Q->size[1]) {
    if (((Q->size[0] == 1) && (Q->size[1] == 1)) ||
        ((R->size[0] == 1) && (R->size[1] == 1))) {
      emlrtErrorWithMessageIdR2018a(
          &b_st, &h_emlrtRTEI, "Coder:toolbox:mtimes_noDynamicScalarExpansion",
          "Coder:toolbox:mtimes_noDynamicScalarExpansion", 0);
    } else {
      emlrtErrorWithMessageIdR2018a(&b_st, &g_emlrtRTEI, "MATLAB:innerdim",
                                    "MATLAB:innerdim", 0);
    }
  }
  b_st.site = &ed_emlrtRSI;
  b_mtimes(&b_st, Q, R, y);
  st.site = &ud_emlrtRSI;
  b_st.site = &fd_emlrtRSI;
  if (y->size[1] != Q->size[1]) {
    if (((y->size[0] == 1) && (y->size[1] == 1)) ||
        ((Q->size[0] == 1) && (Q->size[1] == 1))) {
      emlrtErrorWithMessageIdR2018a(
          &b_st, &h_emlrtRTEI, "Coder:toolbox:mtimes_noDynamicScalarExpansion",
          "Coder:toolbox:mtimes_noDynamicScalarExpansion", 0);
    } else {
      emlrtErrorWithMessageIdR2018a(&b_st, &g_emlrtRTEI, "MATLAB:innerdim",
                                    "MATLAB:innerdim", 0);
    }
  }
  b_st.site = &ed_emlrtRSI;
  c_mtimes(&b_st, y, Q, X);
  st.site = &vd_emlrtRSI;
  k = 0;
  emxFree_creal_T(&y);
  emxFree_creal_T(&Q);
  exitg1 = false;
  while ((!exitg1) && (k <= n)) {
    if ((T->data[k + T->size[0] * k].re == 0.0) &&
        (T->data[k + T->size[0] * k].im == 0.0)) {
      st.site = &wd_emlrtRSI;
      d_warning(&st);
      exitg1 = true;
    } else {
      k++;
    }
  }
  emxFree_creal_T(&T);
  emxInit_real_T(sp, &x, 2, &id_emlrtRTEI, true);
  st.site = &xd_emlrtRSI;
  check_for_cancellation(&st, R);
  i = x->size[0] * x->size[1];
  x->size[0] = X->size[0];
  x->size[1] = X->size[1];
  emxEnsureCapacity_real_T(sp, x, i, &id_emlrtRTEI);
  loop_ub = X->size[0] * X->size[1];
  emxFree_creal_T(&R);
  for (i = 0; i < loop_ub; i++) {
    x->data[i] = X->data[i].im;
  }
  if ((x->size[0] == 0) || (x->size[1] == 0)) {
    s_re = 0.0;
  } else if ((x->size[0] == 1) || (x->size[1] == 1)) {
    s_re = 0.0;
    i = x->size[0] * x->size[1];
    for (k = 0; k < i; k++) {
      s_re += muDoubleScalarAbs(x->data[k]);
    }
  } else {
    s_re = 0.0;
    j = 0;
    exitg1 = false;
    while ((!exitg1) && (j <= x->size[1] - 1)) {
      brm = 0.0;
      i = x->size[0];
      for (b_i = 0; b_i < i; b_i++) {
        brm += muDoubleScalarAbs(x->data[b_i + x->size[0] * j]);
      }
      if (muDoubleScalarIsNaN(brm)) {
        s_re = rtNaN;
        exitg1 = true;
      } else {
        if (brm > s_re) {
          s_re = brm;
        }
        j++;
      }
    }
  }
  emxFree_real_T(&x);
  if ((X->size[0] == 0) || (X->size[1] == 0)) {
    s_im = 0.0;
  } else if ((X->size[0] == 1) || (X->size[1] == 1)) {
    s_im = 0.0;
    i = X->size[0] * X->size[1];
    for (k = 0; k < i; k++) {
      s_im += muDoubleScalarHypot(X->data[k].re, X->data[k].im);
    }
  } else {
    s_im = 0.0;
    j = 0;
    exitg1 = false;
    while ((!exitg1) && (j <= X->size[1] - 1)) {
      brm = 0.0;
      i = X->size[0];
      for (b_i = 0; b_i < i; b_i++) {
        brm += muDoubleScalarHypot(X->data[b_i + X->size[0] * j].re,
                                   X->data[b_i + X->size[0] * j].im);
      }
      if (muDoubleScalarIsNaN(brm)) {
        s_im = rtNaN;
        exitg1 = true;
      } else {
        if (brm > s_im) {
          s_im = brm;
        }
        j++;
      }
    }
  }
  if (s_re <= 10.0 * (real_T)A->size[0] * 2.2204460492503131E-16 * s_im) {
    st.site = &yd_emlrtRSI;
    for (j = 0; j <= n; j++) {
      st.site = &ae_emlrtRSI;
      if ((1 <= n + 1) && (n + 1 > 2147483646)) {
        b_st.site = &bb_emlrtRSI;
        check_forloop_overflow_error(&b_st);
      }
      for (b_i = 0; b_i <= n; b_i++) {
        X->data[b_i + X->size[0] * j].im = 0.0;
      }
    }
  }
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtCTX)sp);
}

/* End of code generation (sqrtm.c) */
