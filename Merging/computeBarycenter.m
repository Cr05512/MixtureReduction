function bar = computeBarycenter(gmh,costMeas)


availableMeasVec = Experiment.getAvailableLocalMeasures(); %Vector of available dissimilarity measures
assert(any(strcmpi(availableMeasVec,costMeas)), strcat(['Unknown cost measure. The available measures are:',' ',strjoin(availableMeasVec,', '),'.']));

switch costMeas
    case 'W2ij'
        bar = W2Barycenter(gmh,100);
    case 'L2ij'
        bar = ISEBarycenter(gmh);
    case 'NL2ij'
        bar = NISEBarycenter(gmh);
    case 'CSDij'
        bar = CSDBarycenter(gmh);
    case 'bhattDij'
        bar = BhattDBarycenter(gmh);
    otherwise
        bar = KLDBarycenter(gmh);
end

end

