function NBhattD = BD12(gmh,gmr,nPoints)
% NBhattD = BhattD12(gmh,gmr,nPoints):
% INPUT:
% - gmh, gmr, two Gaussian Mixture,
% - nPoints, number of evaluation points.
% OUTPUT:
% - NBhattD, numerically computed Bhattacharyya distance.
% This function computes the numerical Bhattacharyya distance only for 1 and 2 dimensional
% problems.

d = size(gmh(1).mu,1);
if nargin < 3
    nPoints = 1000/(d^2);
end

NBhattD = -log(BC12(gmh,gmr,nPoints));
end

