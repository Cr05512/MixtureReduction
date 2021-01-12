function normL2dist = normL2(pdfh,pdfr)
% normL2dist = normL2(pdfh,pdfr):
% INPUTS:
% - pdfh, pdfr, two Gaussian densities.
% OUTPUTS:
% - normL2dist, the normalized L2 distance between the two Gaussian densities (scalar).
% This function computes the L2 distance between two Gaussian components.
Jhh = mvnpdf(pdfh.mu,pdfh.mu,2*pdfh.Sigma);
Jrr = mvnpdf(pdfr.mu,pdfr.mu,2*pdfr.Sigma);
Jhr = mvnpdf(pdfr.mu,pdfh.mu,pdfr.Sigma+pdfh.Sigma);

normL2dist = (Jhh - 2*Jhr + Jrr)/(Jhh + Jrr);

end

