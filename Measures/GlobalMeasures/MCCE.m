function dMCKLD = MCCE(gmh,gmr,nPoints)
% dMCKLD = MCKLD(gmh,gmr,nSamples):
% INPUTS:
% - gmh, proposal density f (Gaussian Mixture),
% - gmrVec, cell array containing Gaussian mixtures to evaluate (g),
% - nPoints, number of i.i.d. samples to evaluate the MCKLD (scalar).
% OUTPUTS:
% - MCKLDs, numerically computed KLD (vector numGs x 1).
% This function implements the MC computation of the KLD between two
% mixtures as shown in:
% "Approximating the Kullback Leibler Divergence Between Gaussian Mixture
% Models", J. R. Hershey, P. Olsen, Conference: Acoustics, Speech and Signal
% Processing, 2007. ICASSP 2007. IEEE International Conference onVolume: 4
% NOTE: the positivity property of the KLD does not hold with this
% approximation.

if nargin < 3
    nPoints = 1000000;
end
assert(~isempty(gmh) && ~isempty(gmr),'The mixtures have to contain at least one element.');


X = GMSamples(gmh,nPoints);
valsr = evalGM(gmr,X);
dMCKLD = -1/nPoints * sum(log(valsr));



end

