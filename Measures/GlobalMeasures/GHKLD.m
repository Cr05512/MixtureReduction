function GHKLDval = GHKLD(gmh,gmr,m)
% UTKLDVal = UTKLD(gmh,gmr,k):
% INPUT:
% - gmh, gmr, two Gaussian mixtures,
% - m, GH order.
% OUTPUT:
% - UTKLDVal, Unscented Transform KLD estimate value.
% This function implements the UT approximation of the KLD between two
% Gaussian Mixtures.
if nargin < 3
    m = 3;
end


Nh = numel(gmh);
d = size(gmh(1).mu,1);

SPs = [];
for i=1:Nh
    SPs = [SPs GaussHermitePoints(gmh(i).mu,gmh(i).Sigma,m)];
end

logVals = log(evalGM(gmh,SPs)./evalGM(gmr,SPs));
val = 0;
for m=1:Nh
    val = val + gmh(m).w*sum(logVals(((m-1)*(m^d)+1):m*(m^d)));
end

GHKLDval = val/(m^d);
end

