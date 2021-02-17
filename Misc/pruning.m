function varargout = pruning(prune,gmh,varargin)
    availablePruningAlgorithms = Experiment.getAvailablePrunings();
    assert(ismember(lower(prune),lower(availablePruningAlgorithms)), strcat(['Unknown pruning method. The available pruning methods are:',' ',strjoin(availablePruningAlgorithms,', '),'.']));
    varargout = cell(1,nargout(prune));
    [varargout{:}] = feval(prune,gmh,varargin{:});
end

