function varargout = reduce(algo,gmh,varargin)
availableGreedyAlgorithms = Experiment.getAvailableAlgorithms(); %Check the corresponding documentation for further details
assert(ismember(lower(algo),lower(availableGreedyAlgorithms)), strcat(['Unknown greedy algorithm. The available algorithms are:',' ',strjoin(availableGreedyAlgorithms,', '),'.']));
varargout = cell(1,nargout(algo));
[varargout{:}] = feval(algo,gmh,varargin{:});
end

