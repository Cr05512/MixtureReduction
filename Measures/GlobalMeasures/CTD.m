function [dT,C,pi_star] = CTD(gmh,gmr,costMeas,varargin)
% [dT,C,pi_star] = CTD(gmh,gmr,costMeas):
% INPUTS:
% - gmh, gmr, two Gaussian mixtures,
% - costMeas, cost function used in the computation of the cost matrix (char array),
% - varargin, additional parameters needed by some measures (can be empty).
% OUTPUTS:
% - dT, the composite transportation distance (scalar),
% - C, the cost matrix (Nh x Nr matrix),
% - pi_star, the optimal transportation plan (Nh x Nr matrix).
% This function computes the composite transportation distance between two
% Gaussian mixtures given a cost function.

if nargin < 3
    costMeas = 'FKLDij'; %By default
    disp('Assuming KLD as cost function...');
end

assert(~isempty(gmh) && ~isempty(gmr),'The mixtures have to contain at least one element.');

C = CostMatrix(gmh,gmr,costMeas,varargin{:});

%assert(norm(sum([gmh.w])-1)<1e-12 && norm(sum([gmr.w])-1)<1e-12,'Weights are not normalized.');
pi_star = computeOTP(C,[gmh.w]',[gmr.w]');

dT = trace(pi_star'*C);  %Frobenius product


end

