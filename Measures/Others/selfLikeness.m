function Jhh = selfLikeness(gm)
% Jhh = selfLikeness(w,mu,Sigma):
% INPUTS:
% - gm, a Gaussian mixture.
% OUTPUTS:
% - Jhh, self likeness of gmh (scalar).
% This function computes the self-likeness of a Gaussian mixture.
% This is part of the Integral Squared Error computation.
%assert(~isempty(gmh),'The mixture has to contain at least one element.');

Jhh = sum(sum(matrixSelfLikeness(gm)));

end

