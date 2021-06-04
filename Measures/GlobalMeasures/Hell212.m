function NHell2 = Hell212(gmh,gmr,nPoints)
% NHell2 = Hell212(gmh,gmr,nPoints):
% INPUT:
% - gmh, gmr, two Gaussian Mixture,
% - nPoints, number of evaluation points.
% OUTPUT:
% - NHell2, numerically computed squared Hellinger distance.
% This function computes the numerical squared Hellinger distance only for 1 and 2 dimensional
% problems.

NHell2 = 1 - BC12(gmh,gmr,nPoints);
end

