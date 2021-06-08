function [gmr,C,pi_star] = ERCTDRef(gmr,gmh,costMeas,lambda,maxiter,varargin)
% [gmr,C,pi_star] = ERCTDRef(gmh,gmr,costMeas,lambda,maxiter,I):
% INPUTS:
% - gmr,gmh, respectively the reduced and original mixtures,
% - costMeas, desired cost measure (char array),
% - lambda, regularization parameter (scalar),
% - varargin, additional parameters needed by some measures (can be empty).
% OUTPUTS:
% - gmr, the refined mixture according to the CTDGMRA algorithm.
% This function implements the Entropic Regularized Composite Transportation Distance
% refinement algoirthm as presented in:
% Q. Zhang and J. Chen. "A unified framework for gaussian mixture reduction
% with  composite  transportation  distance".arXiv:2002.08410v1  [stat.ML.],2020.
if nargin < 3
    costMeas = 'KLDij';
    lambda = 0.1;
    maxiter = 100;
elseif nargin < 4
    lambda = 0.1;
    maxiter = 100;
elseif nargin < 5
    maxiter = 100;
end
assert(lambda>=0,'The regularization parameter has to be non-negative.');
assert(maxiter>=0,'The number of iterations has to be non-negative.');

if maxiter==0
    C = 0;
    pi_star = 0;
    return
end

gmh_temp = gmh;
Nr = numel(gmr);
J = Inf;
J_prev = J;

[wF,~,~] = paramsFromMixture(gmh);


for k=1:maxiter
    
    C = CostMatrix(gmh,gmr,costMeas,varargin{:});
    pi_star = EffEROTP(wF,C,lambda); %It works only in this context, we are solving the opt problem by considering only one constraint
    
    J = trace(pi_star'*C) - lambda*MatrixEntropy(pi_star);

    if abs(J-J_prev) < 1e-12
        break;
    end

    wG = sum(pi_star,1)';

    w_temp = num2cell(pi_star);
    for j=1:Nr
        if wG(j)>0
            [gmh_temp.w] = w_temp{:,j};
            gmr(j) = computeBarycenter(gmh_temp,costMeas);
        end

    end
    
    gmr = gmr(wG>0);
    wG = wG(wG>0);
    w_norm = num2cell(wG./sum(wG));
    [gmr.w] = w_norm{:};
    Nr = length(gmr);
    %wG = wG(ind_keep);
    J_prev = J;
    
end

end

