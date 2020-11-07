function gm_pruned = pruneKSmallestComp(gm,k)
% gm_pruned = pruneKSmallestComp(gm,k):
% INPUTS:
% - gm, a Gaussian mixture,
% - k, number of components to be pruned.
% OUTPUTS:
% gm_pruned, pruned Gaussian mixture.
% This function prunes out the k smallest components of the mixture
% according to their weights.
if nargin<2
    k = 1;
end
assert(~isempty(gm),'The Gaussian mixture has to contain at least one element.');
assert(k>0,'The number of components to be pruned has to be greater than zero.');

w = [gm.w]';
% w_bar = w;
% for i=1:length(gm)
%     w_bar(i) = w_bar(i)/det(gm(i).Sigma);
% end
[~,ind] = mink(w,k);
indKeep = setdiff(1:length(gm),ind);
gm_pruned = gm(indKeep);
% w = w(indKeep);
% w_norm = num2cell(w./sum(w));
% [gm_pruned.w] = w_norm{:};

    
end

