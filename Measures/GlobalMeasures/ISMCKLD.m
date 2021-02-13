function ISMCKLDs = ISMCKLD(gmh,gmrVec,nSamples)
% ISMCKLDs = ISMCKLD(gmh,gmrVec,nSamples)
% INPUTS:
% - gmh, proposal density f (Gaussian Mixture),
% - gmrVec, cell array containing Gaussian mixtures to evaluate (g),
% - nSamples, number of i.i.d. samples to evaluate the ISMCKLD (scalar).
% OUTPUTS:
% - ISMCKLDs, numerically computed KLD (vector numGs x 1).
% This function implements the Itakura-Saito modification of the MCKLD between two
% mixtures as shown in:
% "Closed-Form Information-Theoretic Divergences for Statistical Mixtures",
% F. Nielsen.
% NOTE: this implementation gives the positivity property to the MCKLD.

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
ISMCKLDs = zeros(numGs,1);
if isstruct(gmrVec)
    valsr = evalGM(gmrVec,X);
    ISMCKLDs = 1/nSamples * sum(log(valsh./valsr) + valsr./valsh - 1);
else
    for i=1:numGs
        valsr = evalGM(gmrVec{i},X);
        ISMCKLDs(i) = 1/nSamples * sum(log(valsh./valsr) + valsr./valsh - 1);
    end
end


end

