/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * rsf2csf.c
 *
 * Code generation for function 'rsf2csf'
 *
 */

/* Include files */
#include "rsf2csf.h"
#include "alphaJDBarycenter_data.h"
#include "alphaJDBarycenter_emxutil.h"
#include "alphaJDBarycenter_types.h"
#include "eml_int_forloop_overflow_check.h"
#include "rt_nonfinite.h"
#include "mwmathutil.h"

/* Variable Definitions */
static emlrtRSInfo uf_emlrtRSI = {
    15,                                                          /* lineNo */
    "rsf2csf",                                                   /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/rsf2csf.m" /* pathName */
};

static emlrtRSInfo
    vf_emlrtRSI =
        {
            37,            /* lineNo */
            "eml_rsf2csf", /* fcnName */
            "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/private/"
            "eml_rsf2csf.m" /* pathName */
};

static emlrtRSInfo
    wf_emlrtRSI =
        {
            47,            /* lineNo */
            "eml_rsf2csf", /* fcnName */
            "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/private/"
            "eml_rsf2csf.m" /* pathName */
};

static emlrtRSInfo
    xf_emlrtRSI =
        {
            55,            /* lineNo */
            "eml_rsf2csf", /* fcnName */
            "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/private/"
            "eml_rsf2csf.m" /* pathName */
};

static emlrtRSInfo
    yf_emlrtRSI =
        {
            63,            /* lineNo */
            "eml_rsf2csf", /* fcnName */
            "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/private/"
            "eml_rsf2csf.m" /* pathName */
};

static emlrtRTEInfo
    pf_emlrtRTEI =
        {
            12,            /* lineNo */
            1,             /* colNo */
            "eml_rsf2csf", /* fName */
            "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/private/"
            "eml_rsf2csf.m" /* pName */
};

static emlrtRTEInfo
    qf_emlrtRTEI =
        {
            17,            /* lineNo */
            5,             /* colNo */
            "eml_rsf2csf", /* fName */
            "/home/cr055/MATLAB/toolbox/eml/lib/matlab/matfun/private/"
            "eml_rsf2csf.m" /* pName */
};

/* Function Definitions */
void rsf2csf(const emlrtStack *sp, const emxArray_real_T *Ur,
             const emxArray_real_T *Tr, emxArray_creal_T *U,
             emxArray_creal_T *T)
{
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack st;
  real_T a;
  real_T b;
  real_T b_c;
  real_T bcmax;
  real_T cs;
  real_T d;
  real_T p;
  real_T scale;
  real_T tau;
  real_T temp;
  real_T z;
  int32_T c;
  int32_T mTr;
  int32_T mUr;
  int32_T nTr;
  int32_T nUr;
  st.prev = sp;
  st.tls = sp->tls;
  st.site = &uf_emlrtRSI;
  b_st.prev = &st;
  b_st.tls = st.tls;
  c_st.prev = &b_st;
  c_st.tls = b_st.tls;
  nTr = T->size[0] * T->size[1];
  T->size[0] = Tr->size[0];
  T->size[1] = Tr->size[1];
  emxEnsureCapacity_creal_T(&st, T, nTr, &pf_emlrtRTEI);
  mTr = Tr->size[0] * Tr->size[1];
  for (nTr = 0; nTr < mTr; nTr++) {
    T->data[nTr].re = Tr->data[nTr];
    T->data[nTr].im = 0.0;
  }
  nTr = U->size[0] * U->size[1];
  U->size[0] = Ur->size[0];
  U->size[1] = Ur->size[1];
  emxEnsureCapacity_creal_T(&st, U, nTr, &qf_emlrtRTEI);
  mTr = Ur->size[0] * Ur->size[1];
  for (nTr = 0; nTr < mTr; nTr++) {
    U->data[nTr].re = Ur->data[nTr];
    U->data[nTr].im = 0.0;
  }
  mTr = Tr->size[0];
  nTr = Tr->size[1];
  mUr = Ur->size[0];
  nUr = Ur->size[1];
  c = muIntScalarMin_sint32(mTr, nTr);
  nUr = muIntScalarMin_sint32(mUr, nUr);
  mTr = muIntScalarMin_sint32(c, nUr);
  if (mTr != 0) {
    for (nTr = mTr - 1; nTr + 1 >= 2; nTr--) {
      b_c = Tr->data[nTr + Tr->size[0] * (nTr - 1)];
      if (b_c != 0.0) {
        b_st.site = &vf_emlrtRSI;
        a = Tr->data[(nTr + Tr->size[0] * (nTr - 1)) - 1];
        b = Tr->data[(nTr + Tr->size[0] * nTr) - 1];
        p = b_c;
        d = Tr->data[nTr + Tr->size[0] * nTr];
        if (!(b_c == 0.0)) {
          if (b == 0.0) {
            a = d;
            b = -b_c;
            p = 0.0;
          } else if ((!(a - d == 0.0)) || ((b < 0.0) == (b_c < 0.0))) {
            temp = a - d;
            p = 0.5 * temp;
            z = muDoubleScalarAbs(b);
            tau = muDoubleScalarAbs(b_c);
            bcmax = muDoubleScalarMax(z, tau);
            scale = muDoubleScalarMax(muDoubleScalarAbs(p), bcmax);
            if (!(b < 0.0)) {
              nUr = 1;
            } else {
              nUr = -1;
            }
            if (!(b_c < 0.0)) {
              c = 1;
            } else {
              c = -1;
            }
            z = p / scale * p +
                bcmax / scale *
                    (muDoubleScalarMin(z, tau) * (real_T)nUr * (real_T)c);
            if (z >= 8.8817841970012523E-16) {
              a = muDoubleScalarSqrt(scale) * muDoubleScalarSqrt(z);
              if (p < 0.0) {
                a = -a;
              }
              a = d + (p + a);
              b -= b_c;
              p = 0.0;
            } else {
              scale = b + b_c;
              tau = muDoubleScalarHypot(scale, temp);
              cs = muDoubleScalarSqrt(0.5 *
                                      (muDoubleScalarAbs(scale) / tau + 1.0));
              if (!(scale < 0.0)) {
                nUr = 1;
              } else {
                nUr = -1;
              }
              temp = -(p / (tau * cs)) * (real_T)nUr;
              bcmax = a * cs + b * temp;
              tau = -a * temp + b * cs;
              scale = b_c * cs + d * temp;
              z = -b_c * temp + d * cs;
              b = tau * cs + z * temp;
              p = -bcmax * temp + scale * cs;
              temp =
                  0.5 * ((bcmax * cs + scale * temp) + (-tau * temp + z * cs));
              a = temp;
              if (p != 0.0) {
                if (b != 0.0) {
                  if ((b < 0.0) == (p < 0.0)) {
                    a = muDoubleScalarSqrt(muDoubleScalarAbs(b)) *
                        muDoubleScalarSqrt(muDoubleScalarAbs(p));
                    if (p < 0.0) {
                      a = -a;
                    }
                    a += temp;
                    b -= p;
                    p = 0.0;
                  }
                } else {
                  b = -p;
                  p = 0.0;
                }
              }
            }
          }
        }
        if (p == 0.0) {
          scale = 0.0;
        } else {
          scale = muDoubleScalarSqrt(muDoubleScalarAbs(b)) *
                  muDoubleScalarSqrt(muDoubleScalarAbs(p));
        }
        z = a - Tr->data[nTr + Tr->size[0] * nTr];
        tau = muDoubleScalarHypot(muDoubleScalarHypot(z, scale), b_c);
        if (scale == 0.0) {
          cs = z / tau;
          p = 0.0;
        } else if (z == 0.0) {
          cs = 0.0;
          p = scale / tau;
        } else {
          cs = z / tau;
          p = scale / tau;
        }
        temp = b_c / tau;
        b_st.site = &wf_emlrtRSI;
        if ((nTr <= mTr) && (mTr > 2147483646)) {
          c_st.site = &lb_emlrtRSI;
          check_forloop_overflow_error(&c_st);
        }
        for (mUr = nTr; mUr <= mTr; mUr++) {
          z = T->data[(nTr + T->size[0] * (mUr - 1)) - 1].re;
          scale = T->data[(nTr + T->size[0] * (mUr - 1)) - 1].im;
          T->data[(nTr + T->size[0] * (mUr - 1)) - 1].re =
              (cs * z + p * scale) +
              temp * T->data[nTr + T->size[0] * (mUr - 1)].re;
          T->data[(nTr + T->size[0] * (mUr - 1)) - 1].im =
              (cs * scale - p * z) +
              temp * T->data[nTr + T->size[0] * (mUr - 1)].im;
          bcmax = cs * T->data[nTr + T->size[0] * (mUr - 1)].im +
                  p * T->data[nTr + T->size[0] * (mUr - 1)].re;
          T->data[nTr + T->size[0] * (mUr - 1)].re =
              (cs * T->data[nTr + T->size[0] * (mUr - 1)].re -
               p * T->data[nTr + T->size[0] * (mUr - 1)].im) -
              temp * z;
          T->data[nTr + T->size[0] * (mUr - 1)].im = bcmax - temp * scale;
        }
        b_st.site = &xf_emlrtRSI;
        if (nTr + 1 > 2147483646) {
          c_st.site = &lb_emlrtRSI;
          check_forloop_overflow_error(&c_st);
        }
        for (mUr = 0; mUr <= nTr; mUr++) {
          scale = T->data[mUr + T->size[0] * (nTr - 1)].re;
          tau = T->data[mUr + T->size[0] * (nTr - 1)].im;
          bcmax = cs * T->data[mUr + T->size[0] * (nTr - 1)].im +
                  p * T->data[mUr + T->size[0] * (nTr - 1)].re;
          T->data[mUr + T->size[0] * (nTr - 1)].re =
              (cs * T->data[mUr + T->size[0] * (nTr - 1)].re -
               p * T->data[mUr + T->size[0] * (nTr - 1)].im) +
              temp * T->data[mUr + T->size[0] * nTr].re;
          T->data[mUr + T->size[0] * (nTr - 1)].im =
              bcmax + temp * T->data[mUr + T->size[0] * nTr].im;
          z = T->data[mUr + T->size[0] * nTr].re;
          T->data[mUr + T->size[0] * nTr].re =
              (cs * T->data[mUr + T->size[0] * nTr].re +
               p * T->data[mUr + T->size[0] * nTr].im) -
              temp * scale;
          T->data[mUr + T->size[0] * nTr].im =
              (cs * T->data[mUr + T->size[0] * nTr].im - p * z) - temp * tau;
        }
        b_st.site = &yf_emlrtRSI;
        for (mUr = 0; mUr < mTr; mUr++) {
          scale = U->data[mUr + U->size[0] * (nTr - 1)].re;
          tau = U->data[mUr + U->size[0] * (nTr - 1)].im;
          bcmax = cs * U->data[mUr + U->size[0] * (nTr - 1)].im +
                  p * U->data[mUr + U->size[0] * (nTr - 1)].re;
          U->data[mUr + U->size[0] * (nTr - 1)].re =
              (cs * U->data[mUr + U->size[0] * (nTr - 1)].re -
               p * U->data[mUr + U->size[0] * (nTr - 1)].im) +
              temp * U->data[mUr + U->size[0] * nTr].re;
          U->data[mUr + U->size[0] * (nTr - 1)].im =
              bcmax + temp * U->data[mUr + U->size[0] * nTr].im;
          z = U->data[mUr + U->size[0] * nTr].re;
          U->data[mUr + U->size[0] * nTr].re =
              (cs * U->data[mUr + U->size[0] * nTr].re +
               p * U->data[mUr + U->size[0] * nTr].im) -
              temp * scale;
          U->data[mUr + U->size[0] * nTr].im =
              (cs * U->data[mUr + U->size[0] * nTr].im - p * z) - temp * tau;
        }
        T->data[nTr + T->size[0] * (nTr - 1)].re = 0.0;
        T->data[nTr + T->size[0] * (nTr - 1)].im = 0.0;
      }
    }
  }
}

/* End of code generation (rsf2csf.c) */
