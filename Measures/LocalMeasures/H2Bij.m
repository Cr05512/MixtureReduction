function dH2Bij = H2Bij(pdfi,pdfj,maxiter,tol)

if nargin < 3
    maxiter = 500;
    tol = 1e-12;
end

bar = H2Barycenter([pdfi;pdfj],maxiter,tol);
dH2Bij = pdfi.w*H2ij(pdfi,bar) + pdfj.w*H2ij(pdfj,bar);

end