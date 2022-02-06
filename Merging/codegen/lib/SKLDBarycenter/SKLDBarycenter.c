/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: SKLDBarycenter.c
 *
 * MATLAB Coder version            : 5.2
 * C/C++ source code generated on  : 31-Jan-2022 14:36:42
 */

/* Include Files */
#include "SKLDBarycenter.h"
#include "SKLDBarycenter_emxutil.h"
#include "SKLDBarycenter_types.h"
#include "mrdivide_helper.h"
#include "mtimes.h"
#include "rt_nonfinite.h"
#include "sqrtm.h"
#include "sum.h"
#include <math.h>

/* Function Definitions */
/*
 * Arguments    : const emxArray_struct0_T *comps
 *                double maxiter
 *                double tol
 *                struct0_T *bar
 * Return Type  : void
 */
void SKLDBarycenter(const emxArray_struct0_T *comps, double maxiter, double tol,
                    struct0_T *bar)
{
  emxArray_creal_T *b_srPsiCIinv;
  emxArray_creal_T *c_Sigmainv;
  emxArray_creal_T *r;
  emxArray_creal_T *srPsiCI;
  emxArray_creal_T *srPsiCIinv;
  emxArray_real_T *A_tmp;
  emxArray_real_T *PsiCIinv;
  emxArray_real_T *Sigma;
  emxArray_real_T *Sigmabar;
  emxArray_real_T *Sigmai;
  emxArray_real_T *Sigmaiinv;
  emxArray_real_T *Sigmainv;
  emxArray_real_T *Sigmajinv;
  emxArray_real_T *b_Sigma;
  emxArray_real_T *b_Sigmainv;
  emxArray_real_T *b_mubar;
  emxArray_real_T *barOld_mu;
  emxArray_real_T *bsum;
  emxArray_real_T *c_Sigma;
  emxArray_real_T *muCI;
  emxArray_real_T *mubar;
  emxArray_real_T *mui;
  emxArray_real_T *wSigmainv;
  emxArray_real_T *wi;
  double a;
  double d_Sigmainv;
  double sumWi;
  double wbar;
  int aoffset;
  int bvstride;
  int d;
  int hi;
  int k;
  int lastBlockLength;
  int nblocks;
  int vstride;
  int xblockoffset;
  int xj;
  int xoffset;
  boolean_T exitg1;
  emxInit_real_T(&Sigmainv, 2);
  emxInit_real_T(&Sigma, 3);
  emxInit_real_T(&bsum, 1);
  /*  KLDBar = KLDBarycenter(comps): */
  /*  INPUTS: */
  /*  - comps, a vector of weighted Gaussian components (numComps x 1 vector).
   */
  /*  OUTPUTS: */
  /*  - KLDBar, the moment preserving merge of the input components (weighted
   * Gaussian density). */
  /*  This function takes as input a vecot of Gaussian components and returns */
  /*  their moment-preseving merge (KLD-barycenter). */
  /*  [w,mu,Sigma] = paramsFromMixture(gm): */
  /*  INPUT: */
  /*  - gm, a Gaussian Mixture. */
  /*  OUTPUT: */
  /*  - w, weight vector (size N x 1), */
  /*  - mu, mean vector (size d x N), */
  /*  - Sigma, covariance 3D matrix (size d x d x N). */
  /*  This function returns the mixture parameters in separate data structures.
   */
  xj = bsum->size[0];
  bsum->size[0] = comps->size[0];
  emxEnsureCapacity_real_T(bsum, xj);
  xj = Sigmainv->size[0] * Sigmainv->size[1];
  Sigmainv->size[0] = comps->data[0].mu->size[0];
  Sigmainv->size[1] = comps->size[0];
  emxEnsureCapacity_real_T(Sigmainv, xj);
  xj = Sigma->size[0] * Sigma->size[1] * Sigma->size[2];
  Sigma->size[0] = comps->data[0].mu->size[0];
  Sigma->size[1] = comps->data[0].mu->size[0];
  Sigma->size[2] = comps->size[0];
  emxEnsureCapacity_real_T(Sigma, xj);
  xj = comps->size[0];
  for (xoffset = 0; xoffset < xj; xoffset++) {
    bsum->data[xoffset] = comps->data[xoffset].w;
    hi = comps->data[xoffset].mu->size[0];
    for (lastBlockLength = 0; lastBlockLength < hi; lastBlockLength++) {
      Sigmainv->data[lastBlockLength + Sigmainv->size[0] * xoffset] =
          comps->data[xoffset].mu->data[lastBlockLength];
    }
    hi = comps->data[xoffset].Sigma->size[1];
    for (lastBlockLength = 0; lastBlockLength < hi; lastBlockLength++) {
      xblockoffset = comps->data[xoffset].Sigma->size[0];
      for (nblocks = 0; nblocks < xblockoffset; nblocks++) {
        Sigma->data[(nblocks + Sigma->size[0] * lastBlockLength) +
                    Sigma->size[0] * Sigma->size[1] * xoffset] =
            comps->data[xoffset]
                .Sigma->data[nblocks + comps->data[xoffset].Sigma->size[0] *
                                           lastBlockLength];
      }
    }
  }
  emxInit_real_T(&mubar, 1);
  wbar = sum(bsum);
  hi = Sigmainv->size[0];
  xj = mubar->size[0];
  mubar->size[0] = Sigmainv->size[0];
  emxEnsureCapacity_real_T(mubar, xj);
  for (xj = 0; xj < hi; xj++) {
    mubar->data[xj] = 0.0;
  }
  xj = comps->size[0];
  for (xoffset = 0; xoffset < xj; xoffset++) {
    hi = mubar->size[0];
    for (lastBlockLength = 0; lastBlockLength < hi; lastBlockLength++) {
      mubar->data[lastBlockLength] +=
          bsum->data[xoffset] *
          Sigmainv->data[lastBlockLength + Sigmainv->size[0] * xoffset];
    }
  }
  a = 1.0 / wbar;
  hi = mubar->size[0];
  for (xj = 0; xj < hi; xj++) {
    mubar->data[xj] *= a;
  }
  emxInit_real_T(&Sigmabar, 2);
  xj = Sigmabar->size[0] * Sigmabar->size[1];
  Sigmabar->size[0] = Sigmainv->size[0];
  Sigmabar->size[1] = Sigmainv->size[0];
  emxEnsureCapacity_real_T(Sigmabar, xj);
  hi = Sigmainv->size[0] * Sigmainv->size[0];
  for (xj = 0; xj < hi; xj++) {
    Sigmabar->data[xj] = 0.0;
  }
  xj = comps->size[0];
  emxInit_real_T(&b_mubar, 1);
  emxInit_real_T(&b_Sigmainv, 2);
  emxInit_real_T(&b_Sigma, 2);
  for (xoffset = 0; xoffset < xj; xoffset++) {
    hi = Sigmainv->size[0];
    lastBlockLength = b_mubar->size[0];
    b_mubar->size[0] = Sigmainv->size[0];
    emxEnsureCapacity_real_T(b_mubar, lastBlockLength);
    lastBlockLength = b_Sigmainv->size[0] * b_Sigmainv->size[1];
    b_Sigmainv->size[0] = 1;
    b_Sigmainv->size[1] = Sigmainv->size[0];
    emxEnsureCapacity_real_T(b_Sigmainv, lastBlockLength);
    for (lastBlockLength = 0; lastBlockLength < hi; lastBlockLength++) {
      a = Sigmainv->data[lastBlockLength + Sigmainv->size[0] * xoffset] -
          mubar->data[lastBlockLength];
      b_mubar->data[lastBlockLength] = a;
      b_Sigmainv->data[lastBlockLength] = a;
    }
    lastBlockLength = b_Sigma->size[0] * b_Sigma->size[1];
    b_Sigma->size[0] = b_mubar->size[0];
    b_Sigma->size[1] = b_Sigmainv->size[1];
    emxEnsureCapacity_real_T(b_Sigma, lastBlockLength);
    hi = b_Sigmainv->size[1];
    for (lastBlockLength = 0; lastBlockLength < hi; lastBlockLength++) {
      xblockoffset = b_mubar->size[0];
      for (nblocks = 0; nblocks < xblockoffset; nblocks++) {
        b_Sigma->data[nblocks + b_Sigma->size[0] * lastBlockLength] =
            Sigma->data[(nblocks + Sigma->size[0] * lastBlockLength) +
                        Sigma->size[0] * Sigma->size[1] * xoffset] +
            b_mubar->data[nblocks] * b_Sigmainv->data[lastBlockLength];
      }
    }
    hi = Sigmabar->size[0] * Sigmabar->size[1];
    for (lastBlockLength = 0; lastBlockLength < hi; lastBlockLength++) {
      Sigmabar->data[lastBlockLength] +=
          bsum->data[xoffset] * b_Sigma->data[lastBlockLength];
    }
  }
  emxFree_real_T(&Sigma);
  xj = bar->Sigma->size[0] * bar->Sigma->size[1];
  bar->Sigma->size[0] = Sigmabar->size[0];
  bar->Sigma->size[1] = Sigmabar->size[1];
  emxEnsureCapacity_real_T(bar->Sigma, xj);
  hi = Sigmabar->size[0] * Sigmabar->size[1];
  for (xj = 0; xj < hi; xj++) {
    bar->Sigma->data[xj] = Sigmabar->data[xj] / wbar;
  }
  bar->w = wbar;
  xj = bar->mu->size[0];
  bar->mu->size[0] = mubar->size[0];
  emxEnsureCapacity_real_T(bar->mu, xj);
  hi = mubar->size[0];
  for (xj = 0; xj < hi; xj++) {
    bar->mu->data[xj] = mubar->data[xj];
  }
  emxInit_real_T(&wi, 1);
  emxInit_real_T(&mui, 2);
  emxInit_real_T(&Sigmai, 3);
  /*       [~,idx] = max([comps.w]); */
  /*       bar = comps(idx); */
  /*       bar.w = sum([comps.w]); */
  d = comps->data[0].mu->size[0];
  /*  [w,mu,Sigma] = paramsFromMixture(gm): */
  /*  INPUT: */
  /*  - gm, a Gaussian Mixture. */
  /*  OUTPUT: */
  /*  - w, weight vector (size N x 1), */
  /*  - mu, mean vector (size d x N), */
  /*  - Sigma, covariance 3D matrix (size d x d x N). */
  /*  This function returns the mixture parameters in separate data structures.
   */
  xj = wi->size[0];
  wi->size[0] = comps->size[0];
  emxEnsureCapacity_real_T(wi, xj);
  xj = mui->size[0] * mui->size[1];
  mui->size[0] = comps->data[0].mu->size[0];
  mui->size[1] = comps->size[0];
  emxEnsureCapacity_real_T(mui, xj);
  xj = Sigmai->size[0] * Sigmai->size[1] * Sigmai->size[2];
  Sigmai->size[0] = comps->data[0].mu->size[0];
  Sigmai->size[1] = comps->data[0].mu->size[0];
  Sigmai->size[2] = comps->size[0];
  emxEnsureCapacity_real_T(Sigmai, xj);
  xj = comps->size[0];
  for (xoffset = 0; xoffset < xj; xoffset++) {
    wi->data[xoffset] = comps->data[xoffset].w;
    hi = comps->data[xoffset].mu->size[0];
    for (lastBlockLength = 0; lastBlockLength < hi; lastBlockLength++) {
      mui->data[lastBlockLength + mui->size[0] * xoffset] =
          comps->data[xoffset].mu->data[lastBlockLength];
    }
    hi = comps->data[xoffset].Sigma->size[1];
    for (lastBlockLength = 0; lastBlockLength < hi; lastBlockLength++) {
      xblockoffset = comps->data[xoffset].Sigma->size[0];
      for (nblocks = 0; nblocks < xblockoffset; nblocks++) {
        Sigmai->data[(nblocks + Sigmai->size[0] * lastBlockLength) +
                     Sigmai->size[0] * Sigmai->size[1] * xoffset] =
            comps->data[xoffset]
                .Sigma->data[nblocks + comps->data[xoffset].Sigma->size[0] *
                                           lastBlockLength];
      }
    }
  }
  emxInit_real_T(&muCI, 1);
  emxInit_real_T(&c_Sigma, 3);
  emxInit_real_T(&Sigmaiinv, 2);
  sumWi = sum(wi);
  /*  KLDBar = KLDBarycenter(comps): */
  /*  INPUTS: */
  /*  - comps, a vector of weighted Gaussian components (numComps x 1 vector).
   */
  /*  OUTPUTS: */
  /*  - KLDBar, the moment preserving merge of the input components (weighted
   * Gaussian density). */
  /*  This function takes as input a vecot of Gaussian components and returns */
  /*  their moment-preseving merge (KLD-barycenter). */
  /*  [w,mu,Sigma] = paramsFromMixture(gm): */
  /*  INPUT: */
  /*  - gm, a Gaussian Mixture. */
  /*  OUTPUT: */
  /*  - w, weight vector (size N x 1), */
  /*  - mu, mean vector (size d x N), */
  /*  - Sigma, covariance 3D matrix (size d x d x N). */
  /*  This function returns the mixture parameters in separate data structures.
   */
  xj = muCI->size[0];
  muCI->size[0] = comps->size[0];
  emxEnsureCapacity_real_T(muCI, xj);
  xj = Sigmaiinv->size[0] * Sigmaiinv->size[1];
  Sigmaiinv->size[0] = comps->data[0].mu->size[0];
  Sigmaiinv->size[1] = comps->size[0];
  emxEnsureCapacity_real_T(Sigmaiinv, xj);
  xj = c_Sigma->size[0] * c_Sigma->size[1] * c_Sigma->size[2];
  c_Sigma->size[0] = comps->data[0].mu->size[0];
  c_Sigma->size[1] = comps->data[0].mu->size[0];
  c_Sigma->size[2] = comps->size[0];
  emxEnsureCapacity_real_T(c_Sigma, xj);
  xj = comps->size[0];
  for (xoffset = 0; xoffset < xj; xoffset++) {
    muCI->data[xoffset] = comps->data[xoffset].w;
    hi = comps->data[xoffset].mu->size[0];
    for (lastBlockLength = 0; lastBlockLength < hi; lastBlockLength++) {
      Sigmaiinv->data[lastBlockLength + Sigmaiinv->size[0] * xoffset] =
          comps->data[xoffset].mu->data[lastBlockLength];
    }
    hi = comps->data[xoffset].Sigma->size[1];
    for (lastBlockLength = 0; lastBlockLength < hi; lastBlockLength++) {
      xblockoffset = comps->data[xoffset].Sigma->size[0];
      for (nblocks = 0; nblocks < xblockoffset; nblocks++) {
        c_Sigma->data[(nblocks + c_Sigma->size[0] * lastBlockLength) +
                      c_Sigma->size[0] * c_Sigma->size[1] * xoffset] =
            comps->data[xoffset]
                .Sigma->data[nblocks + comps->data[xoffset].Sigma->size[0] *
                                           lastBlockLength];
      }
    }
  }
  a = sum(muCI);
  hi = Sigmaiinv->size[0];
  xj = b_mubar->size[0];
  b_mubar->size[0] = Sigmaiinv->size[0];
  emxEnsureCapacity_real_T(b_mubar, xj);
  for (xj = 0; xj < hi; xj++) {
    b_mubar->data[xj] = 0.0;
  }
  emxInit_real_T(&wSigmainv, 3);
  xj = wSigmainv->size[0] * wSigmainv->size[1] * wSigmainv->size[2];
  wSigmainv->size[0] = Sigmaiinv->size[0];
  wSigmainv->size[1] = Sigmaiinv->size[0];
  wSigmainv->size[2] = comps->size[0];
  emxEnsureCapacity_real_T(wSigmainv, xj);
  xj = comps->size[0];
  emxInit_real_T(&Sigmajinv, 2);
  for (xoffset = 0; xoffset < xj; xoffset++) {
    lastBlockLength = Sigmaiinv->size[0] - 1;
    nblocks = Sigmajinv->size[0] * Sigmajinv->size[1];
    Sigmajinv->size[0] = Sigmaiinv->size[0];
    Sigmajinv->size[1] = Sigmaiinv->size[0];
    emxEnsureCapacity_real_T(Sigmajinv, nblocks);
    hi = Sigmaiinv->size[0] * Sigmaiinv->size[0];
    for (nblocks = 0; nblocks < hi; nblocks++) {
      Sigmajinv->data[nblocks] = 0.0;
    }
    if (Sigmaiinv->size[0] > 0) {
      for (k = 0; k <= lastBlockLength; k++) {
        Sigmajinv->data[k + Sigmajinv->size[0] * k] = 1.0;
      }
    }
    lastBlockLength = Sigmabar->size[0] * Sigmabar->size[1];
    Sigmabar->size[0] = Sigmajinv->size[0];
    Sigmabar->size[1] = Sigmajinv->size[1];
    emxEnsureCapacity_real_T(Sigmabar, lastBlockLength);
    hi = Sigmajinv->size[0] * Sigmajinv->size[1];
    for (lastBlockLength = 0; lastBlockLength < hi; lastBlockLength++) {
      Sigmabar->data[lastBlockLength] =
          muCI->data[xoffset] * Sigmajinv->data[lastBlockLength];
    }
    hi = c_Sigma->size[0];
    xblockoffset = c_Sigma->size[1];
    lastBlockLength = b_Sigma->size[0] * b_Sigma->size[1];
    b_Sigma->size[0] = c_Sigma->size[0];
    b_Sigma->size[1] = c_Sigma->size[1];
    emxEnsureCapacity_real_T(b_Sigma, lastBlockLength);
    for (lastBlockLength = 0; lastBlockLength < xblockoffset;
         lastBlockLength++) {
      for (nblocks = 0; nblocks < hi; nblocks++) {
        b_Sigma->data[nblocks + b_Sigma->size[0] * lastBlockLength] =
            c_Sigma->data[(nblocks + c_Sigma->size[0] * lastBlockLength) +
                          c_Sigma->size[0] * c_Sigma->size[1] * xoffset];
      }
    }
    mrdiv(Sigmabar, b_Sigma, Sigmajinv);
    hi = Sigmajinv->size[1];
    for (lastBlockLength = 0; lastBlockLength < hi; lastBlockLength++) {
      xblockoffset = Sigmajinv->size[0];
      for (nblocks = 0; nblocks < xblockoffset; nblocks++) {
        wSigmainv->data[(nblocks + wSigmainv->size[0] * lastBlockLength) +
                        wSigmainv->size[0] * wSigmainv->size[1] * xoffset] =
            Sigmajinv->data[nblocks + Sigmajinv->size[0] * lastBlockLength];
      }
    }
    xblockoffset = wSigmainv->size[0] - 1;
    hi = wSigmainv->size[1] - 1;
    lastBlockLength = bsum->size[0];
    bsum->size[0] = wSigmainv->size[0];
    emxEnsureCapacity_real_T(bsum, lastBlockLength);
    for (nblocks = 0; nblocks <= xblockoffset; nblocks++) {
      bsum->data[nblocks] = 0.0;
    }
    for (k = 0; k <= hi; k++) {
      aoffset = k * wSigmainv->size[0];
      for (nblocks = 0; nblocks <= xblockoffset; nblocks++) {
        lastBlockLength = aoffset + nblocks;
        bsum->data[nblocks] +=
            wSigmainv->data[(lastBlockLength % wSigmainv->size[0] +
                             wSigmainv->size[0] *
                                 (lastBlockLength / wSigmainv->size[0])) +
                            wSigmainv->size[0] * wSigmainv->size[1] * xoffset] *
            Sigmaiinv->data[k + Sigmaiinv->size[0] * xoffset];
      }
    }
    hi = b_mubar->size[0];
    for (lastBlockLength = 0; lastBlockLength < hi; lastBlockLength++) {
      b_mubar->data[lastBlockLength] += bsum->data[lastBlockLength];
    }
  }
  emxFree_real_T(&c_Sigma);
  xj = Sigmaiinv->size[0] - 1;
  lastBlockLength = Sigmajinv->size[0] * Sigmajinv->size[1];
  Sigmajinv->size[0] = Sigmaiinv->size[0];
  Sigmajinv->size[1] = Sigmaiinv->size[0];
  emxEnsureCapacity_real_T(Sigmajinv, lastBlockLength);
  hi = Sigmaiinv->size[0] * Sigmaiinv->size[0];
  for (lastBlockLength = 0; lastBlockLength < hi; lastBlockLength++) {
    Sigmajinv->data[lastBlockLength] = 0.0;
  }
  if (Sigmaiinv->size[0] > 0) {
    for (k = 0; k <= xj; k++) {
      Sigmajinv->data[k + Sigmajinv->size[0] * k] = 1.0;
    }
  }
  if ((wSigmainv->size[0] == 0) || (wSigmainv->size[1] == 0) ||
      (wSigmainv->size[2] == 0)) {
    xj = Sigmainv->size[0] * Sigmainv->size[1];
    Sigmainv->size[0] = wSigmainv->size[0];
    Sigmainv->size[1] = wSigmainv->size[1];
    emxEnsureCapacity_real_T(Sigmainv, xj);
    hi = wSigmainv->size[0] * wSigmainv->size[1];
    for (xj = 0; xj < hi; xj++) {
      Sigmainv->data[xj] = 0.0;
    }
  } else {
    if (wSigmainv->size[2] == 1) {
      vstride = wSigmainv->size[0] * wSigmainv->size[1] * wSigmainv->size[2];
    } else {
      vstride = wSigmainv->size[0] * wSigmainv->size[1];
    }
    bvstride = vstride << 10;
    xj = Sigmainv->size[0] * Sigmainv->size[1];
    Sigmainv->size[0] = wSigmainv->size[0];
    Sigmainv->size[1] = wSigmainv->size[1];
    emxEnsureCapacity_real_T(Sigmainv, xj);
    xj = bsum->size[0];
    bsum->size[0] = vstride;
    emxEnsureCapacity_real_T(bsum, xj);
    if (wSigmainv->size[2] <= 1024) {
      aoffset = wSigmainv->size[2];
      lastBlockLength = 0;
      nblocks = 1;
    } else {
      aoffset = 1024;
      nblocks = wSigmainv->size[2] / 1024;
      lastBlockLength = wSigmainv->size[2] - (nblocks << 10);
      if (lastBlockLength > 0) {
        nblocks++;
      } else {
        lastBlockLength = 1024;
      }
    }
    for (xj = 0; xj < vstride; xj++) {
      Sigmainv->data[xj] = wSigmainv->data[xj];
      bsum->data[xj] = 0.0;
    }
    for (k = 2; k <= aoffset; k++) {
      xoffset = (k - 1) * vstride;
      for (xj = 0; xj < vstride; xj++) {
        Sigmainv->data[xj] += wSigmainv->data[xoffset + xj];
      }
    }
    for (aoffset = 2; aoffset <= nblocks; aoffset++) {
      xblockoffset = (aoffset - 1) * bvstride;
      for (xj = 0; xj < vstride; xj++) {
        bsum->data[xj] = wSigmainv->data[xblockoffset + xj];
      }
      if (aoffset == nblocks) {
        hi = lastBlockLength;
      } else {
        hi = 1024;
      }
      for (k = 2; k <= hi; k++) {
        xoffset = xblockoffset + (k - 1) * vstride;
        for (xj = 0; xj < vstride; xj++) {
          bsum->data[xj] += wSigmainv->data[xoffset + xj];
        }
      }
      for (xj = 0; xj < vstride; xj++) {
        Sigmainv->data[xj] += bsum->data[xj];
      }
    }
  }
  emxFree_real_T(&wSigmainv);
  emxInit_real_T(&A_tmp, 2);
  mrdiv(Sigmajinv, Sigmainv, Sigmabar);
  aoffset = comps->data[0].mu->size[0];
  xj = A_tmp->size[0] * A_tmp->size[1];
  A_tmp->size[0] = comps->data[0].mu->size[0];
  A_tmp->size[1] = comps->data[0].mu->size[0];
  emxEnsureCapacity_real_T(A_tmp, xj);
  hi = comps->data[0].mu->size[0] * comps->data[0].mu->size[0];
  for (xj = 0; xj < hi; xj++) {
    A_tmp->data[xj] = 0.0;
  }
  if (comps->data[0].mu->size[0] > 0) {
    for (k = 0; k < aoffset; k++) {
      A_tmp->data[k + A_tmp->size[0] * k] = 1.0;
    }
  }
  xj = Sigmajinv->size[0] * Sigmajinv->size[1];
  Sigmajinv->size[0] = Sigmabar->size[0];
  Sigmajinv->size[1] = Sigmabar->size[1];
  emxEnsureCapacity_real_T(Sigmajinv, xj);
  hi = Sigmabar->size[0] * Sigmabar->size[1];
  for (xj = 0; xj < hi; xj++) {
    Sigmajinv->data[xj] = a * Sigmabar->data[xj];
  }
  emxInit_real_T(&PsiCIinv, 2);
  mrdiv(A_tmp, Sigmajinv, PsiCIinv);
  xblockoffset = Sigmabar->size[0] - 1;
  hi = Sigmabar->size[1];
  xj = bsum->size[0];
  bsum->size[0] = Sigmabar->size[0];
  emxEnsureCapacity_real_T(bsum, xj);
  for (xoffset = 0; xoffset <= xblockoffset; xoffset++) {
    bsum->data[xoffset] = 0.0;
  }
  for (k = 0; k < hi; k++) {
    aoffset = k * Sigmabar->size[0];
    for (xoffset = 0; xoffset <= xblockoffset; xoffset++) {
      bsum->data[xoffset] +=
          Sigmabar->data[aoffset + xoffset] * b_mubar->data[k];
    }
  }
  emxFree_real_T(&Sigmabar);
  xblockoffset = PsiCIinv->size[0] - 1;
  hi = PsiCIinv->size[1];
  xj = muCI->size[0];
  muCI->size[0] = PsiCIinv->size[0];
  emxEnsureCapacity_real_T(muCI, xj);
  for (xoffset = 0; xoffset <= xblockoffset; xoffset++) {
    muCI->data[xoffset] = 0.0;
  }
  for (k = 0; k < hi; k++) {
    aoffset = k * PsiCIinv->size[0];
    for (xoffset = 0; xoffset <= xblockoffset; xoffset++) {
      muCI->data[xoffset] += PsiCIinv->data[aoffset + xoffset] * bsum->data[k];
    }
  }
  emxInit_creal_T(&srPsiCIinv, 2);
  emxInit_creal_T(&srPsiCI, 2);
  sqrtm(PsiCIinv, srPsiCIinv);
  b_mrdiv(A_tmp, srPsiCIinv, srPsiCI);
  k = 0;
  emxInit_real_T(&barOld_mu, 1);
  emxInit_creal_T(&c_Sigmainv, 2);
  emxInit_creal_T(&b_srPsiCIinv, 2);
  emxInit_creal_T(&r, 2);
  exitg1 = false;
  while ((!exitg1) && (k <= (int)maxiter - 1)) {
    xj = barOld_mu->size[0];
    barOld_mu->size[0] = bar->mu->size[0];
    emxEnsureCapacity_real_T(barOld_mu, xj);
    hi = bar->mu->size[0];
    for (xj = 0; xj < hi; xj++) {
      barOld_mu->data[xj] = bar->mu->data[xj];
    }
    xj = b_Sigma->size[0] * b_Sigma->size[1];
    b_Sigma->size[0] = bar->Sigma->size[0];
    b_Sigma->size[1] = bar->Sigma->size[1];
    emxEnsureCapacity_real_T(b_Sigma, xj);
    hi = bar->Sigma->size[0] * bar->Sigma->size[1];
    for (xj = 0; xj < hi; xj++) {
      b_Sigma->data[xj] = bar->Sigma->data[xj];
    }
    mrdiv(A_tmp, bar->Sigma, Sigmainv);
    xblockoffset = Sigmainv->size[0] - 1;
    hi = Sigmainv->size[1];
    xj = bsum->size[0];
    bsum->size[0] = Sigmainv->size[0];
    emxEnsureCapacity_real_T(bsum, xj);
    for (xoffset = 0; xoffset <= xblockoffset; xoffset++) {
      bsum->data[xoffset] = 0.0;
    }
    for (lastBlockLength = 0; lastBlockLength < hi; lastBlockLength++) {
      aoffset = lastBlockLength * Sigmainv->size[0];
      for (xoffset = 0; xoffset <= xblockoffset; xoffset++) {
        bsum->data[xoffset] +=
            Sigmainv->data[aoffset + xoffset] * mubar->data[lastBlockLength];
      }
    }
    xj = Sigmajinv->size[0] * Sigmajinv->size[1];
    Sigmajinv->size[0] = PsiCIinv->size[0];
    Sigmajinv->size[1] = PsiCIinv->size[1];
    emxEnsureCapacity_real_T(Sigmajinv, xj);
    hi = PsiCIinv->size[0] * PsiCIinv->size[1];
    for (xj = 0; xj < hi; xj++) {
      Sigmajinv->data[xj] = PsiCIinv->data[xj] + Sigmainv->data[xj];
    }
    mrdiv(A_tmp, Sigmajinv, Sigmainv);
    xj = bsum->size[0];
    bsum->size[0] = muCI->size[0];
    emxEnsureCapacity_real_T(bsum, xj);
    hi = muCI->size[0];
    for (xj = 0; xj < hi; xj++) {
      bsum->data[xj] += muCI->data[xj];
    }
    xblockoffset = Sigmainv->size[0] - 1;
    hi = Sigmainv->size[1];
    xj = b_mubar->size[0];
    b_mubar->size[0] = Sigmainv->size[0];
    emxEnsureCapacity_real_T(b_mubar, xj);
    for (xoffset = 0; xoffset <= xblockoffset; xoffset++) {
      b_mubar->data[xoffset] = 0.0;
    }
    for (lastBlockLength = 0; lastBlockLength < hi; lastBlockLength++) {
      aoffset = lastBlockLength * Sigmainv->size[0];
      for (xoffset = 0; xoffset <= xblockoffset; xoffset++) {
        b_mubar->data[xoffset] +=
            Sigmainv->data[aoffset + xoffset] * bsum->data[lastBlockLength];
      }
    }
    xj = bsum->size[0];
    bsum->size[0] = mui->size[0];
    emxEnsureCapacity_real_T(bsum, xj);
    hi = mui->size[0];
    for (xj = 0; xj < hi; xj++) {
      bsum->data[xj] = mui->data[xj] - b_mubar->data[xj];
    }
    xj = Sigmainv->size[0] * Sigmainv->size[1];
    Sigmainv->size[0] = d;
    Sigmainv->size[1] = d;
    emxEnsureCapacity_real_T(Sigmainv, xj);
    hi = d * d;
    for (xj = 0; xj < hi; xj++) {
      Sigmainv->data[xj] = 0.0;
    }
    xj = comps->size[0];
    for (xoffset = 0; xoffset < xj; xoffset++) {
      hi = bsum->size[0];
      lastBlockLength = Sigmajinv->size[0] * Sigmajinv->size[1];
      Sigmajinv->size[0] = bsum->size[0];
      Sigmajinv->size[1] = bsum->size[0];
      emxEnsureCapacity_real_T(Sigmajinv, lastBlockLength);
      for (lastBlockLength = 0; lastBlockLength < hi; lastBlockLength++) {
        for (nblocks = 0; nblocks < hi; nblocks++) {
          Sigmajinv->data[nblocks + Sigmajinv->size[0] * lastBlockLength] =
              Sigmai->data[nblocks + Sigmai->size[0] * lastBlockLength] +
              bsum->data[nblocks] * bsum->data[lastBlockLength];
        }
      }
      hi = Sigmainv->size[0] * Sigmainv->size[1];
      for (lastBlockLength = 0; lastBlockLength < hi; lastBlockLength++) {
        Sigmainv->data[lastBlockLength] +=
            wi->data[0] * Sigmajinv->data[lastBlockLength];
      }
    }
    hi = Sigmainv->size[0] * Sigmainv->size[1];
    for (xj = 0; xj < hi; xj++) {
      Sigmainv->data[xj] /= sumWi;
    }
    /* Sigma = sqrtm(PsiMPM)*srPsiCI; */
    xj = bar->mu->size[0];
    bar->mu->size[0] = b_mubar->size[0];
    emxEnsureCapacity_real_T(bar->mu, xj);
    hi = b_mubar->size[0];
    for (xj = 0; xj < hi; xj++) {
      bar->mu->data[xj] = b_mubar->data[xj];
    }
    xj = c_Sigmainv->size[0] * c_Sigmainv->size[1];
    c_Sigmainv->size[0] = Sigmainv->size[0];
    c_Sigmainv->size[1] = Sigmainv->size[1];
    emxEnsureCapacity_creal_T(c_Sigmainv, xj);
    hi = Sigmainv->size[0] * Sigmainv->size[1];
    for (xj = 0; xj < hi; xj++) {
      c_Sigmainv->data[xj].re = Sigmainv->data[xj];
      c_Sigmainv->data[xj].im = 0.0;
    }
    xj = b_srPsiCIinv->size[0] * b_srPsiCIinv->size[1];
    b_srPsiCIinv->size[0] = srPsiCIinv->size[0];
    b_srPsiCIinv->size[1] = c_Sigmainv->size[1];
    emxEnsureCapacity_creal_T(b_srPsiCIinv, xj);
    hi = srPsiCIinv->size[0];
    for (xj = 0; xj < hi; xj++) {
      xblockoffset = c_Sigmainv->size[1];
      for (lastBlockLength = 0; lastBlockLength < xblockoffset;
           lastBlockLength++) {
        b_srPsiCIinv->data[xj + b_srPsiCIinv->size[0] * lastBlockLength].re =
            0.0;
        b_srPsiCIinv->data[xj + b_srPsiCIinv->size[0] * lastBlockLength].im =
            0.0;
        aoffset = srPsiCIinv->size[1];
        for (nblocks = 0; nblocks < aoffset; nblocks++) {
          b_srPsiCIinv->data[xj + b_srPsiCIinv->size[0] * lastBlockLength].re +=
              srPsiCIinv->data[xj + srPsiCIinv->size[0] * nblocks].re *
                  c_Sigmainv
                      ->data[nblocks + c_Sigmainv->size[0] * lastBlockLength]
                      .re -
              srPsiCIinv->data[xj + srPsiCIinv->size[0] * nblocks].im *
                  c_Sigmainv
                      ->data[nblocks + c_Sigmainv->size[0] * lastBlockLength]
                      .im;
          b_srPsiCIinv->data[xj + b_srPsiCIinv->size[0] * lastBlockLength].im +=
              srPsiCIinv->data[xj + srPsiCIinv->size[0] * nblocks].re *
                  c_Sigmainv
                      ->data[nblocks + c_Sigmainv->size[0] * lastBlockLength]
                      .im +
              srPsiCIinv->data[xj + srPsiCIinv->size[0] * nblocks].im *
                  c_Sigmainv
                      ->data[nblocks + c_Sigmainv->size[0] * lastBlockLength]
                      .re;
        }
      }
    }
    mtimes(b_srPsiCIinv, srPsiCIinv, r);
    b_sqrtm(r, c_Sigmainv);
    mtimes(srPsiCI, c_Sigmainv, r);
    mtimes(r, srPsiCI, c_Sigmainv);
    xj = bar->Sigma->size[0] * bar->Sigma->size[1];
    bar->Sigma->size[0] = c_Sigmainv->size[0];
    bar->Sigma->size[1] = c_Sigmainv->size[1];
    emxEnsureCapacity_real_T(bar->Sigma, xj);
    hi = c_Sigmainv->size[0] * c_Sigmainv->size[1];
    for (xj = 0; xj < hi; xj++) {
      bar->Sigma->data[xj] = c_Sigmainv->data[xj].re;
    }
    if (fmod((double)k + 1.0, 3.0) == 0.0) {
      /*  sKLD = SKLDij(pdfh,pdfr): */
      /*  INPUTS: */
      /*  - pdfh, pdfr, two Gaussian densities. */
      /*  OUTPUTS: */
      /*  - sKLD, resulting symmetrization of the Kullback-Leibler divergence
       * (scalar). */
      /*  This function computes the KLD symmetrization between two multivariate
       * Gaussians. It is */
      /*  not suitable for other kind of distributions. */
      xj = bsum->size[0];
      bsum->size[0] = b_mubar->size[0];
      emxEnsureCapacity_real_T(bsum, xj);
      hi = b_mubar->size[0];
      for (xj = 0; xj < hi; xj++) {
        bsum->data[xj] = b_mubar->data[xj] - barOld_mu->data[xj];
      }
      aoffset = b_mubar->size[0];
      xj = Sigmainv->size[0] * Sigmainv->size[1];
      Sigmainv->size[0] = b_mubar->size[0];
      Sigmainv->size[1] = b_mubar->size[0];
      emxEnsureCapacity_real_T(Sigmainv, xj);
      hi = b_mubar->size[0] * b_mubar->size[0];
      for (xj = 0; xj < hi; xj++) {
        Sigmainv->data[xj] = 0.0;
      }
      if (b_mubar->size[0] > 0) {
        for (lastBlockLength = 0; lastBlockLength < aoffset;
             lastBlockLength++) {
          Sigmainv
              ->data[lastBlockLength + Sigmainv->size[0] * lastBlockLength] =
              1.0;
        }
      }
      mrdiv(Sigmainv, bar->Sigma, Sigmaiinv);
      mrdiv(Sigmainv, b_Sigma, Sigmajinv);
      /* sKLD = 0.5*(KLDij(pdfi,pdfj) + KLDij(pdfj,pdfi)); */
      c_mtimes(Sigmajinv, bar->Sigma, Sigmainv);
      wbar = 0.0;
      xj = Sigmainv->size[0];
      for (lastBlockLength = 0; lastBlockLength < xj; lastBlockLength++) {
        wbar +=
            Sigmainv
                ->data[lastBlockLength + Sigmainv->size[0] * lastBlockLength];
      }
      c_mtimes(Sigmaiinv, b_Sigma, Sigmainv);
      a = 0.0;
      xj = Sigmainv->size[0];
      for (lastBlockLength = 0; lastBlockLength < xj; lastBlockLength++) {
        a += Sigmainv
                 ->data[lastBlockLength + Sigmainv->size[0] * lastBlockLength];
      }
      hi = Sigmaiinv->size[0] * Sigmaiinv->size[1];
      for (xj = 0; xj < hi; xj++) {
        Sigmaiinv->data[xj] += Sigmajinv->data[xj];
      }
      hi = bsum->size[0];
      xblockoffset = Sigmaiinv->size[1];
      xj = b_Sigmainv->size[0] * b_Sigmainv->size[1];
      b_Sigmainv->size[0] = 1;
      b_Sigmainv->size[1] = Sigmaiinv->size[1];
      emxEnsureCapacity_real_T(b_Sigmainv, xj);
      for (nblocks = 0; nblocks < xblockoffset; nblocks++) {
        aoffset = nblocks * Sigmaiinv->size[0];
        b_Sigmainv->data[nblocks] = 0.0;
        for (lastBlockLength = 0; lastBlockLength < hi; lastBlockLength++) {
          b_Sigmainv->data[nblocks] +=
              bsum->data[lastBlockLength] *
              Sigmaiinv->data[aoffset + lastBlockLength];
        }
      }
      d_Sigmainv = 0.0;
      hi = b_Sigmainv->size[1];
      for (xj = 0; xj < hi; xj++) {
        d_Sigmainv += b_Sigmainv->data[xj] * bsum->data[xj];
      }
      if (0.25 * (((wbar + a) + d_Sigmainv) - 2.0 * (double)b_mubar->size[0]) <
          tol) {
        exitg1 = true;
      } else {
        k++;
      }
    } else {
      k++;
    }
  }
  emxFree_creal_T(&r);
  emxFree_creal_T(&b_srPsiCIinv);
  emxFree_creal_T(&c_Sigmainv);
  emxFree_real_T(&b_Sigma);
  emxFree_real_T(&b_Sigmainv);
  emxFree_real_T(&bsum);
  emxFree_real_T(&A_tmp);
  emxFree_real_T(&Sigmajinv);
  emxFree_real_T(&Sigmaiinv);
  emxFree_real_T(&b_mubar);
  emxFree_real_T(&mubar);
  emxFree_real_T(&Sigmai);
  emxFree_real_T(&mui);
  emxFree_real_T(&wi);
  emxFree_real_T(&Sigmainv);
  emxFree_real_T(&barOld_mu);
  emxFree_creal_T(&srPsiCI);
  emxFree_creal_T(&srPsiCIinv);
  emxFree_real_T(&muCI);
  emxFree_real_T(&PsiCIinv);
}

/*
 * File trailer for SKLDBarycenter.c
 *
 * [EOF]
 */
