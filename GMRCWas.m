function gmr = GMRCWas(gmh,Nr,NKMeansSteps)
%This function implements the Gaussian Mixture Reduction via Clustering
%Algorithm
gmr = WassersteinMRA(gmh,Nr);
gmr = KMeans(gmh,gmr,'W2',NKMeansSteps);

end

