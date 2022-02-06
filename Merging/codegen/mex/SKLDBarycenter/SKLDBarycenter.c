/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * SKLDBarycenter.c
 *
 * Code generation for function 'SKLDBarycenter'
 *
 */

/* Include files */
#include "SKLDBarycenter.h"
#include "SKLDBarycenter_data.h"
#include "SKLDBarycenter_emxutil.h"
#include "SKLDBarycenter_mexutil.h"
#include "SKLDBarycenter_types.h"
#include "eml_mtimes_helper.h"
#include "eye.h"
#include "mrdivide_helper.h"
#include "mtimes.h"
#include "paramsFromMixture.h"
#include "rt_nonfinite.h"
#include "sqrtm.h"
#include "sum.h"
#include "trace.h"
#include "mwmathutil.h"

/* Variable Definitions */
static emlrtRSInfo
    emlrtRSI =
        {
            11,               /* lineNo */
            "SKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    b_emlrtRSI =
        {
            20,               /* lineNo */
            "SKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    c_emlrtRSI =
        {
            21,               /* lineNo */
            "SKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    d_emlrtRSI =
        {
            22,               /* lineNo */
            "SKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    e_emlrtRSI =
        {
            23,               /* lineNo */
            "SKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    f_emlrtRSI =
        {
            24,               /* lineNo */
            "SKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    g_emlrtRSI =
        {
            25,               /* lineNo */
            "SKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    h_emlrtRSI =
        {
            26,               /* lineNo */
            "SKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    i_emlrtRSI =
        {
            33,               /* lineNo */
            "SKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    j_emlrtRSI =
        {
            35,               /* lineNo */
            "SKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    k_emlrtRSI =
        {
            45,               /* lineNo */
            "SKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    l_emlrtRSI =
        {
            52,               /* lineNo */
            "SKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    m_emlrtRSI =
        {
            12,               /* lineNo */
            "FKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    n_emlrtRSI =
        {
            16,               /* lineNo */
            "FKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    cb_emlrtRSI =
        {
            12,               /* lineNo */
            "RKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    db_emlrtRSI =
        {
            16,               /* lineNo */
            "RKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    eb_emlrtRSI =
        {
            21,               /* lineNo */
            "RKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    fb_emlrtRSI =
        {
            22,               /* lineNo */
            "RKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    gb_emlrtRSI =
        {
            25,               /* lineNo */
            "RKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    hb_emlrtRSI =
        {
            27,               /* lineNo */
            "RKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    ib_emlrtRSI =
        {
            29,               /* lineNo */
            "RKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    mb_emlrtRSI =
        {
            20,                /* lineNo */
            "mrdivide_helper", /* fcnName */
            "/home/cr055/MATLAB/toolbox/eml/eml/+coder/+internal/"
            "mrdivide_helper.m" /* pathName */
};

static emlrtRSInfo qf_emlrtRSI = {
    16,       /* lineNo */
    "SKLDij", /* fcnName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/SKLDij.m" /* pathName */
};

static emlrtRSInfo rf_emlrtRSI = {
    17,       /* lineNo */
    "SKLDij", /* fcnName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/SKLDij.m" /* pathName */
};

static emlrtRSInfo sf_emlrtRSI = {
    20,       /* lineNo */
    "SKLDij", /* fcnName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/SKLDij.m" /* pathName */
};

static emlrtMCInfo
    emlrtMCI =
        {
            59,               /* lineNo */
            5,                /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
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

static emlrtMCInfo
    d_emlrtMCI =
        {
            10,               /* lineNo */
            1,                /* colNo */
            "RKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pName */
};

static emlrtBCInfo emlrtBCI =
    {
        -1,               /* iFirst */
        -1,               /* iLast */
        18,               /* lineNo */
        16,               /* colNo */
        "comps",          /* aName */
        "SKLDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/SKLDBarycenter.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtRTEInfo
    emlrtRTEI =
        {
            30,               /* lineNo */
            7,                /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtECInfo
    emlrtECI =
        {
            2,                /* nDims */
            35,               /* lineNo */
            19,               /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtECInfo
    b_emlrtECI =
        {
            -1,               /* nDims */
            35,               /* lineNo */
            40,               /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtBCInfo b_emlrtBCI =
    {
        -1,               /* iFirst */
        -1,               /* iLast */
        41,               /* lineNo */
        22,               /* colNo */
        "mui",            /* aName */
        "SKLDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/SKLDBarycenter.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtECInfo
    c_emlrtECI =
        {
            -1,               /* nDims */
            41,               /* lineNo */
            16,               /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtBCInfo c_emlrtBCI =
    {
        -1,               /* iFirst */
        -1,               /* iLast */
        42,               /* lineNo */
        30,               /* colNo */
        "wi",             /* aName */
        "SKLDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/SKLDBarycenter.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtBCInfo d_emlrtBCI =
    {
        -1,               /* iFirst */
        -1,               /* iLast */
        42,               /* lineNo */
        45,               /* colNo */
        "Sigmai",         /* aName */
        "SKLDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/SKLDBarycenter.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtECInfo
    d_emlrtECI =
        {
            2,                /* nDims */
            42,               /* lineNo */
            34,               /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtECInfo
    e_emlrtECI =
        {
            2,                /* nDims */
            42,               /* lineNo */
            18,               /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
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

static emlrtBCInfo e_emlrtBCI =
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

static emlrtBCInfo f_emlrtBCI =
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
    f_emlrtECI =
        {
            -1,               /* nDims */
            20,               /* lineNo */
            13,               /* colNo */
            "FKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pName */
};

static emlrtBCInfo g_emlrtBCI =
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

static emlrtBCInfo h_emlrtBCI =
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

static emlrtBCInfo i_emlrtBCI =
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
    g_emlrtECI =
        {
            -1,               /* nDims */
            27,               /* lineNo */
            47,               /* colNo */
            "FKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pName */
};

static emlrtBCInfo j_emlrtBCI =
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
    h_emlrtECI =
        {
            -1,               /* nDims */
            27,               /* lineNo */
            65,               /* colNo */
            "FKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pName */
};

static emlrtECInfo
    i_emlrtECI =
        {
            2,                /* nDims */
            27,               /* lineNo */
            33,               /* colNo */
            "FKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pName */
};

static emlrtECInfo
    j_emlrtECI =
        {
            2,                /* nDims */
            27,               /* lineNo */
            16,               /* colNo */
            "FKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pName */
};

static emlrtBCInfo k_emlrtBCI =
    {
        -1,               /* iFirst */
        -1,               /* iLast */
        21,               /* lineNo */
        26,               /* colNo */
        "w",              /* aName */
        "RKLDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/RKLDBarycenter.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtBCInfo l_emlrtBCI =
    {
        -1,               /* iFirst */
        -1,               /* iLast */
        21,               /* lineNo */
        46,               /* colNo */
        "Sigma",          /* aName */
        "RKLDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/RKLDBarycenter.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtBCInfo m_emlrtBCI =
    {
        -1,               /* iFirst */
        -1,               /* iLast */
        21,               /* lineNo */
        19,               /* colNo */
        "wSigmainv",      /* aName */
        "RKLDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/RKLDBarycenter.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtECInfo
    k_emlrtECI =
        {
            -1,               /* nDims */
            21,               /* lineNo */
            5,                /* colNo */
            "RKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pName */
};

static emlrtBCInfo n_emlrtBCI =
    {
        -1,               /* iFirst */
        -1,               /* iLast */
        22,               /* lineNo */
        35,               /* colNo */
        "wSigmainv",      /* aName */
        "RKLDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/RKLDBarycenter.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtBCInfo o_emlrtBCI =
    {
        -1,               /* iFirst */
        -1,               /* iLast */
        22,               /* lineNo */
        43,               /* colNo */
        "mu",             /* aName */
        "RKLDBarycenter", /* fName */
        "/home/cr055/MATLAB "
        "Workspace/MixtureReduction/Merging/RKLDBarycenter.m", /* pName */
        0                                                      /* checkKind */
};

static emlrtECInfo
    l_emlrtECI =
        {
            -1,               /* nDims */
            22,               /* lineNo */
            13,               /* colNo */
            "RKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pName */
};

static emlrtECInfo m_emlrtECI = {
    -1,       /* nDims */
    12,       /* lineNo */
    8,        /* colNo */
    "SKLDij", /* fName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/SKLDij.m" /* pName */
};

static emlrtECInfo n_emlrtECI = {
    2,        /* nDims */
    20,       /* lineNo */
    73,       /* colNo */
    "SKLDij", /* fName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/SKLDij.m" /* pName */
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

static emlrtRTEInfo
    p_emlrtRTEI =
        {
            11,               /* lineNo */
            1,                /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
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

static emlrtRTEInfo
    t_emlrtRTEI =
        {
            27,               /* lineNo */
            27,               /* colNo */
            "FKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    u_emlrtRTEI =
        {
            18,               /* lineNo */
            1,                /* colNo */
            "RKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    v_emlrtRTEI =
        {
            22,               /* lineNo */
            11,               /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    w_emlrtRTEI =
        {
            22,               /* lineNo */
            1,                /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    x_emlrtRTEI =
        {
            21,               /* lineNo */
            36,               /* colNo */
            "RKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    y_emlrtRTEI =
        {
            22,               /* lineNo */
            21,               /* colNo */
            "RKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    ab_emlrtRTEI =
        {
            31,               /* lineNo */
            5,                /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    bb_emlrtRTEI =
        {
            22,               /* lineNo */
            38,               /* colNo */
            "RKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    cb_emlrtRTEI =
        {
            35,               /* lineNo */
            19,               /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    db_emlrtRTEI =
        {
            35,               /* lineNo */
            40,               /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    eb_emlrtRTEI =
        {
            38,               /* lineNo */
            5,                /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    fb_emlrtRTEI =
        {
            41,               /* lineNo */
            9,                /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo gb_emlrtRTEI = {
    88,                  /* lineNo */
    13,                  /* colNo */
    "eml_mtimes_helper", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/ops/eml_mtimes_helper.m" /* pName
                                                                         */
};

static emlrtRTEInfo
    hb_emlrtRTEI =
        {
            42,               /* lineNo */
            50,               /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo ib_emlrtRTEI = {
    88,                  /* lineNo */
    9,                   /* colNo */
    "eml_mtimes_helper", /* fName */
    "/home/cr055/MATLAB/toolbox/eml/lib/matlab/ops/eml_mtimes_helper.m" /* pName
                                                                         */
};

static emlrtRTEInfo
    jb_emlrtRTEI =
        {
            42,               /* lineNo */
            27,               /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    kb_emlrtRTEI =
        {
            48,               /* lineNo */
            5,                /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    lb_emlrtRTEI =
        {
            49,               /* lineNo */
            5,                /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo mb_emlrtRTEI = {
    12,       /* lineNo */
    1,        /* colNo */
    "SKLDij", /* fName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/SKLDij.m" /* pName */
};

static emlrtRTEInfo
    nb_emlrtRTEI =
        {
            23,               /* lineNo */
            1,                /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    ob_emlrtRTEI =
        {
            24,               /* lineNo */
            1,                /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    pb_emlrtRTEI =
        {
            25,               /* lineNo */
            1,                /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    qb_emlrtRTEI =
        {
            26,               /* lineNo */
            1,                /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    rb_emlrtRTEI =
        {
            1,                /* lineNo */
            16,               /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    sb_emlrtRTEI =
        {
            32,               /* lineNo */
            5,                /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    tb_emlrtRTEI =
        {
            45,               /* lineNo */
            27,               /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    ub_emlrtRTEI =
        {
            45,               /* lineNo */
            21,               /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    vb_emlrtRTEI =
        {
            35,               /* lineNo */
            11,               /* colNo */
            "SKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    wb_emlrtRTEI =
        {
            19,               /* lineNo */
            1,                /* colNo */
            "RKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    xb_emlrtRTEI =
        {
            25,               /* lineNo */
            1,                /* colNo */
            "RKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo
    yb_emlrtRTEI =
        {
            27,               /* lineNo */
            12,               /* colNo */
            "RKLDBarycenter", /* fName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pName */
};

static emlrtRTEInfo ac_emlrtRTEI = {
    17,       /* lineNo */
    1,        /* colNo */
    "SKLDij", /* fName */
    "/home/cr055/MATLAB "
    "Workspace/MixtureReduction/Measures/LocalMeasures/SKLDij.m" /* pName */
};

static emlrtRSInfo
    tf_emlrtRSI =
        {
            59,               /* lineNo */
            "SKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/SKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    uf_emlrtRSI =
        {
            10,               /* lineNo */
            "RKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/RKLDBarycenter.m" /* pathName */
};

static emlrtRSInfo
    vf_emlrtRSI =
        {
            10,               /* lineNo */
            "FKLDBarycenter", /* fcnName */
            "/home/cr055/MATLAB "
            "Workspace/MixtureReduction/Merging/FKLDBarycenter.m" /* pathName */
};

/* Function Declarations */
static void disp(const emlrtStack *sp, const mxArray *b, emlrtMCInfo *location);

static const mxArray *emlrt_marshallOut(const emlrtStack *sp,
                                        const char_T u[66]);

/* Function Definitions */
static void disp(const emlrtStack *sp, const mxArray *b, emlrtMCInfo *location)
{
  const mxArray *pArray;
  pArray = b;
  emlrtCallMATLABR2012b((emlrtCTX)sp, 0, NULL, 1, &pArray,
                        (const char_T *)"disp", true, location);
}

static const mxArray *emlrt_marshallOut(const emlrtStack *sp,
                                        const char_T u[66])
{
  static const int32_T iv[2] = {1, 66};
  const mxArray *m;
  const mxArray *y;
  y = NULL;
  m = emlrtCreateCharArray(2, &iv[0]);
  emlrtInitCharArrayR2013a((emlrtCTX)sp, 66, m, &u[0]);
  emlrtAssign(&y, m);
  return y;
}

void SKLDBarycenter(const emlrtStack *sp, const emxArray_struct0_T *comps,
                    real_T maxiter, real_T tol, struct0_T *bar)
{
  static const char_T cv[66] = {
      'T', 'h', 'e', ' ', 'n', 'u', 'm', 'b', 'e', 'r', ' ', 'o', 'f', ' ',
      'c', 'o', 'm', 'p', 'o', 'n', 'e', 'n', 't', 's', ' ', 'i', 'n', ' ',
      't', 'h', 'e', ' ', 'm', 'e', 'r', 'g', 'e', ' ', 'h', 'a', 's', ' ',
      't', 'o', ' ', 'b', 'e', ' ', 'g', 'r', 'e', 'a', 't', 'e', 'r', ' ',
      't', 'h', 'a', 'n', ' ', 'z', 'e', 'r', 'o', '.'};
  static const char_T cv1[66] = {
      'T', 'h', 'e', ' ', 'S', 'K', 'L', 'D', ' ', 'F', 'P', 'I', ' ', 'a',
      'l', 'g', 'o', 'r', 'i', 't', 'h', 'm', ' ', 'd', 'i', 'd', ' ', 'n',
      'o', 't', ' ', 'c', 'o', 'n', 'v', 'e', 'r', 'g', 'e', ' ', 'i', 'n',
      ' ', 't', 'h', 'e', ' ', 'a', 'l', 'l', 'o', 'w', 'e', 'd', ' ', 'i',
      't', 'e', 'r', 'a', 't', 'i', 'o', 'n', 's', '.'};
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack st;
  emxArray_creal_T *b;
  emxArray_creal_T *b_Sigma;
  emxArray_creal_T *srPsiCI;
  emxArray_creal_T *srPsiCIinv;
  emxArray_creal_T *y;
  emxArray_real_T *A;
  emxArray_real_T *PsiCIinv;
  emxArray_real_T *Sigma;
  emxArray_real_T *Sigmabar;
  emxArray_real_T *Sigmai;
  emxArray_real_T *Sigmajinv;
  emxArray_real_T *b_mu;
  emxArray_real_T *b_mubar;
  emxArray_real_T *b_wSigmainv;
  emxArray_real_T *barRKLD_Sigma;
  emxArray_real_T *c_mu;
  emxArray_real_T *diff;
  emxArray_real_T *mu;
  emxArray_real_T *muCI;
  emxArray_real_T *mubar;
  emxArray_real_T *mui;
  emxArray_real_T *wCovSum;
  emxArray_real_T *wi;
  real_T a;
  real_T sumWi;
  real_T wbar;
  int32_T iv[2];
  int32_T iv1[2];
  int32_T wSigmainv[2];
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
  int32_T i8;
  int32_T k;
  int32_T loop_ub;
  boolean_T exitg1;
  boolean_T guard1 = false;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  c_st.prev = &b_st;
  c_st.tls = b_st.tls;
  emlrtHeapReferenceStackEnterFcnR2012b((emlrtCTX)sp);
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
    b_st.site = &vf_emlrtRSI;
    error(&b_st, emlrt_marshallOut(&b_st, cv), &b_emlrtMCI);
  }
  emxInit_real_T(&st, &diff, 1, &fb_emlrtRTEI, true);
  emxInit_real_T(&st, &mubar, 1, &l_emlrtRTEI, true);
  emxInit_real_T(&st, &mu, 2, &vb_emlrtRTEI, true);
  emxInit_real_T(&st, &Sigma, 3, &rb_emlrtRTEI, true);
  b_st.site = &m_emlrtRSI;
  paramsFromMixture(&b_st, comps, diff, mu, Sigma);
  b_st.site = &n_emlrtRSI;
  wbar = sum(&b_st, diff);
  loop_ub = mu->size[0];
  i = mubar->size[0];
  mubar->size[0] = mu->size[0];
  emxEnsureCapacity_real_T(&st, mubar, i, &l_emlrtRTEI);
  for (i = 0; i < loop_ub; i++) {
    mubar->data[i] = 0.0;
  }
  i = comps->size[0];
  emxInit_real_T(&st, &muCI, 1, &ob_emlrtRTEI, true);
  for (b_i = 0; b_i < i; b_i++) {
    if (b_i + 1 > diff->size[0]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, diff->size[0], &e_emlrtBCI,
                                    &st);
    }
    if (b_i + 1 > mu->size[1]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, mu->size[1], &f_emlrtBCI, &st);
    }
    loop_ub = mu->size[0];
    i1 = muCI->size[0];
    muCI->size[0] = mu->size[0];
    emxEnsureCapacity_real_T(&st, muCI, i1, &n_emlrtRTEI);
    for (i1 = 0; i1 < loop_ub; i1++) {
      muCI->data[i1] = diff->data[b_i] * mu->data[i1 + mu->size[0] * b_i];
    }
    loop_ub = mubar->size[0];
    if (mubar->size[0] != muCI->size[0]) {
      emlrtSizeEqCheck1DR2012b(mubar->size[0], muCI->size[0], &f_emlrtECI, &st);
    }
    for (i1 = 0; i1 < loop_ub; i1++) {
      mubar->data[i1] += muCI->data[i1];
    }
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b(&st);
    }
  }
  a = 1.0 / wbar;
  loop_ub = mubar->size[0];
  for (i = 0; i < loop_ub; i++) {
    mubar->data[i] *= a;
  }
  emxInit_real_T(&st, &Sigmabar, 2, &m_emlrtRTEI, true);
  i = Sigmabar->size[0] * Sigmabar->size[1];
  Sigmabar->size[0] = mu->size[0];
  Sigmabar->size[1] = mu->size[0];
  emxEnsureCapacity_real_T(&st, Sigmabar, i, &m_emlrtRTEI);
  loop_ub = mu->size[0] * mu->size[0];
  for (i = 0; i < loop_ub; i++) {
    Sigmabar->data[i] = 0.0;
  }
  i = comps->size[0];
  if (0 <= comps->size[0] - 1) {
    i2 = mu->size[0];
    d = mu->size[0];
    k = mu->size[0];
    b_loop_ub = mu->size[0];
    i3 = mu->size[0];
    wSigmainv[0] = Sigma->size[0];
    wSigmainv[1] = Sigma->size[1];
    c_loop_ub = Sigma->size[0];
    i4 = Sigma->size[1];
    d_loop_ub = Sigma->size[1];
  }
  emxInit_real_T(&st, &Sigmajinv, 2, &ac_emlrtRTEI, true);
  emxInit_real_T(&st, &b_mu, 1, &q_emlrtRTEI, true);
  emxInit_real_T(&st, &c_mu, 2, &r_emlrtRTEI, true);
  for (b_i = 0; b_i < i; b_i++) {
    if (b_i + 1 > mu->size[1]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, mu->size[1], &i_emlrtBCI, &st);
    }
    if (i2 != mubar->size[0]) {
      emlrtSizeEqCheck1DR2012b(i2, mubar->size[0], &g_emlrtECI, &st);
    }
    if (b_i + 1 > mu->size[1]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, mu->size[1], &j_emlrtBCI, &st);
    }
    if (d != mubar->size[0]) {
      emlrtSizeEqCheck1DR2012b(d, mubar->size[0], &h_emlrtECI, &st);
    }
    if (b_i + 1 > Sigma->size[2]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, Sigma->size[2], &h_emlrtBCI,
                                    &st);
    }
    i1 = b_mu->size[0];
    b_mu->size[0] = k;
    emxEnsureCapacity_real_T(&st, b_mu, i1, &q_emlrtRTEI);
    i1 = c_mu->size[0] * c_mu->size[1];
    c_mu->size[0] = 1;
    c_mu->size[1] = i3;
    emxEnsureCapacity_real_T(&st, c_mu, i1, &r_emlrtRTEI);
    for (i1 = 0; i1 < b_loop_ub; i1++) {
      a = mu->data[i1 + mu->size[0] * b_i] - mubar->data[i1];
      b_mu->data[i1] = a;
      c_mu->data[i1] = a;
    }
    i1 = Sigmajinv->size[0] * Sigmajinv->size[1];
    Sigmajinv->size[0] = b_mu->size[0];
    Sigmajinv->size[1] = c_mu->size[1];
    emxEnsureCapacity_real_T(&st, Sigmajinv, i1, &s_emlrtRTEI);
    loop_ub = c_mu->size[1];
    for (i1 = 0; i1 < loop_ub; i1++) {
      e_loop_ub = b_mu->size[0];
      for (i5 = 0; i5 < e_loop_ub; i5++) {
        Sigmajinv->data[i5 + Sigmajinv->size[0] * i1] =
            b_mu->data[i5] * c_mu->data[i1];
      }
    }
    iv[0] = (*(int32_T(*)[2])Sigmajinv->size)[0];
    iv[1] = (*(int32_T(*)[2])Sigmajinv->size)[1];
    emlrtSizeEqCheckNDR2012b(&wSigmainv[0], &iv[0], &i_emlrtECI, &st);
    if (b_i + 1 > diff->size[0]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, diff->size[0], &g_emlrtBCI,
                                    &st);
    }
    i1 = Sigmajinv->size[0] * Sigmajinv->size[1];
    Sigmajinv->size[0] = c_loop_ub;
    Sigmajinv->size[1] = i4;
    emxEnsureCapacity_real_T(&st, Sigmajinv, i1, &t_emlrtRTEI);
    for (i1 = 0; i1 < d_loop_ub; i1++) {
      for (i5 = 0; i5 < c_loop_ub; i5++) {
        Sigmajinv->data[i5 + Sigmajinv->size[0] * i1] =
            diff->data[b_i] *
            (Sigma->data[(i5 + Sigma->size[0] * i1) +
                         Sigma->size[0] * Sigma->size[1] * b_i] +
             Sigmajinv->data[i5 + Sigmajinv->size[0] * i1]);
      }
    }
    iv[0] = (*(int32_T(*)[2])Sigmabar->size)[0];
    iv[1] = (*(int32_T(*)[2])Sigmabar->size)[1];
    iv1[0] = (*(int32_T(*)[2])Sigmajinv->size)[0];
    iv1[1] = (*(int32_T(*)[2])Sigmajinv->size)[1];
    emlrtSizeEqCheckNDR2012b(&iv[0], &iv1[0], &j_emlrtECI, &st);
    loop_ub = Sigmabar->size[0] * Sigmabar->size[1];
    for (i1 = 0; i1 < loop_ub; i1++) {
      Sigmabar->data[i1] += Sigmajinv->data[i1];
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
  /*       [~,idx] = max([comps.w]); */
  /*       bar = comps(idx); */
  /*       bar.w = sum([comps.w]); */
  if (1 > comps->size[0]) {
    emlrtDynamicBoundsCheckR2012b(1, 1, comps->size[0], &emlrtBCI,
                                  (emlrtCTX)sp);
  }
  emxInit_real_T(sp, &wi, 1, &rb_emlrtRTEI, true);
  emxInit_real_T(sp, &mui, 2, &rb_emlrtRTEI, true);
  emxInit_real_T(sp, &Sigmai, 3, &rb_emlrtRTEI, true);
  d = comps->data[0].mu->size[0];
  st.site = &b_emlrtRSI;
  paramsFromMixture(&st, comps, wi, mui, Sigmai);
  st.site = &c_emlrtRSI;
  sumWi = sum(&st, wi);
  st.site = &d_emlrtRSI;
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
    b_st.site = &uf_emlrtRSI;
    error(&b_st, emlrt_marshallOut(&b_st, cv), &d_emlrtMCI);
  }
  emxInit_real_T(&st, &b_mubar, 1, &u_emlrtRTEI, true);
  b_st.site = &cb_emlrtRSI;
  paramsFromMixture(&b_st, comps, diff, mu, Sigma);
  b_st.site = &db_emlrtRSI;
  a = sum(&b_st, diff);
  loop_ub = mu->size[0];
  i = b_mubar->size[0];
  b_mubar->size[0] = mu->size[0];
  emxEnsureCapacity_real_T(&st, b_mubar, i, &u_emlrtRTEI);
  for (i = 0; i < loop_ub; i++) {
    b_mubar->data[i] = 0.0;
  }
  emxInit_real_T(&st, &b_wSigmainv, 3, &wb_emlrtRTEI, true);
  i = b_wSigmainv->size[0] * b_wSigmainv->size[1] * b_wSigmainv->size[2];
  b_wSigmainv->size[0] = mu->size[0];
  b_wSigmainv->size[1] = mu->size[0];
  b_wSigmainv->size[2] = comps->size[0];
  emxEnsureCapacity_real_T(&st, b_wSigmainv, i, &v_emlrtRTEI);
  i = comps->size[0];
  emxInit_real_T(&st, &wCovSum, 2, &xb_emlrtRTEI, true);
  for (b_i = 0; b_i < i; b_i++) {
    if (b_i + 1 > b_wSigmainv->size[2]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, b_wSigmainv->size[2],
                                    &m_emlrtBCI, &st);
    }
    if (b_i + 1 > diff->size[0]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, diff->size[0], &k_emlrtBCI,
                                    &st);
    }
    b_st.site = &eb_emlrtRSI;
    eye(&b_st, mu->size[0], wCovSum);
    loop_ub = wCovSum->size[0] * wCovSum->size[1];
    for (i1 = 0; i1 < loop_ub; i1++) {
      wCovSum->data[i1] *= diff->data[b_i];
    }
    b_st.site = &eb_emlrtRSI;
    if (b_i + 1 > Sigma->size[2]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, Sigma->size[2], &l_emlrtBCI,
                                    &b_st);
    }
    loop_ub = Sigma->size[1];
    if (Sigma->size[1] != wCovSum->size[1]) {
      emlrtErrorWithMessageIdR2018a(&b_st, &b_emlrtRTEI, "MATLAB:dimagree",
                                    "MATLAB:dimagree", 0);
    }
    b_loop_ub = Sigma->size[0];
    i1 = Sigmabar->size[0] * Sigmabar->size[1];
    Sigmabar->size[0] = Sigma->size[0];
    Sigmabar->size[1] = Sigma->size[1];
    emxEnsureCapacity_real_T(&b_st, Sigmabar, i1, &x_emlrtRTEI);
    for (i1 = 0; i1 < loop_ub; i1++) {
      for (i2 = 0; i2 < b_loop_ub; i2++) {
        Sigmabar->data[i2 + Sigmabar->size[0] * i1] =
            Sigma->data[(i2 + Sigma->size[0] * i1) +
                        Sigma->size[0] * Sigma->size[1] * b_i];
      }
    }
    c_st.site = &mb_emlrtRSI;
    mrdiv(&c_st, wCovSum, Sigmabar, Sigmajinv);
    wSigmainv[0] = b_wSigmainv->size[0];
    wSigmainv[1] = b_wSigmainv->size[1];
    emlrtSubAssignSizeCheckR2012b(&wSigmainv[0], 2, &Sigmajinv->size[0], 2,
                                  &k_emlrtECI, &st);
    loop_ub = Sigmajinv->size[1];
    for (i1 = 0; i1 < loop_ub; i1++) {
      b_loop_ub = Sigmajinv->size[0];
      for (i2 = 0; i2 < b_loop_ub; i2++) {
        b_wSigmainv->data[(i2 + b_wSigmainv->size[0] * i1) +
                          b_wSigmainv->size[0] * b_wSigmainv->size[1] * b_i] =
            Sigmajinv->data[i2 + Sigmajinv->size[0] * i1];
      }
    }
    b_st.site = &fb_emlrtRSI;
    if (b_i + 1 > b_wSigmainv->size[2]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, b_wSigmainv->size[2],
                                    &n_emlrtBCI, &b_st);
    }
    if (b_i + 1 > mu->size[1]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, mu->size[1], &o_emlrtBCI,
                                    &b_st);
    }
    loop_ub = b_wSigmainv->size[1];
    b_loop_ub = b_wSigmainv->size[0];
    i1 = Sigmabar->size[0] * Sigmabar->size[1];
    Sigmabar->size[0] = b_wSigmainv->size[0];
    Sigmabar->size[1] = b_wSigmainv->size[1];
    emxEnsureCapacity_real_T(&b_st, Sigmabar, i1, &y_emlrtRTEI);
    for (i1 = 0; i1 < loop_ub; i1++) {
      for (i2 = 0; i2 < b_loop_ub; i2++) {
        Sigmabar->data[i2 + Sigmabar->size[0] * i1] =
            b_wSigmainv
                ->data[(i2 + b_wSigmainv->size[0] * i1) +
                       b_wSigmainv->size[0] * b_wSigmainv->size[1] * b_i];
      }
    }
    loop_ub = mu->size[0];
    i1 = b_mu->size[0];
    b_mu->size[0] = mu->size[0];
    emxEnsureCapacity_real_T(&b_st, b_mu, i1, &bb_emlrtRTEI);
    for (i1 = 0; i1 < loop_ub; i1++) {
      b_mu->data[i1] = mu->data[i1 + mu->size[0] * b_i];
    }
    c_st.site = &fd_emlrtRSI;
    dynamic_size_checks(&c_st, Sigmabar, b_mu, b_wSigmainv->size[1],
                        mu->size[0]);
    loop_ub = b_wSigmainv->size[0];
    b_loop_ub = b_wSigmainv->size[1];
    i1 = Sigmabar->size[0] * Sigmabar->size[1];
    Sigmabar->size[0] = b_wSigmainv->size[0];
    Sigmabar->size[1] = b_wSigmainv->size[1];
    emxEnsureCapacity_real_T(&b_st, Sigmabar, i1, &y_emlrtRTEI);
    for (i1 = 0; i1 < b_loop_ub; i1++) {
      for (i2 = 0; i2 < loop_ub; i2++) {
        Sigmabar->data[i2 + Sigmabar->size[0] * i1] =
            b_wSigmainv
                ->data[(i2 + b_wSigmainv->size[0] * i1) +
                       b_wSigmainv->size[0] * b_wSigmainv->size[1] * b_i];
      }
    }
    loop_ub = mu->size[0];
    i1 = b_mu->size[0];
    b_mu->size[0] = mu->size[0];
    emxEnsureCapacity_real_T(&b_st, b_mu, i1, &bb_emlrtRTEI);
    for (i1 = 0; i1 < loop_ub; i1++) {
      b_mu->data[i1] = mu->data[i1 + mu->size[0] * b_i];
    }
    c_st.site = &ed_emlrtRSI;
    mtimes(&c_st, Sigmabar, b_mu, muCI);
    loop_ub = b_mubar->size[0];
    if (b_mubar->size[0] != muCI->size[0]) {
      emlrtSizeEqCheck1DR2012b(b_mubar->size[0], muCI->size[0], &l_emlrtECI,
                               &st);
    }
    for (i1 = 0; i1 < loop_ub; i1++) {
      b_mubar->data[i1] += muCI->data[i1];
    }
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b(&st);
    }
  }
  emxFree_real_T(&Sigma);
  emxInit_real_T(&st, &A, 2, &yb_emlrtRTEI, true);
  b_st.site = &gb_emlrtRSI;
  b_sum(&b_st, b_wSigmainv, wCovSum);
  b_st.site = &hb_emlrtRSI;
  c_st.site = &hb_emlrtRSI;
  eye(&c_st, mu->size[0], A);
  emxFree_real_T(&b_wSigmainv);
  if (wCovSum->size[1] != A->size[1]) {
    emlrtErrorWithMessageIdR2018a(&b_st, &b_emlrtRTEI, "MATLAB:dimagree",
                                  "MATLAB:dimagree", 0);
  }
  emxInit_real_T(&b_st, &barRKLD_Sigma, 2, &w_emlrtRTEI, true);
  c_st.site = &mb_emlrtRSI;
  mrdiv(&c_st, A, wCovSum, Sigmabar);
  b_st.site = &ib_emlrtRSI;
  c_st.site = &fd_emlrtRSI;
  dynamic_size_checks(&c_st, Sigmabar, b_mubar, Sigmabar->size[1],
                      b_mubar->size[0]);
  c_st.site = &ed_emlrtRSI;
  mtimes(&c_st, Sigmabar, b_mubar, b_mu);
  i = barRKLD_Sigma->size[0] * barRKLD_Sigma->size[1];
  barRKLD_Sigma->size[0] = Sigmabar->size[0];
  barRKLD_Sigma->size[1] = Sigmabar->size[1];
  emxEnsureCapacity_real_T(&st, barRKLD_Sigma, i, &w_emlrtRTEI);
  loop_ub = Sigmabar->size[0] * Sigmabar->size[1];
  for (i = 0; i < loop_ub; i++) {
    barRKLD_Sigma->data[i] = a * Sigmabar->data[i];
  }
  st.site = &e_emlrtRSI;
  b_st.site = &e_emlrtRSI;
  eye(&b_st, comps->data[0].mu->size[0], A);
  if (barRKLD_Sigma->size[1] != A->size[1]) {
    emlrtErrorWithMessageIdR2018a(&st, &b_emlrtRTEI, "MATLAB:dimagree",
                                  "MATLAB:dimagree", 0);
  }
  emxInit_real_T(&st, &PsiCIinv, 2, &nb_emlrtRTEI, true);
  emxInit_creal_T(&st, &srPsiCIinv, 2, &pb_emlrtRTEI, true);
  b_st.site = &mb_emlrtRSI;
  mrdiv(&b_st, A, barRKLD_Sigma, PsiCIinv);
  st.site = &f_emlrtRSI;
  b_st.site = &fd_emlrtRSI;
  dynamic_size_checks(&b_st, PsiCIinv, b_mu, PsiCIinv->size[1], b_mu->size[0]);
  b_st.site = &ed_emlrtRSI;
  mtimes(&b_st, PsiCIinv, b_mu, muCI);
  st.site = &g_emlrtRSI;
  sqrtm(&st, PsiCIinv, srPsiCIinv);
  st.site = &h_emlrtRSI;
  b_st.site = &h_emlrtRSI;
  eye(&b_st, comps->data[0].mu->size[0], A);
  if (srPsiCIinv->size[1] != A->size[1]) {
    emlrtErrorWithMessageIdR2018a(&st, &b_emlrtRTEI, "MATLAB:dimagree",
                                  "MATLAB:dimagree", 0);
  }
  emxInit_creal_T(&st, &srPsiCI, 2, &qb_emlrtRTEI, true);
  b_st.site = &mb_emlrtRSI;
  b_mrdiv(&b_st, A, srPsiCIinv, srPsiCI);
  wbar = 0.0;
  emlrtForLoopVectorCheckR2021a(1.0, 1.0, maxiter, mxDOUBLE_CLASS,
                                (int32_T)maxiter, &emlrtRTEI, (emlrtCTX)sp);
  k = 0;
  emxInit_creal_T(sp, &b_Sigma, 2, &sb_emlrtRTEI, true);
  emxInit_creal_T(sp, &y, 2, &tb_emlrtRTEI, true);
  emxInit_creal_T(sp, &b, 2, &ub_emlrtRTEI, true);
  exitg1 = false;
  while ((!exitg1) && (k <= (int32_T)maxiter - 1)) {
    i = b_mu->size[0];
    b_mu->size[0] = bar->mu->size[0];
    emxEnsureCapacity_real_T(sp, b_mu, i, &ab_emlrtRTEI);
    loop_ub = bar->mu->size[0];
    for (i = 0; i < loop_ub; i++) {
      b_mu->data[i] = bar->mu->data[i];
    }
    i = barRKLD_Sigma->size[0] * barRKLD_Sigma->size[1];
    barRKLD_Sigma->size[0] = bar->Sigma->size[0];
    barRKLD_Sigma->size[1] = bar->Sigma->size[1];
    emxEnsureCapacity_real_T(sp, barRKLD_Sigma, i, &ab_emlrtRTEI);
    loop_ub = bar->Sigma->size[0] * bar->Sigma->size[1];
    for (i = 0; i < loop_ub; i++) {
      barRKLD_Sigma->data[i] = bar->Sigma->data[i];
    }
    st.site = &i_emlrtRSI;
    b_st.site = &i_emlrtRSI;
    eye(&b_st, d, A);
    if (bar->Sigma->size[1] != A->size[1]) {
      emlrtErrorWithMessageIdR2018a(&st, &b_emlrtRTEI, "MATLAB:dimagree",
                                    "MATLAB:dimagree", 0);
    }
    b_st.site = &mb_emlrtRSI;
    mrdiv(&b_st, A, bar->Sigma, wCovSum);
    iv[0] = (*(int32_T(*)[2])PsiCIinv->size)[0];
    iv[1] = (*(int32_T(*)[2])PsiCIinv->size)[1];
    iv1[0] = (*(int32_T(*)[2])wCovSum->size)[0];
    iv1[1] = (*(int32_T(*)[2])wCovSum->size)[1];
    emlrtSizeEqCheckNDR2012b(&iv[0], &iv1[0], &emlrtECI, (emlrtCTX)sp);
    st.site = &j_emlrtRSI;
    b_st.site = &fd_emlrtRSI;
    dynamic_size_checks(&b_st, wCovSum, mubar, wCovSum->size[1],
                        mubar->size[0]);
    b_st.site = &ed_emlrtRSI;
    mtimes(&b_st, wCovSum, mubar, diff);
    if (muCI->size[0] != diff->size[0]) {
      emlrtSizeEqCheck1DR2012b(muCI->size[0], diff->size[0], &b_emlrtECI,
                               (emlrtCTX)sp);
    }
    st.site = &j_emlrtRSI;
    b_st.site = &j_emlrtRSI;
    eye(&b_st, d, A);
    loop_ub = PsiCIinv->size[0] * PsiCIinv->size[1];
    i = wCovSum->size[0] * wCovSum->size[1];
    wCovSum->size[0] = PsiCIinv->size[0];
    wCovSum->size[1] = PsiCIinv->size[1];
    emxEnsureCapacity_real_T(&st, wCovSum, i, &cb_emlrtRTEI);
    for (i = 0; i < loop_ub; i++) {
      wCovSum->data[i] += PsiCIinv->data[i];
    }
    if (wCovSum->size[1] != A->size[1]) {
      emlrtErrorWithMessageIdR2018a(&st, &b_emlrtRTEI, "MATLAB:dimagree",
                                    "MATLAB:dimagree", 0);
    }
    b_st.site = &mb_emlrtRSI;
    mrdiv(&b_st, A, wCovSum, mu);
    st.site = &j_emlrtRSI;
    i = diff->size[0];
    diff->size[0] = muCI->size[0];
    emxEnsureCapacity_real_T(&st, diff, i, &db_emlrtRTEI);
    loop_ub = muCI->size[0];
    for (i = 0; i < loop_ub; i++) {
      diff->data[i] += muCI->data[i];
    }
    b_st.site = &fd_emlrtRSI;
    dynamic_size_checks(&b_st, mu, diff, mu->size[1], diff->size[0]);
    b_st.site = &ed_emlrtRSI;
    mtimes(&b_st, mu, diff, b_mubar);
    i = wCovSum->size[0] * wCovSum->size[1];
    wCovSum->size[0] = d;
    wCovSum->size[1] = d;
    emxEnsureCapacity_real_T(sp, wCovSum, i, &eb_emlrtRTEI);
    loop_ub = d * d;
    for (i = 0; i < loop_ub; i++) {
      wCovSum->data[i] = 0.0;
    }
    i = comps->size[0];
    if (0 <= comps->size[0] - 1) {
      i6 = mui->size[0];
      i7 = mui->size[0];
      f_loop_ub = mui->size[0];
      wSigmainv[0] = Sigmai->size[0];
      wSigmainv[1] = Sigmai->size[1];
      g_loop_ub = Sigmai->size[0];
      i8 = Sigmai->size[1];
      h_loop_ub = Sigmai->size[1];
    }
    for (b_i = 0; b_i < i; b_i++) {
      if (b_i + 1 > mui->size[1]) {
        emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, mui->size[1], &b_emlrtBCI,
                                      (emlrtCTX)sp);
      }
      if (i6 != b_mubar->size[0]) {
        emlrtSizeEqCheck1DR2012b(i6, b_mubar->size[0], &c_emlrtECI,
                                 (emlrtCTX)sp);
      }
      i1 = diff->size[0];
      diff->size[0] = i7;
      emxEnsureCapacity_real_T(sp, diff, i1, &fb_emlrtRTEI);
      for (i1 = 0; i1 < f_loop_ub; i1++) {
        diff->data[i1] = mui->data[i1 + mui->size[0] * b_i] - b_mubar->data[i1];
      }
      if (b_i + 1 > Sigmai->size[2]) {
        emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, Sigmai->size[2], &d_emlrtBCI,
                                      (emlrtCTX)sp);
      }
      i1 = Sigmajinv->size[0] * Sigmajinv->size[1];
      Sigmajinv->size[0] = diff->size[0];
      Sigmajinv->size[1] = diff->size[0];
      emxEnsureCapacity_real_T(sp, Sigmajinv, i1, &hb_emlrtRTEI);
      loop_ub = diff->size[0];
      for (i1 = 0; i1 < loop_ub; i1++) {
        b_loop_ub = diff->size[0];
        for (i2 = 0; i2 < b_loop_ub; i2++) {
          Sigmajinv->data[i2 + Sigmajinv->size[0] * i1] =
              diff->data[i2] * diff->data[i1];
        }
      }
      iv[0] = (*(int32_T(*)[2])Sigmajinv->size)[0];
      iv[1] = (*(int32_T(*)[2])Sigmajinv->size)[1];
      emlrtSizeEqCheckNDR2012b(&wSigmainv[0], &iv[0], &d_emlrtECI,
                               (emlrtCTX)sp);
      if (b_i + 1 > wi->size[0]) {
        emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, wi->size[0], &c_emlrtBCI,
                                      (emlrtCTX)sp);
      }
      i1 = Sigmajinv->size[0] * Sigmajinv->size[1];
      Sigmajinv->size[0] = g_loop_ub;
      Sigmajinv->size[1] = i8;
      emxEnsureCapacity_real_T(sp, Sigmajinv, i1, &jb_emlrtRTEI);
      for (i1 = 0; i1 < h_loop_ub; i1++) {
        for (i2 = 0; i2 < g_loop_ub; i2++) {
          Sigmajinv->data[i2 + Sigmajinv->size[0] * i1] =
              wi->data[b_i] *
              (Sigmai->data[(i2 + Sigmai->size[0] * i1) +
                            Sigmai->size[0] * Sigmai->size[1] * b_i] +
               Sigmajinv->data[i2 + Sigmajinv->size[0] * i1]);
        }
      }
      iv[0] = (*(int32_T(*)[2])wCovSum->size)[0];
      iv[1] = (*(int32_T(*)[2])wCovSum->size)[1];
      iv1[0] = (*(int32_T(*)[2])Sigmajinv->size)[0];
      iv1[1] = (*(int32_T(*)[2])Sigmajinv->size)[1];
      emlrtSizeEqCheckNDR2012b(&iv[0], &iv1[0], &e_emlrtECI, (emlrtCTX)sp);
      loop_ub = wCovSum->size[0] * wCovSum->size[1];
      for (i1 = 0; i1 < loop_ub; i1++) {
        wCovSum->data[i1] += Sigmajinv->data[i1];
      }
      if (*emlrtBreakCheckR2012bFlagVar != 0) {
        emlrtBreakCheckR2012b((emlrtCTX)sp);
      }
    }
    loop_ub = wCovSum->size[0] * wCovSum->size[1];
    for (i = 0; i < loop_ub; i++) {
      wCovSum->data[i] /= sumWi;
    }
    st.site = &k_emlrtRSI;
    b_st.site = &fd_emlrtRSI;
    c_dynamic_size_checks(&b_st, srPsiCIinv, wCovSum, srPsiCIinv->size[1],
                          wCovSum->size[0]);
    i = b_Sigma->size[0] * b_Sigma->size[1];
    b_Sigma->size[0] = wCovSum->size[0];
    b_Sigma->size[1] = wCovSum->size[1];
    emxEnsureCapacity_creal_T(&st, b_Sigma, i, &gb_emlrtRTEI);
    loop_ub = wCovSum->size[0] * wCovSum->size[1];
    for (i = 0; i < loop_ub; i++) {
      b_Sigma->data[i].re = wCovSum->data[i];
      b_Sigma->data[i].im = 0.0;
    }
    i = y->size[0] * y->size[1];
    y->size[0] = srPsiCIinv->size[0];
    y->size[1] = b_Sigma->size[1];
    emxEnsureCapacity_creal_T(&st, y, i, &ib_emlrtRTEI);
    loop_ub = srPsiCIinv->size[0];
    for (i = 0; i < loop_ub; i++) {
      b_loop_ub = b_Sigma->size[1];
      for (i1 = 0; i1 < b_loop_ub; i1++) {
        y->data[i + y->size[0] * i1].re = 0.0;
        y->data[i + y->size[0] * i1].im = 0.0;
        c_loop_ub = srPsiCIinv->size[1];
        for (i2 = 0; i2 < c_loop_ub; i2++) {
          y->data[i + y->size[0] * i1].re +=
              srPsiCIinv->data[i + srPsiCIinv->size[0] * i2].re *
                  b_Sigma->data[i2 + b_Sigma->size[0] * i1].re -
              srPsiCIinv->data[i + srPsiCIinv->size[0] * i2].im *
                  b_Sigma->data[i2 + b_Sigma->size[0] * i1].im;
          y->data[i + y->size[0] * i1].im +=
              srPsiCIinv->data[i + srPsiCIinv->size[0] * i2].re *
                  b_Sigma->data[i2 + b_Sigma->size[0] * i1].im +
              srPsiCIinv->data[i + srPsiCIinv->size[0] * i2].im *
                  b_Sigma->data[i2 + b_Sigma->size[0] * i1].re;
        }
      }
    }
    st.site = &k_emlrtRSI;
    b_st.site = &fd_emlrtRSI;
    b_dynamic_size_checks(&b_st, y, srPsiCIinv, y->size[1],
                          srPsiCIinv->size[0]);
    b_st.site = &ed_emlrtRSI;
    b_mtimes(&b_st, y, srPsiCIinv, b_Sigma);
    st.site = &k_emlrtRSI;
    b_st.site = &k_emlrtRSI;
    b_sqrtm(&b_st, b_Sigma, b);
    b_st.site = &fd_emlrtRSI;
    b_dynamic_size_checks(&b_st, srPsiCI, b, srPsiCI->size[1], b->size[0]);
    b_st.site = &ed_emlrtRSI;
    b_mtimes(&b_st, srPsiCI, b, y);
    st.site = &k_emlrtRSI;
    b_st.site = &fd_emlrtRSI;
    b_dynamic_size_checks(&b_st, y, srPsiCI, y->size[1], srPsiCI->size[0]);
    b_st.site = &ed_emlrtRSI;
    b_mtimes(&b_st, y, srPsiCI, b_Sigma);
    /* Sigma = sqrtm(PsiMPM)*srPsiCI; */
    i = bar->mu->size[0];
    bar->mu->size[0] = b_mubar->size[0];
    emxEnsureCapacity_real_T(sp, bar->mu, i, &kb_emlrtRTEI);
    loop_ub = b_mubar->size[0];
    for (i = 0; i < loop_ub; i++) {
      bar->mu->data[i] = b_mubar->data[i];
    }
    i = bar->Sigma->size[0] * bar->Sigma->size[1];
    bar->Sigma->size[0] = b_Sigma->size[0];
    bar->Sigma->size[1] = b_Sigma->size[1];
    emxEnsureCapacity_real_T(sp, bar->Sigma, i, &lb_emlrtRTEI);
    loop_ub = b_Sigma->size[0] * b_Sigma->size[1];
    for (i = 0; i < loop_ub; i++) {
      bar->Sigma->data[i] = b_Sigma->data[i].re;
    }
    guard1 = false;
    if (muDoubleScalarRem((real_T)k + 1.0, 3.0) == 0.0) {
      st.site = &l_emlrtRSI;
      /*  sKLD = SKLDij(pdfh,pdfr): */
      /*  INPUTS: */
      /*  - pdfh, pdfr, two Gaussian densities. */
      /*  OUTPUTS: */
      /*  - sKLD, resulting symmetrization of the Kullback-Leibler divergence
       * (scalar). */
      /*  This function computes the KLD symmetrization between two multivariate
       * Gaussians. It is */
      /*  not suitable for other kind of distributions. */
      if (b_mubar->size[0] != b_mu->size[0]) {
        emlrtSizeEqCheck1DR2012b(b_mubar->size[0], b_mu->size[0], &m_emlrtECI,
                                 &st);
      }
      i = diff->size[0];
      diff->size[0] = b_mubar->size[0];
      emxEnsureCapacity_real_T(&st, diff, i, &mb_emlrtRTEI);
      loop_ub = b_mubar->size[0];
      for (i = 0; i < loop_ub; i++) {
        diff->data[i] = b_mubar->data[i] - b_mu->data[i];
      }
      b_st.site = &qf_emlrtRSI;
      c_st.site = &qf_emlrtRSI;
      eye(&c_st, b_mubar->size[0], A);
      if (bar->Sigma->size[1] != A->size[1]) {
        emlrtErrorWithMessageIdR2018a(&b_st, &b_emlrtRTEI, "MATLAB:dimagree",
                                      "MATLAB:dimagree", 0);
      }
      c_st.site = &mb_emlrtRSI;
      mrdiv(&c_st, A, bar->Sigma, Sigmabar);
      b_st.site = &rf_emlrtRSI;
      c_st.site = &rf_emlrtRSI;
      eye(&c_st, b_mubar->size[0], A);
      if (barRKLD_Sigma->size[1] != A->size[1]) {
        emlrtErrorWithMessageIdR2018a(&b_st, &b_emlrtRTEI, "MATLAB:dimagree",
                                      "MATLAB:dimagree", 0);
      }
      c_st.site = &mb_emlrtRSI;
      mrdiv(&c_st, A, barRKLD_Sigma, Sigmajinv);
      /* sKLD = 0.5*(KLDij(pdfi,pdfj) + KLDij(pdfj,pdfi)); */
      iv[0] = (*(int32_T(*)[2])Sigmabar->size)[0];
      iv[1] = (*(int32_T(*)[2])Sigmabar->size)[1];
      iv1[0] = (*(int32_T(*)[2])Sigmajinv->size)[0];
      iv1[1] = (*(int32_T(*)[2])Sigmajinv->size)[1];
      emlrtSizeEqCheckNDR2012b(&iv[0], &iv1[0], &n_emlrtECI, &st);
      b_st.site = &sf_emlrtRSI;
      c_st.site = &fd_emlrtRSI;
      d_dynamic_size_checks(&c_st, Sigmajinv, bar->Sigma, Sigmajinv->size[1],
                            bar->Sigma->size[0]);
      c_st.site = &ed_emlrtRSI;
      d_mtimes(&c_st, Sigmajinv, bar->Sigma, wCovSum);
      b_st.site = &sf_emlrtRSI;
      c_st.site = &fd_emlrtRSI;
      d_dynamic_size_checks(&c_st, Sigmabar, barRKLD_Sigma, Sigmabar->size[1],
                            barRKLD_Sigma->size[0]);
      c_st.site = &ed_emlrtRSI;
      d_mtimes(&c_st, Sigmabar, barRKLD_Sigma, mu);
      b_st.site = &sf_emlrtRSI;
      loop_ub = Sigmabar->size[0] * Sigmabar->size[1];
      for (i = 0; i < loop_ub; i++) {
        Sigmabar->data[i] += Sigmajinv->data[i];
      }
      c_st.site = &fd_emlrtRSI;
      e_dynamic_size_checks(&c_st, diff, Sigmabar, diff->size[0],
                            Sigmabar->size[0]);
      c_st.site = &ed_emlrtRSI;
      e_mtimes(&c_st, diff, Sigmabar, c_mu);
      b_st.site = &sf_emlrtRSI;
      c_st.site = &fd_emlrtRSI;
      f_dynamic_size_checks(&c_st, c_mu, diff, c_mu->size[1], diff->size[0]);
      b_st.site = &sf_emlrtRSI;
      a = 0.25 *
          (((trace(&b_st, wCovSum) + trace(&b_st, mu)) + f_mtimes(c_mu, diff)) -
           2.0 * (real_T)b_mubar->size[0]);
      if (a < tol) {
        exitg1 = true;
      } else {
        guard1 = true;
      }
    } else {
      guard1 = true;
    }
    if (guard1) {
      wbar = (real_T)k + 1.0;
      k++;
      if (*emlrtBreakCheckR2012bFlagVar != 0) {
        emlrtBreakCheckR2012b((emlrtCTX)sp);
      }
    }
  }
  emxFree_real_T(&c_mu);
  emxFree_real_T(&b_mu);
  emxFree_real_T(&Sigmajinv);
  emxFree_real_T(&A);
  emxFree_real_T(&wCovSum);
  emxFree_real_T(&b_mubar);
  emxFree_real_T(&mu);
  emxFree_real_T(&Sigmabar);
  emxFree_real_T(&mubar);
  emxFree_creal_T(&b);
  emxFree_creal_T(&y);
  emxFree_creal_T(&b_Sigma);
  emxFree_real_T(&Sigmai);
  emxFree_real_T(&mui);
  emxFree_real_T(&wi);
  emxFree_real_T(&diff);
  emxFree_creal_T(&srPsiCI);
  emxFree_creal_T(&srPsiCIinv);
  emxFree_real_T(&muCI);
  emxFree_real_T(&PsiCIinv);
  emxFree_real_T(&barRKLD_Sigma);
  if (wbar == maxiter) {
    st.site = &tf_emlrtRSI;
    disp(&st, emlrt_marshallOut(&st, cv1), &emlrtMCI);
  }
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtCTX)sp);
}

/* End of code generation (SKLDBarycenter.c) */
