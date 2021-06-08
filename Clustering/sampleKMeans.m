function [centroids,Rnk] = sampleKMeans(samples,K,nSteps)
% [centroids,Rnk] = sampleKMeans(samples,K):
% INPUTS:
% - samples, data points (stateDim x numSamples),
% - K, desired number of centroids (scalar),
% - nSteps, maximum number of iterations (scalar).
% OUTPUTS:
% - centroids, data centroids (stateDim x K),
% - Rnk, association/membership matrix (numSamples x K binary matrix).
% This function implements the standard batch KMeans algorithm over samples.

if nargin < 3
    nSteps = 100;
end

assert(~isempty(samples),'The number of samples has to be greater than zero.');
assert(K>0,'The number of centroids has to be greater than zero.');
assert(nSteps>=0,'The number of iterations has to be non-negative.');


d = size(samples,1);
N = size(samples,2);
Rnk = zeros(N,K);
distMatrix = Rnk;
centroids = randn(d,K);
J = Inf;
JPrev = J;

for k=1:nSteps
    
    for i=1:N
        for j=1:K
            distMatrix(i,j) = norm(samples(:,i)-centroids(:,j))^2;
        end
    end
    
    [~,assignVector] = min(distMatrix,[],2);
    
    for i=1:N
        Rnk(i,assignVector(i)) = 1;
    end
    
    J = trace(Rnk'*distMatrix);
    
    if abs(J-JPrev)<1e-12
        break;
    end
    
    centroids = computeDataClusterCenters(samples,Rnk);
    if size(centroids,2)<K
        K = size(centroids,2);
        Rnk = zeros(N,K);
        distMatrix = Rnk;
    end
    
    JPrev = J;
    if k<nSteps
        Rnk = zeros(size(distMatrix)); %Reset of the associations
    end
    
end


end
