function matrixcl = matrixCrossLikeness(gmh,gmr)
% matrixcl = matrixCrossLikeness(gmh,gmr):
% INPUTS:
% - gmh, gmr, two Gaussian mixtures.
% OUTPUTS:
% - matrixcl, the matrix cross likeness (Nh x Nr matrix).
% This function computes the cross likenesses of each pair of components,
% returning a matrix. Summing up over all the elements of such matrix
% returns the scalar cross likeness between the mixtures.
assert(~isempty(gmh) && ~isempty(gmr),'The mixtures have to contain at least one element.');

N = numel(gmh);
R = numel(gmr);

matrixcl = Inf(N,R);

for i=1:N
    for j=1:R
         matrixcl(i,j) = gmh(i).w*gmr(j).w*mvnpdf(gmh(i).mu,gmr(j).mu,gmh(i).Sigma + gmr(j).Sigma);
    end
end

end

