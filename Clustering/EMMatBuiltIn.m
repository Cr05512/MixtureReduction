function gm = EMMatBuiltIn(samples,K)
% gm = EMMatBuiltIn(samples,K):
% INPUT:
% - samples, samples to fit the mixture with (d x N),
% - K, number of components to fit.
% OUTPUT:
% gm, Gaussian mixture fit according to the EM algorithm.
% This function fits a Gaussian mixture of K components to the provided
% samples by using the MATLAB built-in EM algorithm.

gmdist = fitgmdist(samples',K);
gm = gmdist2GaMARTdist(gmdist);

end

