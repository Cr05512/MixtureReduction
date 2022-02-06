/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: xgerc.c
 *
 * MATLAB Coder version            : 5.2
 * C/C++ source code generated on  : 31-Jan-2022 14:36:42
 */

/* Include Files */
#include "xgerc.h"
#include "SKLDBarycenter_types.h"
#include "rt_nonfinite.h"

/* Function Definitions */
/*
 * Arguments    : int m
 *                int n
 *                const creal_T alpha1
 *                int ix0
 *                const emxArray_creal_T *y
 *                emxArray_creal_T *A
 *                int ia0
 *                int lda
 * Return Type  : void
 */
void b_xgerc(int m, int n, const creal_T alpha1, int ix0,
             const emxArray_creal_T *y, emxArray_creal_T *A, int ia0, int lda)
{
  double A_im;
  double temp_im;
  double temp_re;
  int A_re_tmp;
  int i;
  int ijA;
  int j;
  int jA;
  if ((!(alpha1.re == 0.0)) || (!(alpha1.im == 0.0))) {
    jA = ia0;
    for (j = 0; j < n; j++) {
      if ((y->data[j].re != 0.0) || (y->data[j].im != 0.0)) {
        temp_re = y->data[j].re * alpha1.re + y->data[j].im * alpha1.im;
        temp_im = y->data[j].re * alpha1.im - y->data[j].im * alpha1.re;
        i = m + jA;
        for (ijA = jA; ijA < i; ijA++) {
          A_re_tmp = ((ix0 + ijA) - jA) - 1;
          A_im =
              A->data[A_re_tmp].re * temp_im + A->data[A_re_tmp].im * temp_re;
          A->data[ijA - 1].re +=
              A->data[A_re_tmp].re * temp_re - A->data[A_re_tmp].im * temp_im;
          A->data[ijA - 1].im += A_im;
        }
      }
      jA += lda;
    }
  }
}

/*
 * Arguments    : int m
 *                int n
 *                double alpha1
 *                int ix0
 *                const emxArray_real_T *y
 *                emxArray_real_T *A
 *                int ia0
 *                int lda
 * Return Type  : void
 */
void xgerc(int m, int n, double alpha1, int ix0, const emxArray_real_T *y,
           emxArray_real_T *A, int ia0, int lda)
{
  double temp;
  int i;
  int ijA;
  int j;
  int jA;
  if (!(alpha1 == 0.0)) {
    jA = ia0;
    for (j = 0; j < n; j++) {
      if (y->data[j] != 0.0) {
        temp = y->data[j] * alpha1;
        i = m + jA;
        for (ijA = jA; ijA < i; ijA++) {
          A->data[ijA - 1] += A->data[((ix0 + ijA) - jA) - 1] * temp;
        }
      }
      jA += lda;
    }
  }
}

/*
 * File trailer for xgerc.c
 *
 * [EOF]
 */
