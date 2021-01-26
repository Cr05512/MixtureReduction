function MCKLDs = ApproxMCKLD(gmh,gmrVec,nSamples)
% MCKLD = ApproxMCKLD(gmh,gmr,nSamples):
% INPUTS:
% - gmh, proposal density f (Gaussian Mixture),
% - gmrVec, cell array containing Gaussian mixtures to evaluate (g),
% - nSamples, number of i.i.d. samples to evaluate the MCKLD (scalar).
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
    nSamples = 1000000;
end
assert(~isempty(gmh) && ~isempty(gmrVec),'The mixtures have to contain at least one element.');

if iscell(gmrVec)
    numGs = length(gmrVec);
elseif isstruct(gmrVec)
    numGs = 1;
end

X = GMSamples(gmh,nSamples);
valsh = evalGM(gmh,X);
MCKLDs = zeros(numGs,1);
if isstruct(gmrVec)
    valsr = evalGM(gmrVec,X);
    MCKLDs = 1/nSamples * sum(log(valsh./valsr));
else
    for i=1:numGs
        valsr = evalGM(gmrVec{i},X);
        MCKLDs(i) = 1/nSamples * sum(log(valsh./valsr));
    end
end


end

