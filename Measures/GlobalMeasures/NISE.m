function J = NISE(gmh,gmr)
% J = NISE(gmh,gmr):
% INPUTS:
% - gmh, gmr, two Gaussian mixtures.
% OUTPUTS:
% - J, the normalized integral squared error (scalar).
% This function computes the normalized integral squared error between two
% Gaussian mixtures.
assert(~isempty(gmh) && ~isempty(gmr),'The mixtures have to contain at least one element.');

Jhr = crossLikeness(gmh,gmr);
Jhh = selfLikeness(gmh);
Jrr = selfLikeness(gmr);


J = 1 -2*Jhr/(Jhh + Jrr);   

end

