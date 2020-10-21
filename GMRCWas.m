function gmr = GMRCWas(gmh,Nr,NKMeansSteps)
% gmr = GMRCWas(gmh,Nr,NKMeansSteps):
% INPUTS:
% - gmh, a Gaussian mixture,
% - Nr, the desired number of reduced components,
% - NKMeansSteps, the maximum number of allowed steps in the Kmeans algorithm.
% OUTPUTS:
% - gmr, the reduced Gaussian mixture.
% This function implements the Gaussian Mixture Reduction via Clustering
% Algorithm based on the Squared 2-Wasserstein measure.
assert(~isempty(gmh),'The mixture has to contain at least one element.');
assert(Nr>0,'The reduced mixture has to contain at least one element.');
assert(NKMeansSteps>=0,'The number of Kmeans iterations has to be non-negative.');

gmr = WassersteinMRA(gmh,Nr);
gmr = KMeans(gmh,gmr,'W2',NKMeansSteps);

end

