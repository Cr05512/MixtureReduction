function gmr= GMRC(gmh,Nr,initMethod,NKMeansSteps,opt,sk,NOptSteps,optWeights,accThresh)
% gmr = GMRC(gmh,Nr,initMethod,NKMeansSteps,opt,sk,NOptSteps,optWeights):
% INPUTS:
% - gmh, a Gaussian mixture,
% - Nr, the desired number of reduced components (scalar),
% - initMethod, the greedy init algorithm (char array),
% - NKMeansSteps, the maximum number of allowed steps in the Kmeans algorithm (scalar),
% - opt, paramter which enables the optimization over the ISE (opt=1) or skips it (opt=0) (binary variable),
% - sk, the gradient descent step in the ISE optimization (scalar),
% - NOptSteps, optimization iterations (scalar),
% - optWeights, parameter which enables the weight optimization in the
%   ISEOpt; set it to 1 to optimize the weights or to 0 to skip it (binary variable).
% OUTPUTS:
% - gmr, the reduced Gaussian mixture,
% This function implements the Gaussian Mixture Reduction via Clustering
% Algorithm presented in:
% Gaussian Mixture Reduction via Clustering, D. Schieferdecker, M.F. Huber
if nargin < 3
    initMethod = 'Runnalls';
    NKMeansSteps = 1;
    opt = 1;
    sk = 0.01;
    NOptSteps = 30;
    optWeights = 1;
    accThresh = 1e-06;
elseif nargin < 4
    NKMeansSteps = 1;
    opt = 1;
    sk = 0.01;
    NOptSteps = 30;
    optWeights = 1;
    accThresh = 1e-06;
elseif nargin < 5
    opt = 1;
    sk = 0.01;
    NOptSteps = 30;
    optWeights = 1;
    accThresh = 1e-06;
elseif nargin < 6
    sk = 0.01;
    NOptSteps = 30;
    optWeights = 1;
elseif nargin < 7
    NOptSteps = 30;
    optWeights = 1;
    accThresh = 1e-06;
elseif nargin < 8
    optWeights = 1;
    accThresh = 1e-06;
elseif nargin < 9
    accThresh = 1e-06;
end
assert(~isempty(gmh),'The mixture has to contain at least one element.');
assert(Nr>0,'The reduced mixture has to contain at least one element.');
assert(NKMeansSteps>=0,'The number of Kmeans iterations has to be non-negative.');
assert(opt==0 || opt==1,'The opt parameter can take values either 0 or 1.');
assert(sk>0,'The gradient step has to be greater than zero.');
assert(NOptSteps>=0,'The number of optimization steps has to be non-negative.');
assert(optWeights==0 || optWeights==1,'The optWeights parameter can take values either 0 or 1.');

Nh = numel(gmh);
if(Nh==Nr)
    gmr = gmh;
    return
elseif(Nr==1)
    gmr = mpMerge(gmh);
    return
end

gmr = reduce(initMethod,gmh,Nr);

%Initial clustering
gmr = refine('GMKMeans',gmr,gmh,'KLD',NKMeansSteps);

%NISE clustering loop
gmr = refine('clusteringGMRC',gmr,gmh,1);

%Iterative optimization
if opt==1
    gmr = refine('ISEOpt',gmr,gmh,sk,NOptSteps,optWeights,accThresh);
end

% Weight refinement
if opt==1 && optWeights == 1
    gmr = refine('weightISEOpt',gmr,gmh);
end

end

