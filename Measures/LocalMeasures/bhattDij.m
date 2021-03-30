function dBhatt = bhattDij(pdfi,pdfj)
% dBhatt = bhattDij(pdfi,pdfj):
% INPUT:
% - pdfi, pdfj, two Gaussian densities.
% OUTPUT:
% - dBhatt, the Bhattacharyya distance value (scalar).
% This function implements the Bhattacharyya distance computation for two Gaussian densities.
% Note that the Bhattacharyya distance is a Chernoff alpha-divergence for
% alpha = 0.5.

mui = pdfi.mu;
muj = pdfj.mu;
Sigmai = pdfi.Sigma;
Sigmaj = pdfj.Sigma;
meanSigma = (Sigmai+Sigmaj)/2;

dBhatt = (1/8)*(muj-mui)'*((meanSigma)\(muj-mui)) + 0.5*log(det(meanSigma)/sqrt(det(Sigmai)*det(Sigmaj)));
end

