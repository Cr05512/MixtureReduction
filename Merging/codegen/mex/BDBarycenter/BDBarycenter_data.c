/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * BDBarycenter_data.c
 *
 * Code generation for function 'BDBarycenter_data'
 *
 */

/* Include files */
#include "BDBarycenter_data.h"
#include "rt_nonfinite.h"

/* Variable Definitions */
emlrtCTX emlrtRootTLSGlobal = NULL;

const volatile char_T *emlrtBreakCheckR2012bFlagVar = NULL;

emlrtContext emlrtContextGlobal = {
    true,                                                 /* bFirstTime */
    false,                                                /* bInitialized */
    131610U,                                              /* fVersionInfo */
    NULL,                                                 /* fErrorFunction */
    "BDBarycenter",                                       /* fFunctionName */
    NULL,                                                 /* fRTCallStack */
    false,                                                /* bDebugMode */
    {2045744189U, 2170104910U, 2743257031U, 4284093946U}, /* fSigWrd */
    NULL                                                  /* fSigMem */
};

emlrtRSInfo w_emlrtRSI = {
    21,                               /* lineNo */
    "eml_int_forloop_overflow_check", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/eml/"
    "eml_int_forloop_overflow_check.m" /* pathName */
};

emlrtRSInfo eb_emlrtRSI = {
    67,        /* lineNo */
    "lusolve", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/lusolve.m" /* pathName
                                                                     */
};

emlrtRSInfo fb_emlrtRSI = {
    112,          /* lineNo */
    "lusolveNxN", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/lusolve.m" /* pathName
                                                                     */
};

emlrtRSInfo lb_emlrtRSI = {
    27,       /* lineNo */
    "xgetrf", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgetrf.m" /* pathName
                                                                            */
};

emlrtRSInfo mb_emlrtRSI = {
    91,             /* lineNo */
    "ceval_xgetrf", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgetrf.m" /* pathName
                                                                            */
};

emlrtRSInfo nb_emlrtRSI = {
    58,             /* lineNo */
    "ceval_xgetrf", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgetrf.m" /* pathName
                                                                            */
};

emlrtRSInfo rb_emlrtRSI = {
    90,              /* lineNo */
    "warn_singular", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/lusolve.m" /* pathName
                                                                     */
};

emlrtRSInfo sb_emlrtRSI = {
    61,        /* lineNo */
    "qrsolve", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/qrsolve.m" /* pathName
                                                                     */
};

emlrtRSInfo tb_emlrtRSI = {
    72,        /* lineNo */
    "qrsolve", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/qrsolve.m" /* pathName
                                                                     */
};

emlrtRSInfo ub_emlrtRSI = {
    85,        /* lineNo */
    "qrsolve", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/qrsolve.m" /* pathName
                                                                     */
};

emlrtRSInfo hc_emlrtRSI = {
    119,         /* lineNo */
    "LSQFromQR", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/qrsolve.m" /* pathName
                                                                     */
};

emlrtRSInfo jc_emlrtRSI = {
    128,         /* lineNo */
    "LSQFromQR", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/qrsolve.m" /* pathName
                                                                     */
};

emlrtRSInfo kc_emlrtRSI = {
    138,         /* lineNo */
    "LSQFromQR", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/qrsolve.m" /* pathName
                                                                     */
};

emlrtRSInfo
    lc_emlrtRSI =
        {
            31,         /* lineNo */
            "xunormqr", /* fcnName */
            "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/"
            "xunormqr.m" /* pathName */
};

emlrtRSInfo
    mc_emlrtRSI =
        {
            102,              /* lineNo */
            "ceval_xunormqr", /* fcnName */
            "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/"
            "xunormqr.m" /* pathName */
};

emlrtRTEInfo c_emlrtRTEI = {
    135,                   /* lineNo */
    23,                    /* colNo */
    "dynamic_size_checks", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/ops/eml_mtimes_helper.m" /* pName
                                                                         */
};

emlrtRTEInfo d_emlrtRTEI = {
    130,                   /* lineNo */
    23,                    /* colNo */
    "dynamic_size_checks", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/ops/eml_mtimes_helper.m" /* pName
                                                                         */
};

emlrtRTEInfo h_emlrtRTEI =
    {
        44,          /* lineNo */
        13,          /* colNo */
        "infocheck", /* fName */
        "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/"
        "infocheck.m" /* pName */
};

emlrtRTEInfo i_emlrtRTEI =
    {
        47,          /* lineNo */
        13,          /* colNo */
        "infocheck", /* fName */
        "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/"
        "infocheck.m" /* pName */
};

emlrtRTEInfo ac_emlrtRTEI = {
    61,                                                             /* lineNo */
    2,                                                              /* colNo */
    "qrsolve",                                                      /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/qrsolve.m" /* pName */
};

emlrtRTEInfo ec_emlrtRTEI = {
    119,                                                            /* lineNo */
    5,                                                              /* colNo */
    "qrsolve",                                                      /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/qrsolve.m" /* pName */
};

emlrtRTEInfo hc_emlrtRTEI = {
    1,        /* lineNo */
    37,       /* colNo */
    "xgetrf", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgetrf.m" /* pName
                                                                            */
};

emlrtRTEInfo ic_emlrtRTEI = {
    58,       /* lineNo */
    29,       /* colNo */
    "xgetrf", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgetrf.m" /* pName
                                                                            */
};

emlrtRTEInfo jc_emlrtRTEI = {
    89,       /* lineNo */
    27,       /* colNo */
    "xgetrf", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgetrf.m" /* pName
                                                                            */
};

emlrtRTEInfo lc_emlrtRTEI = {
    58,       /* lineNo */
    5,        /* colNo */
    "xgetrf", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgetrf.m" /* pName
                                                                            */
};

const char_T cv[19] = {'L', 'A', 'P', 'A', 'C', 'K', 'E', '_', 'd', 'g',
                       'e', 't', 'r', 'f', '_', 'w', 'o', 'r', 'k'};

/* End of code generation (BDBarycenter_data.c) */
