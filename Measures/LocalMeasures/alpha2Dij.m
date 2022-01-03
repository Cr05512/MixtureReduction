function dCalpha = alpha2Dij(pdfi,pdfj,alpha)
% dCalpha = ChernAlphaDij(pdfi,pdfj,alpha):
% INPUT:
% - pdfi, pdfj, two Gaussian densities,
% - alpha, the alpha determining the Chernoff divergence (scalar).
% OUTPUT:
% - dCalpha, the Chernoff alpha-divergence value (scalar).
% This function implements the Chernoff alpha-divergence computation.
% "Chernoff information of exponential families", F. Nielsen.

if nargin < 3
    alpha = 0.5; %The chernoff alpha-div becomes the Bhattacharyya distance for two Gaussian densities.
end
assert(alpha>=0 && alpha <=1,'Alpha has to take values between 0 and 1.');

dCalpha = -log(alphaCij(pdfi,pdfj,alpha));
end

