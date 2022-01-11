function [pi_star,C] = relaxedOTP(w,C)
% pi_star = relaxedOTP(wF,C):
% INPUTS:
% - w, original mixture weight vector,
% - C, Cost Matrix (Nh x Nr matrix).
% OUTPUTS:
% - pi_star, the relaxed transportation plan,
% - C, the Cost Matrix.
% This function computes the Entropic regularized Optimal Transportation Plan
% according to:
%"A unified framework for GMR with composite transportation distance".

assert(size(C,1)==numel(w),'Check input parameters, dimensions are inconsistent.');
Nh = numel(w);
Nr = size(C,2);
pi_star = zeros(Nh,Nr);
for i=1:Nh
    [~,Ci] = min(C(i,:));
    pi_star(i,Ci) = w(i);
end
        
    
end

