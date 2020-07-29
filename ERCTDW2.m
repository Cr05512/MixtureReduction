function [d,C,pi_star] = ERCTDW2(gmh,gmr,gamma,maxiter)
%This function computes the entropic regularized composite transportation distance between two gaussian mixtures 
Nh = length(gmh);
Nr = length(gmr);
C = zeros(Nh,Nr);
for i=1:length(gmh)
    for j=1:length(gmr)
        C(i,j) = Wasserstein2Dist(gmh(i),gmr(j));
    end
end

pi_star = computeEROTP(gmh,gmr,gamma,maxiter);

d = trace(pi_star'*C);  %Matrix inner product



end

