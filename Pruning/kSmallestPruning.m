function gmr = kSmallestPruning(gmh,k)
% gm_pruned = kSmallestPruning(gm,k):
% INPUTS:
% - gm, a Gaussian mixture,
% - k, number of components to be pruned (scalar).
% OUTPUTS:
% - gm_pruned, pruned Gaussian mixture.
% This function prunes out the k smallest components of the mixture
% according to their weights.
if nargin<2
    k = 1;
end
assert(~isempty(gmh),'The Gaussian mixture has to contain at least one element.');
assert(k>=0,'The number of components to be pruned has to be greater than zero.');

if k==0
    gmr = gmh;
else

    w = [gmh.w]';
    w_bar = w;
    for i=1:length(gmh)
        w_bar(i) = w_bar(i)/sqrt(det(gmh(i).Sigma));
    end
    [~,ind] = mink(w_bar,k);
    indKeep = setdiff(1:length(gmh),ind);
    gmr = gmh(indKeep);
    w = w(indKeep);
    w_norm = num2cell(w./sum(w));
    [gmr.w] = w_norm{:};
end

    
end

