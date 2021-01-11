function pruningAlgos = getAvailablePrunings()
    tmp = split({dir(strcat(what('Pruning').path,'/*.m')).name}','.m');
    pruningAlgos = tmp(:,1);
end

