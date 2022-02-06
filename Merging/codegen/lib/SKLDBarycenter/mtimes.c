/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: mtimes.c
 *
 * MATLAB Coder version            : 5.2
 * C/C++ source code generated on  : 31-Jan-2022 14:36:42
 */

/* Include Files */
#include "mtimes.h"
#include "SKLDBarycenter_emxutil.h"
#include "SKLDBarycenter_types.h"
#include "rt_nonfinite.h"

/* Function Definitions */
/*
 * Arguments    : const emxArray_creal_T *A
 *                const emxArray_creal_T *B
 *                emxArray_creal_T *C
 * Return Type  : void
 */
void b_mtimes(const emxArray_creal_T *A, const emxArray_creal_T *B,
              emxArray_creal_T *C)
{
  double B_im;
  double B_re;
  double s_im;
  double s_re;
  int coffset;
  int i;
  int inner;
  int j;
  int k;
  int m;
  int n;
  m = A->size[0];
  inner = A->size[1];
  n = B->size[0];
  k = C->size[0] * C->size[1];
  C->size[0] = A->size[0];
  C->size[1] = B->size[0];
  emxEnsureCapacity_creal_T(C, k);
  for (j = 0; j < n; j++) {
    coffset = j * m;
    for (i = 0; i < m; i++) {
      s_re = 0.0;
      s_im = 0.0;
      for (k = 0; k < inner; k++) {
        B_re = B->data[k * B->size[0] + j].re;
        B_im = -B->data[k * B->size[0] + j].im;
        s_re += A->data[k * A->size[0] + i].re * B_re -
                A->data[k * A->size[0] + i].im * B_im;
        s_im += A->data[k * A->size[0] + i].re * B_im +
                A->data[k * A->size[0] + i].im * B_re;
      }
      k = coffset + i;
      C->data[k].re = s_re;
      C->data[k].im = s_im;
    }
  }
}

/*
 * Arguments    : const emxArray_real_T *A
 *                const emxArray_real_T *B
 *                emxArray_real_T *C
 * Return Type  : void
 */
void c_mtimes(const emxArray_real_T *A, const emxArray_real_T *B,
              emxArray_real_T *C)
{
  double bkj;
  int aoffset;
  int b_i;
  int boffset;
  int coffset;
  int i;
  int inner;
  int j;
  int k;
  int mc;
  int nc;
  mc = A->size[0];
  inner = A->size[1];
  nc = B->size[1];
  i = C->size[0] * C->size[1];
  C->size[0] = A->size[0];
  C->size[1] = B->size[1];
  emxEnsureCapacity_real_T(C, i);
  for (j = 0; j < nc; j++) {
    coffset = j * mc;
    boffset = j * B->size[0];
    for (b_i = 0; b_i < mc; b_i++) {
      C->data[coffset + b_i] = 0.0;
    }
    for (k = 0; k < inner; k++) {
      aoffset = k * A->size[0];
      bkj = B->data[boffset + k];
      for (b_i = 0; b_i < mc; b_i++) {
        i = coffset + b_i;
        C->data[i] += A->data[aoffset + b_i] * bkj;
      }
    }
  }
}

/*
 * Arguments    : const emxArray_creal_T *A
 *                const emxArray_creal_T *B
 *                emxArray_creal_T *C
 * Return Type  : void
 */
void mtimes(const emxArray_creal_T *A, const emxArray_creal_T *B,
            emxArray_creal_T *C)
{
  double s_im;
  double s_re;
  int A_re_tmp;
  int boffset;
  int coffset;
  int i;
  int inner;
  int j;
  int k;
  int m;
  int n;
  m = A->size[0];
  inner = A->size[1];
  n = B->size[1];
  A_re_tmp = C->size[0] * C->size[1];
  C->size[0] = A->size[0];
  C->size[1] = B->size[1];
  emxEnsureCapacity_creal_T(C, A_re_tmp);
  for (j = 0; j < n; j++) {
    coffset = j * m;
    boffset = j * B->size[0];
    for (i = 0; i < m; i++) {
      s_re = 0.0;
      s_im = 0.0;
      for (k = 0; k < inner; k++) {
        A_re_tmp = boffset + k;
        s_re += A->data[k * A->size[0] + i].re * B->data[A_re_tmp].re -
                A->data[k * A->size[0] + i].im * B->data[A_re_tmp].im;
        s_im += A->data[k * A->size[0] + i].re * B->data[A_re_tmp].im +
                A->data[k * A->size[0] + i].im * B->data[A_re_tmp].re;
      }
      A_re_tmp = coffset + i;
      C->data[A_re_tmp].re = s_re;
      C->data[A_re_tmp].im = s_im;
    }
  }
}

/*
 * File trailer for mtimes.c
 *
 * [EOF]
 */
