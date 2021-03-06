function varargout = pruning(prune,gmh,varargin)
    availablePruningAlgorithms = Experiment.getAvailablePrunings();
    res = strcmpi(prune,availablePruningAlgorithms);
    assert(any(res), strcat(['Unknown pruning method. The available pruning methods are:',' ',strjoin(availablePruningAlgorithms,', '),'.']));
    varargout = cell(1,nargout(prune));
    [varargout{:}] = feval(availablePruningAlgorithms{res},gmh,varargin{:});
end

