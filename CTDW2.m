function [d,C,pi_star] = CTDW2(gmh,gmr,cost_meas)

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

if strcmp(cost_meas,'KLD')
    for i=1:length(gmh)
        for j=1:length(gmr)
            C(i,j) = KLD(gmh(i),gmr(j));
        end
    end
elseif strcmp(cost_meas,'W2')
    for i=1:length(gmh)
        for j=1:length(gmr)
            C(i,j) = Wasserstein2Dist(gmh(i),gmr(j));
        end
    end
else
    disp('Unknown cost function, aborting...');
    C = Inf(Nh,Nr);
end

pi_star = computeOTP(C,[gmh.w]',[gmr.w]');

d = trace(pi_star'*C);  %Matrix inner product



end

