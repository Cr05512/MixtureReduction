function gm_init = sampleKMeansGMInit(gmh,Nr,nSteps,nSamples)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if nargin < 3
    nSteps = 100;
    nSamples = 10000;
elseif nargin < 4
    nSamples = 10000;
end

assert(~isempty(gmh),'The mixture has to contain at least one element.');
assert(Nr>0,'The init mixture has to contain at least one component.');
assert(nSteps>=0,'The number of iterations has to be non-negative.');
assert(nSamples>0,'The number of samples has to be greater than zero.');

samples = GMSamples(gmh,nSamples);

[centroids,Rnk] = sampleKMeans(samples,Nr,nSteps);

if size(centroids,2) < Nr
    disp('The number of centroids is lower than the desired number of reduced mixture components.');
    Nr = size(centroids,2);
end

gm_init(Nr,1) = struct('w',[],'mu',[],'Sigma',[]);

for i=1:Nr
    gm_init(i).w = sum(Rnk(:,i))/nSamples;
    gm_init(i).mu = centroids(:,i);
    gm_init(i).Sigma = eye(size(gmh(1).mu,1));
end
    

end

