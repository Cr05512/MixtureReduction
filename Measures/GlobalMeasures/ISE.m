function J = ISE(gmh,gmr)
% J = ISE(gmh,gmr):
% INPUTS:
% - gmh,gmr, two Gaussian mixtures.
% OUTPUTS:
% - J, ISE value (scalar).
% This function computes the Integral Squared Error between two mixtures. It
% can be used as performance metric in the reduction problem.
assert(~isempty(gmh) && ~isempty(gmr),'Check input parameters, the Gaussian mixtures have to contain at least one element.');

Jhh = selfLikeness(gmh);
Jhr = crossLikeness(gmh,gmr);
Jrr = selfLikeness(gmr);

J = Jhh - 2*Jhr + Jrr;
    
    
end

