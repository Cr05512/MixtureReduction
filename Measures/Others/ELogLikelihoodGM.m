function EL = ELogLikelihoodGM(gm,samples)
% L = ELogLikelihoodGM(gm,samples):
% INPUTS:
% - gm, a Gaussian mixture,
% - samples, samples used in the EM (stateDim x numSamples matrix).
% OUTPUTS:
% - EL, the expected log-likelihood (scalar).
% This function computes the expected log-likelihood of a Gaussian mixture given the samples.
assert(~isempty(gm),'The mixture has to contain at least one element.');
assert(~isempty(samples),'The sample set has to contain at least one element.');
N = size(samples,2);
EL = sum(log(evalGM(gm,samples)))/N;
end

