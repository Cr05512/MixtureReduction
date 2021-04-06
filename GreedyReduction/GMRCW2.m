function gmr = GMRCW2(gmh,Nr,NKMeansSteps)
% gmr = GMRCW2(gmh,Nr,NKMeansSteps):
% INPUTS:
% - gmh, a Gaussian mixture,
% - Nr, the desired number of reduced components (scalar),
% - NKMeansSteps (scalar), the maximum number of allowed steps in the Kmeans algorithm.
% OUTPUTS:
% - gmr, the reduced Gaussian mixture.
% This function implements the Gaussian Mixture Reduction via Clustering
% Algorithm based on the Squared 2-Wasserstein measure presented in:
% Wasserstein-Distance-Based Gaussian Mixture Reduction, A. Assa, K.N. Plataniotis
if nargin < 3
    NKMeansSteps = 100;
end
assert(~isempty(gmh),'The mixture has to contain at least one element.');
assert(Nr>0,'The reduced mixture has to contain at least one element.');
assert(NKMeansSteps>=0,'The number of Kmeans iterations has to be non-negative.');

if numel(gmh)<Nr
    gmr = gmh;
    return
end

gmr = gmh;
Nh = numel(gmh);

if(Nh==Nr)
    return
elseif(Nr==1)
    gmr = W2Barycenter(gmr,100);
    return
end

gmr = reduce('W2MRA',gmh,struct('Nr',Nr));
gmr = refine('GMKMeans',gmr,gmh,struct('costMeas','W2ij','NKMeansSteps',NKMeansSteps));

end

