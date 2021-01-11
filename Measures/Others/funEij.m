function Eij = funEij(pdfi,pdfj)
% Eij = funEij(x,mu,Sigma)
% INPUT:
% - pdfi, pdfj, two Gaussian Densities.
% OUTPUT:
% - Eij, expected log Gaussian between the components i and j (scalar).
% This function compute the expected log Gaussian between the components i
% and j as in L. Yu,  T. Yang,  and A. B. Chan.  Density-preserving hierarchical EM algorithm:
% Simplifying gaussian mixture models for approximate inference.IEEE  Transactions
% on  Pattern  Analysis  and  Machine  Intelligence,  vol.41(6), 2018.
Eij = log_mvnpdf(pdfi.mu,pdfj.mu,pdfj.Sigma) - 0.5*trace(pdfj.Sigma\pdfi.Sigma);
end

