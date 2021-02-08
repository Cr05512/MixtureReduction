function H_GM = GMEntropyBound(gmh,costMeas)
% H_GM = GMEntropyBound(gmh,costMeas):
% INPUT:
% - gmh, a Gaussian Mixture,
% - costMeas, cost measure used to evaluate the bounds on the mixture
%   entropy. The KLD cost gives an upper bound, the bhattD/chernoff
%   alpha-div, with alpha = 0.5, gives a lower bound on the mixture
%   entropy.
% OUTPUT:
% - H_GM, upper/lower bound on the GM Entropy.
% This function implements the computation of the GM entropy bounds as
% shown in:
% "Estimating Mixture Entropy with Pairwise Distances", A. Kolchinsky, B. D. Tracey


Nh = numel(gmh);
C = CostMatrix(gmh,gmh,costMeas);

expC = exp(-C);

H_self = 0;
for i=1:Nh
    H_self = H_self + gmh(i).w*mvEntropy(gmh(i));
end

H_GM = H_self;
for i=1:Nh
    H_GM = H_GM - gmh(i).w*log([gmh.w]*expC(i,:)');
end



end

