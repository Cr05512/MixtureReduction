function UTKLDVal = UTKLD(gmh,gmr,nRings)
% UTKLDVal = UTKLD(gmh,gmr,k):
% INPUT:
% - gmh, gmr, two Gaussian mixtures,
% - nRings, number of sigma-point rings.
% OUTPUT:
% - UTKLDVal, Unscented Transform KLD estimate value.
% This function implements the UT approximation of the KLD between two
% Gaussian Mixtures.
if nargin < 3
    nRings = 1;
end
SPs = kRingUT(gmh,nRings);

Nh = numel(gmh);
d = size(gmh(1).mu,1);

logVals = log(evalGM(gmh,SPs)./evalGM(gmr,SPs));
val = 0;
for m=1:Nh
    val = val + gmh(m).w*sum(logVals(((m-1)*(2*nRings*d+1)+1):m*(2*nRings*d+1)));
end

UTKLDVal = val/(2*nRings*d+1);
end

