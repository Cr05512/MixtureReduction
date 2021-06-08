function gm = mixtureFromParams(w,mu,Sigma)
% gm = mixtureFromParams(w,mu,Sigma):
% INPUT:
% - w, weight vector (size N x 1),
% - mu, mean vector (size d x N),
% - Sigma, covariance 3D matrix (size d x d x N).
% OUTPUT:
% - gm, a Gaussian Mixture.
% This function returns the Gaussian Mixture (struct array) from the
% provided parameters.

assert(~isempty(w) && ~isempty(mu) && ~isempty(Sigma),'Any of the provided parameters are empty.');
N = numel(w);
assert(size(mu,2)==N && size(Sigma,3)==N,'The means or covariances are in a different number from the weights.');

gm(N,1) = struct('w',[],'mu',[],'Sigma',[]);

for i=1:N
    gm(i).w = w(i);
    gm(i).mu = mu(:,i);
    gm(i).Sigma = Sigma(:,:,i);
end

end

