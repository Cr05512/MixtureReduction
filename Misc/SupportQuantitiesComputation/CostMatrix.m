function C = CostMatrix(gmh,gmr,costMeas,varargin)
% C = CostMatrix(gmh,gmr,costMeas,I,alphaGJSD):
% INPUTS:
% - gmh, gmr, two Gaussian mixtures,
% - costMeas, desired cost function (char array),
% - varargin, additional parameters needed by some measures (can be empty).
% OUTPUTS:
% - C, the cost matrix (Nh x Nr matrix).
% This function computes the cost matrix based on the following cost
% functions provided by getAvailableLocalMeasures()

availableMeasVec = getAvailableLocalMeasures(); %Vector of available dissimilarity measures
assert(any(strcmpi(availableMeasVec,costMeas)), strcat(['Unknown cost measure. The available measures are:',' ',strjoin(availableMeasVec,', '),'.']));
assert(numel(gmh)>0 && numel(gmr)>0,'The mixtures have to contain at least one element.');


Nh = numel(gmh);
Nr = numel(gmr);

C = zeros(Nh,Nr);


for i=1:Nh
    for j=1:Nr
        C(i,j) = feval(costMeas,gmh(i),gmr(j),varargin{:});
    end
end

end

