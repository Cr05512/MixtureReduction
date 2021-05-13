function matrixsl = matrixSelfLikeness(gm)
% matrixsl = matrixSelfLikeness(w,mu,Sigma):
% INPUTS:
% - gmh, a Gaussian Mixture.
% OUTPUTS:
% - matrixsl, the matrix self likeness (Nh x Nh matrix).
% This function computes the matrix self likenesses of a Gaussian mixture. Summing up over all the elements of such matrix
% returns the scalar self likeness of the mixture. 
assert(~isempty(gm),'The Gaussian mixture has to contain at least one element.');
[w,mu,Sigma] = paramsFromMixture(gm);

matrixsl = w'*matrixUnwSelfLikeness(mu,Sigma)*w;

end

