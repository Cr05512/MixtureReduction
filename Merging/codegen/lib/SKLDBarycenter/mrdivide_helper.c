/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: mrdivide_helper.c
 *
 * MATLAB Coder version            : 5.2
 * C/C++ source code generated on  : 31-Jan-2022 14:36:42
 */

/* Include Files */
#include "mrdivide_helper.h"
#include "SKLDBarycenter_data.h"
#include "SKLDBarycenter_emxutil.h"
#include "SKLDBarycenter_types.h"
#include "qrsolve.h"
#include "recip.h"
#include "rt_nonfinite.h"
#include <math.h>

/* Function Definitions */
/*
 * Arguments    : const emxArray_real_T *A
 *                const emxArray_creal_T *B
 *                emxArray_creal_T *Y
 * Return Type  : void
 */
void b_mrdiv(const emxArray_real_T *A, const emxArray_creal_T *B,
             emxArray_creal_T *Y)
{
  emxArray_creal_T *b_A;
  emxArray_creal_T *b_B;
  emxArray_int32_T *ipiv;
  emxArray_real_T *c_A;
  creal_T temp;
  double ai;
  double ar;
  double bi;
  double br;
  double brm;
  double re;
  double s;
  double smax;
  int A_tmp;
  int b_i;
  int b_n;
  int i;
  int i1;
  int j;
  int jBcol;
  int jj;
  int jp1j;
  int k;
  int ldap1;
  int mmj_tmp;
  int n;
  int nb;
  int u1;
  int yk;
  emxInit_creal_T(&b_A, 2);
  emxInit_int32_T(&ipiv, 2);
  emxInit_creal_T(&b_B, 2);
  emxInit_real_T(&c_A, 2);
  if ((A->size[0] == 0) || (A->size[1] == 0) ||
      ((B->size[0] == 0) || (B->size[1] == 0))) {
    i = Y->size[0] * Y->size[1];
    Y->size[0] = A->size[0];
    Y->size[1] = B->size[0];
    emxEnsureCapacity_creal_T(Y, i);
    n = A->size[0] * B->size[0];
    for (i = 0; i < n; i++) {
      Y->data[i].re = 0.0;
      Y->data[i].im = 0.0;
    }
  } else if (B->size[0] == B->size[1]) {
    i = Y->size[0] * Y->size[1];
    Y->size[0] = A->size[0];
    Y->size[1] = A->size[1];
    emxEnsureCapacity_creal_T(Y, i);
    n = A->size[0] * A->size[1];
    for (i = 0; i < n; i++) {
      Y->data[i].re = A->data[i];
      Y->data[i].im = 0.0;
    }
    b_n = B->size[1];
    i = b_A->size[0] * b_A->size[1];
    b_A->size[0] = B->size[0];
    b_A->size[1] = B->size[1];
    emxEnsureCapacity_creal_T(b_A, i);
    n = B->size[0] * B->size[1];
    for (i = 0; i < n; i++) {
      b_A->data[i] = B->data[i];
    }
    n = B->size[1];
    i = ipiv->size[0] * ipiv->size[1];
    ipiv->size[0] = 1;
    ipiv->size[1] = B->size[1];
    emxEnsureCapacity_int32_T(ipiv, i);
    ipiv->data[0] = 1;
    yk = 1;
    for (k = 2; k <= n; k++) {
      yk++;
      ipiv->data[k - 1] = yk;
    }
    ldap1 = B->size[1];
    yk = B->size[1] - 1;
    u1 = B->size[1];
    if (yk < u1) {
      u1 = yk;
    }
    for (j = 0; j < u1; j++) {
      mmj_tmp = b_n - j;
      jBcol = j * (b_n + 1);
      jj = j * (ldap1 + 1);
      jp1j = jBcol + 2;
      if (mmj_tmp < 1) {
        n = -1;
      } else {
        n = 0;
        if (mmj_tmp > 1) {
          smax = fabs(b_A->data[jj].re) + fabs(b_A->data[jj].im);
          for (k = 2; k <= mmj_tmp; k++) {
            yk = (jBcol + k) - 1;
            s = fabs(b_A->data[yk].re) + fabs(b_A->data[yk].im);
            if (s > smax) {
              n = k - 1;
              smax = s;
            }
          }
        }
      }
      A_tmp = jj + n;
      if ((b_A->data[A_tmp].re != 0.0) || (b_A->data[A_tmp].im != 0.0)) {
        if (n != 0) {
          n += j;
          ipiv->data[j] = n + 1;
          for (k = 0; k < b_n; k++) {
            yk = k * b_n;
            nb = j + yk;
            temp = b_A->data[nb];
            i = n + yk;
            b_A->data[nb] = b_A->data[i];
            b_A->data[i] = temp;
          }
        }
        i = jj + mmj_tmp;
        for (b_i = jp1j; b_i <= i; b_i++) {
          ar = b_A->data[b_i - 1].re;
          ai = b_A->data[b_i - 1].im;
          br = b_A->data[jj].re;
          bi = b_A->data[jj].im;
          if (bi == 0.0) {
            if (ai == 0.0) {
              re = ar / br;
              smax = 0.0;
            } else if (ar == 0.0) {
              re = 0.0;
              smax = ai / br;
            } else {
              re = ar / br;
              smax = ai / br;
            }
          } else if (br == 0.0) {
            if (ar == 0.0) {
              re = ai / bi;
              smax = 0.0;
            } else if (ai == 0.0) {
              re = 0.0;
              smax = -(ar / bi);
            } else {
              re = ai / bi;
              smax = -(ar / bi);
            }
          } else {
            brm = fabs(br);
            smax = fabs(bi);
            if (brm > smax) {
              s = bi / br;
              smax = br + s * bi;
              re = (ar + s * ai) / smax;
              smax = (ai - s * ar) / smax;
            } else if (smax == brm) {
              if (br > 0.0) {
                s = 0.5;
              } else {
                s = -0.5;
              }
              if (bi > 0.0) {
                smax = 0.5;
              } else {
                smax = -0.5;
              }
              re = (ar * s + ai * smax) / brm;
              smax = (ai * s - ar * smax) / brm;
            } else {
              s = br / bi;
              smax = bi + s * br;
              re = (s * ar + ai) / smax;
              smax = (s * ai - ar) / smax;
            }
          }
          b_A->data[b_i - 1].re = re;
          b_A->data[b_i - 1].im = smax;
        }
      }
      yk = jBcol + b_n;
      n = jj + ldap1;
      for (jBcol = 0; jBcol <= mmj_tmp - 2; jBcol++) {
        A_tmp = yk + jBcol * b_n;
        if ((b_A->data[A_tmp].re != 0.0) || (b_A->data[A_tmp].im != 0.0)) {
          temp.re = -b_A->data[A_tmp].re - b_A->data[A_tmp].im * 0.0;
          temp.im = b_A->data[A_tmp].re * 0.0 + -b_A->data[A_tmp].im;
          i = n + 2;
          i1 = mmj_tmp + n;
          for (nb = i; nb <= i1; nb++) {
            jp1j = ((jj + nb) - n) - 1;
            smax = b_A->data[jp1j].re * temp.im + b_A->data[jp1j].im * temp.re;
            b_A->data[nb - 1].re +=
                b_A->data[jp1j].re * temp.re - b_A->data[jp1j].im * temp.im;
            b_A->data[nb - 1].im += smax;
          }
        }
        n += b_n;
      }
    }
    nb = Y->size[0];
    for (j = 0; j < b_n; j++) {
      jBcol = nb * j - 1;
      yk = b_n * j;
      for (k = 0; k < j; k++) {
        n = nb * k;
        A_tmp = k + yk;
        if ((b_A->data[A_tmp].re != 0.0) || (b_A->data[A_tmp].im != 0.0)) {
          for (b_i = 0; b_i < nb; b_i++) {
            jp1j = b_i + n;
            smax = b_A->data[A_tmp].re * Y->data[jp1j].im +
                   b_A->data[A_tmp].im * Y->data[jp1j].re;
            i = (b_i + jBcol) + 1;
            Y->data[i].re -= b_A->data[A_tmp].re * Y->data[jp1j].re -
                             b_A->data[A_tmp].im * Y->data[jp1j].im;
            Y->data[i].im -= smax;
          }
        }
      }
      temp = recip(b_A->data[j + yk]);
      for (b_i = 0; b_i < nb; b_i++) {
        yk = (b_i + jBcol) + 1;
        smax = temp.re * Y->data[yk].im + temp.im * Y->data[yk].re;
        Y->data[yk].re = temp.re * Y->data[yk].re - temp.im * Y->data[yk].im;
        Y->data[yk].im = smax;
      }
    }
    for (j = b_n; j >= 1; j--) {
      jBcol = nb * (j - 1) - 1;
      yk = b_n * (j - 1) - 1;
      i = j + 1;
      for (k = i; k <= b_n; k++) {
        n = nb * (k - 1);
        A_tmp = k + yk;
        if ((b_A->data[A_tmp].re != 0.0) || (b_A->data[A_tmp].im != 0.0)) {
          for (b_i = 0; b_i < nb; b_i++) {
            jp1j = b_i + n;
            smax = b_A->data[A_tmp].re * Y->data[jp1j].im +
                   b_A->data[A_tmp].im * Y->data[jp1j].re;
            i1 = (b_i + jBcol) + 1;
            Y->data[i1].re -= b_A->data[A_tmp].re * Y->data[jp1j].re -
                              b_A->data[A_tmp].im * Y->data[jp1j].im;
            Y->data[i1].im -= smax;
          }
        }
      }
    }
    i = B->size[1] - 1;
    for (j = i; j >= 1; j--) {
      i1 = ipiv->data[j - 1];
      if (i1 != j) {
        for (b_i = 0; b_i < nb; b_i++) {
          temp = Y->data[b_i + Y->size[0] * (j - 1)];
          Y->data[b_i + Y->size[0] * (j - 1)] =
              Y->data[b_i + Y->size[0] * (i1 - 1)];
          Y->data[b_i + Y->size[0] * (i1 - 1)] = temp;
        }
      }
    }
  } else {
    i = b_B->size[0] * b_B->size[1];
    b_B->size[0] = B->size[1];
    b_B->size[1] = B->size[0];
    emxEnsureCapacity_creal_T(b_B, i);
    n = B->size[0];
    for (i = 0; i < n; i++) {
      yk = B->size[1];
      for (i1 = 0; i1 < yk; i1++) {
        b_B->data[i1 + b_B->size[0] * i].re = B->data[i + B->size[0] * i1].re;
        b_B->data[i1 + b_B->size[0] * i].im = -B->data[i + B->size[0] * i1].im;
      }
    }
    i = c_A->size[0] * c_A->size[1];
    c_A->size[0] = A->size[1];
    c_A->size[1] = A->size[0];
    emxEnsureCapacity_real_T(c_A, i);
    n = A->size[0];
    for (i = 0; i < n; i++) {
      yk = A->size[1];
      for (i1 = 0; i1 < yk; i1++) {
        c_A->data[i1 + c_A->size[0] * i] = A->data[i + A->size[0] * i1];
      }
    }
    b_qrsolve(b_B, c_A, b_A);
    i = Y->size[0] * Y->size[1];
    Y->size[0] = b_A->size[1];
    Y->size[1] = b_A->size[0];
    emxEnsureCapacity_creal_T(Y, i);
    n = b_A->size[0];
    for (i = 0; i < n; i++) {
      yk = b_A->size[1];
      for (i1 = 0; i1 < yk; i1++) {
        Y->data[i1 + Y->size[0] * i].re = b_A->data[i + b_A->size[0] * i1].re;
        Y->data[i1 + Y->size[0] * i].im = -b_A->data[i + b_A->size[0] * i1].im;
      }
    }
  }
  emxFree_real_T(&c_A);
  emxFree_creal_T(&b_B);
  emxFree_int32_T(&ipiv);
  emxFree_creal_T(&b_A);
}

/*
 * Arguments    : const emxArray_real_T *A
 *                const emxArray_real_T *B
 *                emxArray_real_T *Y
 * Return Type  : void
 */
void mrdiv(const emxArray_real_T *A, const emxArray_real_T *B,
           emxArray_real_T *Y)
{
  emxArray_int32_T *ipiv;
  emxArray_real_T *b_A;
  emxArray_real_T *b_B;
  emxArray_real_T *c_A;
  double s;
  double smax;
  int b_i;
  int b_n;
  int i;
  int i1;
  int j;
  int jA;
  int jj;
  int jp1j;
  int k;
  int kBcol;
  int ldap1;
  int mmj_tmp;
  int n;
  int u1;
  int yk;
  emxInit_real_T(&b_A, 2);
  emxInit_int32_T(&ipiv, 2);
  emxInit_real_T(&b_B, 2);
  emxInit_real_T(&c_A, 2);
  if ((A->size[0] == 0) || (A->size[1] == 0) ||
      ((B->size[0] == 0) || (B->size[1] == 0))) {
    i = Y->size[0] * Y->size[1];
    Y->size[0] = A->size[0];
    Y->size[1] = B->size[0];
    emxEnsureCapacity_real_T(Y, i);
    n = A->size[0] * B->size[0];
    for (i = 0; i < n; i++) {
      Y->data[i] = 0.0;
    }
  } else if (B->size[0] == B->size[1]) {
    i = Y->size[0] * Y->size[1];
    Y->size[0] = A->size[0];
    Y->size[1] = A->size[1];
    emxEnsureCapacity_real_T(Y, i);
    n = A->size[0] * A->size[1];
    for (i = 0; i < n; i++) {
      Y->data[i] = A->data[i];
    }
    b_n = B->size[1];
    i = b_A->size[0] * b_A->size[1];
    b_A->size[0] = B->size[0];
    b_A->size[1] = B->size[1];
    emxEnsureCapacity_real_T(b_A, i);
    n = B->size[0] * B->size[1];
    for (i = 0; i < n; i++) {
      b_A->data[i] = B->data[i];
    }
    n = B->size[1];
    i = ipiv->size[0] * ipiv->size[1];
    ipiv->size[0] = 1;
    ipiv->size[1] = B->size[1];
    emxEnsureCapacity_int32_T(ipiv, i);
    ipiv->data[0] = 1;
    yk = 1;
    for (k = 2; k <= n; k++) {
      yk++;
      ipiv->data[k - 1] = yk;
    }
    ldap1 = B->size[1];
    yk = B->size[1] - 1;
    u1 = B->size[1];
    if (yk < u1) {
      u1 = yk;
    }
    for (j = 0; j < u1; j++) {
      mmj_tmp = b_n - j;
      kBcol = j * (b_n + 1);
      jj = j * (ldap1 + 1);
      jp1j = kBcol + 2;
      if (mmj_tmp < 1) {
        yk = -1;
      } else {
        yk = 0;
        if (mmj_tmp > 1) {
          smax = fabs(b_A->data[jj]);
          for (k = 2; k <= mmj_tmp; k++) {
            s = fabs(b_A->data[(kBcol + k) - 1]);
            if (s > smax) {
              yk = k - 1;
              smax = s;
            }
          }
        }
      }
      if (b_A->data[jj + yk] != 0.0) {
        if (yk != 0) {
          n = j + yk;
          ipiv->data[j] = n + 1;
          for (k = 0; k < b_n; k++) {
            yk = k * b_n;
            jA = j + yk;
            smax = b_A->data[jA];
            i = n + yk;
            b_A->data[jA] = b_A->data[i];
            b_A->data[i] = smax;
          }
        }
        i = jj + mmj_tmp;
        for (b_i = jp1j; b_i <= i; b_i++) {
          b_A->data[b_i - 1] /= b_A->data[jj];
        }
      }
      n = kBcol + b_n;
      jA = jj + ldap1;
      for (kBcol = 0; kBcol <= mmj_tmp - 2; kBcol++) {
        yk = n + kBcol * b_n;
        smax = b_A->data[yk];
        if (b_A->data[yk] != 0.0) {
          i = jA + 2;
          i1 = mmj_tmp + jA;
          for (yk = i; yk <= i1; yk++) {
            b_A->data[yk - 1] += b_A->data[((jj + yk) - jA) - 1] * -smax;
          }
        }
        jA += b_n;
      }
    }
    yk = A->size[0];
    for (j = 0; j < b_n; j++) {
      n = yk * j - 1;
      jA = b_n * j;
      for (k = 0; k < j; k++) {
        kBcol = yk * k;
        i = k + jA;
        if (b_A->data[i] != 0.0) {
          for (b_i = 0; b_i < yk; b_i++) {
            i1 = (b_i + n) + 1;
            Y->data[i1] -= b_A->data[i] * Y->data[b_i + kBcol];
          }
        }
      }
      smax = 1.0 / b_A->data[j + jA];
      for (b_i = 0; b_i < yk; b_i++) {
        i = (b_i + n) + 1;
        Y->data[i] *= smax;
      }
    }
    for (j = b_n; j >= 1; j--) {
      n = yk * (j - 1) - 1;
      jA = b_n * (j - 1) - 1;
      i = j + 1;
      for (k = i; k <= b_n; k++) {
        kBcol = yk * (k - 1);
        i1 = k + jA;
        if (b_A->data[i1] != 0.0) {
          for (b_i = 0; b_i < yk; b_i++) {
            jp1j = (b_i + n) + 1;
            Y->data[jp1j] -= b_A->data[i1] * Y->data[b_i + kBcol];
          }
        }
      }
    }
    i = B->size[1] - 1;
    for (j = i; j >= 1; j--) {
      i1 = ipiv->data[j - 1];
      if (i1 != j) {
        for (b_i = 0; b_i < yk; b_i++) {
          smax = Y->data[b_i + Y->size[0] * (j - 1)];
          Y->data[b_i + Y->size[0] * (j - 1)] =
              Y->data[b_i + Y->size[0] * (i1 - 1)];
          Y->data[b_i + Y->size[0] * (i1 - 1)] = smax;
        }
      }
    }
  } else {
    i = b_B->size[0] * b_B->size[1];
    b_B->size[0] = B->size[1];
    b_B->size[1] = B->size[0];
    emxEnsureCapacity_real_T(b_B, i);
    n = B->size[0];
    for (i = 0; i < n; i++) {
      yk = B->size[1];
      for (i1 = 0; i1 < yk; i1++) {
        b_B->data[i1 + b_B->size[0] * i] = B->data[i + B->size[0] * i1];
      }
    }
    i = c_A->size[0] * c_A->size[1];
    c_A->size[0] = A->size[1];
    c_A->size[1] = A->size[0];
    emxEnsureCapacity_real_T(c_A, i);
    n = A->size[0];
    for (i = 0; i < n; i++) {
      yk = A->size[1];
      for (i1 = 0; i1 < yk; i1++) {
        c_A->data[i1 + c_A->size[0] * i] = A->data[i + A->size[0] * i1];
      }
    }
    qrsolve(b_B, c_A, b_A);
    i = Y->size[0] * Y->size[1];
    Y->size[0] = b_A->size[1];
    Y->size[1] = b_A->size[0];
    emxEnsureCapacity_real_T(Y, i);
    n = b_A->size[0];
    for (i = 0; i < n; i++) {
      yk = b_A->size[1];
      for (i1 = 0; i1 < yk; i1++) {
        Y->data[i1 + Y->size[0] * i] = b_A->data[i + b_A->size[0] * i1];
      }
    }
  }
  emxFree_real_T(&c_A);
  emxFree_real_T(&b_B);
  emxFree_int32_T(&ipiv);
  emxFree_real_T(&b_A);
}

/*
 * File trailer for mrdivide_helper.c
 *
 * [EOF]
 */
