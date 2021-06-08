function Jhh = selfLikenessParams(w,mu,Sigma)
% Jhh =selfLikenessParams(w,mu,Sigma):
% INPUTS:
% - w, mu, Sigma, Gaussian mixture parameters.
% OUTPUTS:
% - Jhh, self likeness of gmh (scalar).
% This function computes the self-likeness of a Gaussian mixture.
% This is part of the Integral Squared Error computation.
%assert(~isempty(gmh),'The mixture has to contain at least one element.');

Jhh = sum(sum(matrixSelfLikenessParams(w,mu,Sigma)));

end

