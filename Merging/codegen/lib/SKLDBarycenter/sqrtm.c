/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: sqrtm.c
 *
 * MATLAB Coder version            : 5.2
 * C/C++ source code generated on  : 31-Jan-2022 14:36:42
 */

/* Include Files */
#include "sqrtm.h"
#include "SKLDBarycenter_data.h"
#include "SKLDBarycenter_emxutil.h"
#include "SKLDBarycenter_rtwutil.h"
#include "SKLDBarycenter_types.h"
#include "mtimes.h"
#include "rt_nonfinite.h"
#include "schur.h"
#include "sqrt.h"
#include "xzhseqr.h"
#include "xzlarf.h"
#include "xzlarfg.h"
#include "rt_nonfinite.h"
#include <math.h>

/* Function Definitions */
/*
 * Arguments    : const emxArray_creal_T *A
 *                emxArray_creal_T *X
 * Return Type  : void
 */
void b_sqrtm(const emxArray_creal_T *A, emxArray_creal_T *X)
{
  emxArray_creal_T *Q;
  emxArray_creal_T *R;
  emxArray_creal_T *T;
  emxArray_creal_T *tau;
  emxArray_creal_T *work;
  creal_T alpha1;
  creal_T b_tau;
  double ai;
  double ar;
  double brm;
  double c_im;
  double c_re;
  double re;
  double temp_im;
  double temp_re;
  int b_i;
  int b_n;
  int exitg1;
  int exitg3;
  int i;
  int i1;
  int ia;
  int iac;
  int im1n;
  int in;
  int itau;
  int iv0;
  int jA;
  int k;
  int lastc;
  int lastv;
  int n;
  int nx;
  boolean_T exitg2;
  boolean_T p;
  nx = A->size[0] * A->size[1];
  p = true;
  for (k = 0; k < nx; k++) {
    if ((!p) || (rtIsInf(A->data[k].re) || rtIsInf(A->data[k].im) ||
                 (rtIsNaN(A->data[k].re) || rtIsNaN(A->data[k].im)))) {
      p = false;
    }
  }
  emxInit_creal_T(&Q, 2);
  emxInit_creal_T(&T, 2);
  if (!p) {
    i = Q->size[0] * Q->size[1];
    Q->size[0] = A->size[0];
    Q->size[1] = A->size[1];
    emxEnsureCapacity_creal_T(Q, i);
    nx = A->size[0] * A->size[1];
    for (i = 0; i < nx; i++) {
      Q->data[i].re = rtNaN;
      Q->data[i].im = 0.0;
    }
    nx = Q->size[0];
    if ((Q->size[0] != 0) && (Q->size[1] != 0) && (1 < Q->size[0])) {
      jA = 2;
      if (Q->size[0] - 2 < Q->size[1] - 1) {
        itau = Q->size[0] - 1;
      } else {
        itau = Q->size[1];
      }
      for (iac = 0; iac < itau; iac++) {
        for (b_i = jA; b_i <= nx; b_i++) {
          Q->data[(b_i + Q->size[0] * iac) - 1].re = 0.0;
          Q->data[(b_i + Q->size[0] * iac) - 1].im = 0.0;
        }
        jA++;
      }
    }
    i = T->size[0] * T->size[1];
    T->size[0] = A->size[0];
    T->size[1] = A->size[1];
    emxEnsureCapacity_creal_T(T, i);
    nx = A->size[0] * A->size[1];
    for (i = 0; i < nx; i++) {
      T->data[i].re = rtNaN;
      T->data[i].im = 0.0;
    }
  } else {
    n = A->size[0];
    i = T->size[0] * T->size[1];
    T->size[0] = A->size[0];
    T->size[1] = A->size[1];
    emxEnsureCapacity_creal_T(T, i);
    nx = A->size[0] * A->size[1];
    for (i = 0; i < nx; i++) {
      T->data[i] = A->data[i];
    }
    emxInit_creal_T(&tau, 1);
    emxInit_creal_T(&work, 1);
    b_n = A->size[0];
    i = tau->size[0];
    if (A->size[0] < 1) {
      tau->size[0] = 0;
    } else {
      tau->size[0] = A->size[0] - 1;
    }
    emxEnsureCapacity_creal_T(tau, i);
    i = work->size[0];
    work->size[0] = A->size[0];
    emxEnsureCapacity_creal_T(work, i);
    nx = A->size[0];
    for (i = 0; i < nx; i++) {
      work->data[i].re = 0.0;
      work->data[i].im = 0.0;
    }
    i = A->size[0];
    for (b_i = 0; b_i <= i - 2; b_i++) {
      im1n = b_i * b_n + 2;
      in = (b_i + 1) * b_n;
      alpha1 = T->data[(b_i + T->size[0] * b_i) + 1];
      nx = b_i + 3;
      if (nx >= b_n) {
        nx = b_n;
      }
      b_tau = c_xzlarfg((b_n - b_i) - 1, &alpha1, T, nx + b_i * b_n);
      tau->data[b_i] = b_tau;
      T->data[(b_i + T->size[0] * b_i) + 1].re = 1.0;
      T->data[(b_i + T->size[0] * b_i) + 1].im = 0.0;
      nx = (b_n - b_i) - 3;
      iv0 = (b_i + im1n) - 1;
      itau = in + 1;
      if ((b_tau.re != 0.0) || (b_tau.im != 0.0)) {
        lastv = nx + 1;
        nx += iv0;
        while ((lastv + 1 > 0) &&
               ((T->data[nx + 1].re == 0.0) && (T->data[nx + 1].im == 0.0))) {
          lastv--;
          nx--;
        }
        lastc = b_n;
        exitg2 = false;
        while ((!exitg2) && (lastc > 0)) {
          nx = in + lastc;
          ia = nx;
          do {
            exitg1 = 0;
            if ((b_n > 0) && (ia <= nx + lastv * b_n)) {
              if ((T->data[ia - 1].re != 0.0) || (T->data[ia - 1].im != 0.0)) {
                exitg1 = 1;
              } else {
                ia += b_n;
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
        lastv = -1;
        lastc = 0;
      }
      if (lastv + 1 > 0) {
        if (lastc != 0) {
          for (nx = 0; nx < lastc; nx++) {
            work->data[nx].re = 0.0;
            work->data[nx].im = 0.0;
          }
          nx = iv0;
          k = (in + b_n * lastv) + 1;
          for (iac = itau; b_n < 0 ? iac >= k : iac <= k; iac += b_n) {
            c_re = T->data[nx].re - 0.0 * T->data[nx].im;
            c_im = T->data[nx].im + 0.0 * T->data[nx].re;
            i1 = (iac + lastc) - 1;
            for (ia = iac; ia <= i1; ia++) {
              jA = ia - iac;
              work->data[jA].re +=
                  T->data[ia - 1].re * c_re - T->data[ia - 1].im * c_im;
              work->data[jA].im +=
                  T->data[ia - 1].re * c_im + T->data[ia - 1].im * c_re;
            }
            nx++;
          }
        }
        c_re = -tau->data[b_i].re;
        c_im = -tau->data[b_i].im;
        if ((!(c_re == 0.0)) || (!(c_im == 0.0))) {
          jA = in;
          for (iac = 0; iac <= lastv; iac++) {
            nx = iv0 + iac;
            if ((T->data[nx].re != 0.0) || (T->data[nx].im != 0.0)) {
              temp_re = T->data[nx].re * c_re + T->data[nx].im * c_im;
              temp_im = T->data[nx].re * c_im - T->data[nx].im * c_re;
              k = jA + 1;
              i1 = lastc + jA;
              for (itau = k; itau <= i1; itau++) {
                nx = (itau - jA) - 1;
                T->data[itau - 1].re +=
                    work->data[nx].re * temp_re - work->data[nx].im * temp_im;
                T->data[itau - 1].im +=
                    work->data[nx].re * temp_im + work->data[nx].im * temp_re;
              }
            }
            jA += b_n;
          }
        }
      }
      b_tau.re = tau->data[b_i].re;
      b_tau.im = -tau->data[b_i].im;
      b_xzlarf((b_n - b_i) - 1, (b_n - b_i) - 1, b_i + im1n, b_tau, T,
               (b_i + in) + 2, b_n, work);
      T->data[(b_i + T->size[0] * b_i) + 1] = alpha1;
    }
    i = Q->size[0] * Q->size[1];
    Q->size[0] = T->size[0];
    Q->size[1] = T->size[1];
    emxEnsureCapacity_creal_T(Q, i);
    nx = T->size[0] * T->size[1];
    for (i = 0; i < nx; i++) {
      Q->data[i] = T->data[i];
    }
    if (A->size[0] != 0) {
      lastc = A->size[0] - 1;
      for (iac = n; iac >= 2; iac--) {
        ia = (iac - 1) * n - 1;
        for (b_i = 0; b_i <= iac - 2; b_i++) {
          i = (ia + b_i) + 1;
          Q->data[i].re = 0.0;
          Q->data[i].im = 0.0;
        }
        nx = ia - n;
        i = iac + 1;
        for (b_i = i; b_i <= n; b_i++) {
          Q->data[ia + b_i] = Q->data[nx + b_i];
        }
        i = n + 1;
        for (b_i = i; b_i <= n; b_i++) {
          k = ia + b_i;
          Q->data[k].re = 0.0;
          Q->data[k].im = 0.0;
        }
      }
      for (b_i = 0; b_i < n; b_i++) {
        Q->data[b_i].re = 0.0;
        Q->data[b_i].im = 0.0;
      }
      Q->data[0].re = 1.0;
      Q->data[0].im = 0.0;
      i = A->size[0] + 1;
      for (iac = i; iac <= n; iac++) {
        ia = (iac - 1) * n;
        for (b_i = 0; b_i < n; b_i++) {
          k = ia + b_i;
          Q->data[k].re = 0.0;
          Q->data[k].im = 0.0;
        }
        k = (ia + iac) - 1;
        Q->data[k].re = 1.0;
        Q->data[k].im = 0.0;
      }
      if (A->size[0] - 1 >= 1) {
        i = A->size[0] - 2;
        for (iac = lastc; iac <= i; iac++) {
          ia = (n + iac * n) + 1;
          k = n - 2;
          for (b_i = 0; b_i <= k; b_i++) {
            i1 = ia + b_i;
            Q->data[i1].re = 0.0;
            Q->data[i1].im = 0.0;
          }
          k = ia + iac;
          Q->data[k].re = 1.0;
          Q->data[k].im = 0.0;
        }
        itau = A->size[0] - 2;
        i = work->size[0];
        work->size[0] = Q->size[1];
        emxEnsureCapacity_creal_T(work, i);
        nx = Q->size[1];
        for (i = 0; i < nx; i++) {
          work->data[i].re = 0.0;
          work->data[i].im = 0.0;
        }
        for (b_i = A->size[0] - 1; b_i >= 1; b_i--) {
          jA = (n + b_i) + (b_i - 1) * n;
          if (b_i < n - 1) {
            Q->data[jA].re = 1.0;
            Q->data[jA].im = 0.0;
            b_xzlarf(n - b_i, lastc - b_i, jA + 1, tau->data[itau], Q,
                     (jA + n) + 1, n, work);
            nx = jA + 2;
            c_re = -tau->data[itau].re;
            c_im = -tau->data[itau].im;
            i = (jA + n) - b_i;
            for (k = nx; k <= i; k++) {
              temp_re = c_re * Q->data[k - 1].im + c_im * Q->data[k - 1].re;
              Q->data[k - 1].re =
                  c_re * Q->data[k - 1].re - c_im * Q->data[k - 1].im;
              Q->data[k - 1].im = temp_re;
            }
          }
          Q->data[jA].re = 1.0 - tau->data[itau].re;
          Q->data[jA].im = 0.0 - tau->data[itau].im;
          for (iac = 0; iac <= b_i - 2; iac++) {
            i = (jA - iac) - 1;
            Q->data[i].re = 0.0;
            Q->data[i].im = 0.0;
          }
          itau--;
        }
      }
    }
    emxFree_creal_T(&work);
    emxFree_creal_T(&tau);
    eml_zlahqr(T, Q);
    nx = T->size[0];
    if ((T->size[0] != 0) && (T->size[1] != 0) && (3 < T->size[0])) {
      jA = 4;
      if (T->size[0] - 4 < T->size[1] - 1) {
        itau = T->size[0] - 3;
      } else {
        itau = T->size[1];
      }
      for (iac = 0; iac < itau; iac++) {
        for (b_i = jA; b_i <= nx; b_i++) {
          T->data[(b_i + T->size[0] * iac) - 1].re = 0.0;
          T->data[(b_i + T->size[0] * iac) - 1].im = 0.0;
        }
        jA++;
      }
    }
  }
  emxInit_creal_T(&R, 2);
  n = A->size[0] - 1;
  i = R->size[0] * R->size[1];
  R->size[0] = T->size[0];
  R->size[1] = T->size[1];
  emxEnsureCapacity_creal_T(R, i);
  nx = T->size[0] * T->size[1];
  for (i = 0; i < nx; i++) {
    R->data[i].re = 0.0;
    R->data[i].im = 0.0;
  }
  iac = -1;
  do {
    exitg3 = 0;
    if (iac + 1 <= T->size[1] - 1) {
      b_i = 0;
      do {
        exitg1 = 0;
        if (b_i <= iac) {
          if ((T->data[b_i + T->size[0] * (iac + 1)].re != 0.0) ||
              (T->data[b_i + T->size[0] * (iac + 1)].im != 0.0)) {
            for (iac = 0; iac <= n; iac++) {
              R->data[iac + R->size[0] * iac] = T->data[iac + T->size[0] * iac];
              b_sqrt(&R->data[iac + R->size[0] * iac]);
              for (b_i = iac; b_i >= 1; b_i--) {
                c_re = 0.0;
                c_im = 0.0;
                i = b_i + 1;
                for (k = i; k <= iac; k++) {
                  c_re += R->data[(b_i + R->size[0] * (k - 1)) - 1].re *
                              R->data[(k + R->size[0] * iac) - 1].re -
                          R->data[(b_i + R->size[0] * (k - 1)) - 1].im *
                              R->data[(k + R->size[0] * iac) - 1].im;
                  c_im += R->data[(b_i + R->size[0] * (k - 1)) - 1].re *
                              R->data[(k + R->size[0] * iac) - 1].im +
                          R->data[(b_i + R->size[0] * (k - 1)) - 1].im *
                              R->data[(k + R->size[0] * iac) - 1].re;
                }
                ar = T->data[(b_i + T->size[0] * iac) - 1].re - c_re;
                ai = T->data[(b_i + T->size[0] * iac) - 1].im - c_im;
                c_re = R->data[(b_i + R->size[0] * (b_i - 1)) - 1].re +
                       R->data[iac + R->size[0] * iac].re;
                c_im = R->data[(b_i + R->size[0] * (b_i - 1)) - 1].im +
                       R->data[iac + R->size[0] * iac].im;
                if (c_im == 0.0) {
                  if (ai == 0.0) {
                    re = ar / c_re;
                    temp_re = 0.0;
                  } else if (ar == 0.0) {
                    re = 0.0;
                    temp_re = ai / c_re;
                  } else {
                    re = ar / c_re;
                    temp_re = ai / c_re;
                  }
                } else if (c_re == 0.0) {
                  if (ar == 0.0) {
                    re = ai / c_im;
                    temp_re = 0.0;
                  } else if (ai == 0.0) {
                    re = 0.0;
                    temp_re = -(ar / c_im);
                  } else {
                    re = ai / c_im;
                    temp_re = -(ar / c_im);
                  }
                } else {
                  brm = fabs(c_re);
                  temp_re = fabs(c_im);
                  if (brm > temp_re) {
                    temp_im = c_im / c_re;
                    temp_re = c_re + temp_im * c_im;
                    re = (ar + temp_im * ai) / temp_re;
                    temp_re = (ai - temp_im * ar) / temp_re;
                  } else if (temp_re == brm) {
                    if (c_re > 0.0) {
                      temp_im = 0.5;
                    } else {
                      temp_im = -0.5;
                    }
                    if (c_im > 0.0) {
                      temp_re = 0.5;
                    } else {
                      temp_re = -0.5;
                    }
                    re = (ar * temp_im + ai * temp_re) / brm;
                    temp_re = (ai * temp_im - ar * temp_re) / brm;
                  } else {
                    temp_im = c_re / c_im;
                    temp_re = c_im + temp_im * c_re;
                    re = (temp_im * ar + ai) / temp_re;
                    temp_re = (temp_im * ai - ar) / temp_re;
                  }
                }
                R->data[(b_i + R->size[0] * iac) - 1].re = re;
                R->data[(b_i + R->size[0] * iac) - 1].im = temp_re;
              }
            }
            exitg1 = 1;
          } else {
            b_i++;
          }
        } else {
          iac++;
          exitg1 = 2;
        }
      } while (exitg1 == 0);
      if (exitg1 == 1) {
        exitg3 = 1;
      }
    } else {
      for (iac = 0; iac <= n; iac++) {
        R->data[iac + R->size[0] * iac] = T->data[iac + T->size[0] * iac];
        b_sqrt(&R->data[iac + R->size[0] * iac]);
      }
      exitg3 = 1;
    }
  } while (exitg3 == 0);
  mtimes(Q, R, T);
  b_mtimes(T, Q, X);
  emxFree_creal_T(&T);
  emxFree_creal_T(&Q);
  emxFree_creal_T(&R);
}

/*
 * Arguments    : const emxArray_real_T *A
 *                emxArray_creal_T *X
 * Return Type  : void
 */
void sqrtm(const emxArray_real_T *A, emxArray_creal_T *X)
{
  emxArray_creal_T *Q;
  emxArray_creal_T *R;
  emxArray_creal_T *T;
  emxArray_real_T *x;
  double ai;
  double ar;
  double bi;
  double brm;
  double re;
  double s_im;
  double s_re;
  int b_i;
  int exitg1;
  int exitg2;
  int i;
  int k;
  int loop_ub;
  int n;
  boolean_T exitg3;
  emxInit_creal_T(&R, 2);
  emxInit_creal_T(&Q, 2);
  emxInit_creal_T(&T, 2);
  schur(A, Q, T);
  n = A->size[0] - 1;
  i = R->size[0] * R->size[1];
  R->size[0] = T->size[0];
  R->size[1] = T->size[1];
  emxEnsureCapacity_creal_T(R, i);
  loop_ub = T->size[0] * T->size[1];
  for (i = 0; i < loop_ub; i++) {
    R->data[i].re = 0.0;
    R->data[i].im = 0.0;
  }
  loop_ub = -1;
  do {
    exitg2 = 0;
    if (loop_ub + 1 <= T->size[1] - 1) {
      b_i = 0;
      do {
        exitg1 = 0;
        if (b_i <= loop_ub) {
          if ((T->data[b_i + T->size[0] * (loop_ub + 1)].re != 0.0) ||
              (T->data[b_i + T->size[0] * (loop_ub + 1)].im != 0.0)) {
            for (loop_ub = 0; loop_ub <= n; loop_ub++) {
              R->data[loop_ub + R->size[0] * loop_ub] =
                  T->data[loop_ub + T->size[0] * loop_ub];
              b_sqrt(&R->data[loop_ub + R->size[0] * loop_ub]);
              for (b_i = loop_ub; b_i >= 1; b_i--) {
                s_re = 0.0;
                s_im = 0.0;
                i = b_i + 1;
                for (k = i; k <= loop_ub; k++) {
                  s_re += R->data[(b_i + R->size[0] * (k - 1)) - 1].re *
                              R->data[(k + R->size[0] * loop_ub) - 1].re -
                          R->data[(b_i + R->size[0] * (k - 1)) - 1].im *
                              R->data[(k + R->size[0] * loop_ub) - 1].im;
                  s_im += R->data[(b_i + R->size[0] * (k - 1)) - 1].re *
                              R->data[(k + R->size[0] * loop_ub) - 1].im +
                          R->data[(b_i + R->size[0] * (k - 1)) - 1].im *
                              R->data[(k + R->size[0] * loop_ub) - 1].re;
                }
                ar = T->data[(b_i + T->size[0] * loop_ub) - 1].re - s_re;
                ai = T->data[(b_i + T->size[0] * loop_ub) - 1].im - s_im;
                s_im = R->data[(b_i + R->size[0] * (b_i - 1)) - 1].re +
                       R->data[loop_ub + R->size[0] * loop_ub].re;
                bi = R->data[(b_i + R->size[0] * (b_i - 1)) - 1].im +
                     R->data[loop_ub + R->size[0] * loop_ub].im;
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
                  brm = fabs(s_im);
                  s_re = fabs(bi);
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
                R->data[(b_i + R->size[0] * loop_ub) - 1].re = re;
                R->data[(b_i + R->size[0] * loop_ub) - 1].im = s_re;
              }
            }
            exitg1 = 1;
          } else {
            b_i++;
          }
        } else {
          loop_ub++;
          exitg1 = 2;
        }
      } while (exitg1 == 0);
      if (exitg1 == 1) {
        exitg2 = 1;
      }
    } else {
      for (loop_ub = 0; loop_ub <= n; loop_ub++) {
        R->data[loop_ub + R->size[0] * loop_ub] =
            T->data[loop_ub + T->size[0] * loop_ub];
        b_sqrt(&R->data[loop_ub + R->size[0] * loop_ub]);
      }
      exitg2 = 1;
    }
  } while (exitg2 == 0);
  emxInit_real_T(&x, 2);
  mtimes(Q, R, T);
  b_mtimes(T, Q, X);
  i = x->size[0] * x->size[1];
  x->size[0] = X->size[0];
  x->size[1] = X->size[1];
  emxEnsureCapacity_real_T(x, i);
  loop_ub = X->size[0] * X->size[1];
  emxFree_creal_T(&T);
  emxFree_creal_T(&Q);
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
      s_re += fabs(x->data[k]);
    }
  } else {
    s_re = 0.0;
    loop_ub = 0;
    exitg3 = false;
    while ((!exitg3) && (loop_ub <= x->size[1] - 1)) {
      brm = 0.0;
      i = x->size[0];
      for (b_i = 0; b_i < i; b_i++) {
        brm += fabs(x->data[b_i + x->size[0] * loop_ub]);
      }
      if (rtIsNaN(brm)) {
        s_re = rtNaN;
        exitg3 = true;
      } else {
        if (brm > s_re) {
          s_re = brm;
        }
        loop_ub++;
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
      s_im += rt_hypotd_snf(X->data[k].re, X->data[k].im);
    }
  } else {
    s_im = 0.0;
    loop_ub = 0;
    exitg3 = false;
    while ((!exitg3) && (loop_ub <= X->size[1] - 1)) {
      brm = 0.0;
      i = X->size[0];
      for (b_i = 0; b_i < i; b_i++) {
        brm += rt_hypotd_snf(X->data[b_i + X->size[0] * loop_ub].re,
                             X->data[b_i + X->size[0] * loop_ub].im);
      }
      if (rtIsNaN(brm)) {
        s_im = rtNaN;
        exitg3 = true;
      } else {
        if (brm > s_im) {
          s_im = brm;
        }
        loop_ub++;
      }
    }
  }
  if (s_re <= 10.0 * (double)A->size[0] * 2.2204460492503131E-16 * s_im) {
    for (loop_ub = 0; loop_ub <= n; loop_ub++) {
      for (b_i = 0; b_i <= n; b_i++) {
        X->data[b_i + X->size[0] * loop_ub].im = 0.0;
      }
    }
  }
}

/*
 * File trailer for sqrtm.c
 *
 * [EOF]
 */
