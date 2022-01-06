function dCDiv = alphaCDivij(pdfi,pdfj,alpha)
% dBhatt = sBDij(pdfi,pdfj):
% INPUT:
% - pdfi, pdfj, two Gaussian densities.
% OUTPUT:
% - dBhatt, the Bhattacharyya distance value (scalar).
% This function implements the Bhattacharyya distance computation for two Gaussian densities.
% Note that the Bhattacharyya distance is a Chernoff alpha-divergence for
% alpha = 0.5.

dCDiv = -log(alphaCij(pdfi,pdfj,alpha));

end

