function varargout = reduce(algo,gmh,varargin)
availableGreedyAlgorithms = Experiment.getAvailableAlgorithms(); %Check the corresponding documentation for further details
res = strcmpi(algo,availableGreedyAlgorithms);
assert(any(res), strcat(['Unknown greedy algorithm. The available algorithms are:',' ',strjoin(availableGreedyAlgorithms,', '),'.']));
varargout = cell(1,nargout(algo));
[varargout{:}] = feval(availableGreedyAlgorithms{res},gmh,varargin{:});
end

