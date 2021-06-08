function J = ISEparams(wh,muh,Sigmah,wr,mur,Sigmar)
% J = ISEparams(wh,muh,Sigmah,wr,mur,Sigmar):
% INPUTS:
% - wh, muh, Sigmah, wr, mur, Sigmar, parameters of two Gaussian mixtures.
% OUTPUTS:
% - J, ISE value (scalar).
% This function computes the Integral Squared Error between two mixtures from their parameters. It
% can be used as performance metric in the reduction problem.
%assert(~isempty(gmh) && ~isempty(gmr),'Check input parameters, the Gaussian mixtures have to contain at least one element.');

Jhh = selfLikenessParams(wh,muh,Sigmah);
Jrr = selfLikenessParams(wr,mur,Sigmar);
Jhr = crossLikenessParams(wh,muh,Sigmah,wr,mur,Sigmar);

J = Jhh - 2*Jhr + Jrr;
    
    
end

