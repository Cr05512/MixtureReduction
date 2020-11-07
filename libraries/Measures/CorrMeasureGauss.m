function C = CorrMeasureGauss(pdfh,pdfr)
% C = CorrMeasure(gmh,gmr):
% INPUTS:
% - gmh, gmr, two Gaussian Mixtures.
% OUTPUTS:
% - C, the correlation measure between gmh and gmr.
% This function computes the correlation measure between two Gaussian
% mixtures.  D. J. Petrucci.  Gaussian mixture reduction for bayesian
% target tracking inclutter.Master’s thesis, Air Force Institute of Technology, 2005.


Jhh = mvnpdf(pdfh.mu,pdfh.mu,2*pdfh.Sigma);
Jrr = mvnpdf(pdfr.mu,pdfr.mu,2*pdfr.Sigma);
Jhr = mvnpdf(pdfr.mu,pdfh.mu,pdfr.Sigma+pdfh.Sigma);

C = Jhr/sqrt(Jhh*Jrr);

end

