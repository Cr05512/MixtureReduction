function UTKLDVal = UTKLD(gmh,gmr)
% UTKLDVal = UTKLD(gmh,gmr):
% INPUT:
% - gmh, gmr, two Gaussian mixtures.
% OUTPUT:
% - UTKLDVal, Unscented Transform KLD estimate value.
% This function implements the UT approximation of the KLD between two
% Gaussian Mixtures.

SPs = kRingUT(gmh,1);

Nh = numel(gmh);
d = size(gmh(1).mu,1);

logVals = log(evalGM(gmh,SPs)./evalGM(gmr,SPs));
val = 0;
for m=1:Nh
    val = val + gmh(m).w*sum(logVals(((m-1)*(2*d+1)+1):m*(2*d+1)));
end

UTKLDVal = val/(2*d+1);
end

