function dCM = CM(gmh,gmr)
% dCM = CM(gmh,gmr):
% INPUTS:
% - gmh, gmr, two Gaussian Mixtures.
% OUTPUTS:
% - dCM, the correlation measure between gmh and gmr (scalar).
% This function computes the correlation measure between two Gaussian
% mixtures.  D. J. Petrucci.  Gaussian mixture reduction for bayesian
% target tracking inclutter.Master’s thesis, Air Force Institute of Technology, 2005.

assert(~isempty(gmh) && ~isempty(gmr),'The mixtures have to contain at least one element each.');

dCM = crossLikeness(gmh,gmr)/sqrt(selfLikeness(gmh)*selfLikeness(gmr));

end

