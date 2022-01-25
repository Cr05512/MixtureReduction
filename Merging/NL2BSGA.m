function NIB = NL2BSGA(gmh,maxiter,tol)

if nargin < 2
    maxiter = 100;
    tol = 1e-12;
elseif nargin < 3
    tol = 1e-12;
end

gmr = FKLDBarycenter(gmh);

NIB = refineGaussMix('NL2OptCon',gmr,gmh,struct('maxiter',maxiter,'tol',tol));

end

