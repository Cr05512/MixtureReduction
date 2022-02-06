/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * det.c
 *
 * Code generation for function 'det'
 *
 */

/* Include files */
#include "det.h"
#include "BDBarycenter_data.h"
#include "BDBarycenter_emxutil.h"
#include "BDBarycenter_types.h"
#include "repmat.h"
#include "rt_nonfinite.h"
#include "lapacke.h"
#include "mwmathutil.h"
#include <stddef.h>

/* Variable Definitions */
static emlrtRSInfo gd_emlrtRSI = {
    21,                                                      /* lineNo */
    "det",                                                   /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/det.m" /* pathName */
};

static emlrtRTEInfo k_emlrtRTEI = {
    12,                                                      /* lineNo */
    15,                                                      /* colNo */
    "det",                                                   /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/det.m" /* pName */
};

static emlrtRTEInfo kc_emlrtRTEI = {
    1,                                                       /* lineNo */
    14,                                                      /* colNo */
    "det",                                                   /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/det.m" /* pName */
};

/* Function Definitions */
real_T det(const emlrtStack *sp, const emxArray_real_T *x)
{
  ptrdiff_t info_t;
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack st;
  emxArray_int32_T *ipiv;
  emxArray_ptrdiff_t *ipiv_t;
  emxArray_ptrdiff_t *r;
  emxArray_real_T *b_x;
  real_T y;
  int32_T i;
  int32_T loop_ub;
  int32_T m;
  int32_T n;
  boolean_T isodd;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  c_st.prev = &b_st;
  c_st.tls = b_st.tls;
  emlrtHeapReferenceStackEnterFcnR2012b((emlrtCTX)sp);
  if (x->size[0] != x->size[1]) {
    emlrtErrorWithMessageIdR2018a(sp, &k_emlrtRTEI, "Coder:MATLAB:square",
                                  "Coder:MATLAB:square", 0);
  }
  if ((x->size[0] == 0) || (x->size[1] == 0)) {
    y = 1.0;
  } else {
    emxInit_real_T(sp, &b_x, 2, &kc_emlrtRTEI, true);
    m = x->size[0];
    n = x->size[1];
    st.site = &gd_emlrtRSI;
    i = b_x->size[0] * b_x->size[1];
    b_x->size[0] = x->size[0];
    b_x->size[1] = x->size[1];
    emxEnsureCapacity_real_T(&st, b_x, i, &hc_emlrtRTEI);
    loop_ub = x->size[0] * x->size[1];
    for (i = 0; i < loop_ub; i++) {
      b_x->data[i] = x->data[i];
    }
    emxInit_int32_T(&st, &ipiv, 2, &kc_emlrtRTEI, true);
    emxInit_ptrdiff_t(&st, &ipiv_t, 1, &lc_emlrtRTEI, true);
    emxInit_ptrdiff_t(&st, &r, 1, &ic_emlrtRTEI, true);
    b_st.site = &lb_emlrtRSI;
    c_st.site = &nb_emlrtRSI;
    repmat(&c_st, (ptrdiff_t)0.0, muIntScalarMin_sint32(m, n), r);
    i = ipiv_t->size[0];
    ipiv_t->size[0] = r->size[0];
    emxEnsureCapacity_ptrdiff_t(&b_st, ipiv_t, i, &ic_emlrtRTEI);
    info_t = LAPACKE_dgetrf_work(102, (ptrdiff_t)x->size[0],
                                 (ptrdiff_t)x->size[1], &b_x->data[0],
                                 (ptrdiff_t)x->size[0], &ipiv_t->data[0]);
    m = (int32_T)info_t;
    i = ipiv->size[0] * ipiv->size[1];
    ipiv->size[0] = 1;
    ipiv->size[1] = ipiv_t->size[0];
    emxEnsureCapacity_int32_T(&b_st, ipiv, i, &jc_emlrtRTEI);
    c_st.site = &mb_emlrtRSI;
    emxFree_ptrdiff_t(&r);
    if (m < 0) {
      if (m == -1010) {
        emlrtErrorWithMessageIdR2018a(&c_st, &h_emlrtRTEI, "MATLAB:nomem",
                                      "MATLAB:nomem", 0);
      } else {
        emlrtErrorWithMessageIdR2018a(
            &c_st, &i_emlrtRTEI, "Coder:toolbox:LAPACKCallErrorInfo",
            "Coder:toolbox:LAPACKCallErrorInfo", 5, 4, 19, &cv[0], 12, m);
      }
    }
    i = ipiv_t->size[0] - 1;
    for (m = 0; m <= i; m++) {
      ipiv->data[m] = (int32_T)ipiv_t->data[m];
    }
    emxFree_ptrdiff_t(&ipiv_t);
    y = b_x->data[0];
    i = b_x->size[0];
    for (m = 0; m <= i - 2; m++) {
      y *= b_x->data[(m + b_x->size[0] * (m + 1)) + 1];
    }
    emxFree_real_T(&b_x);
    isodd = false;
    i = ipiv->size[1];
    for (m = 0; m <= i - 2; m++) {
      if (ipiv->data[m] > m + 1) {
        isodd = !isodd;
      }
    }
    emxFree_int32_T(&ipiv);
    if (isodd) {
      y = -y;
    }
  }
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtCTX)sp);
  return y;
}

/* End of code generation (det.c) */
