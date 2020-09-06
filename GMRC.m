function [gmr,nISETrajGMRC] = GMRC(gmh,Nr,NKMeansSteps,opt,sk,NOptSteps,optWeights)
%This function implements the Gaussian Mixture Reduction via Clustering
%Algorithm
gmr = RunnalsMRA(gmh,Nr);
gmr = KMeans(gmh,gmr,'KLD',NKMeansSteps);
if opt==1
    [gmr,nISETrajGMRC] = ISEOpt(gmh,gmr,sk,NOptSteps,optWeights);
end

end

