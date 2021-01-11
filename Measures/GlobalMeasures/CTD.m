function [d,C,pi_star] = CTD(gmh,gmr,costMeas)
% [d,C,pi_star] = CTD(gmh,gmr,costMeas):
% INPUTS:
% - gmh, gmr, two Gaussian mixtures,
% - costMeas, cost function used in the computation of the cost matrix (char array).
% OUTPUTS:
% - d, the composite transportation distance (scalar),
% - C, the cost matrix (Nh x Nr matrix),
% - pi_star, the optimal transportation plan (Nh x Nr matrix).
% This function computes the composite transportation distance between two
% Gaussian mixtures given a cost function.

if nargin < 3
    costMeas = 'KLD'; %By default
    disp('Assuming KLD as cost function...');
end

assert(~isempty(gmh) && ~isempty(gmr),'The mixtures have to contain at least one element.');

C = CostMatrix(gmh,gmr,costMeas);

%assert(norm(sum([gmh.w])-1)<1e-12 && norm(sum([gmr.w])-1)<1e-12,'Weights are not normalized.');
pi_star = EffEROTP(gmh,C,0);
%pi_star = computeOTP(C,[gmh.w]',[gmr.w]');

d = trace(pi_star'*C);  %Matrix inner product


end

