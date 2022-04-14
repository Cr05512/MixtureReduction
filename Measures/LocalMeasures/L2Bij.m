function B = L2Bij(pdfi, pdfj,maxiter,tol)
% B = RKLDBij(pdf1,pdf2):
% INPUTS:
% - pdf1, pdf2, two Gaussian densities.
% OUTPUTS:
% - B, to be documented

if nargin < 3
    maxiter = 500;
    tol = 1e-9;
elseif nargin < 4
    tol = 1e-9;
end

bar = L2Barycenter([pdfi;pdfj],maxiter,tol);
    
B = pdfi.w*L2ij(pdfi,bar) + pdfj.w*L2ij(pdfj,bar);

end

