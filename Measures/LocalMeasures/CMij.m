function C = CMij(pdfi,pdfj)
% C = CMij(pdfh,pdfr):
% INPUTS:
% - pdfh, pdfr, two Gaussian Densities.
% OUTPUTS:
% - C, the correlation measure between gmh and gmr (scalar).
% This function computes the correlation measure between two Gaussian
% Densities.  D. J. Petrucci.  Gaussian mixture reduction for bayesian
% target tracking inclutter.Master’s thesis, Air Force Institute of Technology, 2005.


Jhh = mvnpdf(pdfi.mu,pdfi.mu,2*pdfi.Sigma);
Jrr = mvnpdf(pdfj.mu,pdfj.mu,2*pdfj.Sigma);
Jhr = mvnpdf(pdfj.mu,pdfi.mu,pdfj.Sigma+pdfi.Sigma);

C = Jhr/sqrt(Jhh*Jrr);

end

