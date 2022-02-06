/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * BDBarycenter.c
 *
 * Code generation for function 'BDBarycenter'
 *
 */

/* Include files */
#include "BDBarycenter.h"
#include "BDBarycenter_data.h"
#include "BDBarycenter_emxutil.h"
#include "BDBarycenter_mexutil.h"
#include "BDBarycenter_types.h"
#include "det.h"
#include "eml_mtimes_helper.h"
#include "eye.h"
#include "mldivide.h"
#include "mrdivide_helper.h"
#include "mtimes.h"
#include "paramsFromMixture.h"
#include "rt_nonfinite.h"
#include "sum.h"
#include "blas.h"
#include "mwmathutil.h"
#include <stddef.h>

/* Variable Definitions */
static emlrtRSInfo emlrtRSI = {
    10,             /* lineNo */
    "BDBarycenter", /* fcnName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pathName
                                                                            */
};

static emlrtRSInfo b_emlrtRSI = {
    23,             /* lineNo */
    "BDBarycenter", /* fcnName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pathName
                                                                            */
};

static emlrtRSInfo c_emlrtRSI = {
    24,             /* lineNo */
    "BDBarycenter", /* fcnName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pathName
                                                                            */
};

static emlrtRSInfo d_emlrtRSI = {
    28,             /* lineNo */
    "BDBarycenter", /* fcnName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pathName
                                                                            */
};

static emlrtRSInfo e_emlrtRSI = {
    35,             /* lineNo */
    "BDBarycenter", /* fcnName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pathName
                                                                            */
};

static emlrtRSInfo f_emlrtRSI = {
    37,             /* lineNo */
    "BDBarycenter", /* fcnName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pathName
                                                                            */
};

static emlrtRSInfo g_emlrtRSI = {
    38,             /* lineNo */
    "BDBarycenter", /* fcnName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pathName
                                                                            */
};

static emlrtRSInfo h_emlrtRSI = {
    59,             /* lineNo */
    "BDBarycenter", /* fcnName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pathName
                                                                            */
};

static emlrtRSInfo
    i_emlrtRSI =
        {
            12,               /* lineNo */
            "FKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    j_emlrtRSI =
        {
            16,               /* lineNo */
            "FKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    bb_emlrtRSI =
        {
            20,                /* lineNo */
            "mrdivide_helper", /* fcnName */
            "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/"
            "mrdivide_helper.m" /* pathName */
};

static emlrtRSInfo sc_emlrtRSI = {
    91,                  /* lineNo */
    "eml_mtimes_helper", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/ops/eml_mtimes_helper.m" /* pathName
                                                                         */
};

static emlrtRSInfo tc_emlrtRSI = {
    60,                  /* lineNo */
    "eml_mtimes_helper", /* fcnName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/ops/eml_mtimes_helper.m" /* pathName
                                                                         */
};

static emlrtRSInfo wc_emlrtRSI = {
    18,     /* lineNo */
    "BDij", /* fcnName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/BDij.m" /* pathName */
};

static emlrtMCInfo emlrtMCI = {
    66,             /* lineNo */
    5,              /* colNo */
    "BDBarycenter", /* fName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pName
                                                                            */
};

static emlrtMCInfo
    b_emlrtMCI =
        {
            10,               /* lineNo */
            1,                /* colNo */
            "FKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pName */
};

static emlrtBCInfo
    emlrtBCI =
        {
            -1,             /* iFirst */
            -1,             /* iLast */
            19,             /* lineNo */
            16,             /* colNo */
            "comps",        /* aName */
            "BDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/BDBarycenter.m", /* pName */
            0                                                    /* checkKind */
};

static emlrtBCInfo
    b_emlrtBCI =
        {
            -1,             /* iFirst */
            -1,             /* iLast */
            28,             /* lineNo */
            42,             /* colNo */
            "Sigmai",       /* aName */
            "BDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/BDBarycenter.m", /* pName */
            0                                                    /* checkKind */
};

static emlrtRTEInfo emlrtRTEI = {
    33,             /* lineNo */
    7,              /* colNo */
    "BDBarycenter", /* fName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pName
                                                                            */
};

static emlrtBCInfo
    c_emlrtBCI =
        {
            -1,             /* iFirst */
            -1,             /* iLast */
            28,             /* lineNo */
            19,             /* colNo */
            "Sigmaiinv",    /* aName */
            "BDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/BDBarycenter.m", /* pName */
            0                                                    /* checkKind */
};

static emlrtECInfo emlrtECI = {
    -1,             /* nDims */
    28,             /* lineNo */
    5,              /* colNo */
    "BDBarycenter", /* fName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pName
                                                                            */
};

static emlrtBCInfo
    d_emlrtBCI =
        {
            -1,             /* iFirst */
            -1,             /* iLast */
            37,             /* lineNo */
            51,             /* colNo */
            "Sigmaiinv",    /* aName */
            "BDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/BDBarycenter.m", /* pName */
            0                                                    /* checkKind */
};

static emlrtECInfo b_emlrtECI = {
    2,              /* nDims */
    37,             /* lineNo */
    37,             /* colNo */
    "BDBarycenter", /* fName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pName
                                                                            */
};

static emlrtBCInfo
    e_emlrtBCI =
        {
            -1,             /* iFirst */
            -1,             /* iLast */
            37,             /* lineNo */
            22,             /* colNo */
            "SigmaVec",     /* aName */
            "BDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/BDBarycenter.m", /* pName */
            0                                                    /* checkKind */
};

static emlrtECInfo c_emlrtECI = {
    -1,             /* nDims */
    37,             /* lineNo */
    9,              /* colNo */
    "BDBarycenter", /* fName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pName
                                                                            */
};

static emlrtBCInfo
    f_emlrtBCI =
        {
            -1,             /* iFirst */
            -1,             /* iLast */
            38,             /* lineNo */
            39,             /* colNo */
            "SigmaVec",     /* aName */
            "BDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/BDBarycenter.m", /* pName */
            0                                                    /* checkKind */
};

static emlrtBCInfo
    g_emlrtBCI =
        {
            -1,             /* iFirst */
            -1,             /* iLast */
            38,             /* lineNo */
            57,             /* colNo */
            "Sigmaiinv",    /* aName */
            "BDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/BDBarycenter.m", /* pName */
            0                                                    /* checkKind */
};

static emlrtBCInfo
    h_emlrtBCI =
        {
            -1,             /* iFirst */
            -1,             /* iLast */
            38,             /* lineNo */
            66,             /* colNo */
            "mui",          /* aName */
            "BDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/BDBarycenter.m", /* pName */
            0                                                    /* checkKind */
};

static emlrtECInfo d_emlrtECI = {
    -1,             /* nDims */
    38,             /* lineNo */
    43,             /* colNo */
    "BDBarycenter", /* fName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pName
                                                                            */
};

static emlrtBCInfo
    i_emlrtBCI =
        {
            -1,             /* iFirst */
            -1,             /* iLast */
            43,             /* lineNo */
            22,             /* colNo */
            "wi",           /* aName */
            "BDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/BDBarycenter.m", /* pName */
            0                                                    /* checkKind */
};

static emlrtBCInfo
    j_emlrtBCI =
        {
            -1,             /* iFirst */
            -1,             /* iLast */
            38,             /* lineNo */
            17,             /* colNo */
            "muVec",        /* aName */
            "BDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/BDBarycenter.m", /* pName */
            0                                                    /* checkKind */
};

static emlrtECInfo e_emlrtECI = {
    -1,             /* nDims */
    38,             /* lineNo */
    9,              /* colNo */
    "BDBarycenter", /* fName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pName
                                                                            */
};

static emlrtBCInfo
    k_emlrtBCI =
        {
            -1,             /* iFirst */
            -1,             /* iLast */
            43,             /* lineNo */
            33,             /* colNo */
            "muVec",        /* aName */
            "BDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/BDBarycenter.m", /* pName */
            0                                                    /* checkKind */
};

static emlrtECInfo f_emlrtECI = {
    -1,             /* nDims */
    43,             /* lineNo */
    14,             /* colNo */
    "BDBarycenter", /* fName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pName
                                                                            */
};

static emlrtBCInfo
    l_emlrtBCI =
        {
            -1,             /* iFirst */
            -1,             /* iLast */
            49,             /* lineNo */
            24,             /* colNo */
            "muVec",        /* aName */
            "BDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/BDBarycenter.m", /* pName */
            0                                                    /* checkKind */
};

static emlrtECInfo g_emlrtECI = {
    -1,             /* nDims */
    49,             /* lineNo */
    16,             /* colNo */
    "BDBarycenter", /* fName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pName
                                                                            */
};

static emlrtBCInfo
    m_emlrtBCI =
        {
            -1,             /* iFirst */
            -1,             /* iLast */
            50,             /* lineNo */
            28,             /* colNo */
            "wi",           /* aName */
            "BDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/BDBarycenter.m", /* pName */
            0                                                    /* checkKind */
};

static emlrtBCInfo
    n_emlrtBCI =
        {
            -1,             /* iFirst */
            -1,             /* iLast */
            50,             /* lineNo */
            45,             /* colNo */
            "SigmaVec",     /* aName */
            "BDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/BDBarycenter.m", /* pName */
            0                                                    /* checkKind */
};

static emlrtECInfo h_emlrtECI = {
    2,              /* nDims */
    50,             /* lineNo */
    32,             /* colNo */
    "BDBarycenter", /* fName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pName
                                                                            */
};

static emlrtECInfo i_emlrtECI = {
    2,              /* nDims */
    50,             /* lineNo */
    17,             /* colNo */
    "BDBarycenter", /* fName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pName
                                                                            */
};

static emlrtRTEInfo
    b_emlrtRTEI =
        {
            16,                /* lineNo */
            19,                /* colNo */
            "mrdivide_helper", /* fName */
            "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/"
            "mrdivide_helper.m" /* pName */
};

static emlrtBCInfo o_emlrtBCI =
    {
        -1,               /* iFirst */
        -1,               /* iLast */
        20,               /* lineNo */
        23,               /* colNo */
        "w",              /* aName */
        "FKLDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/FKLDBarycenter.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtBCInfo p_emlrtBCI =
    {
        -1,               /* iFirst */
        -1,               /* iLast */
        20,               /* lineNo */
        31,               /* colNo */
        "mu",             /* aName */
        "FKLDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/FKLDBarycenter.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtECInfo
    j_emlrtECI =
        {
            -1,               /* nDims */
            20,               /* lineNo */
            13,               /* colNo */
            "FKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pName */
};

static emlrtBCInfo q_emlrtBCI =
    {
        -1,               /* iFirst */
        -1,               /* iLast */
        27,               /* lineNo */
        29,               /* colNo */
        "w",              /* aName */
        "FKLDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/FKLDBarycenter.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtBCInfo r_emlrtBCI =
    {
        -1,               /* iFirst */
        -1,               /* iLast */
        27,               /* lineNo */
        43,               /* colNo */
        "Sigma",          /* aName */
        "FKLDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/FKLDBarycenter.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtBCInfo s_emlrtBCI =
    {
        -1,               /* iFirst */
        -1,               /* iLast */
        27,               /* lineNo */
        52,               /* colNo */
        "mu",             /* aName */
        "FKLDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/FKLDBarycenter.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtECInfo
    k_emlrtECI =
        {
            -1,               /* nDims */
            27,               /* lineNo */
            47,               /* colNo */
            "FKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pName */
};

static emlrtBCInfo t_emlrtBCI =
    {
        -1,               /* iFirst */
        -1,               /* iLast */
        27,               /* lineNo */
        70,               /* colNo */
        "mu",             /* aName */
        "FKLDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/FKLDBarycenter.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtECInfo
    l_emlrtECI =
        {
            -1,               /* nDims */
            27,               /* lineNo */
            65,               /* colNo */
            "FKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pName */
};

static emlrtECInfo
    m_emlrtECI =
        {
            2,                /* nDims */
            27,               /* lineNo */
            33,               /* colNo */
            "FKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pName */
};

static emlrtECInfo
    n_emlrtECI =
        {
            2,                /* nDims */
            27,               /* lineNo */
            16,               /* colNo */
            "FKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pName */
};

static emlrtECInfo o_emlrtECI = {
    -1,     /* nDims */
    15,     /* lineNo */
    8,      /* colNo */
    "BDij", /* fName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/BDij.m" /* pName */
};

static emlrtECInfo p_emlrtECI = {
    2,      /* nDims */
    16,     /* lineNo */
    14,     /* colNo */
    "BDij", /* fName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/BDij.m" /* pName */
};

static emlrtRTEInfo e_emlrtRTEI = {
    14,                                                     /* lineNo */
    9,                                                      /* colNo */
    "log",                                                  /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/elfun/log.m" /* pName */
};

static emlrtRTEInfo
    l_emlrtRTEI =
        {
            18,               /* lineNo */
            1,                /* colNo */
            "FKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    m_emlrtRTEI =
        {
            24,               /* lineNo */
            1,                /* colNo */
            "FKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    n_emlrtRTEI =
        {
            20,               /* lineNo */
            21,               /* colNo */
            "FKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    o_emlrtRTEI =
        {
            31,               /* lineNo */
            46,               /* colNo */
            "FKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo p_emlrtRTEI = {
    10,             /* lineNo */
    5,              /* colNo */
    "BDBarycenter", /* fName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pName
                                                                            */
};

static emlrtRTEInfo
    q_emlrtRTEI =
        {
            27,               /* lineNo */
            47,               /* colNo */
            "FKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    r_emlrtRTEI =
        {
            27,               /* lineNo */
            65,               /* colNo */
            "FKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    s_emlrtRTEI =
        {
            27,               /* lineNo */
            46,               /* colNo */
            "FKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo t_emlrtRTEI = {
    22,             /* lineNo */
    12,             /* colNo */
    "BDBarycenter", /* fName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pName
                                                                            */
};

static emlrtRTEInfo
    u_emlrtRTEI =
        {
            27,               /* lineNo */
            27,               /* colNo */
            "FKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo v_emlrtRTEI = {
    34,             /* lineNo */
    5,              /* colNo */
    "BDBarycenter", /* fName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pName
                                                                            */
};

static emlrtRTEInfo w_emlrtRTEI = {
    28,             /* lineNo */
    31,             /* colNo */
    "BDBarycenter", /* fName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pName
                                                                            */
};

static emlrtRTEInfo x_emlrtRTEI = {
    41,             /* lineNo */
    5,              /* colNo */
    "BDBarycenter", /* fName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pName
                                                                            */
};

static emlrtRTEInfo y_emlrtRTEI = {
    47,             /* lineNo */
    5,              /* colNo */
    "BDBarycenter", /* fName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pName
                                                                            */
};

static emlrtRTEInfo ab_emlrtRTEI = {
    43,             /* lineNo */
    19,             /* colNo */
    "BDBarycenter", /* fName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pName
                                                                            */
};

static emlrtRTEInfo bb_emlrtRTEI = {
    56,             /* lineNo */
    5,              /* colNo */
    "BDBarycenter", /* fName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pName
                                                                            */
};

static emlrtRTEInfo cb_emlrtRTEI = {
    37,             /* lineNo */
    37,             /* colNo */
    "BDBarycenter", /* fName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pName
                                                                            */
};

static emlrtRTEInfo db_emlrtRTEI = {
    55,             /* lineNo */
    5,              /* colNo */
    "BDBarycenter", /* fName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pName
                                                                            */
};

static emlrtRTEInfo eb_emlrtRTEI = {
    49,             /* lineNo */
    9,              /* colNo */
    "BDBarycenter", /* fName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pName
                                                                            */
};

static emlrtRTEInfo fb_emlrtRTEI = {
    50,             /* lineNo */
    50,             /* colNo */
    "BDBarycenter", /* fName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pName
                                                                            */
};

static emlrtRTEInfo gb_emlrtRTEI = {
    50,             /* lineNo */
    25,             /* colNo */
    "BDBarycenter", /* fName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pName
                                                                            */
};

static emlrtRTEInfo hb_emlrtRTEI = {
    38,             /* lineNo */
    43,             /* colNo */
    "BDBarycenter", /* fName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pName
                                                                            */
};

static emlrtRTEInfo ib_emlrtRTEI = {
    16,     /* lineNo */
    1,      /* colNo */
    "BDij", /* fName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/BDij.m" /* pName */
};

static emlrtRTEInfo jb_emlrtRTEI = {
    38,             /* lineNo */
    60,             /* colNo */
    "BDBarycenter", /* fName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pName
                                                                            */
};

static emlrtRTEInfo kb_emlrtRTEI = {
    75,                  /* lineNo */
    9,                   /* colNo */
    "eml_mtimes_helper", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/ops/eml_mtimes_helper.m" /* pName
                                                                         */
};

static emlrtRTEInfo lb_emlrtRTEI = {
    77,                  /* lineNo */
    9,                   /* colNo */
    "eml_mtimes_helper", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/ops/eml_mtimes_helper.m" /* pName
                                                                         */
};

static emlrtRTEInfo mb_emlrtRTEI = {
    21,             /* lineNo */
    1,              /* colNo */
    "BDBarycenter", /* fName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pName
                                                                            */
};

static emlrtRTEInfo nb_emlrtRTEI = {
    22,             /* lineNo */
    1,              /* colNo */
    "BDBarycenter", /* fName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pName
                                                                            */
};

static emlrtRTEInfo ob_emlrtRTEI = {
    25,             /* lineNo */
    1,              /* colNo */
    "BDBarycenter", /* fName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pName
                                                                            */
};

static emlrtRTEInfo pb_emlrtRTEI = {
    35,             /* lineNo */
    5,              /* colNo */
    "BDBarycenter", /* fName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pName
                                                                            */
};

static emlrtRTEInfo qb_emlrtRTEI = {
    1,              /* lineNo */
    17,             /* colNo */
    "BDBarycenter", /* fName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pName
                                                                            */
};

static emlrtRSInfo hd_emlrtRSI = {
    66,             /* lineNo */
    "BDBarycenter", /* fcnName */
    "/home/cr055/MATLAB Workspace/MixtureReduction/Merging/BDBarycenter.m" /* pathName
                                                                            */
};

static emlrtRSInfo
    jd_emlrtRSI =
        {
            10,               /* lineNo */
            "FKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pathName */
};

/* Function Declarations */
static void disp(const emlrtStack *sp, const mxArray *b, emlrtMCInfo *location);

/* Function Definitions */
static void disp(const emlrtStack *sp, const mxArray *b, emlrtMCInfo *location)
{
  const mxArray *pArray;
  pArray = b;
  emlrtCallMATLABR2012b((emlrtCTX)sp, 0, NULL, 1, &pArray,
                        (const char_T *)"disp", true, location);
}

void BDBarycenter(const emlrtStack *sp, const emxArray_struct0_T *comps,
                  real_T maxiter, real_T tol, struct0_T *bar)
{
  static const int32_T iv[2] = {1, 66};
  static const int32_T iv4[2] = {1, 64};
  static const char_T u[66] = {
      'T', 'h', 'e', ' ', 'n', 'u', 'm', 'b', 'e', 'r', ' ', 'o', 'f', ' ',
      'c', 'o', 'm', 'p', 'o', 'n', 'e', 'n', 't', 's', ' ', 'i', 'n', ' ',
      't', 'h', 'e', ' ', 'm', 'e', 'r', 'g', 'e', ' ', 'h', 'a', 's', ' ',
      't', 'o', ' ', 'b', 'e', ' ', 'g', 'r', 'e', 'a', 't', 'e', 'r', ' ',
      't', 'h', 'a', 'n', ' ', 'z', 'e', 'r', 'o', '.'};
  static const char_T b_u[64] = {
      'T', 'h', 'e', ' ', 'B', 'D', ' ', 'F', 'P', 'I', ' ', 'a', 'l',
      'g', 'o', 'r', 'i', 't', 'h', 'm', ' ', 'd', 'i', 'd', ' ', 'n',
      'o', 't', ' ', 'c', 'o', 'n', 'v', 'e', 'r', 'g', 'e', ' ', 'i',
      'n', ' ', 't', 'h', 'e', ' ', 'a', 'l', 'l', 'o', 'w', 'e', 'd',
      ' ', 'i', 't', 'e', 'r', 'a', 't', 'i', 'o', 'n', 's', '.'};
  ptrdiff_t incx_t;
  ptrdiff_t incy_t;
  ptrdiff_t n_t;
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack st;
  emxArray_real_T *Sigma;
  emxArray_real_T *SigmaVec;
  emxArray_real_T *Sigmabar;
  emxArray_real_T *Sigmaiinv;
  emxArray_real_T *Sigmainv;
  emxArray_real_T *b_Sigma;
  emxArray_real_T *barOld_Sigma;
  emxArray_real_T *barOld_mu;
  emxArray_real_T *c_Sigma;
  emxArray_real_T *diff;
  emxArray_real_T *mu;
  emxArray_real_T *muVec;
  emxArray_real_T *mubar;
  emxArray_real_T *mui;
  emxArray_real_T *wi;
  const mxArray *b_y;
  const mxArray *m;
  const mxArray *y;
  real_T b_x;
  real_T c_x;
  real_T c_y;
  real_T wbar;
  real_T wiSum;
  real_T x;
  int32_T b_Sigmaiinv[2];
  int32_T iv1[2];
  int32_T iv2[2];
  int32_T iv3[2];
  int32_T b_i;
  int32_T b_loop_ub;
  int32_T c_loop_ub;
  int32_T d;
  int32_T d_loop_ub;
  int32_T e_loop_ub;
  int32_T f_loop_ub;
  int32_T g_loop_ub;
  int32_T h_loop_ub;
  int32_T i;
  int32_T i1;
  int32_T i2;
  int32_T i3;
  int32_T i4;
  int32_T i5;
  int32_T i6;
  int32_T i7;
  int32_T k;
  int32_T loop_ub;
  int32_T n;
  boolean_T exitg1;
  boolean_T guard1 = false;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  c_st.prev = &b_st;
  c_st.tls = b_st.tls;
  emlrtHeapReferenceStackEnterFcnR2012b((emlrtCTX)sp);
  /*  if alpha==0 */
  st.site = &emlrtRSI;
  /*  KLDBar = KLDBarycenter(comps): */
  /*  INPUTS: */
  /*  - comps, a vector of weighted Gaussian components (numComps x 1 vector).
   */
  /*  OUTPUTS: */
  /*  - KLDBar, the moment preserving merge of the input components (weighted
   * Gaussian density). */
  /*  This function takes as input a vecot of Gaussian components and returns */
  /*  their moment-preseving merge (KLD-barycenter). */
  if (comps->size[0] <= 0) {
    y = NULL;
    m = emlrtCreateCharArray(2, &iv[0]);
    emlrtInitCharArrayR2013a(&st, 66, m, &u[0]);
    emlrtAssign(&y, m);
    b_st.site = &jd_emlrtRSI;
    error(&b_st, y, &b_emlrtMCI);
  }
  emxInit_real_T(&st, &SigmaVec, 3, &nb_emlrtRTEI, true);
  emxInit_real_T(&st, &Sigma, 2, &y_emlrtRTEI, true);
  emxInit_real_T(&st, &diff, 1, &eb_emlrtRTEI, true);
  emxInit_real_T(&st, &mubar, 1, &l_emlrtRTEI, true);
  b_st.site = &i_emlrtRSI;
  paramsFromMixture(&b_st, comps, diff, Sigma, SigmaVec);
  b_st.site = &j_emlrtRSI;
  wbar = sum(&b_st, diff);
  loop_ub = Sigma->size[0];
  i = mubar->size[0];
  mubar->size[0] = Sigma->size[0];
  emxEnsureCapacity_real_T(&st, mubar, i, &l_emlrtRTEI);
  for (i = 0; i < loop_ub; i++) {
    mubar->data[i] = 0.0;
  }
  i = comps->size[0];
  emxInit_real_T(&st, &b_Sigma, 1, &q_emlrtRTEI, true);
  for (b_i = 0; b_i < i; b_i++) {
    if (b_i + 1 > diff->size[0]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, diff->size[0], &o_emlrtBCI,
                                    &st);
    }
    if (b_i + 1 > Sigma->size[1]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, Sigma->size[1], &p_emlrtBCI,
                                    &st);
    }
    loop_ub = Sigma->size[0];
    i1 = b_Sigma->size[0];
    b_Sigma->size[0] = Sigma->size[0];
    emxEnsureCapacity_real_T(&st, b_Sigma, i1, &n_emlrtRTEI);
    for (i1 = 0; i1 < loop_ub; i1++) {
      b_Sigma->data[i1] =
          diff->data[b_i] * Sigma->data[i1 + Sigma->size[0] * b_i];
    }
    loop_ub = mubar->size[0];
    if (mubar->size[0] != b_Sigma->size[0]) {
      emlrtSizeEqCheck1DR2012b(mubar->size[0], b_Sigma->size[0], &j_emlrtECI,
                               &st);
    }
    for (i1 = 0; i1 < loop_ub; i1++) {
      mubar->data[i1] += b_Sigma->data[i1];
    }
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b(&st);
    }
  }
  wiSum = 1.0 / wbar;
  loop_ub = mubar->size[0];
  for (i = 0; i < loop_ub; i++) {
    mubar->data[i] *= wiSum;
  }
  emxInit_real_T(&st, &Sigmabar, 2, &m_emlrtRTEI, true);
  i = Sigmabar->size[0] * Sigmabar->size[1];
  Sigmabar->size[0] = Sigma->size[0];
  Sigmabar->size[1] = Sigma->size[0];
  emxEnsureCapacity_real_T(&st, Sigmabar, i, &m_emlrtRTEI);
  loop_ub = Sigma->size[0] * Sigma->size[0];
  for (i = 0; i < loop_ub; i++) {
    Sigmabar->data[i] = 0.0;
  }
  i = comps->size[0];
  if (0 <= comps->size[0] - 1) {
    i2 = Sigma->size[0];
    k = Sigma->size[0];
    n = Sigma->size[0];
    b_loop_ub = Sigma->size[0];
    d = Sigma->size[0];
    iv1[0] = SigmaVec->size[0];
    iv1[1] = SigmaVec->size[1];
    c_loop_ub = SigmaVec->size[0];
    i3 = SigmaVec->size[1];
    d_loop_ub = SigmaVec->size[1];
  }
  emxInit_real_T(&st, &Sigmainv, 2, &pb_emlrtRTEI, true);
  emxInit_real_T(&st, &c_Sigma, 2, &r_emlrtRTEI, true);
  for (b_i = 0; b_i < i; b_i++) {
    if (b_i + 1 > Sigma->size[1]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, Sigma->size[1], &s_emlrtBCI,
                                    &st);
    }
    if (i2 != mubar->size[0]) {
      emlrtSizeEqCheck1DR2012b(i2, mubar->size[0], &k_emlrtECI, &st);
    }
    if (b_i + 1 > Sigma->size[1]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, Sigma->size[1], &t_emlrtBCI,
                                    &st);
    }
    if (k != mubar->size[0]) {
      emlrtSizeEqCheck1DR2012b(k, mubar->size[0], &l_emlrtECI, &st);
    }
    if (b_i + 1 > SigmaVec->size[2]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, SigmaVec->size[2], &r_emlrtBCI,
                                    &st);
    }
    i1 = b_Sigma->size[0];
    b_Sigma->size[0] = n;
    emxEnsureCapacity_real_T(&st, b_Sigma, i1, &q_emlrtRTEI);
    i1 = c_Sigma->size[0] * c_Sigma->size[1];
    c_Sigma->size[0] = 1;
    c_Sigma->size[1] = d;
    emxEnsureCapacity_real_T(&st, c_Sigma, i1, &r_emlrtRTEI);
    for (i1 = 0; i1 < b_loop_ub; i1++) {
      wiSum = Sigma->data[i1 + Sigma->size[0] * b_i] - mubar->data[i1];
      b_Sigma->data[i1] = wiSum;
      c_Sigma->data[i1] = wiSum;
    }
    i1 = Sigmainv->size[0] * Sigmainv->size[1];
    Sigmainv->size[0] = b_Sigma->size[0];
    Sigmainv->size[1] = c_Sigma->size[1];
    emxEnsureCapacity_real_T(&st, Sigmainv, i1, &s_emlrtRTEI);
    loop_ub = c_Sigma->size[1];
    for (i1 = 0; i1 < loop_ub; i1++) {
      e_loop_ub = b_Sigma->size[0];
      for (i4 = 0; i4 < e_loop_ub; i4++) {
        Sigmainv->data[i4 + Sigmainv->size[0] * i1] =
            b_Sigma->data[i4] * c_Sigma->data[i1];
      }
    }
    iv2[0] = (*(int32_T(*)[2])Sigmainv->size)[0];
    iv2[1] = (*(int32_T(*)[2])Sigmainv->size)[1];
    emlrtSizeEqCheckNDR2012b(&iv1[0], &iv2[0], &m_emlrtECI, &st);
    if (b_i + 1 > diff->size[0]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, diff->size[0], &q_emlrtBCI,
                                    &st);
    }
    i1 = Sigmainv->size[0] * Sigmainv->size[1];
    Sigmainv->size[0] = c_loop_ub;
    Sigmainv->size[1] = i3;
    emxEnsureCapacity_real_T(&st, Sigmainv, i1, &u_emlrtRTEI);
    for (i1 = 0; i1 < d_loop_ub; i1++) {
      for (i4 = 0; i4 < c_loop_ub; i4++) {
        Sigmainv->data[i4 + Sigmainv->size[0] * i1] =
            diff->data[b_i] *
            (SigmaVec->data[(i4 + SigmaVec->size[0] * i1) +
                            SigmaVec->size[0] * SigmaVec->size[1] * b_i] +
             Sigmainv->data[i4 + Sigmainv->size[0] * i1]);
      }
    }
    iv2[0] = (*(int32_T(*)[2])Sigmabar->size)[0];
    iv2[1] = (*(int32_T(*)[2])Sigmabar->size)[1];
    iv3[0] = (*(int32_T(*)[2])Sigmainv->size)[0];
    iv3[1] = (*(int32_T(*)[2])Sigmainv->size)[1];
    emlrtSizeEqCheckNDR2012b(&iv2[0], &iv3[0], &n_emlrtECI, &st);
    loop_ub = Sigmabar->size[0] * Sigmabar->size[1];
    for (i1 = 0; i1 < loop_ub; i1++) {
      Sigmabar->data[i1] += Sigmainv->data[i1];
    }
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b(&st);
    }
  }
  i = bar->Sigma->size[0] * bar->Sigma->size[1];
  bar->Sigma->size[0] = Sigmabar->size[0];
  bar->Sigma->size[1] = Sigmabar->size[1];
  emxEnsureCapacity_real_T(&st, bar->Sigma, i, &o_emlrtRTEI);
  loop_ub = Sigmabar->size[0] * Sigmabar->size[1];
  for (i = 0; i < loop_ub; i++) {
    bar->Sigma->data[i] = Sigmabar->data[i] / wbar;
  }
  bar->w = wbar;
  i = bar->mu->size[0];
  bar->mu->size[0] = mubar->size[0];
  emxEnsureCapacity_real_T(&st, bar->mu, i, &p_emlrtRTEI);
  loop_ub = mubar->size[0];
  for (i = 0; i < loop_ub; i++) {
    bar->mu->data[i] = mubar->data[i];
  }
  /*  elseif alpha==1 */
  /*      Dabar = KLDBarycenter(comps); */
  /*  else */
  /*      [~,idx] = max([comps.w]); */
  /*      Dabar = comps(idx); */
  /*  end */
  n = comps->size[0] - 1;
  if (1 > comps->size[0]) {
    emlrtDynamicBoundsCheckR2012b(1, 1, comps->size[0], &emlrtBCI,
                                  (emlrtCTX)sp);
  }
  emxInit_real_T(sp, &Sigmaiinv, 3, &ob_emlrtRTEI, true);
  emxInit_real_T(sp, &wi, 1, &qb_emlrtRTEI, true);
  emxInit_real_T(sp, &mui, 2, &qb_emlrtRTEI, true);
  d = comps->data[0].mu->size[0];
  st.site = &b_emlrtRSI;
  paramsFromMixture(&st, comps, wi, mui, SigmaVec);
  st.site = &c_emlrtRSI;
  wiSum = sum(&st, wi);
  i = comps->size[0];
  i1 = Sigmaiinv->size[0] * Sigmaiinv->size[1] * Sigmaiinv->size[2];
  Sigmaiinv->size[0] = comps->data[0].mu->size[0];
  Sigmaiinv->size[1] = comps->data[0].mu->size[0];
  Sigmaiinv->size[2] = comps->size[0];
  emxEnsureCapacity_real_T(sp, Sigmaiinv, i1, &t_emlrtRTEI);
  for (b_i = 0; b_i < i; b_i++) {
    if (b_i + 1 > Sigmaiinv->size[2]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, Sigmaiinv->size[2], &c_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    st.site = &d_emlrtRSI;
    b_st.site = &d_emlrtRSI;
    eye(&b_st, d, Sigma);
    if (b_i + 1 > SigmaVec->size[2]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, SigmaVec->size[2], &b_emlrtBCI,
                                    &st);
    }
    loop_ub = SigmaVec->size[1];
    if (SigmaVec->size[1] != Sigma->size[1]) {
      emlrtErrorWithMessageIdR2018a(&st, &b_emlrtRTEI, "MATLAB:dimagree",
                                    "MATLAB:dimagree", 0);
    }
    b_loop_ub = SigmaVec->size[0];
    i1 = Sigmabar->size[0] * Sigmabar->size[1];
    Sigmabar->size[0] = SigmaVec->size[0];
    Sigmabar->size[1] = SigmaVec->size[1];
    emxEnsureCapacity_real_T(&st, Sigmabar, i1, &w_emlrtRTEI);
    for (i1 = 0; i1 < loop_ub; i1++) {
      for (i2 = 0; i2 < b_loop_ub; i2++) {
        Sigmabar->data[i2 + Sigmabar->size[0] * i1] =
            SigmaVec->data[(i2 + SigmaVec->size[0] * i1) +
                           SigmaVec->size[0] * SigmaVec->size[1] * b_i];
      }
    }
    b_st.site = &bb_emlrtRSI;
    mrdiv(&b_st, Sigma, Sigmabar);
    b_Sigmaiinv[0] = Sigmaiinv->size[0];
    b_Sigmaiinv[1] = Sigmaiinv->size[1];
    emlrtSubAssignSizeCheckR2012b(&b_Sigmaiinv[0], 2, &Sigma->size[0], 2,
                                  &emlrtECI, (emlrtCTX)sp);
    loop_ub = Sigma->size[1];
    for (i1 = 0; i1 < loop_ub; i1++) {
      b_loop_ub = Sigma->size[0];
      for (i2 = 0; i2 < b_loop_ub; i2++) {
        Sigmaiinv->data[(i2 + Sigmaiinv->size[0] * i1) +
                        Sigmaiinv->size[0] * Sigmaiinv->size[1] * b_i] =
            Sigma->data[i2 + Sigma->size[0] * i1];
      }
    }
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b((emlrtCTX)sp);
    }
  }
  wbar = 0.0;
  emlrtForLoopVectorCheckR2021a(1.0, 1.0, maxiter, mxDOUBLE_CLASS,
                                (int32_T)maxiter, &emlrtRTEI, (emlrtCTX)sp);
  k = 0;
  emxInit_real_T(sp, &muVec, 2, &mb_emlrtRTEI, true);
  emxInit_real_T(sp, &barOld_mu, 1, &v_emlrtRTEI, true);
  emxInit_real_T(sp, &barOld_Sigma, 2, &v_emlrtRTEI, true);
  emxInit_real_T(sp, &mu, 1, &x_emlrtRTEI, true);
  exitg1 = false;
  while ((!exitg1) && (k <= (int32_T)maxiter - 1)) {
    i = barOld_mu->size[0];
    barOld_mu->size[0] = bar->mu->size[0];
    emxEnsureCapacity_real_T(sp, barOld_mu, i, &v_emlrtRTEI);
    loop_ub = bar->mu->size[0];
    for (i = 0; i < loop_ub; i++) {
      barOld_mu->data[i] = bar->mu->data[i];
    }
    i = barOld_Sigma->size[0] * barOld_Sigma->size[1];
    barOld_Sigma->size[0] = bar->Sigma->size[0];
    barOld_Sigma->size[1] = bar->Sigma->size[1];
    emxEnsureCapacity_real_T(sp, barOld_Sigma, i, &v_emlrtRTEI);
    loop_ub = bar->Sigma->size[0] * bar->Sigma->size[1];
    for (i = 0; i < loop_ub; i++) {
      barOld_Sigma->data[i] = bar->Sigma->data[i];
    }
    st.site = &e_emlrtRSI;
    b_st.site = &e_emlrtRSI;
    eye(&b_st, d, Sigmainv);
    if (bar->Sigma->size[1] != Sigmainv->size[1]) {
      emlrtErrorWithMessageIdR2018a(&st, &b_emlrtRTEI, "MATLAB:dimagree",
                                    "MATLAB:dimagree", 0);
    }
    b_st.site = &bb_emlrtRSI;
    mrdiv(&b_st, Sigmainv, bar->Sigma);
    i = SigmaVec->size[0] * SigmaVec->size[1] * SigmaVec->size[2];
    SigmaVec->size[0] = comps->data[0].mu->size[0];
    SigmaVec->size[1] = comps->data[0].mu->size[0];
    SigmaVec->size[2] = comps->size[0];
    emxEnsureCapacity_real_T(sp, SigmaVec, i, &t_emlrtRTEI);
    i = muVec->size[0] * muVec->size[1];
    muVec->size[0] = comps->data[0].mu->size[0];
    muVec->size[1] = comps->size[0];
    emxEnsureCapacity_real_T(sp, muVec, i, &t_emlrtRTEI);
    for (b_i = 0; b_i <= n; b_i++) {
      if (b_i + 1 > Sigmaiinv->size[2]) {
        emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, Sigmaiinv->size[2],
                                      &d_emlrtBCI, (emlrtCTX)sp);
      }
      b_Sigmaiinv[0] = Sigmaiinv->size[0];
      b_Sigmaiinv[1] = Sigmaiinv->size[1];
      iv1[0] = (*(int32_T(*)[2])Sigmainv->size)[0];
      iv1[1] = (*(int32_T(*)[2])Sigmainv->size)[1];
      emlrtSizeEqCheckNDR2012b(&b_Sigmaiinv[0], &iv1[0], &b_emlrtECI,
                               (emlrtCTX)sp);
      if (b_i + 1 > SigmaVec->size[2]) {
        emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, SigmaVec->size[2],
                                      &e_emlrtBCI, (emlrtCTX)sp);
      }
      st.site = &f_emlrtRSI;
      eye(&st, d, Sigmabar);
      loop_ub = Sigmabar->size[0] * Sigmabar->size[1];
      for (i = 0; i < loop_ub; i++) {
        Sigmabar->data[i] *= 2.0;
      }
      st.site = &f_emlrtRSI;
      loop_ub = Sigmaiinv->size[0];
      b_loop_ub = Sigmaiinv->size[1];
      i = Sigma->size[0] * Sigma->size[1];
      Sigma->size[0] = Sigmaiinv->size[0];
      Sigma->size[1] = Sigmaiinv->size[1];
      emxEnsureCapacity_real_T(&st, Sigma, i, &cb_emlrtRTEI);
      for (i = 0; i < b_loop_ub; i++) {
        for (i1 = 0; i1 < loop_ub; i1++) {
          Sigma->data[i1 + Sigma->size[0] * i] =
              Sigmaiinv->data[(i1 + Sigmaiinv->size[0] * i) +
                              Sigmaiinv->size[0] * Sigmaiinv->size[1] * b_i] +
              Sigmainv->data[i1 + Sigmainv->size[0] * i];
        }
      }
      if (Sigma->size[1] != Sigmabar->size[1]) {
        emlrtErrorWithMessageIdR2018a(&st, &b_emlrtRTEI, "MATLAB:dimagree",
                                      "MATLAB:dimagree", 0);
      }
      b_st.site = &bb_emlrtRSI;
      mrdiv(&b_st, Sigmabar, Sigma);
      b_Sigmaiinv[0] = SigmaVec->size[0];
      b_Sigmaiinv[1] = SigmaVec->size[1];
      emlrtSubAssignSizeCheckR2012b(&b_Sigmaiinv[0], 2, &Sigmabar->size[0], 2,
                                    &c_emlrtECI, (emlrtCTX)sp);
      loop_ub = Sigmabar->size[1];
      for (i = 0; i < loop_ub; i++) {
        b_loop_ub = Sigmabar->size[0];
        for (i1 = 0; i1 < b_loop_ub; i1++) {
          SigmaVec->data[(i1 + SigmaVec->size[0] * i) +
                         SigmaVec->size[0] * SigmaVec->size[1] * b_i] =
              Sigmabar->data[i1 + Sigmabar->size[0] * i];
        }
      }
      st.site = &g_emlrtRSI;
      if (b_i + 1 > Sigmaiinv->size[2]) {
        emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, Sigmaiinv->size[2],
                                      &g_emlrtBCI, &st);
      }
      if (b_i + 1 > mui->size[1]) {
        emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, mui->size[1], &h_emlrtBCI,
                                      &st);
      }
      loop_ub = Sigmaiinv->size[1];
      b_loop_ub = Sigmaiinv->size[0];
      i = Sigmabar->size[0] * Sigmabar->size[1];
      Sigmabar->size[0] = Sigmaiinv->size[0];
      Sigmabar->size[1] = Sigmaiinv->size[1];
      emxEnsureCapacity_real_T(&st, Sigmabar, i, &hb_emlrtRTEI);
      for (i = 0; i < loop_ub; i++) {
        for (i1 = 0; i1 < b_loop_ub; i1++) {
          Sigmabar->data[i1 + Sigmabar->size[0] * i] =
              Sigmaiinv->data[(i1 + Sigmaiinv->size[0] * i) +
                              Sigmaiinv->size[0] * Sigmaiinv->size[1] * b_i];
        }
      }
      loop_ub = mui->size[0];
      i = b_Sigma->size[0];
      b_Sigma->size[0] = mui->size[0];
      emxEnsureCapacity_real_T(&st, b_Sigma, i, &jb_emlrtRTEI);
      for (i = 0; i < loop_ub; i++) {
        b_Sigma->data[i] = mui->data[i + mui->size[0] * b_i];
      }
      b_st.site = &tc_emlrtRSI;
      dynamic_size_checks(&b_st, Sigmabar, b_Sigma, Sigmaiinv->size[1],
                          mui->size[0]);
      loop_ub = Sigmaiinv->size[0];
      b_loop_ub = Sigmaiinv->size[1];
      i = Sigmabar->size[0] * Sigmabar->size[1];
      Sigmabar->size[0] = Sigmaiinv->size[0];
      Sigmabar->size[1] = Sigmaiinv->size[1];
      emxEnsureCapacity_real_T(&st, Sigmabar, i, &hb_emlrtRTEI);
      for (i = 0; i < b_loop_ub; i++) {
        for (i1 = 0; i1 < loop_ub; i1++) {
          Sigmabar->data[i1 + Sigmabar->size[0] * i] =
              Sigmaiinv->data[(i1 + Sigmaiinv->size[0] * i) +
                              Sigmaiinv->size[0] * Sigmaiinv->size[1] * b_i];
        }
      }
      loop_ub = mui->size[0];
      i = b_Sigma->size[0];
      b_Sigma->size[0] = mui->size[0];
      emxEnsureCapacity_real_T(&st, b_Sigma, i, &jb_emlrtRTEI);
      for (i = 0; i < loop_ub; i++) {
        b_Sigma->data[i] = mui->data[i + mui->size[0] * b_i];
      }
      b_st.site = &sc_emlrtRSI;
      mtimes(&b_st, Sigmabar, b_Sigma, mubar);
      st.site = &g_emlrtRSI;
      b_st.site = &tc_emlrtRSI;
      dynamic_size_checks(&b_st, Sigmainv, bar->mu, Sigmainv->size[1],
                          bar->mu->size[0]);
      b_st.site = &sc_emlrtRSI;
      mtimes(&b_st, Sigmainv, bar->mu, b_Sigma);
      if (mubar->size[0] != b_Sigma->size[0]) {
        emlrtSizeEqCheck1DR2012b(mubar->size[0], b_Sigma->size[0], &d_emlrtECI,
                                 (emlrtCTX)sp);
      }
      if (b_i + 1 > muVec->size[1]) {
        emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, muVec->size[1], &j_emlrtBCI,
                                      (emlrtCTX)sp);
      }
      if (b_i + 1 > SigmaVec->size[2]) {
        emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, SigmaVec->size[2],
                                      &f_emlrtBCI, (emlrtCTX)sp);
      }
      loop_ub = SigmaVec->size[0];
      b_loop_ub = SigmaVec->size[1];
      i = Sigma->size[0] * Sigma->size[1];
      Sigma->size[0] = SigmaVec->size[0];
      Sigma->size[1] = SigmaVec->size[1];
      emxEnsureCapacity_real_T(sp, Sigma, i, &lb_emlrtRTEI);
      for (i = 0; i < b_loop_ub; i++) {
        for (i1 = 0; i1 < loop_ub; i1++) {
          Sigma->data[i1 + Sigma->size[0] * i] =
              0.5 * SigmaVec->data[(i1 + SigmaVec->size[0] * i) +
                                   SigmaVec->size[0] * SigmaVec->size[1] * b_i];
        }
      }
      st.site = &g_emlrtRSI;
      loop_ub = mubar->size[0];
      for (i = 0; i < loop_ub; i++) {
        mubar->data[i] += b_Sigma->data[i];
      }
      b_st.site = &tc_emlrtRSI;
      dynamic_size_checks(&b_st, Sigma, mubar, Sigma->size[1], mubar->size[0]);
      b_st.site = &sc_emlrtRSI;
      mtimes(&b_st, Sigma, mubar, b_Sigma);
      emlrtSubAssignSizeCheckR2012b(&muVec->size[0], 1, &b_Sigma->size[0], 1,
                                    &e_emlrtECI, (emlrtCTX)sp);
      loop_ub = b_Sigma->size[0];
      for (i = 0; i < loop_ub; i++) {
        muVec->data[i + muVec->size[0] * b_i] = b_Sigma->data[i];
      }
      if (*emlrtBreakCheckR2012bFlagVar != 0) {
        emlrtBreakCheckR2012b((emlrtCTX)sp);
      }
    }
    i = mu->size[0];
    mu->size[0] = d;
    emxEnsureCapacity_real_T(sp, mu, i, &x_emlrtRTEI);
    for (i = 0; i < d; i++) {
      mu->data[i] = 0.0;
    }
    for (b_i = 0; b_i <= n; b_i++) {
      if (b_i + 1 > wi->size[0]) {
        emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, wi->size[0], &i_emlrtBCI,
                                      (emlrtCTX)sp);
      }
      if (b_i + 1 > muVec->size[1]) {
        emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, muVec->size[1], &k_emlrtBCI,
                                      (emlrtCTX)sp);
      }
      loop_ub = muVec->size[0];
      i = b_Sigma->size[0];
      b_Sigma->size[0] = muVec->size[0];
      emxEnsureCapacity_real_T(sp, b_Sigma, i, &ab_emlrtRTEI);
      for (i = 0; i < loop_ub; i++) {
        b_Sigma->data[i] =
            wi->data[b_i] * muVec->data[i + muVec->size[0] * b_i];
      }
      loop_ub = mu->size[0];
      if (mu->size[0] != b_Sigma->size[0]) {
        emlrtSizeEqCheck1DR2012b(mu->size[0], b_Sigma->size[0], &f_emlrtECI,
                                 (emlrtCTX)sp);
      }
      for (i = 0; i < loop_ub; i++) {
        mu->data[i] += b_Sigma->data[i];
      }
      if (*emlrtBreakCheckR2012bFlagVar != 0) {
        emlrtBreakCheckR2012b((emlrtCTX)sp);
      }
    }
    loop_ub = mu->size[0];
    for (i = 0; i < loop_ub; i++) {
      mu->data[i] /= wiSum;
    }
    i = Sigma->size[0] * Sigma->size[1];
    Sigma->size[0] = d;
    Sigma->size[1] = d;
    emxEnsureCapacity_real_T(sp, Sigma, i, &y_emlrtRTEI);
    loop_ub = d * d;
    for (i = 0; i < loop_ub; i++) {
      Sigma->data[i] = 0.0;
    }
    if (0 <= n) {
      i5 = muVec->size[0];
      i6 = muVec->size[0];
      f_loop_ub = muVec->size[0];
      b_Sigmaiinv[0] = SigmaVec->size[0];
      b_Sigmaiinv[1] = SigmaVec->size[1];
      g_loop_ub = SigmaVec->size[0];
      i7 = SigmaVec->size[1];
      h_loop_ub = SigmaVec->size[1];
    }
    for (b_i = 0; b_i <= n; b_i++) {
      if (b_i + 1 > muVec->size[1]) {
        emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, muVec->size[1], &l_emlrtBCI,
                                      (emlrtCTX)sp);
      }
      if (i5 != mu->size[0]) {
        emlrtSizeEqCheck1DR2012b(i5, mu->size[0], &g_emlrtECI, (emlrtCTX)sp);
      }
      i = diff->size[0];
      diff->size[0] = i6;
      emxEnsureCapacity_real_T(sp, diff, i, &eb_emlrtRTEI);
      for (i = 0; i < f_loop_ub; i++) {
        diff->data[i] = muVec->data[i + muVec->size[0] * b_i] - mu->data[i];
      }
      if (b_i + 1 > SigmaVec->size[2]) {
        emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, SigmaVec->size[2],
                                      &n_emlrtBCI, (emlrtCTX)sp);
      }
      i = Sigmainv->size[0] * Sigmainv->size[1];
      Sigmainv->size[0] = diff->size[0];
      Sigmainv->size[1] = diff->size[0];
      emxEnsureCapacity_real_T(sp, Sigmainv, i, &fb_emlrtRTEI);
      loop_ub = diff->size[0];
      for (i = 0; i < loop_ub; i++) {
        b_loop_ub = diff->size[0];
        for (i1 = 0; i1 < b_loop_ub; i1++) {
          Sigmainv->data[i1 + Sigmainv->size[0] * i] =
              diff->data[i1] * diff->data[i];
        }
      }
      iv1[0] = (*(int32_T(*)[2])Sigmainv->size)[0];
      iv1[1] = (*(int32_T(*)[2])Sigmainv->size)[1];
      emlrtSizeEqCheckNDR2012b(&b_Sigmaiinv[0], &iv1[0], &h_emlrtECI,
                               (emlrtCTX)sp);
      if (b_i + 1 > wi->size[0]) {
        emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, wi->size[0], &m_emlrtBCI,
                                      (emlrtCTX)sp);
      }
      i = Sigmainv->size[0] * Sigmainv->size[1];
      Sigmainv->size[0] = g_loop_ub;
      Sigmainv->size[1] = i7;
      emxEnsureCapacity_real_T(sp, Sigmainv, i, &gb_emlrtRTEI);
      for (i = 0; i < h_loop_ub; i++) {
        for (i1 = 0; i1 < g_loop_ub; i1++) {
          Sigmainv->data[i1 + Sigmainv->size[0] * i] =
              wi->data[b_i] *
              (SigmaVec->data[(i1 + SigmaVec->size[0] * i) +
                              SigmaVec->size[0] * SigmaVec->size[1] * b_i] +
               Sigmainv->data[i1 + Sigmainv->size[0] * i]);
        }
      }
      iv1[0] = (*(int32_T(*)[2])Sigma->size)[0];
      iv1[1] = (*(int32_T(*)[2])Sigma->size)[1];
      iv2[0] = (*(int32_T(*)[2])Sigmainv->size)[0];
      iv2[1] = (*(int32_T(*)[2])Sigmainv->size)[1];
      emlrtSizeEqCheckNDR2012b(&iv1[0], &iv2[0], &i_emlrtECI, (emlrtCTX)sp);
      loop_ub = Sigma->size[0] * Sigma->size[1];
      for (i = 0; i < loop_ub; i++) {
        Sigma->data[i] += Sigmainv->data[i];
      }
      if (*emlrtBreakCheckR2012bFlagVar != 0) {
        emlrtBreakCheckR2012b((emlrtCTX)sp);
      }
    }
    i = bar->Sigma->size[0] * bar->Sigma->size[1];
    bar->Sigma->size[0] = Sigma->size[0];
    bar->Sigma->size[1] = Sigma->size[1];
    emxEnsureCapacity_real_T(sp, bar->Sigma, i, &bb_emlrtRTEI);
    loop_ub = Sigma->size[0] * Sigma->size[1];
    for (i = 0; i < loop_ub; i++) {
      bar->Sigma->data[i] = Sigma->data[i] / wiSum;
    }
    i = bar->mu->size[0];
    bar->mu->size[0] = mu->size[0];
    emxEnsureCapacity_real_T(sp, bar->mu, i, &db_emlrtRTEI);
    loop_ub = mu->size[0];
    for (i = 0; i < loop_ub; i++) {
      bar->mu->data[i] = mu->data[i];
    }
    guard1 = false;
    if (muDoubleScalarRem((real_T)k + 1.0, 5.0) == 0.0) {
      st.site = &h_emlrtRSI;
      /*  dBhatt = BDij(pdfi,pdfj): */
      /*  INPUT: */
      /*  - pdfi, pdfj, two Gaussian densities. */
      /*  OUTPUT: */
      /*  - dBhatt, the Bhattacharyya distance value (scalar). */
      /*  This function implements the Bhattacharyya distance computation for
       * two Gaussian densities. */
      /*  Note that the Bhattacharyya distance is a Chernoff alpha-divergence
       * for */
      /*  alpha = 0.5. */
      if (mu->size[0] != barOld_mu->size[0]) {
        emlrtSizeEqCheck1DR2012b(mu->size[0], barOld_mu->size[0], &o_emlrtECI,
                                 &st);
      }
      loop_ub = mu->size[0];
      for (i = 0; i < loop_ub; i++) {
        mu->data[i] -= barOld_mu->data[i];
      }
      iv1[0] = (*(int32_T(*)[2])bar->Sigma->size)[0];
      iv1[1] = (*(int32_T(*)[2])bar->Sigma->size)[1];
      iv2[0] = (*(int32_T(*)[2])barOld_Sigma->size)[0];
      iv2[1] = (*(int32_T(*)[2])barOld_Sigma->size)[1];
      emlrtSizeEqCheckNDR2012b(&iv1[0], &iv2[0], &p_emlrtECI, &st);
      i = Sigma->size[0] * Sigma->size[1];
      Sigma->size[0] = bar->Sigma->size[0];
      Sigma->size[1] = bar->Sigma->size[1];
      emxEnsureCapacity_real_T(&st, Sigma, i, &ib_emlrtRTEI);
      loop_ub = bar->Sigma->size[0] * bar->Sigma->size[1];
      for (i = 0; i < loop_ub; i++) {
        Sigma->data[i] = 0.5 * (bar->Sigma->data[i] + barOld_Sigma->data[i]);
      }
      i = c_Sigma->size[0] * c_Sigma->size[1];
      c_Sigma->size[0] = 1;
      c_Sigma->size[1] = mu->size[0];
      emxEnsureCapacity_real_T(&st, c_Sigma, i, &kb_emlrtRTEI);
      loop_ub = mu->size[0];
      for (i = 0; i < loop_ub; i++) {
        c_Sigma->data[i] = 0.125 * mu->data[i];
      }
      b_st.site = &wc_emlrtRSI;
      c_st.site = &wc_emlrtRSI;
      mldivide(&c_st, Sigma, mu, mubar);
      c_st.site = &tc_emlrtRSI;
      if (mubar->size[0] != c_Sigma->size[1]) {
        if ((c_Sigma->size[1] == 1) || (mubar->size[0] == 1)) {
          emlrtErrorWithMessageIdR2018a(
              &c_st, &d_emlrtRTEI,
              "Coder:toolbox:mtimes_noDynamicScalarExpansion",
              "Coder:toolbox:mtimes_noDynamicScalarExpansion", 0);
        } else {
          emlrtErrorWithMessageIdR2018a(&c_st, &c_emlrtRTEI, "MATLAB:innerdim",
                                        "MATLAB:innerdim", 0);
        }
      }
      if (c_Sigma->size[1] < 1) {
        c_y = 0.0;
      } else {
        n_t = (ptrdiff_t)c_Sigma->size[1];
        incx_t = (ptrdiff_t)1;
        incy_t = (ptrdiff_t)1;
        c_y = ddot(&n_t, &c_Sigma->data[0], &incx_t, &mubar->data[0], &incy_t);
      }
      b_st.site = &wc_emlrtRSI;
      c_st.site = &wc_emlrtRSI;
      x = det(&c_st, Sigma);
      if (x < 0.0) {
        emlrtErrorWithMessageIdR2018a(
            &b_st, &e_emlrtRTEI, "Coder:toolbox:ElFunDomainError",
            "Coder:toolbox:ElFunDomainError", 3, 4, 3, "log");
      }
      x = muDoubleScalarLog(x);
      b_st.site = &wc_emlrtRSI;
      c_st.site = &wc_emlrtRSI;
      b_x = det(&c_st, bar->Sigma);
      if (b_x < 0.0) {
        emlrtErrorWithMessageIdR2018a(
            &b_st, &e_emlrtRTEI, "Coder:toolbox:ElFunDomainError",
            "Coder:toolbox:ElFunDomainError", 3, 4, 3, "log");
      }
      b_x = muDoubleScalarLog(b_x);
      b_st.site = &wc_emlrtRSI;
      c_st.site = &wc_emlrtRSI;
      c_x = det(&c_st, barOld_Sigma);
      if (c_x < 0.0) {
        emlrtErrorWithMessageIdR2018a(
            &b_st, &e_emlrtRTEI, "Coder:toolbox:ElFunDomainError",
            "Coder:toolbox:ElFunDomainError", 3, 4, 3, "log");
      }
      c_x = muDoubleScalarLog(c_x);
      if (((c_y + 0.5 * x) - 0.25 * b_x) - 0.25 * c_x < tol) {
        exitg1 = true;
      } else {
        guard1 = true;
      }
    } else {
      guard1 = true;
    }
    if (guard1) {
      wbar++;
      k++;
      if (*emlrtBreakCheckR2012bFlagVar != 0) {
        emlrtBreakCheckR2012b((emlrtCTX)sp);
      }
    }
  }
  emxFree_real_T(&c_Sigma);
  emxFree_real_T(&b_Sigma);
  emxFree_real_T(&Sigmabar);
  emxFree_real_T(&mubar);
  emxFree_real_T(&mui);
  emxFree_real_T(&wi);
  emxFree_real_T(&diff);
  emxFree_real_T(&Sigma);
  emxFree_real_T(&mu);
  emxFree_real_T(&Sigmainv);
  emxFree_real_T(&barOld_Sigma);
  emxFree_real_T(&barOld_mu);
  emxFree_real_T(&Sigmaiinv);
  emxFree_real_T(&SigmaVec);
  emxFree_real_T(&muVec);
  if (wbar == maxiter) {
    b_y = NULL;
    m = emlrtCreateCharArray(2, &iv4[0]);
    emlrtInitCharArrayR2013a((emlrtCTX)sp, 64, m, &b_u[0]);
    emlrtAssign(&b_y, m);
    st.site = &hd_emlrtRSI;
    disp(&st, b_y, &emlrtMCI);
  }
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtCTX)sp);
}

/* End of code generation (BDBarycenter.c) */
