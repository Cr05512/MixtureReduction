function Jhr = crossLikeness(gmh,gmr)
% Jhh = crossLikeness(gmh,gmr):
% INPUTS:
% - gmh, gmr, two Gaussian mixtures
% OUTPUTS:
% - Jhhr, cross likeness of gmh and gmr (scalar).
% This function computes the cross-likeness of two Gaussian mixtures.
% This is part of the Integral Squared Error computation.

Jhr = sum(sum(matrixCrossLikeness(gmh,gmr)));

end

