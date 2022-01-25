function RKLDBar = RKLDBarycenter(comps)
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
wSigmainv = zeros(d,d,N);
for i=1:N
    wSigmainv(:,:,i) = w(i)*eye(d)/Sigma(:,:,i);
    mubar = mubar + wSigmainv(:,:,i)*mu(:,i);
end

wCovSum = sum(wSigmainv,3);

Sigmabar = eye(d)/wCovSum;

mubar = Sigmabar*mubar;

Sigmabar = wbar*Sigmabar;

RKLDBar = struct('w',wbar,'mu',mubar,'Sigma',Sigmabar);

end

