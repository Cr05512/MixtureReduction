function gm = genMixtureFromParams(w,mu,Sigma)
% gm = genMixtureFromParams(w,mu,Sigma):
% INPUT: 
% - w, weight vector (N x 1),
% - mu, matrix containing d-dimensional means (d x N),
% - Sigma, 3D matrix containing d-dimensional covariance matrices (d x d x N).
% OUTPUT:
% - gm, newly generated Gaussian mixture.
% This function generates a d-dimensional multivariate Gaussian mixture
% from parameters

N = numel(w);

gm(N,1) = struct('w',[],'mu',[],'Sigma',[]);

for i=1:N
    gm(i).w = w(i);
    gm(i).mu = mu(:,i);
    gm(i).Sigma = Sigma(:,:,i);
end

end

