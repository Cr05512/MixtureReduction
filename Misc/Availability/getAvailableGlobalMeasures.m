function globMeas = getAvailableGlobalMeasures()
    tmp = split({dir(strcat(what('GlobalMeasures').path,'/*.m')).name}','.m');
    globMeas = tmp(:,1);
end