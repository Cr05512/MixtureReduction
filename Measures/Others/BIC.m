function BICVal = BIC(gm,X,m)
% BICVal = BIC(gm,X,m):
% INPUT:
% - gm, a Gaussian Mixture,
% - X, data (d x N matrix),
% - m, (optional) number of estimated parameters.
% OUTPUT:
% - BICVal, Bayesian Information Criterion value.
% This function computes the Bayesian Information Criterion (BIC).

d = size(X,1);
K = numel(gm);

if nargin < 3
    m = K-1 + K*(d + d*(d+1)/2);
end
n = size(X,2);

BICVal = -2*logLikelihoodGM(gm,X) + m*log(n);
end

