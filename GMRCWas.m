function [gmr,nISETrajGMRC] = GMRCWas(gmh,Nr,NKMeansSteps,sk,NOptSteps,optWeights)
%This function implements the Gaussian Mixture Reduction via Clustering
%Algorithm
gmr = WassersteinMRA(gmh,Nr);
gm_KM = KMeansW2Dist(gmh,gmr,NKMeansSteps);
[gmr, nISETrajGMRC] = ISEOpt(gmh,gm_KM,sk,NOptSteps,optWeights);

end

