function [gmr,C,pi_star] = CTDRef(gmr,gmh,costMeas,maxiter,varargin)
% [gmr,C,pi_star] = ERCTDRef(gmh,gmr,costMeas,lambda,maxiter,I):
% INPUTS:
% - gmr,gmh, respectively the reduced and original mixtures,
% - costMeas, desired cost measure (char array),
% - varargin, additional parameters needed by some measures (can be empty).
% OUTPUTS:
% - gmr, the refined mixture according to the CTDGMRA algorithm.

if nargin < 3
    costMeas = 'FKLDij';
    maxiter = 100;
elseif nargin < 4
    maxiter = 100;
end

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

wF = [gmh.w]';


for k=1:maxiter
    
    C = CostMatrix(gmh,gmr,costMeas,varargin{:});
    pi_star = relaxedOTP(wF,C); %It works only in this context, we are solving the opt problem by considering only one constraint

    wG = sum(pi_star,1)';

    w_temp = num2cell(pi_star);
    for j=1:Nr
        if wG(j)>0
            [gmh_temp.w] = w_temp{:,j};
            gmr(j) = computeBarycenter(gmh_temp,costMeas,varargin{:});
        end

    end
    
    gmr = gmr(wG>0);
    wG = wG(wG>0);
    w_norm = num2cell(wG./sum(wG));
    [gmr.w] = w_norm{:};
    Nr = length(gmr);
    
    J = trace(pi_star'*C);

    if abs(J-J_prev) < 1e-12
        break;
    end
    J_prev = J;
    
end

end

