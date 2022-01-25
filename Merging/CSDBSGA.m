function CSDB = CSDBSGA(gmh,maxiter,tol)

if nargin < 2
    maxiter = 100;
    tol = 1e-9;
elseif nargin < 3
    tol = 1e-9;
end

gmr = RKLDBarycenter(gmh);

CSDB = refineGaussMix('CSDOptCon',gmr,gmh,struct('maxiter',maxiter,'tol',tol));

end

