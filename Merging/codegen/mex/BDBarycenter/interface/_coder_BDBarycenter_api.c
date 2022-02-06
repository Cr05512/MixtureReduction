/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_BDBarycenter_api.c
 *
 * Code generation for function '_coder_BDBarycenter_api'
 *
 */

/* Include files */
#include "_coder_BDBarycenter_api.h"
#include "BDBarycenter.h"
#include "BDBarycenter_data.h"
#include "BDBarycenter_emxutil.h"
#include "BDBarycenter_types.h"
#include "rt_nonfinite.h"

/* Variable Definitions */
static emlrtRTEInfo mc_emlrtRTEI = {
    1,                         /* lineNo */
    1,                         /* colNo */
    "_coder_BDBarycenter_api", /* fName */
    ""                         /* pName */
};

/* Function Declarations */
static void c_emlrt_marshallIn(const emlrtStack *sp, const mxArray *comps,
                               const char_T *identifier, emxArray_struct0_T *y);

static void d_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               emxArray_struct0_T *y);

static real_T e_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                 const emlrtMsgIdentifier *parentId);

static const mxArray *emlrt_marshallOut(const struct0_T u);

static void f_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               emxArray_real_T *y);

static void g_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               emxArray_real_T *y);

static real_T h_emlrt_marshallIn(const emlrtStack *sp, const mxArray *maxiter,
                                 const char_T *identifier);

static real_T j_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                 const emlrtMsgIdentifier *msgId);

static void k_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                               const emlrtMsgIdentifier *msgId,
                               emxArray_real_T *ret);

static void l_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                               const emlrtMsgIdentifier *msgId,
                               emxArray_real_T *ret);

/* Function Definitions */
static void c_emlrt_marshallIn(const emlrtStack *sp, const mxArray *comps,
                               const char_T *identifier, emxArray_struct0_T *y)
{
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = (const char_T *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  d_emlrt_marshallIn(sp, emlrtAlias(comps), &thisId, y);
  emlrtDestroyArray(&comps);
}

static void d_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               emxArray_struct0_T *y)
{
  static const int32_T dims = -1;
  static const char_T *fieldNames[3] = {"w", "mu", "Sigma"};
  emlrtMsgIdentifier thisId;
  int32_T i;
  int32_T sizes;
  const boolean_T b = true;
  thisId.fParent = parentId;
  thisId.bParentIsCell = false;
  emlrtCheckVsStructR2012b((emlrtCTX)sp, parentId, u, 3,
                           (const char_T **)&fieldNames[0], 1U, (void *)&dims,
                           &b, &sizes);
  i = y->size[0];
  y->size[0] = sizes;
  emxEnsureCapacity_struct0_T(sp, y, i, (emlrtRTEInfo *)NULL);
  for (i = 0; i < sizes; i++) {
    thisId.fIdentifier = "w";
    y->data[i].w =
        e_emlrt_marshallIn(sp,
                           emlrtAlias(emlrtGetFieldR2017b((emlrtCTX)sp, u, i, 0,
                                                          (const char_T *)"w")),
                           &thisId);
    thisId.fIdentifier = "mu";
    f_emlrt_marshallIn(sp,
                       emlrtAlias(emlrtGetFieldR2017b((emlrtCTX)sp, u, i, 1,
                                                      (const char_T *)"mu")),
                       &thisId, y->data[i].mu);
    thisId.fIdentifier = "Sigma";
    g_emlrt_marshallIn(sp,
                       emlrtAlias(emlrtGetFieldR2017b((emlrtCTX)sp, u, i, 2,
                                                      (const char_T *)"Sigma")),
                       &thisId, y->data[i].Sigma);
  }
  emlrtDestroyArray(&u);
}

static real_T e_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                 const emlrtMsgIdentifier *parentId)
{
  real_T y;
  y = j_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static const mxArray *emlrt_marshallOut(const struct0_T u)
{
  static const char_T *sv[3] = {"w", "mu", "Sigma"};
  const mxArray *b_y;
  const mxArray *c_y;
  const mxArray *d_y;
  const mxArray *m;
  const mxArray *y;
  real_T *pData;
  int32_T iv[2];
  int32_T b_i;
  int32_T c_i;
  int32_T i;
  y = NULL;
  emlrtAssign(&y, emlrtCreateStructMatrix(1, 1, 3, (const char_T **)&sv[0]));
  b_y = NULL;
  m = emlrtCreateDoubleScalar(u.w);
  emlrtAssign(&b_y, m);
  emlrtSetFieldR2017b(y, 0, (const char_T *)"w", b_y, 0);
  c_y = NULL;
  m = emlrtCreateNumericArray(1, &u.mu->size[0], mxDOUBLE_CLASS, mxREAL);
  pData = emlrtMxGetPr(m);
  i = 0;
  for (b_i = 0; b_i < u.mu->size[0]; b_i++) {
    pData[i] = u.mu->data[b_i];
    i++;
  }
  emlrtAssign(&c_y, m);
  emlrtSetFieldR2017b(y, 0, (const char_T *)"mu", c_y, 1);
  d_y = NULL;
  iv[0] = u.Sigma->size[0];
  iv[1] = u.Sigma->size[1];
  m = emlrtCreateNumericArray(2, &iv[0], mxDOUBLE_CLASS, mxREAL);
  pData = emlrtMxGetPr(m);
  i = 0;
  for (b_i = 0; b_i < u.Sigma->size[1]; b_i++) {
    for (c_i = 0; c_i < u.Sigma->size[0]; c_i++) {
      pData[i] = u.Sigma->data[c_i + u.Sigma->size[0] * b_i];
      i++;
    }
  }
  emlrtAssign(&d_y, m);
  emlrtSetFieldR2017b(y, 0, (const char_T *)"Sigma", d_y, 2);
  return y;
}

static void f_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               emxArray_real_T *y)
{
  k_emlrt_marshallIn(sp, emlrtAlias(u), parentId, y);
  emlrtDestroyArray(&u);
}

static void g_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               emxArray_real_T *y)
{
  l_emlrt_marshallIn(sp, emlrtAlias(u), parentId, y);
  emlrtDestroyArray(&u);
}

static real_T h_emlrt_marshallIn(const emlrtStack *sp, const mxArray *maxiter,
                                 const char_T *identifier)
{
  emlrtMsgIdentifier thisId;
  real_T y;
  thisId.fIdentifier = (const char_T *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = e_emlrt_marshallIn(sp, emlrtAlias(maxiter), &thisId);
  emlrtDestroyArray(&maxiter);
  return y;
}

static real_T j_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                 const emlrtMsgIdentifier *msgId)
{
  static const int32_T dims = 0;
  real_T ret;
  emlrtCheckBuiltInR2012b((emlrtCTX)sp, msgId, src, (const char_T *)"double",
                          false, 0U, (void *)&dims);
  ret = *(real_T *)emlrtMxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

static void k_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                               const emlrtMsgIdentifier *msgId,
                               emxArray_real_T *ret)
{
  static const int32_T dims = -1;
  int32_T i;
  int32_T i1;
  const boolean_T b = true;
  emlrtCheckVsBuiltInR2012b((emlrtCTX)sp, msgId, src, (const char_T *)"double",
                            false, 1U, (void *)&dims, &b, &i);
  i1 = ret->size[0];
  ret->size[0] = i;
  emxEnsureCapacity_real_T(sp, ret, i1, (emlrtRTEInfo *)NULL);
  emlrtImportArrayR2015b((emlrtCTX)sp, src, &ret->data[0], 8, false);
  emlrtDestroyArray(&src);
}

static void l_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                               const emlrtMsgIdentifier *msgId,
                               emxArray_real_T *ret)
{
  static const int32_T dims[2] = {-1, -1};
  int32_T iv[2];
  int32_T i;
  const boolean_T bv[2] = {true, true};
  emlrtCheckVsBuiltInR2012b((emlrtCTX)sp, msgId, src, (const char_T *)"double",
                            false, 2U, (void *)&dims[0], &bv[0], &iv[0]);
  i = ret->size[0] * ret->size[1];
  ret->size[0] = iv[0];
  ret->size[1] = iv[1];
  emxEnsureCapacity_real_T(sp, ret, i, (emlrtRTEInfo *)NULL);
  emlrtImportArrayR2015b((emlrtCTX)sp, src, &ret->data[0], 8, false);
  emlrtDestroyArray(&src);
}

void BDBarycenter_api(const mxArray *const prhs[3], const mxArray **plhs)
{
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  emxArray_struct0_T *comps;
  struct0_T bar;
  real_T maxiter;
  real_T tol;
  st.tls = emlrtRootTLSGlobal;
  emlrtHeapReferenceStackEnterFcnR2012b(&st);
  emxInit_struct0_T(&st, &comps, 1, &mc_emlrtRTEI, true);
  emxInitStruct_struct0_T(&st, &bar, &mc_emlrtRTEI, true);
  /* Marshall function inputs */
  c_emlrt_marshallIn(&st, emlrtAliasP(prhs[0]), "comps", comps);
  maxiter = h_emlrt_marshallIn(&st, emlrtAliasP(prhs[1]), "maxiter");
  tol = h_emlrt_marshallIn(&st, emlrtAliasP(prhs[2]), "tol");
  /* Invoke the target function */
  BDBarycenter(&st, comps, maxiter, tol, &bar);
  /* Marshall function outputs */
  *plhs = emlrt_marshallOut(bar);
  emxFreeStruct_struct0_T(&bar);
  emxFree_struct0_T(&comps);
  emlrtHeapReferenceStackLeaveFcnR2012b(&st);
}

/* End of code generation (_coder_BDBarycenter_api.c) */
