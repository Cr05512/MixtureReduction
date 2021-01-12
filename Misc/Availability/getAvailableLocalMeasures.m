function locMeas = getAvailableLocalMeasures()
    tmp = split({dir(strcat(what('LocalMeasures').path,'/*.m')).name}','.m');
    locMeas = tmp(:,1);
end