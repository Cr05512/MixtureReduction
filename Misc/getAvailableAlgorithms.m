function greedyAlgos = getAvailableAlgorithms()
    tmp = split({dir(strcat(what('GreedyReduction').path,'/*.m')).name}','.m');
    greedyAlgos = tmp(:,1);
end

