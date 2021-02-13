function H2 = GMRenyi2Entropy(gmh)
% H2 = GMRenyi2Entropy(gmh):
% INPUT:
% - gmh, a Gaussian Mixture.
% OUTPUT:
% - H2, the Renyi Quadratic Entropy.
% This function computes the Renyi Quadratic Entropy of a Gaussian Mixture.
assert(~isempty(gmh),'The mixture has to contain at least one element.');
H2 = -log(selfLikeness(gmh));
end

