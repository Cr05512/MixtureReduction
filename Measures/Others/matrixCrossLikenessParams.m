function matrixclp = matrixCrossLikenessParams(wh,muh,Sigmah,wr,mur,Sigmar)
% matrixclp = matrixCrossLikenessParams(wh,muh,Sigmah,wr,mur,Sigmar):
% INPUTS:
% - wh, muh, Sigmah, wr, mur, Sigmar, parameters of two Gaussian Mixtures.
% OUTPUTS:
% - matrixclp, the matrix cross likeness (Nh x Nh matrix).
% This function computes the matrix cross likenesses of a Gaussian mixture. Summing up over all the elements of such matrix
% returns the scalar self likeness of the mixture. 
%assert(~isempty(gmh) && ~isempty(gmr),'The Gaussian mixtures have to contain at least one element.');


weightMatrix = wh*wr';

matrixclp = weightMatrix.*matrixUnwCrossLikeness(muh,Sigmah,mur,Sigmar);

end

