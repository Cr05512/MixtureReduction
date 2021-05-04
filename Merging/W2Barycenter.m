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

if N==1
    W2Bar = gm;
    return
end

d = size(gm(1).mu,1);
S_prev = zeros(d,d);
mubar = zeros(d,1);
wbar = sum(w);

for i=1:N
    mubar = mubar + w(i)*mu(:,i);
    if N>2
        S_prev = S_prev + w(i)*Sigma(:,:,i);
    end
end
mubar = mubar./wbar;

if N==2
    w1 = w(1)/wbar;
    w2 = w(2)/wbar;
    Sigma1 = Sigma(:,:,1);
    Sigma2 = Sigma(:,:,2);
    S = w1^2*Sigma1 + w2^2*Sigma2 + w1*w2*real(sqrtm(Sigma2*Sigma1) + sqrtm(Sigma1*Sigma2));
else
    S_prev = S_prev./wbar;

    for k=1:maxIter
        S = zeros(d,d);
        S_prev = real(sqrtm(S_prev));
        for i=1:N
            S = S + (w(i)/wbar)*real(sqrtm(S_prev*Sigma(:,:,i)*S_prev));
        end
        S = S_prev\(S^2/S_prev); %This multiplication can be avoided, but there is no result on the convergence
        if norm(real(sqrtm(S))-S_prev)<1e-10
            break;
        else
            S_prev = S;
        end
    end
end


W2Bar = mixtureFromParams(wbar,mubar,S);
    
end

