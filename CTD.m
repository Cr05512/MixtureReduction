function [d,C,pi_star] = CTD(gmh,gmr,cost_meas)

if nargin < 2
    error('Not enough inputs')
elseif nargin < 3
    cost_meas = 'KLD'; %By default
    disp('Assuming KLD as cost function...');
end
%This function computes the composite transportation distance between two gaussian mixtures 
Nh = length(gmh);
Nr = length(gmr);
C = CostMatrix(gmh,gmr,cost_meas);
if isinf(C)
    disp('Unknown cost function, aborting...');
    d = Inf;
    pi_star = Inf(Nh,Nr);
    return
end

assert(norm(sum([gmh.w])-1)<1e-12 && norm(sum([gmr.w])-1)<1e-12,'Weights are not normalized.');
pi_star = computeOTP(C,[gmh.w]',[gmr.w]');

d = trace(pi_star'*C);  %Matrix inner product



end

