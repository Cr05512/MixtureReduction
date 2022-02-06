function B = alpha1Bij(pdfi, pdfj, alpha, maxiter, tol)

if nargin < 3
    alpha = 0.5;
    maxiter = 50;
    tol = 1e-6;
elseif nargin < 4
    maxiter = 50;
    tol = 1e-6;
elseif nargin < 5
    tol = 1e-6;
end


bar = alpha1DBarycenter([pdfi;pdfj],alpha,maxiter,tol);
    
B = pdfi.w*alpha1Dij(pdfi,bar,alpha) + pdfj.w*alpha1Dij(pdfj,bar,alpha);

end

