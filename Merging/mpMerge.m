function mergedComp = mpMerge(comps)
% mergedComp = mpMerge(w,comps):
% INPUTS:
% - comps, a vector of weighted Gaussian components (numComps x 1 vector).
% OUTPUTS:
% - mergedComp, the moment preserving merge of the input components (weighted Gaussian density).
% This function takes as input a vecot of Gaussian components and returns
% their moment-preseving merge (KLD-barycenter).

assert(numel(comps)>0,'The number of components in the merge has to be greater than zero.');


w_merged = sum([comps.w]);
d = size(comps(1).mu,1);

mu_merged = zeros(d,1);
for i=1:numel(comps)
    mu_merged = mu_merged + comps(i).w*comps(i).mu;
end
mu_merged = (1/w_merged)*mu_merged;

Sigma_merged = zeros(d,d);

for i=1:numel(comps)
    Sigma_merged = Sigma_merged + (comps(i).w/w_merged)*(comps(i).Sigma...
        + (comps(i).mu - mu_merged)*(comps(i).mu - mu_merged)');
end
          
mergedComp = struct('w',w_merged,'mu',mu_merged,'Sigma',Sigma_merged);
end

