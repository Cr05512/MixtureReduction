function DRE = DREntropy(pdf1, pdf2)
% DRE = DREntropy(pdf1, pdf2):
% INPUTS:
% - pdf1, pdf2, two Gaussian densities.
% OUTPUTS:
% - DRE, the differential relative entropy (KLD) between pdf1 and pdf2 (scalar).
% This function computes the Differential Relative Entropy between two
% Gaussian densities. This is equivalent to the KLD, but it is described by
% the decomposition in the Burg Matrix divergence and the squared
% Mahalanobis distance

DRE = 0.5*(BurgMatrixDivergence(pdf1.Sigma,pdf2.Sigma) + mahalSquaredDist(pdf1.mu,pdf2.mu,pdf2.Sigma));
end

