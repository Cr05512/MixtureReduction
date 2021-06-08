function dCUBKLD = CUBKLD(gmh,gmr)
% CUBKLD = CUBKLD(gmh,gmr):
% INPUTS:
% - gmh, gmr, two Gaussian mixtures,
% OUTPUTS:
% - dCUBKLD, numerically computed KLD (scalar).
% This function implements the computation of a convex upper bound on the KLD between two
% mixtures as shown in:
% "Approximating the Kullback Leibler Divergence Between Gaussian Mixture
% Models", J. R. Hershey, P. Olsen, Conference: Acoustics, Speech and Signal
% Processing, 2007. ICASSP 2007. IEEE International Conference onVolume: 4
% NOTE: the positivity property of the KLD holds with this
% approximation.

C = CostMatrix(gmh,gmr,'KLDij');
dCUBKLD = [gmh.w]*C*[gmr.w]';


end

