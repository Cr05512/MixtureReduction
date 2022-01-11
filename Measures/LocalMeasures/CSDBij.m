function dCSDBij = CSDBij(pdfi,pdfj,maxiter,tol)


if nargin < 3
    maxiter = 200;
    tol = 1e-12;
elseif nargin < 4
    tol = 1e-12;
end

bar = CSDBarycenter([pdfi;pdfj],maxiter,tol);
dCSDBij = pdfi.w*CSDij(pdfi,bar) + pdfj.w*CSDij(pdfj,bar);

end

