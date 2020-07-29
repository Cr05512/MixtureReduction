function [d,C,pi_star] = ERCTDW2(gmh,gmr,cost_meas,gamma,maxiter)
if nargin < 2
    error('Not enough inputs')
elseif nargin < 3
    cost_meas = 'W2'; %By default
    disp('Assuming W2 as cost function...');
    gamma = 6;
    maxiter = 100;
elseif nargin < 4
    gamma = 6;
    maxiter = 100;
elseif nargin < 5
    maxiter = 100;
end
%This function computes the entropic regularized composite transportation distance between two gaussian mixtures 
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

if gamma==0
    disp('Falling back to classic OTP calculation...');
    pi_star = computeOTP(C,[gmh.w]',[gmr.w]');
else
    pi_star = computeEROTP(C,[gmh.w]',[gmr.w]',gamma,maxiter);
end

d = trace(pi_star'*C);  %Matrix inner product



end

