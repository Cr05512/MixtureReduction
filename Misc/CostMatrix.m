function C = CostMatrix(gmh,gmr,costMeas,lambda,I,alphaGJSD)
% C = CostMatrix(gmh,gmr,costMeas,lambda,I,alphaGJSD):
% INPUTS:
% - gmh, gmr, two Gaussian mixtures,
% - costMeas, desired cost function (char array),
% - lambda, regularization parameter (only needed by the MKLD measure) (scalar),
% - I, number of virtual samples (only needed by the MKLD measure) (scalar),
% - alphaGJSD, alpha used in the generalized Jensen-Shannon divergence (scalar).
% OUTPUTS:
% C, the cost matrix (Nh x Nr matrix).
% This function computes the cost matrix based on the following cost
% functions:
% - Kullback-Leibler divergence (KLD),
% - Squared 2-Wasserstein (W2),
% - Generalized Jensen-Shannon divergence (GJSD),
% - Modified KLD (MKLD),
% - L2 distance (L2),
% - Normalized L2 distance (normL2),
% - Correlation measure (CM),
% - Symmetrized KLD (symKLD),
% - Squared root JSD (SRJSD).


if nargin < 4
    lambda = 0.1;
    I = 10*numel(gmh);
    alphaGJSD = 0.5;
elseif nargin < 5
    I = 10*numel(gmh);
    alphaGJSD = 0.5;
elseif nargin < 6
    alphaGJSD = 0.5;
end
availableMeasVec = {'KLD','W2','GJSD','MKLD','L2','normL2','CM','symKLD','SRJSD'}; %Vector of available dissimilarity measures
assert(any(strcmpi(availableMeasVec,costMeas)), strcat(['Unknown cost measure. The available measures are:',' ',strjoin(availableMeasVec,', '),'.']));
assert(numel(gmh)>0 && numel(gmr)>0,'The mixtures have to contain at least one element.');
assert(lambda>=0,'The lambda parameter has to be non-negative.');
assert(I>0,'The number of samples has to be greater than zero.');


Nh = numel(gmh);
Nr = numel(gmr);

C = zeros(Nh,Nr);


for i=1:Nh
    for j=1:Nr
        if strcmpi(costMeas,'KLD')
            C(i,j) = KLD(gmh(i),gmr(j));
        elseif strcmpi(costMeas,'W2')
            C(i,j) = Wasserstein2Dist(gmh(i),gmr(j));
        elseif strcmpi(costMeas,'GJSD')
            C(i,j) = GJSD(gmh(i),gmr(j),alphaGJSD);
        elseif strcmpi(costMeas,'MKLD')
            C(i,j) = MKLD(gmr.getWeights(j),gmh(i),gmr(j),lambda,I);
        elseif strcmpi(costMeas,'L2')
            C(i,j) = L2Gauss(gmh(i),gmr(j));
        elseif strcmpi(costMeas,'normL2')
            C(i,j) = normL2Gauss(gmh(i),gmr(j));
        elseif strcmpi(costMeas,'CM')
            C(i,j) = CorrMeasureGauss(gmh(i),gmr(j));
        elseif strcmpi(costMeas,'symKLD')
            C(i,j) = symKLD(gmh(i),gmr(j));
        elseif strcmpi(costMeas,'SRJSD')
            C(i,j) = SRJSD(gmh(i),gmr(j));
        end
    end
end

end

