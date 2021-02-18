function [w,mu,Sigma] = paramsFromMixture(gm)
% [w,mu,Sigma] = paramsFromMixture(gm):
% INPUT:
% - gm, a Gaussian Mixture.
% OUTPUT:
% - w, weight vector (size N x 1),
% - mu, mean vector (size d x N),
% - Sigma, covariance 3D matrix (size d x d x N).
% This function returns the mixture parameters in separate data structures.
assert(~isempty(gm),'The mixture has to be non empty.');

N = numel(gm);
d = size(gm(1).mu,1);

w = zeros(N,1);
mu = zeros(d,N);
Sigma = zeros(d,d,N);

for i=1:N
    w(i) = gm(i).w;
    mu(:,i) = gm(i).mu;
    Sigma(:,:,i) = gm(i).Sigma;
end

end

