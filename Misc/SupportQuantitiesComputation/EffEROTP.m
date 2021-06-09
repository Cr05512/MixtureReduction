function [pi_star,C] = EffEROTP(wF,C,lambda)
% pi_star = EffEROTP(wF,C,lambda):
% INPUTS:
% - wF, original mixture weight vector,
% - C, Cost Matrix (Nh x Nr matrix),
% - lambda, regularization parameter (scalar).
% OUTPUTS:
% - logPi, the logarithmic entropic regularized optimal transportation plan (scalar).
% This function computes the Entropic regularized Optimal Transportation Plan
% according to:
%"A unified framework for GMR with composite transportation distance".

assert(size(C,1)==numel(wF),'Check input parameters, dimensions are inconsistent.');
assert(lambda>=0,'The parameter lambda has to be non-negative.');
Nh = numel(wF);
Nr = size(C,2);
pi_star = zeros(Nh,Nr);
for i=1:Nh
    if lambda==0
        [~,Ci] = min(C(i,:));
        pi_star(i,Ci) = wF(i);
    else
        tmp = exp(-C(i,:)./lambda);
        piTmp = wF(i)*tmp/sum(tmp);
        if ~isnan(piTmp)
            pi_star(i,:) = piTmp;
        end

    end
end
        
    
end

