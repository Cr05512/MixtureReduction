function W2Bar = W2Barycenter(gm,maxIter)
% W2Bar = W2Barycenter(gm,maxIter):
% INPUTS:
% - gm, a Gaussian mixture (numComps x 1 vector),
% - maxIter, maximum number of allowed iterations in the covariance computation (scalar).
% OUTPUTS:
% - W2Bar, merged component according to W2 dist (Gaussian component).
% This function computes the Wasserstein barycenter of several Gaussian
% components.
if nargin < 2
    maxIter = 100;
end
assert(~isempty(gm),'The mixture has to contain at least one element.');
assert(maxIter>0,'The number of iterations has to be greater than zero.');

[w,mu,Sigma] = paramsFromMixture(gm);
N = numel(gm);

d = size(gm(1).mu,1);
S_prev = zeros(d,d);
mubar = zeros(d,1);
wbar = sum(w);

for i=1:N
    mubar = mubar + w(i)*mu(:,i);
    S_prev = S_prev + w(i)*Sigma(:,:,i);
end
mubar = mubar./wbar;
S_prev = S_prev./wbar;

for k=1:maxIter
    S = zeros(d,d);
    S_prev = real(sqrtm(S_prev));
    %S_prev_inv = inv(S_prev);
    for i=1:N
        S = S + (w(i)/wbar)*real(sqrtm(S_prev*Sigma(:,:,i)*S_prev));
    end
    %S = S_prev_inv*S^2*S_prev_inv; %This multiplication can be avoided, but there is no result on the convergence
    if norm(real(sqrtm(S))-S_prev)<1e-10
        break;
    else
        S_prev = S;
    end
end


W2Bar = mixtureFromParams(wbar,mubar,S);
    
end

