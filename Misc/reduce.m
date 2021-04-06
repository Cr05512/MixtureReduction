function gmr = reduce(algo,gmr,algoParams)

    availableGreedyAlgorithms = Experiment.getAvailableAlgorithms(); %Check the corresponding documentation for further details
    res = strcmpi(algo,availableGreedyAlgorithms);
    assert(any(res), strcat(['Unknown greedy algorithm. The available algorithms are:',' ',strjoin(availableGreedyAlgorithms,', '),'.']));
    algoArgVector = struct2cell(algoParams);
    gmr = feval(availableGreedyAlgorithms{res},gmr,algoArgVector{:});
    
end

