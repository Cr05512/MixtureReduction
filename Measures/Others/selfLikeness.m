function Jhh = selfLikeness(gmh)
% Jhh = selfLikeness(gmh):
% INPUTS:
% - gmh, a Gaussian mixture.
% OUTPUTS:
% - Jhh, self likeness of gmh (scalar).
% This function computes the self-likeness of a Gaussian mixture.
% This is part of the Integral Squared Error computation.
assert(~isempty(gmh),'The mixture has to contain at least one element.');

Jhh = sum(sum(matrixSelfLikeness(gmh)));

end

