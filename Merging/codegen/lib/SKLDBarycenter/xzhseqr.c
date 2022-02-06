/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: xzhseqr.c
 *
 * MATLAB Coder version            : 5.2
 * C/C++ source code generated on  : 31-Jan-2022 14:36:42
 */

/* Include Files */
#include "xzhseqr.h"
#include "SKLDBarycenter_data.h"
#include "SKLDBarycenter_rtwutil.h"
#include "SKLDBarycenter_types.h"
#include "rt_nonfinite.h"
#include "sqrt.h"
#include "xzlarfg.h"
#include <math.h>

/* Function Definitions */
/*
 * Arguments    : emxArray_creal_T *h
 *                emxArray_creal_T *z
 * Return Type  : int
 */
int eml_zlahqr(emxArray_creal_T *h, emxArray_creal_T *z)
{
  creal_T v[2];
  creal_T sc;
  creal_T x2;
  double SMLNUM;
  double aa;
  double ba;
  double htmp2;
  double itmax;
  double re;
  double s;
  double t_im;
  double t_re;
  double tst;
  double u_im;
  double u_re;
  int b_i;
  int b_k;
  int c_k;
  int h_tmp;
  int i;
  int info;
  int its;
  int ix0;
  int j;
  int k;
  int ldh;
  int ldz;
  int m;
  int n;
  int u1;
  boolean_T exitg1;
  boolean_T exitg2;
  boolean_T exitg3;
  boolean_T goto140;
  boolean_T goto70;
  n = h->size[0];
  itmax = 30.0 * fmax(10.0, h->size[0]);
  ldh = h->size[0];
  ldz = z->size[0];
  info = 0;
  if ((n != 0) && (1 != n)) {
    for (j = 0; j <= n - 4; j++) {
      h->data[(j + h->size[0] * j) + 2].re = 0.0;
      h->data[(j + h->size[0] * j) + 2].im = 0.0;
      h->data[(j + h->size[0] * j) + 3].re = 0.0;
      h->data[(j + h->size[0] * j) + 3].im = 0.0;
    }
    if (1 <= n - 2) {
      h->data[(n + h->size[0] * (n - 3)) - 1].re = 0.0;
      h->data[(n + h->size[0] * (n - 3)) - 1].im = 0.0;
    }
    for (i = 2; i <= n; i++) {
      if (h->data[(i + h->size[0] * (i - 2)) - 1].im != 0.0) {
        tst = h->data[(i + h->size[0] * (i - 2)) - 1].re;
        htmp2 = h->data[(i + h->size[0] * (i - 2)) - 1].im;
        t_re = fabs(h->data[(i + h->size[0] * (i - 2)) - 1].re) +
               fabs(h->data[(i + h->size[0] * (i - 2)) - 1].im);
        if (htmp2 == 0.0) {
          sc.re = tst / t_re;
          sc.im = 0.0;
        } else if (tst == 0.0) {
          sc.re = 0.0;
          sc.im = htmp2 / t_re;
        } else {
          sc.re = tst / t_re;
          sc.im = htmp2 / t_re;
        }
        t_re = rt_hypotd_snf(sc.re, sc.im);
        if (-sc.im == 0.0) {
          re = sc.re / t_re;
          aa = 0.0;
        } else if (sc.re == 0.0) {
          re = 0.0;
          aa = -sc.im / t_re;
        } else {
          re = sc.re / t_re;
          aa = -sc.im / t_re;
        }
        h->data[(i + h->size[0] * (i - 2)) - 1].re =
            rt_hypotd_snf(tst, h->data[(i + h->size[0] * (i - 2)) - 1].im);
        h->data[(i + h->size[0] * (i - 2)) - 1].im = 0.0;
        h_tmp = (i - 1) * ldh;
        ix0 = i + h_tmp;
        if (ldh >= 1) {
          b_i = ix0 + ldh * (n - i);
          for (k = ix0; ldh < 0 ? k >= b_i : k <= b_i; k += ldh) {
            htmp2 = re * h->data[k - 1].im + aa * h->data[k - 1].re;
            h->data[k - 1].re = re * h->data[k - 1].re - aa * h->data[k - 1].im;
            h->data[k - 1].im = htmp2;
          }
        }
        ix0 = h_tmp + 1;
        u1 = i + 1;
        if (n < u1) {
          u1 = n;
        }
        b_i = h_tmp + u1;
        for (k = ix0; k <= b_i; k++) {
          htmp2 = re * h->data[k - 1].im + -aa * h->data[k - 1].re;
          h->data[k - 1].re = re * h->data[k - 1].re - -aa * h->data[k - 1].im;
          h->data[k - 1].im = htmp2;
        }
        u1 = (i - 1) * ldz;
        ix0 = u1 + 1;
        b_i = u1 + n;
        for (k = ix0; k <= b_i; k++) {
          htmp2 = re * z->data[k - 1].im + -aa * z->data[k - 1].re;
          z->data[k - 1].re = re * z->data[k - 1].re - -aa * z->data[k - 1].im;
          z->data[k - 1].im = htmp2;
        }
      }
    }
    SMLNUM = 2.2250738585072014E-308 * ((double)n / 2.2204460492503131E-16);
    i = n - 1;
    exitg1 = false;
    while ((!exitg1) && (i + 1 >= 1)) {
      ldz = -1;
      goto140 = false;
      its = 0;
      exitg2 = false;
      while ((!exitg2) && (its <= (int)itmax)) {
        k = i;
        exitg3 = false;
        while ((!exitg3) && (k + 1 > ldz + 2)) {
          htmp2 = fabs(h->data[k + h->size[0] * (k - 1)].re);
          ba = htmp2 + fabs(h->data[k + h->size[0] * (k - 1)].im);
          if (ba <= SMLNUM) {
            exitg3 = true;
          } else {
            t_re = fabs(h->data[k + h->size[0] * k].re) +
                   fabs(h->data[k + h->size[0] * k].im);
            tst = (fabs(h->data[(k + h->size[0] * (k - 1)) - 1].re) +
                   fabs(h->data[(k + h->size[0] * (k - 1)) - 1].im)) +
                  t_re;
            if (tst == 0.0) {
              if (k - 1 >= 1) {
                tst = fabs(h->data[(k + h->size[0] * (k - 2)) - 1].re);
              }
              if (k + 2 <= n) {
                tst += fabs(h->data[(k + h->size[0] * k) + 1].re);
              }
            }
            if (htmp2 <= 2.2204460492503131E-16 * tst) {
              htmp2 = fabs(h->data[(k + h->size[0] * k) - 1].re) +
                      fabs(h->data[(k + h->size[0] * k) - 1].im);
              if (ba > htmp2) {
                tst = ba;
                ba = htmp2;
              } else {
                tst = htmp2;
              }
              htmp2 = fabs(h->data[(k + h->size[0] * (k - 1)) - 1].re -
                           h->data[k + h->size[0] * k].re) +
                      fabs(h->data[(k + h->size[0] * (k - 1)) - 1].im -
                           h->data[k + h->size[0] * k].im);
              if (t_re > htmp2) {
                aa = t_re;
                t_re = htmp2;
              } else {
                aa = htmp2;
              }
              s = aa + tst;
              if (ba * (tst / s) <=
                  fmax(SMLNUM, 2.2204460492503131E-16 * (t_re * (aa / s)))) {
                exitg3 = true;
              } else {
                k--;
              }
            } else {
              k--;
            }
          }
        }
        ldz = k - 1;
        if (k + 1 > 1) {
          h->data[k + h->size[0] * (k - 1)].re = 0.0;
          h->data[k + h->size[0] * (k - 1)].im = 0.0;
        }
        if (k + 1 >= i + 1) {
          goto140 = true;
          exitg2 = true;
        } else {
          if (its == 10) {
            t_re = 0.75 * fabs(h->data[(k + h->size[0] * k) + 1].re) +
                   h->data[k + h->size[0] * k].re;
            t_im = h->data[k + h->size[0] * k].im;
          } else if (its == 20) {
            t_re = 0.75 * fabs(h->data[i + h->size[0] * (i - 1)].re) +
                   h->data[i + h->size[0] * i].re;
            t_im = h->data[i + h->size[0] * i].im;
          } else {
            t_re = h->data[i + h->size[0] * i].re;
            t_im = h->data[i + h->size[0] * i].im;
            x2 = h->data[(i + h->size[0] * i) - 1];
            b_sqrt(&x2);
            sc = h->data[i + h->size[0] * (i - 1)];
            b_sqrt(&sc);
            u_re = x2.re * sc.re - x2.im * sc.im;
            u_im = x2.re * sc.im + x2.im * sc.re;
            s = fabs(u_re) + fabs(u_im);
            if (s != 0.0) {
              t_re = 0.5 * (h->data[(i + h->size[0] * (i - 1)) - 1].re -
                            h->data[i + h->size[0] * i].re);
              t_im = 0.5 * (h->data[(i + h->size[0] * (i - 1)) - 1].im -
                            h->data[i + h->size[0] * i].im);
              tst = fabs(t_re) + fabs(t_im);
              s = fmax(s, tst);
              if (t_im == 0.0) {
                x2.re = t_re / s;
                x2.im = 0.0;
              } else if (t_re == 0.0) {
                x2.re = 0.0;
                x2.im = t_im / s;
              } else {
                x2.re = t_re / s;
                x2.im = t_im / s;
              }
              re = x2.re * x2.re - x2.im * x2.im;
              htmp2 = x2.re * x2.im;
              if (u_im == 0.0) {
                sc.re = u_re / s;
                sc.im = 0.0;
              } else if (u_re == 0.0) {
                sc.re = 0.0;
                sc.im = u_im / s;
              } else {
                sc.re = u_re / s;
                sc.im = u_im / s;
              }
              aa = sc.re * sc.re - sc.im * sc.im;
              ba = sc.re * sc.im;
              x2.re = re + aa;
              x2.im = (htmp2 + htmp2) + (ba + ba);
              b_sqrt(&x2);
              sc.re = s * x2.re;
              sc.im = s * x2.im;
              if (tst > 0.0) {
                if (t_im == 0.0) {
                  x2.re = t_re / tst;
                  x2.im = 0.0;
                } else if (t_re == 0.0) {
                  x2.re = 0.0;
                  x2.im = t_im / tst;
                } else {
                  x2.re = t_re / tst;
                  x2.im = t_im / tst;
                }
                if (x2.re * sc.re + x2.im * sc.im < 0.0) {
                  sc.re = -sc.re;
                  sc.im = -sc.im;
                }
              }
              t_re += sc.re;
              aa = t_im + sc.im;
              if (aa == 0.0) {
                if (u_im == 0.0) {
                  t_im = u_re / t_re;
                  tst = 0.0;
                } else if (u_re == 0.0) {
                  t_im = 0.0;
                  tst = u_im / t_re;
                } else {
                  t_im = u_re / t_re;
                  tst = u_im / t_re;
                }
              } else if (t_re == 0.0) {
                if (u_re == 0.0) {
                  t_im = u_im / aa;
                  tst = 0.0;
                } else if (u_im == 0.0) {
                  t_im = 0.0;
                  tst = -(u_re / aa);
                } else {
                  t_im = u_im / aa;
                  tst = -(u_re / aa);
                }
              } else {
                ba = fabs(t_re);
                tst = fabs(aa);
                if (ba > tst) {
                  s = aa / t_re;
                  tst = t_re + s * aa;
                  t_im = (u_re + s * u_im) / tst;
                  tst = (u_im - s * u_re) / tst;
                } else if (tst == ba) {
                  if (t_re > 0.0) {
                    htmp2 = 0.5;
                  } else {
                    htmp2 = -0.5;
                  }
                  if (aa > 0.0) {
                    tst = 0.5;
                  } else {
                    tst = -0.5;
                  }
                  t_im = (u_re * htmp2 + u_im * tst) / ba;
                  tst = (u_im * htmp2 - u_re * tst) / ba;
                } else {
                  s = t_re / aa;
                  tst = aa + s * t_re;
                  t_im = (s * u_re + u_im) / tst;
                  tst = (s * u_im - u_re) / tst;
                }
              }
              t_re =
                  h->data[i + h->size[0] * i].re - (u_re * t_im - u_im * tst);
              t_im =
                  h->data[i + h->size[0] * i].im - (u_re * tst + u_im * t_im);
            }
          }
          goto70 = false;
          m = i;
          exitg3 = false;
          while ((!exitg3) && (m > k + 1)) {
            sc.re = h->data[(m + h->size[0] * (m - 1)) - 1].re - t_re;
            sc.im = h->data[(m + h->size[0] * (m - 1)) - 1].im - t_im;
            tst = h->data[m + h->size[0] * (m - 1)].re;
            s = (fabs(sc.re) + fabs(sc.im)) + fabs(tst);
            if (sc.im == 0.0) {
              re = sc.re / s;
              aa = 0.0;
            } else if (sc.re == 0.0) {
              re = 0.0;
              aa = sc.im / s;
            } else {
              re = sc.re / s;
              aa = sc.im / s;
            }
            sc.re = re;
            sc.im = aa;
            tst /= s;
            v[0] = sc;
            v[1].re = tst;
            v[1].im = 0.0;
            if (fabs(h->data[(m + h->size[0] * (m - 2)) - 1].re) * fabs(tst) <=
                2.2204460492503131E-16 *
                    ((fabs(re) + fabs(aa)) *
                     ((fabs(h->data[(m + h->size[0] * (m - 1)) - 1].re) +
                       fabs(h->data[(m + h->size[0] * (m - 1)) - 1].im)) +
                      (fabs(h->data[m + h->size[0] * m].re) +
                       fabs(h->data[m + h->size[0] * m].im))))) {
              goto70 = true;
              exitg3 = true;
            } else {
              m--;
            }
          }
          if (!goto70) {
            sc.re = h->data[k + h->size[0] * k].re - t_re;
            sc.im = h->data[k + h->size[0] * k].im - t_im;
            tst = h->data[(k + h->size[0] * k) + 1].re;
            s = (fabs(sc.re) + fabs(sc.im)) + fabs(tst);
            if (sc.im == 0.0) {
              v[0].re = sc.re / s;
              v[0].im = 0.0;
            } else if (sc.re == 0.0) {
              v[0].re = 0.0;
              v[0].im = sc.im / s;
            } else {
              v[0].re = sc.re / s;
              v[0].im = sc.im / s;
            }
            tst /= s;
            v[1].re = tst;
            v[1].im = 0.0;
          }
          for (b_k = m; b_k <= i; b_k++) {
            if (b_k > m) {
              v[0] = h->data[(b_k + h->size[0] * (b_k - 2)) - 1];
              v[1] = h->data[b_k + h->size[0] * (b_k - 2)];
            }
            sc = d_xzlarfg(&v[0], &v[1]);
            if (b_k > m) {
              h->data[(b_k + h->size[0] * (b_k - 2)) - 1] = v[0];
              h->data[b_k + h->size[0] * (b_k - 2)].re = 0.0;
              h->data[b_k + h->size[0] * (b_k - 2)].im = 0.0;
            }
            t_re = v[1].re;
            t_im = v[1].im;
            htmp2 = sc.re * v[1].re - sc.im * v[1].im;
            for (j = b_k; j <= n; j++) {
              x2.re = (sc.re * h->data[(b_k + h->size[0] * (j - 1)) - 1].re -
                       -sc.im * h->data[(b_k + h->size[0] * (j - 1)) - 1].im) +
                      htmp2 * h->data[b_k + h->size[0] * (j - 1)].re;
              x2.im = (sc.re * h->data[(b_k + h->size[0] * (j - 1)) - 1].im +
                       -sc.im * h->data[(b_k + h->size[0] * (j - 1)) - 1].re) +
                      htmp2 * h->data[b_k + h->size[0] * (j - 1)].im;
              h->data[(b_k + h->size[0] * (j - 1)) - 1].re -= x2.re;
              h->data[(b_k + h->size[0] * (j - 1)) - 1].im -= x2.im;
              h->data[b_k + h->size[0] * (j - 1)].re -=
                  x2.re * t_re - x2.im * t_im;
              h->data[b_k + h->size[0] * (j - 1)].im -=
                  x2.re * t_im + x2.im * t_re;
            }
            if (b_k + 2 < i + 1) {
              b_i = b_k + 1;
            } else {
              b_i = i;
            }
            for (j = 0; j <= b_i; j++) {
              x2.re = (sc.re * h->data[j + h->size[0] * (b_k - 1)].re -
                       sc.im * h->data[j + h->size[0] * (b_k - 1)].im) +
                      htmp2 * h->data[j + h->size[0] * b_k].re;
              x2.im = (sc.re * h->data[j + h->size[0] * (b_k - 1)].im +
                       sc.im * h->data[j + h->size[0] * (b_k - 1)].re) +
                      htmp2 * h->data[j + h->size[0] * b_k].im;
              h->data[j + h->size[0] * (b_k - 1)].re -= x2.re;
              h->data[j + h->size[0] * (b_k - 1)].im -= x2.im;
              h->data[j + h->size[0] * b_k].re -= x2.re * t_re - x2.im * -t_im;
              h->data[j + h->size[0] * b_k].im -= x2.re * -t_im + x2.im * t_re;
            }
            for (j = 0; j < n; j++) {
              x2.re = (sc.re * z->data[j + z->size[0] * (b_k - 1)].re -
                       sc.im * z->data[j + z->size[0] * (b_k - 1)].im) +
                      htmp2 * z->data[j + z->size[0] * b_k].re;
              x2.im = (sc.re * z->data[j + z->size[0] * (b_k - 1)].im +
                       sc.im * z->data[j + z->size[0] * (b_k - 1)].re) +
                      htmp2 * z->data[j + z->size[0] * b_k].im;
              z->data[j + z->size[0] * (b_k - 1)].re -= x2.re;
              z->data[j + z->size[0] * (b_k - 1)].im -= x2.im;
              z->data[j + z->size[0] * b_k].re -= x2.re * t_re - x2.im * -t_im;
              z->data[j + z->size[0] * b_k].im -= x2.re * -t_im + x2.im * t_re;
            }
            if ((b_k == m) && (m > k + 1)) {
              sc.re = 1.0 - sc.re;
              sc.im = 0.0 - sc.im;
              t_re = rt_hypotd_snf(sc.re, sc.im);
              if (sc.im == 0.0) {
                re = sc.re / t_re;
                aa = 0.0;
              } else if (sc.re == 0.0) {
                re = 0.0;
                aa = sc.im / t_re;
              } else {
                re = sc.re / t_re;
                aa = sc.im / t_re;
              }
              htmp2 = h->data[m + h->size[0] * (m - 1)].re * -aa +
                      h->data[m + h->size[0] * (m - 1)].im * re;
              h->data[m + h->size[0] * (m - 1)].re =
                  h->data[m + h->size[0] * (m - 1)].re * re -
                  h->data[m + h->size[0] * (m - 1)].im * -aa;
              h->data[m + h->size[0] * (m - 1)].im = htmp2;
              if (m + 2 <= i + 1) {
                htmp2 = h->data[(m + h->size[0] * m) + 1].re * aa +
                        h->data[(m + h->size[0] * m) + 1].im * re;
                h->data[(m + h->size[0] * m) + 1].re =
                    h->data[(m + h->size[0] * m) + 1].re * re -
                    h->data[(m + h->size[0] * m) + 1].im * aa;
                h->data[(m + h->size[0] * m) + 1].im = htmp2;
              }
              for (j = m; j <= i + 1; j++) {
                if (j != m + 1) {
                  if (n > j) {
                    ix0 = j + j * ldh;
                    if (ldh >= 1) {
                      b_i = ix0 + ldh * ((n - j) - 1);
                      for (c_k = ix0; ldh < 0 ? c_k >= b_i : c_k <= b_i;
                           c_k += ldh) {
                        htmp2 =
                            re * h->data[c_k - 1].im + aa * h->data[c_k - 1].re;
                        h->data[c_k - 1].re =
                            re * h->data[c_k - 1].re - aa * h->data[c_k - 1].im;
                        h->data[c_k - 1].im = htmp2;
                      }
                    }
                  }
                  u1 = (j - 1) * ldh;
                  h_tmp = u1 + 1;
                  b_i = (u1 + j) - 1;
                  for (c_k = h_tmp; c_k <= b_i; c_k++) {
                    htmp2 =
                        re * h->data[c_k - 1].im + -aa * h->data[c_k - 1].re;
                    h->data[c_k - 1].re =
                        re * h->data[c_k - 1].re - -aa * h->data[c_k - 1].im;
                    h->data[c_k - 1].im = htmp2;
                  }
                  b_i = u1 + n;
                  for (c_k = h_tmp; c_k <= b_i; c_k++) {
                    htmp2 =
                        re * z->data[c_k - 1].im + -aa * z->data[c_k - 1].re;
                    z->data[c_k - 1].re =
                        re * z->data[c_k - 1].re - -aa * z->data[c_k - 1].im;
                    z->data[c_k - 1].im = htmp2;
                  }
                }
              }
            }
          }
          sc = h->data[i + h->size[0] * (i - 1)];
          if (h->data[i + h->size[0] * (i - 1)].im != 0.0) {
            htmp2 = rt_hypotd_snf(h->data[i + h->size[0] * (i - 1)].re,
                                  h->data[i + h->size[0] * (i - 1)].im);
            h->data[i + h->size[0] * (i - 1)].re = htmp2;
            h->data[i + h->size[0] * (i - 1)].im = 0.0;
            if (sc.im == 0.0) {
              re = sc.re / htmp2;
              aa = 0.0;
            } else if (sc.re == 0.0) {
              re = 0.0;
              aa = sc.im / htmp2;
            } else {
              re = sc.re / htmp2;
              aa = sc.im / htmp2;
            }
            if (n > i + 1) {
              ix0 = (i + (i + 1) * ldh) + 1;
              if (ldh >= 1) {
                b_i = ix0 + ldh * ((n - i) - 2);
                for (k = ix0; ldh < 0 ? k >= b_i : k <= b_i; k += ldh) {
                  htmp2 = re * h->data[k - 1].im + -aa * h->data[k - 1].re;
                  h->data[k - 1].re =
                      re * h->data[k - 1].re - -aa * h->data[k - 1].im;
                  h->data[k - 1].im = htmp2;
                }
              }
            }
            u1 = i * ldh;
            h_tmp = u1 + 1;
            b_i = u1 + i;
            for (k = h_tmp; k <= b_i; k++) {
              htmp2 = re * h->data[k - 1].im + aa * h->data[k - 1].re;
              h->data[k - 1].re =
                  re * h->data[k - 1].re - aa * h->data[k - 1].im;
              h->data[k - 1].im = htmp2;
            }
            b_i = u1 + n;
            for (k = h_tmp; k <= b_i; k++) {
              htmp2 = re * z->data[k - 1].im + aa * z->data[k - 1].re;
              z->data[k - 1].re =
                  re * z->data[k - 1].re - aa * z->data[k - 1].im;
              z->data[k - 1].im = htmp2;
            }
          }
          its++;
        }
      }
      if (!goto140) {
        info = i + 1;
        exitg1 = true;
      } else {
        i = ldz;
      }
    }
  }
  return info;
}

/*
 * File trailer for xzhseqr.c
 *
 * [EOF]
 */
