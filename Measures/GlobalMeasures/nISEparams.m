function J = nISEparams(wh,muh,Sigmah,wr,mur,Sigmar)
% J = nISEparams(wh,muh,Sigmah,wr,mur,Sigmar):
% INPUTS:
% - wh, muh, Sigmah, wr, mur, Sigmar, parameters of two Gaussian mixtures.
% OUTPUTS:
% - J, nISE value (scalar).
% This function computes the Normalized Integral Squared Error between two mixtures from their parameters. It
% can be used as performance metric in the reduction problem.
%assert(~isempty(gmh) && ~isempty(gmr),'Check input parameters, the Gaussian mixtures have to contain at least one element.');

Jhh = selfLikenessParams(wh,muh,Sigmah);
Jrr = selfLikenessParams(wr,mur,Sigmar);
Jhr = crossLikenessParams(wh,muh,Sigmah,wr,mur,Sigmar);
J = 1 -2*Jhr/(Jhh + Jrr);
    
    
end

