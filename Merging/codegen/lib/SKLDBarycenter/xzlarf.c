/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: xzlarf.c
 *
 * MATLAB Coder version            : 5.2
 * C/C++ source code generated on  : 31-Jan-2022 14:36:42
 */

/* Include Files */
#include "xzlarf.h"
#include "SKLDBarycenter_types.h"
#include "rt_nonfinite.h"
#include "xgerc.h"

/* Function Definitions */
/*
 * Arguments    : int m
 *                int n
 *                int iv0
 *                const creal_T tau
 *                emxArray_creal_T *C
 *                int ic0
 *                int ldc
 *                emxArray_creal_T *work
 * Return Type  : void
 */
void b_xzlarf(int m, int n, int iv0, const creal_T tau, emxArray_creal_T *C,
              int ic0, int ldc, emxArray_creal_T *work)
{
  creal_T b_tau;
  double c_im;
  double c_re;
  int b_i;
  int c_re_tmp;
  int exitg1;
  int i;
  int ia;
  int iac;
  int iy;
  int lastc;
  int lastv;
  boolean_T exitg2;
  if ((tau.re != 0.0) || (tau.im != 0.0)) {
    lastv = m;
    i = iv0 + m;
    while ((lastv > 0) &&
           ((C->data[i - 2].re == 0.0) && (C->data[i - 2].im == 0.0))) {
      lastv--;
      i--;
    }
    lastc = n;
    exitg2 = false;
    while ((!exitg2) && (lastc > 0)) {
      i = ic0 + (lastc - 1) * ldc;
      ia = i;
      do {
        exitg1 = 0;
        if (ia <= (i + lastv) - 1) {
          if ((C->data[ia - 1].re != 0.0) || (C->data[ia - 1].im != 0.0)) {
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
    lastv = 0;
    lastc = 0;
  }
  if (lastv > 0) {
    if (lastc != 0) {
      for (iy = 0; iy < lastc; iy++) {
        work->data[iy].re = 0.0;
        work->data[iy].im = 0.0;
      }
      iy = 0;
      i = ic0 + ldc * (lastc - 1);
      for (iac = ic0; ldc < 0 ? iac >= i : iac <= i; iac += ldc) {
        c_re = 0.0;
        c_im = 0.0;
        b_i = (iac + lastv) - 1;
        for (ia = iac; ia <= b_i; ia++) {
          c_re_tmp = ((iv0 + ia) - iac) - 1;
          c_re += C->data[ia - 1].re * C->data[c_re_tmp].re +
                  C->data[ia - 1].im * C->data[c_re_tmp].im;
          c_im += C->data[ia - 1].re * C->data[c_re_tmp].im -
                  C->data[ia - 1].im * C->data[c_re_tmp].re;
        }
        work->data[iy].re += c_re - 0.0 * c_im;
        work->data[iy].im += c_im + 0.0 * c_re;
        iy++;
      }
    }
    b_tau.re = -tau.re;
    b_tau.im = -tau.im;
    b_xgerc(lastv, lastc, b_tau, iv0, work, C, ic0, ldc);
  }
}

/*
 * Arguments    : int m
 *                int n
 *                int iv0
 *                double tau
 *                emxArray_real_T *C
 *                int ic0
 *                int ldc
 *                emxArray_real_T *work
 * Return Type  : void
 */
void xzlarf(int m, int n, int iv0, double tau, emxArray_real_T *C, int ic0,
            int ldc, emxArray_real_T *work)
{
  double c;
  int b_i;
  int exitg1;
  int i;
  int ia;
  int iac;
  int iy;
  int lastc;
  int lastv;
  boolean_T exitg2;
  if (tau != 0.0) {
    lastv = m;
    i = iv0 + m;
    while ((lastv > 0) && (C->data[i - 2] == 0.0)) {
      lastv--;
      i--;
    }
    lastc = n;
    exitg2 = false;
    while ((!exitg2) && (lastc > 0)) {
      i = ic0 + (lastc - 1) * ldc;
      ia = i;
      do {
        exitg1 = 0;
        if (ia <= (i + lastv) - 1) {
          if (C->data[ia - 1] != 0.0) {
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
    lastv = 0;
    lastc = 0;
  }
  if (lastv > 0) {
    if (lastc != 0) {
      for (iy = 0; iy < lastc; iy++) {
        work->data[iy] = 0.0;
      }
      iy = 0;
      i = ic0 + ldc * (lastc - 1);
      for (iac = ic0; ldc < 0 ? iac >= i : iac <= i; iac += ldc) {
        c = 0.0;
        b_i = (iac + lastv) - 1;
        for (ia = iac; ia <= b_i; ia++) {
          c += C->data[ia - 1] * C->data[((iv0 + ia) - iac) - 1];
        }
        work->data[iy] += c;
        iy++;
      }
    }
    xgerc(lastv, lastc, -tau, iv0, work, C, ic0, ldc);
  }
}

/*
 * File trailer for xzlarf.c
 *
 * [EOF]
 */
