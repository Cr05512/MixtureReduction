function CBhatt = bhattCij(pdfi,pdfj)
% CBhatt = bhattCij(pdfi,pdfj):
% INPUT:
% - pdfi, pdfj, two Gaussian densities.
% OUTPUT:
% - CBhatt, the Bhattacharyya coefficient value (scalar).
% This function implements the Bhattacharyya coefficient computation for two Gaussian densities.

CBhatt = 1/exp(bhattD(pdfi,pdfj));
end