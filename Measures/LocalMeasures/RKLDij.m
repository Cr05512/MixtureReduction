function dRKLij = RKLDij(pdfi,pdfj)
% dKLij = KLDij(pdfi,pdfj):
% INPUTS:
% - pdfi, pdfj, two Gaussian densities.
% OUTPUTS:
% - dKLij, resulting Kullback-Leibler divergence (scalar).
% This function computes the KLD between two multivariate Gaussians. It is
% not suitable for other kind of distributions.

mui = pdfi.mu;
muj = pdfj.mu;
Pi = pdfi.Sigma;
Pj = pdfj.Sigma;
d = size(mui,1);

dRKLij = 0.5*(trace(Pi\Pj) + (mui-muj)'*(Pi\(mui-muj))-d+log(det(Pi)/det(Pj)));

end

