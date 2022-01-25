function ds = mahalSquaredDist(x,mu,P)
% ds = mahalSquaredDist(x,mu,P):
% INPUTS:
% - x, evaluation point (stateDim x 1 vector),
% - mu, the mean of density of interest (stateDim x 1 vector),
% - P, the covariance of the density of interest (stateDim x stateDim matrix).
% OUTPUTS:
% ds, the squared Mahalanobis distance (scalar).
% This function computes the squared Mahalanobis distance between a point x
% and a set of points characterized by a mean mu and a covariance P.

ds = (x-mu)'*(P\(x-mu));

end

