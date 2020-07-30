function [d,C,pi_star] = CTD(gmh,gmr,cost_meas)

if nargin < 2
    error('Not enough inputs')
elseif nargin < 3
    cost_meas = 'W2'; %By default
    disp('Assuming W2 as cost function...');
end
%This function computes the composite transportation distance between two gaussian mixtures 
Nh = length(gmh);
Nr = length(gmr);
C = zeros(Nh,Nr);


for i=1:length(gmh)
    for j=1:length(gmr)
        if strcmp(cost_meas,'KLD')
            C(i,j) = KLD(gmh(i),gmr(j));
        elseif strcmp(cost_meas,'W2')
            C(i,j) = Wasserstein2Dist(gmh(i),gmr(j));
        elseif strcmp(cost_meas,'L2')
            C(i,j) = ISE(gmh(i),gmr(j));
        else
            disp('Unknown cost function, aborting...');
            d = Inf;
            C = Inf(Nh,Nr);
            pi_star = Inf(Nh,Nr);
            return
        end
    end
end

pi_star = computeOTP(C,[gmh.w]',[gmr.w]');

d = trace(pi_star'*C);  %Matrix inner product



end

