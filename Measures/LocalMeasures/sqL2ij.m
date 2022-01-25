function L2dist = sqL2ij(pdfi,pdfj)
% L2dist = L2ij(pdfh,pdfr):
% INPUTS:
% - pdfh, pdfr, two Gaussian densities.
% OUTPUTS:
% - L2dist, the L2 distance between the two Gaussian densities (scalar).
% This function computes the L2 distance between two Gaussian components.

Jhh = mvnpdf(pdfi.mu,pdfi.mu,2*pdfi.Sigma);
Jrr = mvnpdf(pdfj.mu,pdfj.mu,2*pdfj.Sigma);
Jhr = mvnpdf(pdfi.mu,pdfj.mu,pdfi.Sigma+pdfj.Sigma);

L2dist = sqrt(Jhh - 2*Jhr + Jrr);

end

