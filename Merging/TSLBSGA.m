function NIB = TSLBSGA(gmh,maxiter,tol)

if nargin < 2
    maxiter = 100;
    tol = 1e-12;
elseif nargin < 3
    tol = 1e-12;
end

gmr = RKLDBarycenter(gmh);

NIB = refineGaussMix('TSLOptCon',gmr,gmh,struct('maxiter',maxiter,'tol',tol));

end

