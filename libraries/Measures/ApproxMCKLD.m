function MCKLD = ApproxMCKLD(gmh,gmr,nSamples)
% MCKLD = ApproxMCKLD(gmh,gmr,nSamples):
% INPUTS:
% - gmh, gmr, two Gaussian mixtures,
% - nSamples, number of i.i.d. samples to evaluate the MCKLD
% OUTPUTS:
% - MCKLD, numerically computed KLD.
% This function implements the MC computation of the KLD between two
% mixtures as shown in:
% "Approximating the Kullback Leibler Divergence Between Gaussian Mixture
% Models", J. R. Hershey, P. Olsen, Conference: Acoustics, Speech and Signal
% Processing, 2007. ICASSP 2007. IEEE International Conference onVolume: 4
% NOTE: the positivity property of the KLD does not hold with this
% approximation.

if nargin < 3
    nSamples = 1000000;
end
assert(~isempty(gmh) && ~isempty(gmr),'The mixtures have to contain at least one element.');

X = GMSamples(gmh,nSamples);
%X = SigmaPointsGM(gmh);
valsh = evalGMM(gmh,X);
valsr = evalGMM(gmr,X);

MCKLD = 1/nSamples * sum(log(valsh./valsr));


end

