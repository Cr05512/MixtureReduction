function [gmr,nISETrajGMRC] = GMRCMod(gmh,Nr,NKMeansSteps,opt,sk,NOptSteps,optWeights)
% [gmr,nISETrajGMRC] = GMRC(gmh,Nr,NKMeansSteps,opt,sk,NOptSteps,optWeights):
% INPUTS:
% - gmh, a Gaussian mixture,
% - Nr, the desired number of reduced components,
% - NKMeansSteps, the maximum number of allowed steps in the Kmeans algorithm,
% - opt, paramter which enables the optimization over the ISE (opt=1) or skips it (opt=0),
% - sk, the gradient descent step in the ISE optimization,
% - NOptSteps, optimization iterations,
% - optWeights, parameter which enables the weight optimization in the
%   ISEOpt; set it to 1 to optimize the weights or to 0 to skip it.
% OUTPUTS:
% - gmr, the reduced Gaussian mixture,
% - nISETrajGMRC, this argument contains the normalized ISE values over the optimization phase.
% This function implements the Gaussian Mixture Reduction via Clustering
% Algorithm presented in:
% Gaussian Mixture Reduction via Clustering, D. Schieferdecker, M.F. Huber
if nargin < 3
    NKMeansSteps = 100;
    opt = 1;
    sk = 0.01;
    NOptSteps = 30;
    optWeights = 1;
elseif nargin < 4
    opt = 1;
    sk = 0.01;
    NOptSteps = 30;
    optWeights = 1;
elseif nargin < 5
    sk = 0.01;
    NOptSteps = 30;
    optWeights = 1;
elseif nargin < 6
    NOptSteps = 30;
    optWeights = 1;
elseif nargin < 7
    optWeights = 1;
end
assert(~isempty(gmh),'The mixture has to contain at least one element.');
assert(Nr>0,'The reduced mixture has to contain at least one element.');
assert(NKMeansSteps>=0,'The number of Kmeans iterations has to be non-negative.');
assert(opt==0 || opt==1,'The opt parameter can take values either 0 or 1.');
assert(sk>0,'The gradient step has to be greater than zero.');
assert(NOptSteps>=0,'The number of optimization steps has to be non-negative.');
assert(optWeights==0 || optWeights==1,'The optWeights parameter can take values either 0 or 1.');

Nh = length(gmh);
if(Nh==Nr)
    gmr = gmh;
    return
elseif(Nr==1)
    gmr = mpMerge(gmh);
    return
end

    
gmr = RunnalsMRA(gmh,Nr);
gmr = KMeansMod(gmh,gmr,'KLD',NKMeansSteps);
%gmr = KMeans(gmh,gmr,'KLD',NKMeansSteps);
if opt==1
    [gmr,nISETrajGMRC] = ISEOptimization(gmh,gmr,sk,NOptSteps,optWeights);
end

end

