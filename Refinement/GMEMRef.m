function gmr = GMEMRef(gmr, gmh, nPoints, maxiter)
% gmr = GMEMRef(gmr, gmh, nSamples, maxiter):
% INPUTS:
% - gmr, initial Gaussian mixture,
% - gmh, reference Gaussian mixture,
% - nSamples, number of samples to draw from the reference mixture (scalar),
% - maxiter, maximum number of allowed iterations (scalar).
% OUTPUTS:
% - gmr, the refined mixture according to the EM algorithm.
% This function implements EM refinement over the gm_init mixture by using samples from the full mixture
% as presented in:
% Maximum Likelihood from Incomplete Data via the EM Algorithm,  A. P. Dempster, N. M. Laird, D. B. Rubin
if nargin < 3
    maxiter = 200;
end
assert(~isempty(gmr) && ~isempty(gmh),'The Gaussian Mixtures have to contain at least one element.');
assert(nPoints>0,'The number of samples has to be a non-negative integer.');
assert(maxiter>0,'The number of iterations has to be non-negative.');
assert(nPoints>numel(gmr),'The number of samples has to be greater than the number of starting componts.');

samples = GMSamples(gmh,nPoints);

gmr = EM(samples,numel(gmr),maxiter,gmr);

end

