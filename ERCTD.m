function [d,C,pi_star] = ERCTD(gmh,gmr,cost_meas,lambda,maxiter)
if nargin < 2
    error('Not enough inputs')
elseif nargin < 3
    cost_meas = 'W2'; %By default
    disp('Assuming W2 as cost function...');
    lambda = 6;
    maxiter = 100;
elseif nargin < 4
    lambda = 0.1;
    maxiter = 100;
elseif nargin < 5
    maxiter = 100;
end

if lambda==0
    [d,C,pi_star] = CTD(gmh,gmr,cost_meas);
else
    %This function computes the entropic regularized composite transportation distance between two gaussian mixtures 
    Nh = length(gmh);
    Nr = length(gmr);

    C = CostMatrix(gmh,gmr,cost_meas);
    if isinf(C)
        disp('Unknown cost function, aborting...');
        d = Inf;
        pi_star = Inf(Nh,Nr);
        return
    end

    pi_star = computeEROTP(C,[gmh.w]',[gmr.w]',lambda,maxiter);

    d = trace(pi_star'*C);  %Matrix inner product
end



end

