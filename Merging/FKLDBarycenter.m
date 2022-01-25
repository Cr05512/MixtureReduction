function FKLDBar = FKLDBarycenter(comps)
% KLDBar = KLDBarycenter(comps):
% INPUTS:
% - comps, a vector of weighted Gaussian components (numComps x 1 vector).
% OUTPUTS:
% - KLDBar, the moment preserving merge of the input components (weighted Gaussian density).
% This function takes as input a vecot of Gaussian components and returns
% their moment-preseving merge (KLD-barycenter).

assert(numel(comps)>0,'The number of components in the merge has to be greater than zero.');

[w,mu,Sigma] = paramsFromMixture(comps);
d = size(mu(:,1),1);
N = numel(comps);

wbar = sum(w);

mubar = zeros(d,1);
for i=1:N
    mubar = mubar + w(i)*mu(:,i);
end
mubar = (1/wbar)*mubar;

Sigmabar = zeros(d,d);

for i=1:N
    Sigmabar = Sigmabar + w(i)*(Sigma(:,:,i)+(mu(:,i) - mubar)*(mu(:,i) - mubar)');
end
Sigmabar = Sigmabar/wbar;

FKLDBar = struct('w',wbar,'mu',mubar,'Sigma',Sigmabar);

end

