function refAlgos = getAvailableRefinements()
    tmp = split({dir(strcat(what('Refinement').path,'/*.m')).name}','.m');
    refAlgos = tmp(:,1);
end