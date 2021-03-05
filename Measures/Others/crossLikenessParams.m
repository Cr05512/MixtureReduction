function Jhr = crossLikenessParams(wh,muh,Sigmah,wr,mur,Sigmar)
% Jhh = crossLikeness(wh,muh,Sigmah,wr,mur,Sigmar):
% INPUTS:
% - wh,muh,Sigmah,wr,mur,Sigmar, parameters of two Gaussian mixtures.
% OUTPUTS:
% - Jhr, cross likeness of gmh and gmr (scalar).
% This function computes the cross-likeness of two Gaussian mixtures.
% This is part of the Integral Squared Error computation.

Jhr = sum(sum(matrixCrossLikenessParams(wh,muh,Sigmah,wr,mur,Sigmar)));

end

