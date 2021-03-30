function dSRJS = SRJSDij(pdfh,pdfr)
% dSRJS = SRJSDij(pdfh,pdfr):
% INPUTS:
% - pdfh, pdfr, two Gaussian densities.
% OUTPUTS:
% - dSRJS, resulting squared root Jensen-Shannon divergence (scalar).
% This function computes the squared root Jensen-Shannon divergence between two multivariate Gaussians. It is
% not suitable for other kind of distributions. Note, this is a true
% distance.

dSRJS = real(sqrt(GJSD(pdfh,pdfr,0.5)));
end

