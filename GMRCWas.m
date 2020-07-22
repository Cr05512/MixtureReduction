function gmr = GMRCWas(gmh,Nr,NKMeansSteps)
%This function implements the Gaussian Mixture Reduction via Clustering
%Algorithm
gmr = WassersteinMRA(gmh,Nr);
gmr = KMeansW2Dist(gmh,gmr,NKMeansSteps);
%[gmr, nISETrajGMRC] = ISEOpt(gmh,gm_KM,sk,NOptSteps,optWeights);

end

