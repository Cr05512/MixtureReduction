function J = nISE(gmh,gmr)
% J = nISE(gmh,gmr):
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


J = (Jhh -2*Jhr + Jrr) / (Jhh + Jrr);   

end

