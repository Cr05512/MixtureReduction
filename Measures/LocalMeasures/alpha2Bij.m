function B = alpha2Bij(pdfi, pdfj, alpha, maxiter, tol)

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


bar = alpha2DBarycenter([pdfi;pdfj],alpha,maxiter,tol);
    
B = pdfi.w*alpha2Dij(pdfi,bar,alpha) + pdfj.w*alpha2Dij(pdfj,bar,alpha);

end

