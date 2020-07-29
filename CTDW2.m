function [d,C,pi_star] = CTDW2(gmh,gmr)
%This function computes the composite transportation distance between two gaussian mixtures 
Nh = length(gmh);
Nr = length(gmr);
C = zeros(Nh,Nr);
for i=1:length(gmh)
    for j=1:length(gmr)
        C(i,j) = Wasserstein2Dist(gmh(i),gmr(j));
    end
end

pi_star = computeOTP(gmh,gmr);

d = trace(pi_star'*C);  %Matrix inner product



end

