/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * chol.c
 *
 * Code generation for function 'chol'
 *
 */

/* Include files */
#include "chol.h"
#include "alphaJDBarycenter_data.h"
#include "alphaJDBarycenter_types.h"
#include "eml_int_forloop_overflow_check.h"
#include "rt_nonfinite.h"
#include "lapacke.h"
#include <stddef.h>

/* Variable Definitions */
static emlrtRSInfo pg_emlrtRSI = {
    74,                                                       /* lineNo */
    "cholesky",                                               /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/chol.m" /* pathName */
};

static emlrtRSInfo qg_emlrtRSI = {
    84,                                                       /* lineNo */
    "cholesky",                                               /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/chol.m" /* pathName */
};

static emlrtRSInfo rg_emlrtRSI = {
    85,                                                       /* lineNo */
    "cholesky",                                               /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/chol.m" /* pathName */
};

static emlrtRSInfo sg_emlrtRSI = {
    79,             /* lineNo */
    "ceval_xpotrf", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xpotrf.m" /* pathName
                                                                            */
};

static emlrtRSInfo tg_emlrtRSI = {
    13,       /* lineNo */
    "xpotrf", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xpotrf.m" /* pathName
                                                                            */
};

static emlrtRTEInfo n_emlrtRTEI = {
    80,                                                       /* lineNo */
    23,                                                       /* colNo */
    "cholesky",                                               /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/chol.m" /* pName */
};

static emlrtRTEInfo o_emlrtRTEI = {
    54,                                                       /* lineNo */
    15,                                                       /* colNo */
    "cholesky",                                               /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/chol.m" /* pName */
};

/* Function Definitions */
void cholesky(const emlrtStack *sp, emxArray_real_T *A)
{
  static const char_T fname[19] = {'L', 'A', 'P', 'A', 'C', 'K', 'E',
                                   '_', 'd', 'p', 'o', 't', 'r', 'f',
                                   '_', 'w', 'o', 'r', 'k'};
  ptrdiff_t info_t;
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack st;
  int32_T info;
  int32_T jmax;
  int32_T n;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  c_st.prev = &b_st;
  c_st.tls = b_st.tls;
  n = A->size[1];
  if (A->size[0] != A->size[1]) {
    emlrtErrorWithMessageIdR2018a(sp, &o_emlrtRTEI, "Coder:MATLAB:square",
                                  "Coder:MATLAB:square", 0);
  }
  if (A->size[1] != 0) {
    st.site = &pg_emlrtRSI;
    b_st.site = &tg_emlrtRSI;
    info_t = LAPACKE_dpotrf_work(102, 'L', (ptrdiff_t)A->size[1], &A->data[0],
                                 (ptrdiff_t)A->size[1]);
    info = (int32_T)info_t;
    c_st.site = &sg_emlrtRSI;
    if (info < 0) {
      if (info == -1010) {
        emlrtErrorWithMessageIdR2018a(&c_st, &i_emlrtRTEI, "MATLAB:nomem",
                                      "MATLAB:nomem", 0);
      } else {
        emlrtErrorWithMessageIdR2018a(
            &c_st, &h_emlrtRTEI, "Coder:toolbox:LAPACKCallErrorInfo",
            "Coder:toolbox:LAPACKCallErrorInfo", 5, 4, 19, &fname[0], 12, info);
      }
    }
    if (info == 0) {
      jmax = n;
    } else {
      emlrtErrorWithMessageIdR2018a(sp, &n_emlrtRTEI, "Coder:MATLAB:posdef",
                                    "Coder:MATLAB:posdef", 0);
    }
    st.site = &qg_emlrtRSI;
    if ((2 <= jmax) && (jmax > 2147483646)) {
      b_st.site = &lb_emlrtRSI;
      check_forloop_overflow_error(&b_st);
    }
    for (n = 2; n <= jmax; n++) {
      st.site = &rg_emlrtRSI;
      for (info = 0; info <= n - 2; info++) {
        A->data[info + A->size[0] * (n - 1)] = 0.0;
      }
    }
  }
}

/* End of code generation (chol.c) */
