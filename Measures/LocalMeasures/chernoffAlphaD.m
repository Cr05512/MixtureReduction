function dCalpha = chernoffAlphaD(pdfi,pdfj,alpha)
% dCalpha = chernoffAlphaD(pdfi,pdfj,alpha):
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

mui = pdfi.mu;
muj = pdfj.mu;
Sigmai = pdfi.Sigma;
Sigmaj = pdfj.Sigma;

alphaSigmaij = alpha*Sigmai + (1-alpha)*Sigmaj;

dCalpha = 0.5 * (log(det(alphaSigmaij)/(det(Sigmai)^alpha * det(Sigmaj)^(1-alpha))) + ...
            alpha*(1-alpha) * (mui - muj)'*(alphaSigmaij\(mui - muj)));
end

