function gmr = GMRCWas(gmh,Nr,NKMeansSteps)
% gmr = GMRCWas(gmh,Nr,NKMeansSteps):
% INPUTS:
% - gmh, a Gaussian mixture,
% - Nr, the desired number of reduced components,
% - NKMeansSteps, the maximum number of allowed steps in the Kmeans algorithm.
% OUTPUTS:
% - gmr, the reduced Gaussian mixture.
% This function implements the Gaussian Mixture Reduction via Clustering
% Algorithm based on the Squared 2-Wasserstein measure presented in:
% Wasserstein-Distance-Based Gaussian Mixture Reduction, A. Assa, K.N. Plataniotis
assert(~isempty(gmh),'The mixture has to contain at least one element.');
assert(Nr>0,'The reduced mixture has to contain at least one element.');
assert(NKMeansSteps>=0,'The number of Kmeans iterations has to be non-negative.');

Nh = length(gmh);
if(Nh==Nr)
    gmr = gmh;
    return
elseif(Nr==1)
    gmr = WassersteinBarycenter(gmh,100);
    return
end

gmr = WassersteinMRA(gmh,Nr);
gmr = GMKMeans(gmh,gmr,'W2',NKMeansSteps);

end

