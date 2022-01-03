function B = alphaBij(pdf1, pdf2, alpha, maxiter, tol)

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


bar = DaBarycenter([pdf1;pdf2],alpha,maxiter,tol);
    
B = pdf1.w*alpha1Dij(pdf1,bar,alpha) + pdf2.w*alpha1Dij(pdf2,bar,alpha);

end

