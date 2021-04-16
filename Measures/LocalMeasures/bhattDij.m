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
d = size(mui,1);

dBhatt = 0.5*(log(det(Sigmai+Sigmaj)) - 0.5*log(det(Sigmai)) - 0.5*log(det(Sigmaj)) - d*log(2) +...
            0.5*(mui-muj)'*((Sigmai + Sigmaj)\(mui-muj)));
end

