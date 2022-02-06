/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: schur.c
 *
 * MATLAB Coder version            : 5.2
 * C/C++ source code generated on  : 31-Jan-2022 14:36:42
 */

/* Include Files */
#include "schur.h"
#include "SKLDBarycenter_data.h"
#include "SKLDBarycenter_emxutil.h"
#include "SKLDBarycenter_rtwutil.h"
#include "SKLDBarycenter_types.h"
#include "rt_nonfinite.h"
#include "xdhseqr.h"
#include "xdlanv2.h"
#include "xzlarf.h"
#include "xzlarfg.h"
#include "rt_nonfinite.h"

/* Function Definitions */
/*
 * Arguments    : const emxArray_real_T *A
 *                emxArray_creal_T *V
 *                emxArray_creal_T *T
 * Return Type  : void
 */
void schur(const emxArray_real_T *A, emxArray_creal_T *V, emxArray_creal_T *T)
{
  emxArray_real_T *Vr;
  emxArray_real_T *b_A;
  emxArray_real_T *tau;
  emxArray_real_T *work;
  double c;
  double cs;
  double d;
  double r;
  double rt1i;
  double rt1r;
  double rt2i;
  double rt2r;
  double s;
  double sn;
  double temp;
  int b_i;
  int b_n;
  int exitg1;
  int i;
  int ia;
  int iac;
  int iaii;
  int im1n;
  int in;
  int itau;
  int iv0;
  int k;
  int lastc;
  int lastv;
  int n;
  int nh;
  int nx;
  boolean_T exitg2;
  boolean_T p;
  nx = A->size[0] * A->size[1];
  p = true;
  for (k = 0; k < nx; k++) {
    if ((!p) || (rtIsInf(A->data[k]) || rtIsNaN(A->data[k]))) {
      p = false;
    }
  }
  if (!p) {
    i = V->size[0] * V->size[1];
    V->size[0] = A->size[0];
    V->size[1] = A->size[1];
    emxEnsureCapacity_creal_T(V, i);
    nx = A->size[0] * A->size[1];
    for (i = 0; i < nx; i++) {
      V->data[i].re = rtNaN;
      V->data[i].im = 0.0;
    }
    itau = V->size[0];
    if ((V->size[0] != 0) && (V->size[1] != 0) && (2 < V->size[0])) {
      nx = 3;
      if (V->size[0] - 3 < V->size[1] - 1) {
        iaii = V->size[0] - 2;
      } else {
        iaii = V->size[1];
      }
      for (iac = 0; iac < iaii; iac++) {
        for (b_i = nx; b_i <= itau; b_i++) {
          V->data[(b_i + V->size[0] * iac) - 1].re = 0.0;
          V->data[(b_i + V->size[0] * iac) - 1].im = 0.0;
        }
        nx++;
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
    emxInit_real_T(&b_A, 2);
    n = A->size[0];
    i = b_A->size[0] * b_A->size[1];
    b_A->size[0] = A->size[0];
    b_A->size[1] = A->size[1];
    emxEnsureCapacity_real_T(b_A, i);
    nx = A->size[0] * A->size[1];
    for (i = 0; i < nx; i++) {
      b_A->data[i] = A->data[i];
    }
    emxInit_real_T(&tau, 1);
    emxInit_real_T(&work, 1);
    b_n = A->size[0];
    i = tau->size[0];
    if (A->size[0] < 1) {
      tau->size[0] = 0;
    } else {
      tau->size[0] = A->size[0] - 1;
    }
    emxEnsureCapacity_real_T(tau, i);
    i = work->size[0];
    work->size[0] = A->size[0];
    emxEnsureCapacity_real_T(work, i);
    nx = A->size[0];
    for (i = 0; i < nx; i++) {
      work->data[i] = 0.0;
    }
    i = A->size[0];
    for (b_i = 0; b_i <= i - 2; b_i++) {
      im1n = b_i * b_n + 2;
      in = (b_i + 1) * b_n;
      r = b_A->data[(b_i + b_A->size[0] * b_i) + 1];
      iaii = b_i + 3;
      if (iaii >= b_n) {
        iaii = b_n;
      }
      d = xzlarfg((b_n - b_i) - 1, &r, b_A, iaii + b_i * b_n);
      tau->data[b_i] = d;
      b_A->data[(b_i + b_A->size[0] * b_i) + 1] = 1.0;
      nx = (b_n - b_i) - 3;
      iv0 = (b_i + im1n) - 1;
      nh = in + 1;
      if (d != 0.0) {
        lastv = nx + 1;
        nx += iv0;
        while ((lastv + 1 > 0) && (b_A->data[nx + 1] == 0.0)) {
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
              if (b_A->data[ia - 1] != 0.0) {
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
            work->data[nx] = 0.0;
          }
          nx = iv0;
          k = (in + b_n * lastv) + 1;
          for (iac = nh; b_n < 0 ? iac >= k : iac <= k; iac += b_n) {
            itau = (iac + lastc) - 1;
            for (ia = iac; ia <= itau; ia++) {
              iaii = ia - iac;
              work->data[iaii] += b_A->data[ia - 1] * b_A->data[nx];
            }
            nx++;
          }
        }
        if (!(-tau->data[b_i] == 0.0)) {
          nx = in;
          for (iac = 0; iac <= lastv; iac++) {
            k = iv0 + iac;
            if (b_A->data[k] != 0.0) {
              temp = b_A->data[k] * -tau->data[b_i];
              k = nx + 1;
              itau = lastc + nx;
              for (iaii = k; iaii <= itau; iaii++) {
                b_A->data[iaii - 1] += work->data[(iaii - nx) - 1] * temp;
              }
            }
            nx += b_n;
          }
        }
      }
      xzlarf((b_n - b_i) - 1, (b_n - b_i) - 1, b_i + im1n, tau->data[b_i], b_A,
             (b_i + in) + 2, b_n, work);
      b_A->data[(b_i + b_A->size[0] * b_i) + 1] = r;
    }
    emxInit_real_T(&Vr, 2);
    i = Vr->size[0] * Vr->size[1];
    Vr->size[0] = b_A->size[0];
    Vr->size[1] = b_A->size[1];
    emxEnsureCapacity_real_T(Vr, i);
    nx = b_A->size[0] * b_A->size[1];
    for (i = 0; i < nx; i++) {
      Vr->data[i] = b_A->data[i];
    }
    if (A->size[0] != 0) {
      nh = A->size[0] - 1;
      for (iac = n; iac >= 2; iac--) {
        ia = (iac - 1) * n - 1;
        for (b_i = 0; b_i <= iac - 2; b_i++) {
          Vr->data[(ia + b_i) + 1] = 0.0;
        }
        nx = ia - n;
        i = iac + 1;
        for (b_i = i; b_i <= n; b_i++) {
          Vr->data[ia + b_i] = Vr->data[nx + b_i];
        }
        i = n + 1;
        for (b_i = i; b_i <= n; b_i++) {
          Vr->data[ia + b_i] = 0.0;
        }
      }
      for (b_i = 0; b_i < n; b_i++) {
        Vr->data[b_i] = 0.0;
      }
      Vr->data[0] = 1.0;
      i = A->size[0] + 1;
      for (iac = i; iac <= n; iac++) {
        ia = (iac - 1) * n;
        for (b_i = 0; b_i < n; b_i++) {
          Vr->data[ia + b_i] = 0.0;
        }
        Vr->data[(ia + iac) - 1] = 1.0;
      }
      if (A->size[0] - 1 >= 1) {
        i = A->size[0] - 2;
        for (iac = nh; iac <= i; iac++) {
          ia = (n + iac * n) + 1;
          k = n - 2;
          for (b_i = 0; b_i <= k; b_i++) {
            Vr->data[ia + b_i] = 0.0;
          }
          Vr->data[ia + iac] = 1.0;
        }
        itau = A->size[0] - 2;
        i = work->size[0];
        work->size[0] = Vr->size[1];
        emxEnsureCapacity_real_T(work, i);
        nx = Vr->size[1];
        for (i = 0; i < nx; i++) {
          work->data[i] = 0.0;
        }
        for (b_i = A->size[0] - 1; b_i >= 1; b_i--) {
          iaii = (n + b_i) + (b_i - 1) * n;
          if (b_i < n - 1) {
            Vr->data[iaii] = 1.0;
            xzlarf(n - b_i, nh - b_i, iaii + 1, tau->data[itau], Vr,
                   (iaii + n) + 1, n, work);
            nx = iaii + 2;
            i = (iaii + n) - b_i;
            for (k = nx; k <= i; k++) {
              Vr->data[k - 1] *= -tau->data[itau];
            }
          }
          Vr->data[iaii] = 1.0 - tau->data[itau];
          for (iac = 0; iac <= b_i - 2; iac++) {
            Vr->data[(iaii - iac) - 1] = 0.0;
          }
          itau--;
        }
      }
    }
    emxFree_real_T(&work);
    emxFree_real_T(&tau);
    eml_dlahqr(b_A, Vr);
    itau = b_A->size[0];
    if ((b_A->size[0] != 0) && (b_A->size[1] != 0) && (3 < b_A->size[0])) {
      nx = 4;
      if (b_A->size[0] - 4 < b_A->size[1] - 1) {
        iaii = b_A->size[0] - 3;
      } else {
        iaii = b_A->size[1];
      }
      for (iac = 0; iac < iaii; iac++) {
        for (b_i = nx; b_i <= itau; b_i++) {
          b_A->data[(b_i + b_A->size[0] * iac) - 1] = 0.0;
        }
        nx++;
      }
    }
    i = T->size[0] * T->size[1];
    T->size[0] = b_A->size[0];
    T->size[1] = b_A->size[1];
    emxEnsureCapacity_creal_T(T, i);
    nx = b_A->size[0] * b_A->size[1];
    for (i = 0; i < nx; i++) {
      T->data[i].re = b_A->data[i];
      T->data[i].im = 0.0;
    }
    i = V->size[0] * V->size[1];
    V->size[0] = Vr->size[0];
    V->size[1] = Vr->size[1];
    emxEnsureCapacity_creal_T(V, i);
    nx = Vr->size[0] * Vr->size[1];
    for (i = 0; i < nx; i++) {
      V->data[i].re = Vr->data[i];
      V->data[i].im = 0.0;
    }
    iaii = b_A->size[0];
    nx = b_A->size[1];
    if (iaii < nx) {
      nx = iaii;
    }
    iaii = Vr->size[0];
    n = Vr->size[1];
    if (iaii < n) {
      n = iaii;
    }
    if (nx < n) {
      n = nx;
    }
    emxFree_real_T(&Vr);
    if (n != 0) {
      for (itau = n - 1; itau + 1 >= 2; itau--) {
        d = b_A->data[itau + b_A->size[0] * (itau - 1)];
        if (d != 0.0) {
          temp = b_A->data[(itau + b_A->size[0] * (itau - 1)) - 1];
          r = b_A->data[(itau + b_A->size[0] * itau) - 1];
          c = d;
          s = b_A->data[itau + b_A->size[0] * itau];
          xdlanv2(&temp, &r, &c, &s, &rt1r, &rt1i, &rt2r, &rt2i, &cs, &sn);
          temp = rt1r - b_A->data[itau + b_A->size[0] * itau];
          r = rt_hypotd_snf(rt_hypotd_snf(temp, rt1i), d);
          if (rt1i == 0.0) {
            rt2r = temp / r;
            rt1r = 0.0;
          } else if (temp == 0.0) {
            rt2r = 0.0;
            rt1r = rt1i / r;
          } else {
            rt2r = temp / r;
            rt1r = rt1i / r;
          }
          s = d / r;
          for (iac = itau; iac <= n; iac++) {
            temp = T->data[(itau + T->size[0] * (iac - 1)) - 1].re;
            r = T->data[(itau + T->size[0] * (iac - 1)) - 1].im;
            T->data[(itau + T->size[0] * (iac - 1)) - 1].re =
                (rt2r * temp + rt1r * r) +
                s * T->data[itau + T->size[0] * (iac - 1)].re;
            T->data[(itau + T->size[0] * (iac - 1)) - 1].im =
                (rt2r * r - rt1r * temp) +
                s * T->data[itau + T->size[0] * (iac - 1)].im;
            c = rt2r * T->data[itau + T->size[0] * (iac - 1)].im +
                rt1r * T->data[itau + T->size[0] * (iac - 1)].re;
            T->data[itau + T->size[0] * (iac - 1)].re =
                (rt2r * T->data[itau + T->size[0] * (iac - 1)].re -
                 rt1r * T->data[itau + T->size[0] * (iac - 1)].im) -
                s * temp;
            T->data[itau + T->size[0] * (iac - 1)].im = c - s * r;
          }
          for (b_i = 0; b_i <= itau; b_i++) {
            temp = T->data[b_i + T->size[0] * (itau - 1)].re;
            r = T->data[b_i + T->size[0] * (itau - 1)].im;
            c = rt2r * T->data[b_i + T->size[0] * (itau - 1)].im +
                rt1r * T->data[b_i + T->size[0] * (itau - 1)].re;
            T->data[b_i + T->size[0] * (itau - 1)].re =
                (rt2r * T->data[b_i + T->size[0] * (itau - 1)].re -
                 rt1r * T->data[b_i + T->size[0] * (itau - 1)].im) +
                s * T->data[b_i + T->size[0] * itau].re;
            T->data[b_i + T->size[0] * (itau - 1)].im =
                c + s * T->data[b_i + T->size[0] * itau].im;
            d = T->data[b_i + T->size[0] * itau].re;
            T->data[b_i + T->size[0] * itau].re =
                (rt2r * T->data[b_i + T->size[0] * itau].re +
                 rt1r * T->data[b_i + T->size[0] * itau].im) -
                s * temp;
            T->data[b_i + T->size[0] * itau].im =
                (rt2r * T->data[b_i + T->size[0] * itau].im - rt1r * d) - s * r;
          }
          for (b_i = 0; b_i < n; b_i++) {
            temp = V->data[b_i + V->size[0] * (itau - 1)].re;
            r = V->data[b_i + V->size[0] * (itau - 1)].im;
            c = rt2r * V->data[b_i + V->size[0] * (itau - 1)].im +
                rt1r * V->data[b_i + V->size[0] * (itau - 1)].re;
            V->data[b_i + V->size[0] * (itau - 1)].re =
                (rt2r * V->data[b_i + V->size[0] * (itau - 1)].re -
                 rt1r * V->data[b_i + V->size[0] * (itau - 1)].im) +
                s * V->data[b_i + V->size[0] * itau].re;
            V->data[b_i + V->size[0] * (itau - 1)].im =
                c + s * V->data[b_i + V->size[0] * itau].im;
            d = V->data[b_i + V->size[0] * itau].re;
            V->data[b_i + V->size[0] * itau].re =
                (rt2r * V->data[b_i + V->size[0] * itau].re +
                 rt1r * V->data[b_i + V->size[0] * itau].im) -
                s * temp;
            V->data[b_i + V->size[0] * itau].im =
                (rt2r * V->data[b_i + V->size[0] * itau].im - rt1r * d) - s * r;
          }
          T->data[itau + T->size[0] * (itau - 1)].re = 0.0;
          T->data[itau + T->size[0] * (itau - 1)].im = 0.0;
        }
      }
    }
    emxFree_real_T(&b_A);
  }
}

/*
 * File trailer for schur.c
 *
 * [EOF]
 */
