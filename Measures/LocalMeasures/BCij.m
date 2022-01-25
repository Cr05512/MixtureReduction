function CBhatt = BCij(pdfi,pdfj)
% CBhatt = bhattCij(pdfi,pdfj):
% INPUT:
% - pdfi, pdfj, two Gaussian densities.
% OUTPUT:
% - CBhatt, the Bhattacharyya coefficient value (scalar).
% This function implements the Bhattacharyya coefficient computation for two Gaussian densities.

CBhatt = alphaCij(pdfi,pdfj,0.5);
end