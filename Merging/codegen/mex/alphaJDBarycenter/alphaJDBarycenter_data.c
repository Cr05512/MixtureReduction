/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * alphaJDBarycenter_data.c
 *
 * Code generation for function 'alphaJDBarycenter_data'
 *
 */

/* Include files */
#include "alphaJDBarycenter_data.h"
#include "rt_nonfinite.h"

/* Variable Definitions */
emlrtCTX emlrtRootTLSGlobal = NULL;

const volatile char_T *emlrtBreakCheckR2012bFlagVar = NULL;

emlrtContext emlrtContextGlobal = {
    true,                                                 /* bFirstTime */
    false,                                                /* bInitialized */
    131610U,                                              /* fVersionInfo */
    NULL,                                                 /* fErrorFunction */
    "alphaJDBarycenter",                                  /* fFunctionName */
    NULL,                                                 /* fRTCallStack */
    false,                                                /* bDebugMode */
    {2045744189U, 2170104910U, 2743257031U, 4284093946U}, /* fSigWrd */
    NULL                                                  /* fSigMem */
};

emlrtRSInfo w_emlrtRSI = {
    20,                                                       /* lineNo */
    "sum",                                                    /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/sum.m" /* pathName */
};

emlrtRSInfo x_emlrtRSI = {
    99,        /* lineNo */
    "sumprod", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/sumprod.m" /* pathName
                                                                           */
};

emlrtRSInfo y_emlrtRSI = {
    74,                      /* lineNo */
    "combineVectorElements", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/datafun/private/"
    "combineVectorElements.m" /* pathName */
};

emlrtRSInfo lb_emlrtRSI = {
    21,                               /* lineNo */
    "eml_int_forloop_overflow_check", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/eml/"
    "eml_int_forloop_overflow_check.m" /* pathName */
};

emlrtRSInfo
    pb_emlrtRSI =
        {
            20,                /* lineNo */
            "mrdivide_helper", /* fcnName */
            "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/"
            "mrdivide_helper.m" /* pathName */
};

emlrtRSInfo ac_emlrtRSI = {
    27,       /* lineNo */
    "xgetrf", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgetrf.m" /* pathName
                                                                            */
};

emlrtRSInfo bc_emlrtRSI = {
    91,             /* lineNo */
    "ceval_xgetrf", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgetrf.m" /* pathName
                                                                            */
};

emlrtRSInfo cc_emlrtRSI = {
    58,             /* lineNo */
    "ceval_xgetrf", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgetrf.m" /* pathName
                                                                            */
};

emlrtRSInfo hd_emlrtRSI = {
    91,                  /* lineNo */
    "eml_mtimes_helper", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/ops/eml_mtimes_helper.m" /* pathName
                                                                         */
};

emlrtRSInfo id_emlrtRSI = {
    60,                  /* lineNo */
    "eml_mtimes_helper", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/ops/eml_mtimes_helper.m" /* pathName
                                                                         */
};

emlrtRSInfo jd_emlrtRSI = {
    142,      /* lineNo */
    "mtimes", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+blas/mtimes.m" /* pathName
                                                                          */
};

emlrtRSInfo kd_emlrtRSI = {
    178,           /* lineNo */
    "mtimes_blas", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+blas/mtimes.m" /* pathName
                                                                          */
};

emlrtRTEInfo
    b_emlrtRTEI =
        {
            16,                /* lineNo */
            19,                /* colNo */
            "mrdivide_helper", /* fName */
            "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/"
            "mrdivide_helper.m" /* pName */
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
        47,          /* lineNo */
        13,          /* colNo */
        "infocheck", /* fName */
        "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/"
        "infocheck.m" /* pName */
};

emlrtRTEInfo i_emlrtRTEI =
    {
        44,          /* lineNo */
        13,          /* colNo */
        "infocheck", /* fName */
        "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/"
        "infocheck.m" /* pName */
};

emlrtRTEInfo cb_emlrtRTEI = {
    88,                  /* lineNo */
    13,                  /* colNo */
    "eml_mtimes_helper", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/ops/eml_mtimes_helper.m" /* pName
                                                                         */
};

emlrtRTEInfo qc_emlrtRTEI = {
    1,        /* lineNo */
    37,       /* colNo */
    "xgetrf", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgetrf.m" /* pName
                                                                            */
};

emlrtRTEInfo sc_emlrtRTEI = {
    58,       /* lineNo */
    29,       /* colNo */
    "xgetrf", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgetrf.m" /* pName
                                                                            */
};

emlrtRTEInfo tc_emlrtRTEI = {
    89,       /* lineNo */
    27,       /* colNo */
    "xgetrf", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgetrf.m" /* pName
                                                                            */
};

emlrtRTEInfo wc_emlrtRTEI = {
    58,       /* lineNo */
    5,        /* colNo */
    "xgetrf", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+lapack/xgetrf.m" /* pName
                                                                            */
};

emlrtRTEInfo jd_emlrtRTEI = {
    218,      /* lineNo */
    20,       /* colNo */
    "mtimes", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/+blas/mtimes.m" /* pName
                                                                          */
};

const char_T cv[66] = {'T', 'h', 'e', ' ', 'n', 'u', 'm', 'b', 'e', 'r', ' ',
                       'o', 'f', ' ', 'c', 'o', 'm', 'p', 'o', 'n', 'e', 'n',
                       't', 's', ' ', 'i', 'n', ' ', 't', 'h', 'e', ' ', 'm',
                       'e', 'r', 'g', 'e', ' ', 'h', 'a', 's', ' ', 't', 'o',
                       ' ', 'b', 'e', ' ', 'g', 'r', 'e', 'a', 't', 'e', 'r',
                       ' ', 't', 'h', 'a', 'n', ' ', 'z', 'e', 'r', 'o', '.'};

const char_T cv1[19] = {'L', 'A', 'P', 'A', 'C', 'K', 'E', '_', 'd', 'g',
                        'e', 't', 'r', 'f', '_', 'w', 'o', 'r', 'k'};

const creal_T dc1 = {
    1.0, /* re */
    0.0  /* im */
};

/* End of code generation (alphaJDBarycenter_data.c) */
