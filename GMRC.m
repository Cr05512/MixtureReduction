function [gmr,nISETrajGMRC] = GMRC(gmh,Nr,NKMeansSteps,sk,NOptSteps,optWeights)
%This function implements the Gaussian Mixture Reduction via Clustering
%Algorithm
gmr = SalmondMRA(gmh,Nr);
gm_KM = KMeans(gmh,gmr,'KLD',NKMeansSteps);
[gmr,nISETrajGMRC] = ISEOpt(gmh,gm_KM,sk,NOptSteps,optWeights);

end

