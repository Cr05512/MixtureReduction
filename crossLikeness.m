function Jhr = crossLikeness(gmh,gmr)
% Jhr = crossLikeness(gmh,gmr):
% INPUTS:
% - gmh, gmr, two Gaussian mixtures.
% OUTPUTS:
% - Jhr, cross likeness between gmh and gmr.
% This function computes the cross-likeness between two Gaussian mixtures.
% This is part of the Integral Squared Error computation.
assert(~isempty(gmh) && ~isempty(gmr),'The mixtures have to contain at least one element.');

Jhr = sum(sum(matrixCrossLikeness(gmh,gmr)));

end

