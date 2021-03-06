function dCS = CSD(gmh,gmr)
% dCS = CSD(gmh,gmr):
% INPUT:
% - gmh, gmr, two Gaussian Mixtures.
% OUTPUT:
% - dCS, Cauchy-Schwarz divergence computed as shown in:
% "Closed-form Cauchy-Schwarz PDF divergence for Mixture of Gaussians." K.
%  Kampa, E. Hasanbelliu, J.C. Principe
%dCS = -log(crossLikeness(gmh,gmr)) + 0.5*(log(selfLikeness(gmh)) + log(selfLikeness(gmr)));
dCS = -log(crossLikeness(gmh,gmr)/sqrt(selfLikeness(gmh)*selfLikeness(gmr)));
end

