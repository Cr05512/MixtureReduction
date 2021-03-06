function dij = GJSD(pdfi,pdfj,alpha)
% dij = GJSD(pdfi,pdfj,alpha):
% INPUTS:
% - pdfi, pdfj, two Gaussian densities,
% - alpha, tuning parameter for the abstract means (scalar).
% OUTPUTS:
% - dij, the dual skew generalized Jensen-Shannon divergence (scalar).
% This function computes the dual skew Generalized Jensen-Shannon Divergence
% which is a bounded symmetrization of the Kullback-Leibler Divergence. For more
% informations check "On a generalization of the Jensen-Shannon divergence and the
% JS-symmetrization of distances relying on abstract means", F. Nielsen.
% In the case alpha=0.5 we get the Jensen-Shannon divergence, while for
% alpha = 1 we get half of the Jeffrey's divergence.
if nargin < 3
    alpha = 0.5;
end
assert(alpha>=0 && alpha <=1,'The parameter alpha is is bounded between 0 and 1.');

mu1 = pdfi.mu;
mu2 = pdfj.mu;
Sigma1 = pdfi.Sigma;
Sigma2 = pdfj.Sigma;
d = size(mu1,1);
I = eye(d);

Sigma_a = I/((1-alpha)*I/Sigma1 + alpha*I/Sigma2);
mu_a = Sigma_a*((1-alpha)*(Sigma1\mu1) + alpha*(Sigma2\mu2));

dij = 0.5*((1-alpha)*mu1'*(Sigma1\mu1) + alpha*mu2'*(Sigma2\mu2) - mu_a'*(Sigma_a\mu_a) +...
    +log((det(Sigma1)^(1-alpha))*(det(Sigma2)^alpha)/det(Sigma_a)));

end

