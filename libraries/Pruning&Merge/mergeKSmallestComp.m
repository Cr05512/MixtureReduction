function gmr = mergeKSmallestComp(gm,k)
% gm_red = pruneKComp(gm,k):
% INPUTS:
% - gm, a Gaussian mixture,
% - k, number of components to be merged.
% OUTPUTS:
% gmr, reduced Gaussian mixture.
% This function merges the k smallest components of the mixture
% according to their weights. The resulting mixture will have k-1 less
% components.
if nargin<2
    k = 1;
end
assert(~isempty(gm),'The Gaussian mixture has to contain at least one element.');
assert(k>0,'The number of components to be merged has to be greater than one.');

gmr = gm;

w = [gmr.w]';
[~,ind] = mink(w,k+1);
pdf_merged = mpMerge(gmr(ind));
gmr(ind(2:end)) = [];
gmr(ind(1)) = pdf_merged;


    
end

