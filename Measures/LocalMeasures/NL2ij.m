function normL2dist = NL2ij(pdfh,pdfr)
% normL2dist = NL2ij(pdfh,pdfr):
% INPUTS:
% - pdfh, pdfr, two Gaussian densities.
% OUTPUTS:
% - normL2dist, the normalized L2 distance between the two Gaussian densities (scalar).
% This function computes the L2 distance between two Gaussian components.
Jhh = mvnpdf(pdfh.mu,pdfh.mu,2*pdfh.Sigma);
Jrr = mvnpdf(pdfr.mu,pdfr.mu,2*pdfr.Sigma);
Jhr = mvnpdf(pdfh.mu,pdfr.mu,pdfh.Sigma+pdfr.Sigma);

normL2dist = 1 - 2*Jhr/(Jhh + Jrr);

end

