function [d,C,pi_star] = ERCTDW2(gmh,gmr,cost_meas,gamma,maxiter)
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


pi_star = computeEROTP(gmh,gmr,gamma,maxiter);

d = trace(pi_star'*C);  %Matrix inner product



end

