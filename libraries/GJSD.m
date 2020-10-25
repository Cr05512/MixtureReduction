function dij = GJSD(pdfi,pdfj,alpha)
% dij = GJSD(pdfi,pdfj,alpha):
% INPUTS:
% - pdfi, pdfj, two Gaussian densities,
% - alpha, tuning parameter for the abstract means.
% OUTPUTS:
% - dij, the dual skew generalized Jensen-Shannon divergence.
% This function computes the dual skew Generalized Jensen-Shannon Divergence
% which is a bounded symmetrization of the Kullback-Leibler Divergence. For more
% informations check "On a generalization of the Jensen-Shannon divergence and the
% JS-symmetrization of distances relying on abstract means", F. Nielsen.
if nargin < 3
    alpha = 0.5;
end
assert(alpha>=0 && alpha <=1,'The parameter alpha is is bounded between 0 and 1.');

mu1 = pdfi.mu;
mu2 = pdfj.mu;
Sigma1 = pdfi.Sigma;
Sigma2 = pdfj.Sigma;
Sigma1_inv = inv(Sigma1);
Sigma2_inv = inv(Sigma2);

Sigma_a = inv((1-alpha)*Sigma1_inv + alpha*Sigma2_inv);
mu_a = Sigma_a*((1-alpha)*Sigma1_inv*mu1 + alpha*Sigma2_inv*mu2);

dij = 0.5*((1-alpha)*mu1'*Sigma1_inv*mu1 + alpha*mu2'*Sigma2_inv*mu2 - mu_a'*inv(Sigma_a)*mu_a +...
    +log((det(Sigma1)^(1-alpha))*(det(Sigma2)^alpha)/det(Sigma_a)));

end

