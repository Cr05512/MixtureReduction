function gmr = GMRC(gmh,Nr,initMethod,NKMeansSteps,NOptSteps,accThresh)
% gmr = GMRC(gmh,Nr,initMethod,NKMeansSteps,opt,sk,NOptSteps,optWeights):
% INPUTS:
% - gmh, a Gaussian mixture,
% - Nr, the desired number of reduced components (scalar),
% - initMethod, the greedy init algorithm (char array),
% - NKMeansSteps, the maximum number of allowed steps in the Kmeans algorithm (scalar),
% - NOptSteps, optimization iterations (scalar),
% - accThresh, accuracy threshold for the ISE optimization.
% OUTPUTS:
% - gmr, the reduced Gaussian mixture,
% This function implements the Gaussian Mixture Reduction via Clustering
% Algorithm presented in:
% Gaussian Mixture Reduction via Clustering, D. Schieferdecker, M.F. Huber
if nargin < 3
    initMethod = 'Runnalls';
    NKMeansSteps = 1;
    NOptSteps = 200;
    accThresh = 1e-09;
elseif nargin < 4
    NKMeansSteps = 1;
    NOptSteps = 200;
    accThresh = 1e-09;
elseif nargin < 5
    NOptSteps = 200;
    accThresh = 1e-09;
elseif nargin < 6
    accThresh = 1e-09;
end
assert(~isempty(gmh),'The mixture has to contain at least one element.');
assert(Nr>0,'The reduced mixture has to contain at least one element.');
assert(any(strcmpi(initMethod,{'Runnalls','West','Salmond','Williams','BF'})),'This init method is not allowed.');
assert(NKMeansSteps>=0,'The number of Kmeans iterations has to be non-negative.');
assert(NOptSteps>=0,'The number of optimization steps has to be non-negative.');
assert(accThresh>0,'The accuracy has to be greater than zero.');

if numel(gmh)<Nr
    gmr = gmh;
    return
end
Nh = numel(gmh);
if(Nh==Nr)
    gmr = gmh;
    return
elseif(Nr==1)
    gmr = KLDBarycenter(gmh);
    return
end

gmr = reduceGaussMix(initMethod,gmh,struct('Nr',Nr));

%Initial clustering
gmr = refineGaussMix('GMKMeansRef',gmr,gmh,struct('costMeas','KLDij','NKmeansSteps',NKMeansSteps));

%NISE clustering loop
gmr = refineGaussMix('clusteringGMRC',gmr,gmh,struct('NSteps',1));

%Iterative optimization
gmr = refineGaussMix('ISEOptUnc',gmr,gmh,struct('NOptSteps',NOptSteps,'optWeights',1,'accThresh',accThresh));

% Weight refinement
gmr = refineGaussMix('weightISEOpt',gmr,gmh);

end

