function NHell1 = Hell112(gmh,gmr,nPoints)
% NHell1 = Hell112(gmh,gmr,nPoints):
% INPUT:
% - gmh, gmr, two Gaussian Mixture,
% - nPoints, number of evaluation points.
% OUTPUT:
% - NHell1, numerically computed squared Hellinger distance.
% This function computes the numerical Hellinger distance only for 1 and 2 dimensional
% problems.

NHell1 = sqrt(1 - BC12(gmh,gmr,nPoints));
end

