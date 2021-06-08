function L = logLikelihoodGM(gmr,samples)
% L = logLikelihoodGM(gmr,samples):
% INPUTS:
% - gmr, a Gaussian mixture,
% - samples, samples used in the EM (stateDim x numSamples matrix).
% OUTPUTS:
% - L, the log-likelihood (scalar).
% This function computes the log-likelihood of a Gaussian mixture given the samples.
assert(~isempty(gmr),'The mixture has to contain at least one element.');
assert(~isempty(samples),'The sample set has to contain at least one element.');

L = sum(log(evalGM(gmr,samples)));
end

