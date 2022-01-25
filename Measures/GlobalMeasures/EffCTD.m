function [d,C,pi_star] = EffCTD(gmh,gmr,costMeas,lambda,varargin)
% [d,C,pi_star] = EffCTD(gmh,gmr,costMeas):
% INPUTS:
% - gmh, gmr, two Gaussian mixtures,
% - costMeas, cost function used in the computation of the cost matrix (char array),
% - varargin, additional parameters needed by some measures (can be empty).
% OUTPUTS:
% - d, the composite transportation distance (scalar),
% - C, the cost matrix (Nh x Nr matrix),
% - pi_star, the optimal transportation plan (Nh x Nr matrix).
% This function computes the efficient composite transportation distance between two
% Gaussian mixtures given a cost function. It uses 1 constraint TP.

if nargin < 3
    costMeas = 'FKLDij'; %By default
    lambda = 0;
    disp('Assuming FKLD as cost function...');
elseif nargin < 4
    lambda = 0;
end

assert(~isempty(gmh) && ~isempty(gmr),'The mixtures have to contain at least one element.');

C = CostMatrix(gmh,gmr,costMeas,varargin{:});

pi_star = EffEROTP([gmh.w]',C,lambda);

d = trace(pi_star'*C);  %Matrix inner product


end

