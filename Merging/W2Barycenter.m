function W2Bar = W2Barycenter(gm,maxiter,tol)
% W2Bar = W2Barycenter(gm,maxIter):
% INPUTS:
% - gm, a Gaussian mixture (numComps x 1 vector),
% - maxIter, maximum number of allowed iterations in the covariance computation (scalar).
% OUTPUTS:
% - W2Bar, merged component according to W2 dist (Gaussian component).
% This function computes the Wasserstein barycenter of several Gaussian
% components.
if nargin < 2
    maxiter = 100;
    tol = 1e-09;
elseif nargin < 3
    tol = 1e-09;
end
assert(~isempty(gm),'The mixture has to contain at least one element.');
assert(maxiter>0,'The number of iterations has to be greater than zero.');
assert(tol>0,'The tolerance has to be greater than zero.');

[w,mu,Sigma] = paramsFromMixture(gm);
N = numel(gm);

if N==1
    W2Bar = gm;
    return
end

d = size(gm(1).mu,1);
wbar = sum(w);
mubar = 1/wbar * sum(w'.*mu,2);

if N==2
    Sigmabar = 1/(w(1)+w(2))^2 * (w(1)^2*Sigma(:,:,1) + w(2)^2*Sigma(:,:,2) +...
        w(1)*w(2)*(sqrtm(Sigma(:,:,1)*Sigma(:,:,2)) + sqrtm(Sigma(:,:,2)*Sigma(:,:,1))));
else
    
    Sigmabar = 1/N*sum(Sigma,3);
    for k=1:maxiter
       sqrtS = sqrtm(Sigmabar);
       S = zeros(d,d);
       for i=1:N
          S = S + w(i)*sqrtm(sqrtS*Sigma(:,:,i)*sqrtS); 
       end
       Sigmabar = 1/wbar * S;
       
       if ~mod(k,10)
           if norm(sqrtS-sqrtm(Sigmabar))<tol
               break;
           end
       end
       
    end
end

W2Bar = struct('w',wbar,'mu',mubar,'Sigma',Sigmabar);

end