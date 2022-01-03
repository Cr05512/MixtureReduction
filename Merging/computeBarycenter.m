function bar = computeBarycenter(gmh,costMeas,alpha)

if nargin < 3
    alpha = 0.5;
end


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
    case 'TSLij'
        bar = TSLBarycenter(gmh);
    case 'BDij'
        bar = BDBarycenter(gmh);
    case 'RKLDij'
        bar = RKLDBarycenter(gmh);
    case 'H2ij'
        bar = H2Barycenter(gmh);
    case 'alpha1Dij'
        bar = DaBarycenter(gmh,alpha);
    otherwise
        bar = KLDBarycenter(gmh);
end

end

