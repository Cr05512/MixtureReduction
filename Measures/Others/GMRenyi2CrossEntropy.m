function H2c = GMRenyi2CrossEntropy(gmh,gmr)
% H2c = GMRenyi2CrossEntropy(gmh,gmr):
% INPUT:
% - gmh, gmr, two Gaussian Mixtures.
% OUTPUT:
% - H2c, the Renyi Quadratic Cross Entropy.
% This function computes the Renyi Quadratic Cross Entropy between two GMs.
assert(~isempty(gmh) && ~isempty(gmr),'The mixture has to contain at least one element.');

Jhh = selfLikeness(gmh);
Jhr = crossLikeness(gmh,gmr);
Jrr = selfLikeness(gmr);


H2c = -log((Jhh+2*Jhr+Jrr)/4);
end

