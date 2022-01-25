function dAMKLD = AMKLD(gmh,gmr)
% dAMKLD = AMKLD(gmh,gmr):
% INPUT:
% - gmh, gmr, two Gaussian mixtures.
% OUTPUT:
% - dAMKLD, matching based approximation of the KLD.
% This function computes an approximation of the KLD as seen in:
% "An Efficient Image Similarity Measure Based on Approximations of
% KL-Divergence Between Two Gaussian Mixtures", J. Goldberger, S. Gordon,
% H. Greenspan.
% This is not an upper bound on the KLD and it does not satisfy any of the
% divergence properties. 

Nh = numel(gmh);
pi = zeros(Nh,1);

logWr = log([gmr.w]');
C = CostMatrix(gmh,gmr,'FKLDij');

for i=1:Nh
    [~,pi(i)] = min(C(i,:)-logWr');
end

dAMKLD = 0;

for i=1:Nh
    dAMKLD = dAMKLD + gmh(i).w*(C(i,pi(i)) + log(gmh(i).w/gmr(pi(i)).w));
end

end

