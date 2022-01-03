function dCalpha = alpha1Dij(pdfi,pdfj,alpha)
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

if alpha==1
    dCalpha = KLDij(pdfi,pdfj);
elseif alpha==0
    dCalpha = RKLDij(pdfi,pdfj);
else
    dCalpha = 1/(alpha*(1-alpha))*(1-alphaCij(pdfi,pdfj,alpha));
end

end

