function ISUTKLDVal = ISUTKLD(gmh,gmr,k)
% ISUTKLDVal = ISUTKLD(gmh,gmr,k):
% INPUT:
% - gmh, gmr, two Gaussian mixtures,
% - k, number of sigma-point rings.
% OUTPUT:
% - ISUTKLDVal, Unscented Transform KLD estimate value.
% This function implements the Itakura-Saito UT approximation of the KLD between two
% Gaussian Mixtures.
if nargin < 3
    k = 1;
end
SPs = kRingUT(gmh,k);

Nh = numel(gmh);
d = size(gmh(1).mu,1);
valsh = evalGM(gmh,SPs);
valsr = evalGM(gmr,SPs);
logVals = log(valsh./valsr);
val = 0;
for m=1:Nh
    val = val + gmh(m).w*sum(logVals(((m-1)*(2*k*d+1)+1):m*(2*k*d+1)) + valsr(((m-1)*(2*k*d+1)+1):m*(2*k*d+1))./valsh(((m-1)*(2*k*d+1)+1):m*(2*k*d+1)) - 1);
end

ISUTKLDVal = val/(2*k*d+1);
end

