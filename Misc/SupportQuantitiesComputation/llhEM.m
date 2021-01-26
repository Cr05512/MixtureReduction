function L = llhEM(gmr,samples)
% L = llhEM(gmr,samples):
% INPUTS:
% - gmr, a Gaussian mixture,
% - samples, samples used in the EM (stateDim x numSamples matrix).
% OUTPUTS:
% - L, the log-likelihood (scalar).
% This function computes the log-likelihood of the EM algorithm.
assert(~isempty(gmr),'The mixture has to contain at least one element.');
assert(~isempty(samples),'The sample set has to contain at least one element.');

L = 0;
for i=1:size(samples,2)
    tmp = 0;
    for j=1:numel(gmr)
        tmp = tmp + gmr(j).w*mvnpdf(samples(:,i),gmr(j).mu,gmr(j).Sigma);
    end
    L = L + log(tmp);
end
end

