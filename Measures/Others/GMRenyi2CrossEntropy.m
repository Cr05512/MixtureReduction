function H2c = GMRenyi2CrossEntropy(gmh,gmr)
% H2c = GMRenyi2CrossEntropy(gmh,gmr):
% INPUT:
% - gmh, gmr, two Gaussian Mixtures.
% OUTPUT:
% - H2c, the Renyi Quadratic Cross Entropy.
% This function computes the Renyi Quadratic Cross Entropy between two GMs.
assert(~isempty(gmh) && ~isempty(gmr),'The mixture has to contain at least one element.');
H2c = -log(0.5*crossLikeness(gmh,gmr));
end

