function EL = ELogLikelihoodGM(gmr,samples)
% L = ELogLikelihoodGM(gmr,samples):
% INPUTS:
% - gmr, a Gaussian mixture,
% - samples, samples used in the EM (stateDim x numSamples matrix).
% OUTPUTS:
% - EL, the expected log-likelihood (scalar).
% This function computes the expected log-likelihood of a Gaussian mixture given the samples.
assert(~isempty(gmr),'The mixture has to contain at least one element.');
assert(~isempty(samples),'The sample set has to contain at least one element.');
N = size(samples,2);
EL = sum(log(evalGM(gmr,samples)))/N;
end

