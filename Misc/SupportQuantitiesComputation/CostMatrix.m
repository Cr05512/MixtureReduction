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
% functions provided by getAvailableLocalMeasures()

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
availableMeasVec = getAvailableLocalMeasures(); %Vector of available dissimilarity measures
assert(any(strcmpi(availableMeasVec,costMeas)), strcat(['Unknown cost measure. The available measures are:',' ',strjoin(availableMeasVec,', '),'.']));
assert(numel(gmh)>0 && numel(gmr)>0,'The mixtures have to contain at least one element.');
assert(lambda>=0,'The lambda parameter has to be non-negative.');
assert(I>0,'The number of samples has to be greater than zero.');


Nh = numel(gmh);
Nr = numel(gmr);

C = zeros(Nh,Nr);


for i=1:Nh
    for j=1:Nr
        if strcmpi(costMeas,'MKLD')
            C(i,j) = feval(costMeas,gmh(i),gmr(j),lambda,I);
        elseif strcmpi(costMeas,'GJSD')
            C(i,j) = feval(costMeas,gmh(i),gmr(j),alphaGJSD);
        else
            C(i,j) = feval(costMeas,gmh(i),gmr(j));
        end
    end
end

end

