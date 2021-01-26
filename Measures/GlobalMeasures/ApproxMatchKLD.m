function AMKLD = ApproxMatchKLD(gmh,gmr)
% AMKLD = ApproxMatchKLD(gmh,gmr):
% INPUT:
% - gmh, gmr, two Gaussian mixtures.
% OUTPUT:
% - AMKLD, matching based approximation of the KLD.
% This function computes an approximation of the KLD as seen in:
% "An Efficient Image Similarity Measure Based on Approximations of
% KL-Divergence Between Two Gaussian Mixtures", J. Goldberger, S. Gordon,
% H. Greenspan.
% This is not an upper bound on the KLD and it does not satisfy any of the
% divergence properties. 

Nh = numel(gmh);
pi = zeros(Nh,1);

logWr = log([gmr.w]');
C = CostMatrix(gmh,gmr,'KLD');

for i=1:Nh
    [~,pi(i)] = min(C(i,:)-logWr');
end

AMKLD = 0;

for i=1:Nh
    AMKLD = AMKLD + gmh(i).w*(C(i,pi(i)) + log(gmh(i).w/gmr(pi(i)).w));
end

end

