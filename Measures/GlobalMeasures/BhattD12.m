function NBhattD = BhattD12(gmh,gmr,nPoints)
% NBhattD = BhattD12(gmh,gmr,nPoints):
% INPUT:
% - gmh, gmr, two Gaussian Mixture,
% - nPoints, number of evaluation points.
% OUTPUT:
% - NBhattD, numerically computed Bhattacharyya distance.
% This function computes the numerical Bhattacharyya distance only for 1 and 2 dimensional
% problems.

if nargin < 3
    nPoints = 500;
end

NBhattD = -log(BhattC12(gmh,gmr,nPoints));
end

