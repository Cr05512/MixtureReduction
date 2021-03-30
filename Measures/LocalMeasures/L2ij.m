function L2dist = L2ij(pdfh,pdfr)
% L2dist = L2ij(pdfh,pdfr):
% INPUTS:
% - pdfh, pdfr, two Gaussian densities.
% OUTPUTS:
% - L2dist, the L2 distance between the two Gaussian densities (scalar).
% This function computes the L2 distance between two Gaussian components.

Jhh = mvnpdf(pdfh.mu,pdfh.mu,2*pdfh.Sigma);
Jrr = mvnpdf(pdfr.mu,pdfr.mu,2*pdfr.Sigma);
Jhr = mvnpdf(pdfh.mu,pdfr.mu,pdfh.Sigma+pdfr.Sigma);

L2dist = Jhh - 2*Jhr + Jrr;

end

