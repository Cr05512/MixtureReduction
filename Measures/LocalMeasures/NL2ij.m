function normL2dist = NL2ij(pdfi,pdfj)
% normL2dist = NL2ij(pdfh,pdfr):
% INPUTS:
% - pdfh, pdfr, two Gaussian densities.
% OUTPUTS:
% - normL2dist, the normalized L2 distance between the two Gaussian densities (scalar).
% This function computes the L2 distance between two Gaussian components.
Jhh = mvnpdf(pdfi.mu,pdfi.mu,2*pdfi.Sigma);
Jrr = mvnpdf(pdfj.mu,pdfj.mu,2*pdfj.Sigma);
Jhr = mvnpdf(pdfi.mu,pdfj.mu,pdfi.Sigma+pdfj.Sigma);

normL2dist = 1 - 2*Jhr/(Jhh + Jrr);

end

