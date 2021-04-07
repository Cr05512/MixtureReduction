function AICVal = AIC(gm,X,m)
% AICVal = AIC(gm,X,m):
% INPUT:
% - gm, a Gaussian Mixture,
% - X, data (d x N matrix),
% - m, (optional) number of estimated parameters.
% OUTPUT:
% - AICVal, Akaike Information Criterion value.
% This function computes the Akaike Information Criterion (AIC).

d = size(X,1);
K = numel(gm);

if nargin < 3
    m = K-1 + K*(d + d*(d+1)/2);
end

AICVal = -2*logLikelihoodGM(gm,X) + 2*m;
end

