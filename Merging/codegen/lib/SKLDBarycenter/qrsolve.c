/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: qrsolve.c
 *
 * MATLAB Coder version            : 5.2
 * C/C++ source code generated on  : 31-Jan-2022 14:36:42
 */

/* Include Files */
#include "qrsolve.h"
#include "SKLDBarycenter_data.h"
#include "SKLDBarycenter_emxutil.h"
#include "SKLDBarycenter_rtwutil.h"
#include "SKLDBarycenter_types.h"
#include "recip.h"
#include "rt_nonfinite.h"
#include "xdlapy3.h"
#include "xgerc.h"
#include "xnrm2.h"
#include "xzlarfg.h"
#include <math.h>

/* Function Definitions */
/*
 * Arguments    : const emxArray_creal_T *A
 *                const emxArray_real_T *B
 *                emxArray_creal_T *Y
 * Return Type  : void
 */
void b_qrsolve(const emxArray_creal_T *A, const emxArray_real_T *B,
               emxArray_creal_T *Y)
{
  emxArray_creal_T *CB;
  emxArray_creal_T *b_A;
  emxArray_creal_T *tau;
  emxArray_creal_T *work;
  emxArray_int32_T *jpvt;
  emxArray_real_T *vn1;
  emxArray_real_T *vn2;
  creal_T c_A;
  creal_T temp;
  double ai;
  double ar;
  double brm;
  double c_im;
  double conjti_im;
  double re;
  double s;
  double smax;
  int b_i;
  int exitg1;
  int i;
  int ia;
  int ii;
  int ip1;
  int k;
  int lastc;
  int m;
  int ma;
  int minmana;
  int minmn;
  int mmi;
  int n;
  int nmi;
  int pvt;
  int rankA;
  int u0;
  boolean_T exitg2;
  emxInit_creal_T(&b_A, 2);
  i = b_A->size[0] * b_A->size[1];
  b_A->size[0] = A->size[0];
  b_A->size[1] = A->size[1];
  emxEnsureCapacity_creal_T(b_A, i);
  minmana = A->size[0] * A->size[1];
  for (i = 0; i < minmana; i++) {
    b_A->data[i] = A->data[i];
  }
  emxInit_creal_T(&tau, 1);
  m = A->size[0];
  n = A->size[1];
  u0 = A->size[0];
  minmana = A->size[1];
  if (u0 < minmana) {
    minmana = u0;
  }
  i = tau->size[0];
  tau->size[0] = minmana;
  emxEnsureCapacity_creal_T(tau, i);
  for (i = 0; i < minmana; i++) {
    tau->data[i].re = 0.0;
    tau->data[i].im = 0.0;
  }
  emxInit_int32_T(&jpvt, 2);
  if ((A->size[0] == 0) || (A->size[1] == 0)) {
    i = jpvt->size[0] * jpvt->size[1];
    jpvt->size[0] = 1;
    jpvt->size[1] = A->size[1];
    emxEnsureCapacity_int32_T(jpvt, i);
    minmana = A->size[1];
    for (i = 0; i < minmana; i++) {
      jpvt->data[i] = 0;
    }
    for (u0 = 0; u0 < n; u0++) {
      jpvt->data[u0] = u0 + 1;
    }
  } else {
    i = jpvt->size[0] * jpvt->size[1];
    jpvt->size[0] = 1;
    jpvt->size[1] = A->size[1];
    emxEnsureCapacity_int32_T(jpvt, i);
    minmana = A->size[1];
    for (i = 0; i < minmana; i++) {
      jpvt->data[i] = 0;
    }
    for (k = 0; k < n; k++) {
      jpvt->data[k] = k + 1;
    }
    emxInit_creal_T(&work, 1);
    ma = A->size[0];
    u0 = A->size[0];
    minmn = A->size[1];
    if (u0 < minmn) {
      minmn = u0;
    }
    i = work->size[0];
    work->size[0] = A->size[1];
    emxEnsureCapacity_creal_T(work, i);
    minmana = A->size[1];
    for (i = 0; i < minmana; i++) {
      work->data[i].re = 0.0;
      work->data[i].im = 0.0;
    }
    emxInit_real_T(&vn1, 1);
    i = vn1->size[0];
    vn1->size[0] = A->size[1];
    emxEnsureCapacity_real_T(vn1, i);
    minmana = A->size[1];
    for (i = 0; i < minmana; i++) {
      vn1->data[i] = 0.0;
    }
    emxInit_real_T(&vn2, 1);
    i = vn2->size[0];
    vn2->size[0] = A->size[1];
    emxEnsureCapacity_real_T(vn2, i);
    minmana = A->size[1];
    for (i = 0; i < minmana; i++) {
      vn2->data[i] = 0.0;
    }
    for (u0 = 0; u0 < n; u0++) {
      smax = c_xnrm2(m, A, u0 * ma + 1);
      vn1->data[u0] = smax;
      vn2->data[u0] = smax;
    }
    for (b_i = 0; b_i < minmn; b_i++) {
      ip1 = b_i + 2;
      lastc = b_i * ma;
      ii = lastc + b_i;
      nmi = n - b_i;
      mmi = (m - b_i) - 1;
      if (nmi < 1) {
        minmana = -1;
      } else {
        minmana = 0;
        if (nmi > 1) {
          smax = fabs(vn1->data[b_i]);
          for (k = 2; k <= nmi; k++) {
            s = fabs(vn1->data[(b_i + k) - 1]);
            if (s > smax) {
              minmana = k - 1;
              smax = s;
            }
          }
        }
      }
      pvt = b_i + minmana;
      if (pvt + 1 != b_i + 1) {
        minmana = pvt * ma;
        for (k = 0; k < m; k++) {
          u0 = minmana + k;
          temp = b_A->data[u0];
          i = lastc + k;
          b_A->data[u0] = b_A->data[i];
          b_A->data[i] = temp;
        }
        minmana = jpvt->data[pvt];
        jpvt->data[pvt] = jpvt->data[b_i];
        jpvt->data[b_i] = minmana;
        vn1->data[pvt] = vn1->data[b_i];
        vn2->data[pvt] = vn2->data[b_i];
      }
      if (b_i + 1 < m) {
        temp = b_A->data[ii];
        tau->data[b_i] = c_xzlarfg(mmi + 1, &temp, b_A, ii + 2);
        b_A->data[ii] = temp;
      } else {
        temp = b_A->data[ii];
        tau->data[b_i].re = 0.0;
        tau->data[b_i].im = 0.0;
        if (b_A->data[ii].im != 0.0) {
          s = xdlapy3(b_A->data[ii].re, b_A->data[ii].im, 0.0);
          if (b_A->data[ii].re >= 0.0) {
            s = -s;
          }
          if (fabs(s) < 1.0020841800044864E-292) {
            minmana = -1;
            do {
              minmana++;
              for (k = ii + 1; k <= ii; k++) {
                smax = 9.9792015476736E+291 * b_A->data[k - 1].im +
                       0.0 * b_A->data[k - 1].re;
                b_A->data[k - 1].re =
                    9.9792015476736E+291 * b_A->data[k - 1].re -
                    0.0 * b_A->data[k - 1].im;
                b_A->data[k - 1].im = smax;
              }
              s *= 9.9792015476736E+291;
              temp.re *= 9.9792015476736E+291;
              temp.im *= 9.9792015476736E+291;
            } while (!(fabs(s) >= 1.0020841800044864E-292));
            s = xdlapy3(temp.re, temp.im, 0.0);
            if (temp.re >= 0.0) {
              s = -s;
            }
            ar = s - temp.re;
            if (0.0 - temp.im == 0.0) {
              tau->data[b_i].re = ar / s;
              tau->data[b_i].im = 0.0;
            } else if (ar == 0.0) {
              tau->data[b_i].re = 0.0;
              tau->data[b_i].im = (0.0 - temp.im) / s;
            } else {
              tau->data[b_i].re = ar / s;
              tau->data[b_i].im = (0.0 - temp.im) / s;
            }
            c_A.re = temp.re - s;
            c_A.im = temp.im;
            temp = recip(c_A);
            for (k = ii + 1; k <= ii; k++) {
              smax =
                  temp.re * b_A->data[k - 1].im + temp.im * b_A->data[k - 1].re;
              b_A->data[k - 1].re =
                  temp.re * b_A->data[k - 1].re - temp.im * b_A->data[k - 1].im;
              b_A->data[k - 1].im = smax;
            }
            for (k = 0; k <= minmana; k++) {
              s *= 1.0020841800044864E-292;
            }
            temp.re = s;
            temp.im = 0.0;
          } else {
            ar = s - b_A->data[ii].re;
            ai = 0.0 - b_A->data[ii].im;
            if (ai == 0.0) {
              tau->data[b_i].re = ar / s;
              tau->data[b_i].im = 0.0;
            } else if (ar == 0.0) {
              tau->data[b_i].re = 0.0;
              tau->data[b_i].im = ai / s;
            } else {
              tau->data[b_i].re = ar / s;
              tau->data[b_i].im = ai / s;
            }
            c_A.re = b_A->data[ii].re - s;
            c_A.im = b_A->data[ii].im;
            temp = recip(c_A);
            for (k = ii + 1; k <= ii; k++) {
              smax =
                  temp.re * b_A->data[k - 1].im + temp.im * b_A->data[k - 1].re;
              b_A->data[k - 1].re =
                  temp.re * b_A->data[k - 1].re - temp.im * b_A->data[k - 1].im;
              b_A->data[k - 1].im = smax;
            }
            temp.re = s;
            temp.im = 0.0;
          }
        }
        b_A->data[ii] = temp;
      }
      if (b_i + 1 < n) {
        temp = b_A->data[ii];
        b_A->data[ii].re = 1.0;
        b_A->data[ii].im = 0.0;
        s = tau->data[b_i].re;
        conjti_im = -tau->data[b_i].im;
        rankA = (ii + ma) + 1;
        if ((s != 0.0) || (conjti_im != 0.0)) {
          pvt = mmi + 1;
          minmana = ii + mmi;
          while ((pvt > 0) && ((b_A->data[minmana].re == 0.0) &&
                               (b_A->data[minmana].im == 0.0))) {
            pvt--;
            minmana--;
          }
          lastc = nmi - 1;
          exitg2 = false;
          while ((!exitg2) && (lastc > 0)) {
            minmana = rankA + (lastc - 1) * ma;
            ia = minmana;
            do {
              exitg1 = 0;
              if (ia <= (minmana + pvt) - 1) {
                if ((b_A->data[ia - 1].re != 0.0) ||
                    (b_A->data[ia - 1].im != 0.0)) {
                  exitg1 = 1;
                } else {
                  ia++;
                }
              } else {
                lastc--;
                exitg1 = 2;
              }
            } while (exitg1 == 0);
            if (exitg1 == 1) {
              exitg2 = true;
            }
          }
        } else {
          pvt = 0;
          lastc = 0;
        }
        if (pvt > 0) {
          if (lastc != 0) {
            for (nmi = 0; nmi < lastc; nmi++) {
              work->data[nmi].re = 0.0;
              work->data[nmi].im = 0.0;
            }
            nmi = 0;
            i = rankA + ma * (lastc - 1);
            for (k = rankA; ma < 0 ? k >= i : k <= i; k += ma) {
              smax = 0.0;
              c_im = 0.0;
              minmana = (k + pvt) - 1;
              for (ia = k; ia <= minmana; ia++) {
                u0 = (ii + ia) - k;
                smax += b_A->data[ia - 1].re * b_A->data[u0].re +
                        b_A->data[ia - 1].im * b_A->data[u0].im;
                c_im += b_A->data[ia - 1].re * b_A->data[u0].im -
                        b_A->data[ia - 1].im * b_A->data[u0].re;
              }
              work->data[nmi].re += smax - 0.0 * c_im;
              work->data[nmi].im += c_im + 0.0 * smax;
              nmi++;
            }
          }
          c_A.re = -s;
          c_A.im = -conjti_im;
          b_xgerc(pvt, lastc, c_A, ii + 1, work, b_A, rankA, ma);
        }
        b_A->data[ii] = temp;
      }
      for (u0 = ip1; u0 <= n; u0++) {
        minmana = b_i + (u0 - 1) * ma;
        smax = vn1->data[u0 - 1];
        if (smax != 0.0) {
          s = rt_hypotd_snf(b_A->data[minmana].re, b_A->data[minmana].im) /
              smax;
          s = 1.0 - s * s;
          if (s < 0.0) {
            s = 0.0;
          }
          c_im = smax / vn2->data[u0 - 1];
          c_im = s * (c_im * c_im);
          if (c_im <= 1.4901161193847656E-8) {
            if (b_i + 1 < m) {
              smax = c_xnrm2(mmi, b_A, minmana + 2);
              vn1->data[u0 - 1] = smax;
              vn2->data[u0 - 1] = smax;
            } else {
              vn1->data[u0 - 1] = 0.0;
              vn2->data[u0 - 1] = 0.0;
            }
          } else {
            vn1->data[u0 - 1] = smax * sqrt(s);
          }
        }
      }
    }
    emxFree_real_T(&vn2);
    emxFree_real_T(&vn1);
    emxFree_creal_T(&work);
  }
  rankA = 0;
  if (b_A->size[0] < b_A->size[1]) {
    minmn = b_A->size[0];
    minmana = b_A->size[1];
  } else {
    minmn = b_A->size[1];
    minmana = b_A->size[0];
  }
  if (minmn > 0) {
    smax =
        fmin(1.4901161193847656E-8, 2.2204460492503131E-15 * (double)minmana) *
        rt_hypotd_snf(b_A->data[0].re, b_A->data[0].im);
    while ((rankA < minmn) &&
           (!(rt_hypotd_snf(b_A->data[rankA + b_A->size[0] * rankA].re,
                            b_A->data[rankA + b_A->size[0] * rankA].im) <=
              smax))) {
      rankA++;
    }
  }
  pvt = B->size[1];
  i = Y->size[0] * Y->size[1];
  Y->size[0] = b_A->size[1];
  Y->size[1] = B->size[1];
  emxEnsureCapacity_creal_T(Y, i);
  minmana = b_A->size[1] * B->size[1];
  for (i = 0; i < minmana; i++) {
    Y->data[i].re = 0.0;
    Y->data[i].im = 0.0;
  }
  emxInit_creal_T(&CB, 2);
  i = CB->size[0] * CB->size[1];
  CB->size[0] = B->size[0];
  CB->size[1] = B->size[1];
  emxEnsureCapacity_creal_T(CB, i);
  minmana = B->size[0] * B->size[1];
  for (i = 0; i < minmana; i++) {
    CB->data[i].re = B->data[i];
    CB->data[i].im = 0.0;
  }
  m = b_A->size[0];
  minmana = CB->size[1];
  u0 = b_A->size[0];
  lastc = b_A->size[1];
  if (u0 < lastc) {
    lastc = u0;
  }
  for (u0 = 0; u0 < lastc; u0++) {
    temp.re = tau->data[u0].re;
    temp.im = -tau->data[u0].im;
    if ((temp.re != 0.0) || (temp.im != 0.0)) {
      for (k = 0; k < minmana; k++) {
        s = CB->data[u0 + CB->size[0] * k].re;
        conjti_im = CB->data[u0 + CB->size[0] * k].im;
        i = u0 + 2;
        for (b_i = i; b_i <= m; b_i++) {
          s += b_A->data[(b_i + b_A->size[0] * u0) - 1].re *
                   CB->data[(b_i + CB->size[0] * k) - 1].re +
               b_A->data[(b_i + b_A->size[0] * u0) - 1].im *
                   CB->data[(b_i + CB->size[0] * k) - 1].im;
          conjti_im += b_A->data[(b_i + b_A->size[0] * u0) - 1].re *
                           CB->data[(b_i + CB->size[0] * k) - 1].im -
                       b_A->data[(b_i + b_A->size[0] * u0) - 1].im *
                           CB->data[(b_i + CB->size[0] * k) - 1].re;
        }
        re = temp.re * s - temp.im * conjti_im;
        smax = temp.re * conjti_im + temp.im * s;
        if ((re != 0.0) || (smax != 0.0)) {
          CB->data[u0 + CB->size[0] * k].re -= re;
          CB->data[u0 + CB->size[0] * k].im -= smax;
          for (b_i = i; b_i <= m; b_i++) {
            CB->data[(b_i + CB->size[0] * k) - 1].re -=
                b_A->data[(b_i + b_A->size[0] * u0) - 1].re * re -
                b_A->data[(b_i + b_A->size[0] * u0) - 1].im * smax;
            CB->data[(b_i + CB->size[0] * k) - 1].im -=
                b_A->data[(b_i + b_A->size[0] * u0) - 1].re * smax +
                b_A->data[(b_i + b_A->size[0] * u0) - 1].im * re;
          }
        }
      }
    }
  }
  emxFree_creal_T(&tau);
  for (k = 0; k < pvt; k++) {
    for (b_i = 0; b_i < rankA; b_i++) {
      Y->data[(jpvt->data[b_i] + Y->size[0] * k) - 1] =
          CB->data[b_i + CB->size[0] * k];
    }
    for (u0 = rankA; u0 >= 1; u0--) {
      i = jpvt->data[u0 - 1];
      ar = Y->data[(i + Y->size[0] * k) - 1].re;
      ai = Y->data[(i + Y->size[0] * k) - 1].im;
      c_im = b_A->data[(u0 + b_A->size[0] * (u0 - 1)) - 1].re;
      conjti_im = b_A->data[(u0 + b_A->size[0] * (u0 - 1)) - 1].im;
      if (conjti_im == 0.0) {
        if (ai == 0.0) {
          re = ar / c_im;
          smax = 0.0;
        } else if (ar == 0.0) {
          re = 0.0;
          smax = ai / c_im;
        } else {
          re = ar / c_im;
          smax = ai / c_im;
        }
      } else if (c_im == 0.0) {
        if (ar == 0.0) {
          re = ai / conjti_im;
          smax = 0.0;
        } else if (ai == 0.0) {
          re = 0.0;
          smax = -(ar / conjti_im);
        } else {
          re = ai / conjti_im;
          smax = -(ar / conjti_im);
        }
      } else {
        brm = fabs(c_im);
        smax = fabs(conjti_im);
        if (brm > smax) {
          s = conjti_im / c_im;
          smax = c_im + s * conjti_im;
          re = (ar + s * ai) / smax;
          smax = (ai - s * ar) / smax;
        } else if (smax == brm) {
          if (c_im > 0.0) {
            s = 0.5;
          } else {
            s = -0.5;
          }
          if (conjti_im > 0.0) {
            smax = 0.5;
          } else {
            smax = -0.5;
          }
          re = (ar * s + ai * smax) / brm;
          smax = (ai * s - ar * smax) / brm;
        } else {
          s = c_im / conjti_im;
          smax = conjti_im + s * c_im;
          re = (s * ar + ai) / smax;
          smax = (s * ai - ar) / smax;
        }
      }
      Y->data[(i + Y->size[0] * k) - 1].re = re;
      Y->data[(i + Y->size[0] * k) - 1].im = smax;
      for (b_i = 0; b_i <= u0 - 2; b_i++) {
        smax = Y->data[(jpvt->data[u0 - 1] + Y->size[0] * k) - 1].re *
                   b_A->data[b_i + b_A->size[0] * (u0 - 1)].im +
               Y->data[(jpvt->data[u0 - 1] + Y->size[0] * k) - 1].im *
                   b_A->data[b_i + b_A->size[0] * (u0 - 1)].re;
        Y->data[(jpvt->data[b_i] + Y->size[0] * k) - 1].re -=
            Y->data[(jpvt->data[u0 - 1] + Y->size[0] * k) - 1].re *
                b_A->data[b_i + b_A->size[0] * (u0 - 1)].re -
            Y->data[(jpvt->data[u0 - 1] + Y->size[0] * k) - 1].im *
                b_A->data[b_i + b_A->size[0] * (u0 - 1)].im;
        Y->data[(jpvt->data[b_i] + Y->size[0] * k) - 1].im -= smax;
      }
    }
  }
  emxFree_creal_T(&CB);
  emxFree_int32_T(&jpvt);
  emxFree_creal_T(&b_A);
}

/*
 * Arguments    : const emxArray_real_T *A
 *                const emxArray_real_T *B
 *                emxArray_real_T *Y
 * Return Type  : void
 */
void qrsolve(const emxArray_real_T *A, const emxArray_real_T *B,
             emxArray_real_T *Y)
{
  emxArray_int32_T *jpvt;
  emxArray_real_T *b_A;
  emxArray_real_T *b_B;
  emxArray_real_T *tau;
  emxArray_real_T *vn1;
  emxArray_real_T *vn2;
  emxArray_real_T *work;
  double d;
  double s;
  double smax;
  int b_i;
  int exitg1;
  int i;
  int ii;
  int ip1;
  int k;
  int lastc;
  int lastv;
  int m;
  int ma;
  int minmana;
  int minmn;
  int mmi;
  int mn;
  int n;
  int nmi;
  int pvt;
  boolean_T exitg2;
  emxInit_real_T(&b_A, 2);
  i = b_A->size[0] * b_A->size[1];
  b_A->size[0] = A->size[0];
  b_A->size[1] = A->size[1];
  emxEnsureCapacity_real_T(b_A, i);
  minmana = A->size[0] * A->size[1];
  for (i = 0; i < minmana; i++) {
    b_A->data[i] = A->data[i];
  }
  emxInit_real_T(&tau, 1);
  m = A->size[0];
  n = A->size[1];
  lastc = A->size[0];
  minmana = A->size[1];
  if (lastc < minmana) {
    minmana = lastc;
  }
  i = tau->size[0];
  tau->size[0] = minmana;
  emxEnsureCapacity_real_T(tau, i);
  for (i = 0; i < minmana; i++) {
    tau->data[i] = 0.0;
  }
  emxInit_int32_T(&jpvt, 2);
  if ((A->size[0] == 0) || (A->size[1] == 0)) {
    i = jpvt->size[0] * jpvt->size[1];
    jpvt->size[0] = 1;
    jpvt->size[1] = A->size[1];
    emxEnsureCapacity_int32_T(jpvt, i);
    minmana = A->size[1];
    for (i = 0; i < minmana; i++) {
      jpvt->data[i] = 0;
    }
    for (lastc = 0; lastc < n; lastc++) {
      jpvt->data[lastc] = lastc + 1;
    }
  } else {
    i = jpvt->size[0] * jpvt->size[1];
    jpvt->size[0] = 1;
    jpvt->size[1] = A->size[1];
    emxEnsureCapacity_int32_T(jpvt, i);
    minmana = A->size[1];
    for (i = 0; i < minmana; i++) {
      jpvt->data[i] = 0;
    }
    for (k = 0; k < n; k++) {
      jpvt->data[k] = k + 1;
    }
    emxInit_real_T(&work, 1);
    ma = A->size[0];
    lastc = A->size[0];
    minmn = A->size[1];
    if (lastc < minmn) {
      minmn = lastc;
    }
    i = work->size[0];
    work->size[0] = A->size[1];
    emxEnsureCapacity_real_T(work, i);
    minmana = A->size[1];
    for (i = 0; i < minmana; i++) {
      work->data[i] = 0.0;
    }
    emxInit_real_T(&vn1, 1);
    i = vn1->size[0];
    vn1->size[0] = A->size[1];
    emxEnsureCapacity_real_T(vn1, i);
    minmana = A->size[1];
    for (i = 0; i < minmana; i++) {
      vn1->data[i] = 0.0;
    }
    emxInit_real_T(&vn2, 1);
    i = vn2->size[0];
    vn2->size[0] = A->size[1];
    emxEnsureCapacity_real_T(vn2, i);
    minmana = A->size[1];
    for (i = 0; i < minmana; i++) {
      vn2->data[i] = 0.0;
    }
    for (lastc = 0; lastc < n; lastc++) {
      d = xnrm2(m, A, lastc * ma + 1);
      vn1->data[lastc] = d;
      vn2->data[lastc] = d;
    }
    for (b_i = 0; b_i < minmn; b_i++) {
      ip1 = b_i + 2;
      mn = b_i * ma;
      ii = mn + b_i;
      nmi = n - b_i;
      mmi = (m - b_i) - 1;
      if (nmi < 1) {
        minmana = -1;
      } else {
        minmana = 0;
        if (nmi > 1) {
          smax = fabs(vn1->data[b_i]);
          for (k = 2; k <= nmi; k++) {
            s = fabs(vn1->data[(b_i + k) - 1]);
            if (s > smax) {
              minmana = k - 1;
              smax = s;
            }
          }
        }
      }
      pvt = b_i + minmana;
      if (pvt + 1 != b_i + 1) {
        minmana = pvt * ma;
        for (k = 0; k < m; k++) {
          lastc = minmana + k;
          smax = b_A->data[lastc];
          i = mn + k;
          b_A->data[lastc] = b_A->data[i];
          b_A->data[i] = smax;
        }
        minmana = jpvt->data[pvt];
        jpvt->data[pvt] = jpvt->data[b_i];
        jpvt->data[b_i] = minmana;
        vn1->data[pvt] = vn1->data[b_i];
        vn2->data[pvt] = vn2->data[b_i];
      }
      if (b_i + 1 < m) {
        s = b_A->data[ii];
        d = xzlarfg(mmi + 1, &s, b_A, ii + 2);
        tau->data[b_i] = d;
        b_A->data[ii] = s;
      } else {
        d = 0.0;
        tau->data[b_i] = 0.0;
      }
      if (b_i + 1 < n) {
        s = b_A->data[ii];
        b_A->data[ii] = 1.0;
        mn = (ii + ma) + 1;
        if (d != 0.0) {
          lastv = mmi + 1;
          minmana = ii + mmi;
          while ((lastv > 0) && (b_A->data[minmana] == 0.0)) {
            lastv--;
            minmana--;
          }
          lastc = nmi - 1;
          exitg2 = false;
          while ((!exitg2) && (lastc > 0)) {
            minmana = mn + (lastc - 1) * ma;
            k = minmana;
            do {
              exitg1 = 0;
              if (k <= (minmana + lastv) - 1) {
                if (b_A->data[k - 1] != 0.0) {
                  exitg1 = 1;
                } else {
                  k++;
                }
              } else {
                lastc--;
                exitg1 = 2;
              }
            } while (exitg1 == 0);
            if (exitg1 == 1) {
              exitg2 = true;
            }
          }
        } else {
          lastv = 0;
          lastc = 0;
        }
        if (lastv > 0) {
          if (lastc != 0) {
            for (pvt = 0; pvt < lastc; pvt++) {
              work->data[pvt] = 0.0;
            }
            pvt = 0;
            i = mn + ma * (lastc - 1);
            for (nmi = mn; ma < 0 ? nmi >= i : nmi <= i; nmi += ma) {
              smax = 0.0;
              minmana = (nmi + lastv) - 1;
              for (k = nmi; k <= minmana; k++) {
                smax += b_A->data[k - 1] * b_A->data[(ii + k) - nmi];
              }
              work->data[pvt] += smax;
              pvt++;
            }
          }
          xgerc(lastv, lastc, -tau->data[b_i], ii + 1, work, b_A, mn, ma);
        }
        b_A->data[ii] = s;
      }
      for (lastc = ip1; lastc <= n; lastc++) {
        minmana = b_i + (lastc - 1) * ma;
        d = vn1->data[lastc - 1];
        if (d != 0.0) {
          smax = fabs(b_A->data[minmana]) / d;
          smax = 1.0 - smax * smax;
          if (smax < 0.0) {
            smax = 0.0;
          }
          s = d / vn2->data[lastc - 1];
          s = smax * (s * s);
          if (s <= 1.4901161193847656E-8) {
            if (b_i + 1 < m) {
              d = xnrm2(mmi, b_A, minmana + 2);
              vn1->data[lastc - 1] = d;
              vn2->data[lastc - 1] = d;
            } else {
              vn1->data[lastc - 1] = 0.0;
              vn2->data[lastc - 1] = 0.0;
            }
          } else {
            vn1->data[lastc - 1] = d * sqrt(smax);
          }
        }
      }
    }
    emxFree_real_T(&vn2);
    emxFree_real_T(&vn1);
    emxFree_real_T(&work);
  }
  lastv = 0;
  if (b_A->size[0] < b_A->size[1]) {
    minmn = b_A->size[0];
    minmana = b_A->size[1];
  } else {
    minmn = b_A->size[1];
    minmana = b_A->size[0];
  }
  if (minmn > 0) {
    smax =
        fmin(1.4901161193847656E-8, 2.2204460492503131E-15 * (double)minmana) *
        fabs(b_A->data[0]);
    while ((lastv < minmn) &&
           (!(fabs(b_A->data[lastv + b_A->size[0] * lastv]) <= smax))) {
      lastv++;
    }
  }
  emxInit_real_T(&b_B, 2);
  i = b_B->size[0] * b_B->size[1];
  b_B->size[0] = B->size[0];
  b_B->size[1] = B->size[1];
  emxEnsureCapacity_real_T(b_B, i);
  minmana = B->size[0] * B->size[1];
  for (i = 0; i < minmana; i++) {
    b_B->data[i] = B->data[i];
  }
  pvt = B->size[1];
  i = Y->size[0] * Y->size[1];
  Y->size[0] = b_A->size[1];
  Y->size[1] = B->size[1];
  emxEnsureCapacity_real_T(Y, i);
  minmana = b_A->size[1] * B->size[1];
  for (i = 0; i < minmana; i++) {
    Y->data[i] = 0.0;
  }
  m = b_A->size[0];
  minmana = B->size[1];
  lastc = b_A->size[0];
  mn = b_A->size[1];
  if (lastc < mn) {
    mn = lastc;
  }
  for (lastc = 0; lastc < mn; lastc++) {
    if (tau->data[lastc] != 0.0) {
      for (k = 0; k < minmana; k++) {
        smax = b_B->data[lastc + b_B->size[0] * k];
        i = lastc + 2;
        for (b_i = i; b_i <= m; b_i++) {
          smax += b_A->data[(b_i + b_A->size[0] * lastc) - 1] *
                  b_B->data[(b_i + b_B->size[0] * k) - 1];
        }
        smax *= tau->data[lastc];
        if (smax != 0.0) {
          b_B->data[lastc + b_B->size[0] * k] -= smax;
          for (b_i = i; b_i <= m; b_i++) {
            b_B->data[(b_i + b_B->size[0] * k) - 1] -=
                b_A->data[(b_i + b_A->size[0] * lastc) - 1] * smax;
          }
        }
      }
    }
  }
  emxFree_real_T(&tau);
  for (k = 0; k < pvt; k++) {
    for (b_i = 0; b_i < lastv; b_i++) {
      Y->data[(jpvt->data[b_i] + Y->size[0] * k) - 1] =
          b_B->data[b_i + b_B->size[0] * k];
    }
    for (lastc = lastv; lastc >= 1; lastc--) {
      i = jpvt->data[lastc - 1];
      Y->data[(i + Y->size[0] * k) - 1] /=
          b_A->data[(lastc + b_A->size[0] * (lastc - 1)) - 1];
      for (b_i = 0; b_i <= lastc - 2; b_i++) {
        Y->data[(jpvt->data[b_i] + Y->size[0] * k) - 1] -=
            Y->data[(jpvt->data[lastc - 1] + Y->size[0] * k) - 1] *
            b_A->data[b_i + b_A->size[0] * (lastc - 1)];
      }
    }
  }
  emxFree_real_T(&b_B);
  emxFree_int32_T(&jpvt);
  emxFree_real_T(&b_A);
}

/*
 * File trailer for qrsolve.c
 *
 * [EOF]
 */
