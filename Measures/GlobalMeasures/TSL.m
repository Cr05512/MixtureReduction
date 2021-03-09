function dTSL = TSL(gmh,gmr)
% dTSL = TSL(gmh,gmr):
% INPUT:
% - gmh, gmr, two Gaussian Mixtures.
% OUTPUT:
% - DTSL, total squared loss divergence computed as shown in:
% "Shape Retrieval Using Hierarchical Total Bregman Soft Clustering"
%  M. Liu, B. C. Vemuri, S. Amari, F. Nielsen
%dCS = -log(crossLikeness(gmh,gmr)) + 0.5*(log(selfLikeness(gmh)) + log(selfLikeness(gmr)));
Jhh = selfLikeness(gmh);
Jhr = crossLikeness(gmh,gmr);
Jrr = selfLikeness(gmr);
dTSL = (Jhh - 2*Jhr + Jrr)/sqrt(1+4*Jrr);
end

