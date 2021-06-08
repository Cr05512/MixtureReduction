function H = mvEntropy(pdf)
% H = mvEntropy(pdf):
% INPUT:
% - pdf, a Gaussian density.
% OUTPUT:
% - H, entropy of the multivariate Gaussian density.
% This function computes the entropy of a multivariate Gaussian.

d = size(pdf.mu,1);
H = 0.5*(log(det(pdf.Sigma)) + d*log(2*pi) + d);

end

