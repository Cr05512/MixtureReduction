function [gmr,nISETrajGMRC] = GMRC(gmh,Nr,NKMeansSteps,sk,NOptSteps,optWeights)
%This function implements the Gaussian Mixture Reduction via Clustering
%Algorithm
gmr = RunnalsMRA(gmh,Nr);
gm_KM = KMeansKLD(gmh,gmr,NKMeansSteps);
[gmr,nISETrajGMRC] = ISEOpt(gmh,gm_KM,sk,NOptSteps,optWeights);

end

