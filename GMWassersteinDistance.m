function [d,C,pi_star] = GMWassersteinDistance(gmh,gmr)
%This function computes the distance between two gaussian mixtures based on
% an upper bound on the Wasserstein2 distance

Nh = length(gmh);
Nr = length(gmr);
C = zeros(Nh,Nr);
for i=1:length(gmh)
    for j=1:length(gmr)
        C(i,j) = Wasserstein2Dist(gmh(i),gmr(j));
    end
end

pi_star = computeOPT(gmh,gmr);

d = 0;

for i=1:Nh
    for j=1:Nr
        d = d + C(i,j)*pi_star(i,j);
    end
end



end

