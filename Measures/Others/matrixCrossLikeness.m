function matrixcl = matrixCrossLikeness(gmh,gmr)
% matrixcl = matrixCrossLikeness(gmh,gmr):
% INPUTS:
% - gmh, gmr, two Gaussian Mixtures.
% OUTPUTS:
% - matrixcl, the matrix cross likeness (Nh x Nh matrix).
% This function computes the matrix cross likenesses of a Gaussian mixture. Summing up over all the elements of such matrix
% returns the scalar self likeness of the mixture. 
assert(~isempty(gmh) && ~isempty(gmr),'The Gaussian mixtures have to contain at least one element.');

[wh,muh,Sigmah] = paramsFromMixture(gmh);
[wr,mur,Sigmar] = paramsFromMixture(gmr);

weightMatrix = wh*wr';

matrixcl = weightMatrix.*matrixUnwCrossLikeness(muh,Sigmah,mur,Sigmar);

end

