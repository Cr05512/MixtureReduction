function ds = mahalSquaredDist(x,mu,P)
% ds = mahalSquaredDist(x,mu,P):
% INPUTS:
% - x, evaluation point,
% - mu, the mean of density of interest,
% - P, the covariance of the density of interest.
% OUTPUTS:
% ds, the squared Mahalanobis distance.
% This function computes the squared Mahalanobis distance between a point x
% and a set of points characterized by a mean mu and a covariance P.

ds = (x-mu)' * inv(P) * (x-mu);

end

