function B = alphaJDBij(pdfi, pdfj, alpha, maxiter, tol)

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


bar = alphaJDBarycenter([pdfi;pdfj],alpha,maxiter,tol);
    
B = pdfi.w*alphaJDij(pdfi,bar,alpha) + pdfj.w*alphaJDij(pdfj,bar,alpha);

end

