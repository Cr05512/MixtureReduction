function J = ISE(gmh,gmr)
% J = ISE(gmh,gmr):
% INPUTS:
% - gmh,gmr, two Gaussian mixtures.
% OUTPUTS:
% - J, ISE value.
% This function computes the Integral Squared Error between two mixtures. It
% can be used as performance metric in the reduction problem.
assert(~isempty(gmh) && ~isempty(gmr),'Check input parameters, the Gaussian mixtures have to contain at least one element.');

J = selfLikeness(gmh) -2*crossLikeness(gmh,gmr) + selfLikeness(gmr);
    
    
end

