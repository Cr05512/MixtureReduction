function bar =  BDBarycenter(gmh,maxiter,tol)
if nargin < 2
    maxiter = 10000;
    tol = 1e-09;
elseif nargin < 3
    tol = 1e-09;
end

bar = Da2Barycenter(gmh,0.5,maxiter,tol);
    

end

