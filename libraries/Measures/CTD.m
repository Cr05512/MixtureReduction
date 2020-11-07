function [d,C,pi_star] = CTD(gmh,gmr,cost_meas)
% [d,C,pi_star] = CTD(gmh,gmr,cost_meas):
% INPUTS:
% - gmh, gmr, two Gaussian mixtures,
% - cost_meas, cost function used in the computation of the cost matrix.
% OUTPUTS:
% - d, the composite transportation distance,
% - C, the cost matrix,
% - pi_star, the optimal transportation plan.
% This function computes the composite transportation distance between two
% Gaussian mixtures given a cost function.
if nargin < 2
    error('Not enough inputs')
elseif nargin < 3
    cost_meas = 'KLD'; %By default
    disp('Assuming KLD as cost function...');
end

assert(~isempty(gmh) && ~isempty(gmr),'The mixtures have to contain at least one element.');

C = CostMatrix(gmh,gmr,cost_meas);

%assert(norm(sum([gmh.w])-1)<1e-12 && norm(sum([gmr.w])-1)<1e-12,'Weights are not normalized.');
pi_star = EffEROTP(gmh,C,0);
%pi_star = computeOTP(C,[gmh.w]',[gmr.w]');

d = trace(pi_star'*C);  %Matrix inner product


end

