function W2Bar = W2Barycenter(comps,maxiter,tol)
% W2Bar = W2Barycenter(gm,maxIter):
% INPUTS:
% - gm, a Gaussian mixture (numComps x 1 vector),
% - maxIter, maximum number of allowed iterations in the covariance computation (scalar).
% OUTPUTS:
% - W2Bar, merged component according to W2 dist (Gaussian component).
% This function computes the Wasserstein barycenter of several Gaussian
% components.
if nargin < 2
    maxiter = 500;
    tol = 1e-9;
elseif nargin < 3
    tol = 1e-9;
end
assert(maxiter>0,'The number of iterations has to be greater than zero.');
assert(tol>0,'The tolerance has to be greater than zero.');

[w,mu,Sigma] = paramsFromMixture(comps);
n = numel(comps);

d = size(comps(1).mu,1);
wbar = sum(w);
mubar = 1/wbar * sum(w'.*mu,2);

if n==2
    Sigmabar = 1/(w(1)+w(2))^2 * (w(1)^2*Sigma(:,:,1) + w(2)^2*Sigma(:,:,2) +...
        w(1)*w(2)*(sqrtm(Sigma(:,:,1)*Sigma(:,:,2)) + sqrtm(Sigma(:,:,2)*Sigma(:,:,1))));
else
    Sigmabar = 1/n*sum(Sigma,3);
    for k=1:maxiter
       SigmabarOld = Sigmabar;
       sqrtS = sqrtm(Sigmabar);
       S = zeros(d,d);
       for i=1:n
          S = S + w(i)*sqrtm(sqrtS*Sigma(:,:,i)*sqrtS); 
       end
       Sigmabar = 1/wbar * S;
%        invSqS = inv(sqrtS);
%        Sigmabar = invSqS*Sigmabar*Sigmabar*invSqS;
       
       if mod(k,5)==0
           if norm(SigmabarOld-Sigmabar)<tol
               break;
           end
       end
       
    end
    if k==maxiter
        disp('The W2 FPI algorithm did not converge in the allowed iterations.');
    end
end
W2Bar = struct('w',wbar,'mu',mubar,'Sigma',Sigmabar);


end