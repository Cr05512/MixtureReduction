function L2dist = L2Gauss(pdfh,pdfr)
% L2dist = L2Gauss(pdfh,pdfr):
% INPUTS:
% - pdfh, pdfr, two Gaussian densities.
% OUTPUTS:
% - L2dist, the L2 distance between the two Gaussian densities.
% This function computes the L2 distance between two Gaussian components.

Jhh = mvnpdf(pdfh.mu,pdfh.mu,2*pdfh.Sigma);
Jrr = mvnpdf(pdfr.mu,pdfr.mu,2*pdfr.Sigma);
Jhr = mvnpdf(pdfr.mu,pdfh.mu,pdfr.Sigma+pdfh.Sigma);

L2dist = Jhh - 2*Jhr + Jrr;

end

