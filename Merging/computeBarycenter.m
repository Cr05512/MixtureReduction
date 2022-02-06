function bar = computeBarycenter(gmh,costMeas,varargin)
% varargin is thought to be a struct containing the additional fields
% required for some local measures


availableMeasVec = Experiment.getAvailableLocalMeasures(); %Vector of available dissimilarity measures
assert(any(strcmpi(availableMeasVec,costMeas)), strcat(['Unknown cost measure. The available measures are:',' ',strjoin(availableMeasVec,', '),'.']));


barName = strcat(costMeas(1:end-2),'Barycenter');
availableMergeVec = Experiment.getAvailableMerging(); %Vector of available dissimilarity measures
if ~any(strcmpi(availableMergeVec,barName))
    disp('The chosen measure is not associated with any of the existing merging algorithms. Falling back to FKLD.');
    barName = 'FKLDBarycenter';
end


barInputList = getFunArgNames(barName);
barInputList(1) = [];

if nargin>2
    params = varargin{:};
    varargin = {};
    
    for i=1:length(barInputList)
        if isfield(params,barInputList{i})
            varargin{i} = params.(barInputList{i});
            params = rmfield(params,barInputList{i});
        end
    end

    if ~isempty(fieldnames(params))
        disp('The provided parameters for the cost measure may be too many.');
    end

end

bar = feval(barName,gmh,varargin{:});


end

