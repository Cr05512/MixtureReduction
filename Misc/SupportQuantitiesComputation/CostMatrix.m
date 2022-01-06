function C = CostMatrix(gmh,gmr,costMeas,varargin)
% C = CostMatrix(gmh,gmr,costMeas,varargin):
% INPUTS:
% - gmh, gmr, two Gaussian mixtures,
% - costMeas, desired cost function (char array),
% - varargin, additional parameters needed by some measures (can be empty) (struct).
% OUTPUTS:
% - C, the cost matrix (Nh x Nr matrix).
% This function computes the cost matrix based on the following cost
% functions provided by getAvailableLocalMeasures()

availableMeasVec = Experiment.getAvailableLocalMeasures(); %Vector of available dissimilarity measures
assert(any(strcmpi(availableMeasVec,costMeas)), strcat(['Unknown cost measure. The available measures are:',' ',strjoin(availableMeasVec,', '),'.']));
assert(numel(gmh)>0 && numel(gmr)>0,'The mixtures have to contain at least one element.');


Nh = numel(gmh);
Nr = numel(gmr);

C = zeros(Nh,Nr);

measInputList = getFunArgNames(costMeas);
measInputList(1:2) = [];

if nargin>3
    params = varargin{:};
    varargin = {};
    
    for i=1:length(measInputList)
        if isfield(params,measInputList{i})
            varargin{i} = params.(measInputList{i});
            params = rmfield(params,measInputList{i});
        end
    end

    if ~isempty(fieldnames(params))
        disp('The provided parameters for the cost measure may be too many.');
    end

end


for i=1:Nh
    for j=1:Nr
        C(i,j) = feval(costMeas,gmh(i),gmr(j),varargin{:});
    end
end

end

