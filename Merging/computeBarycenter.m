function bar = computeBarycenter(gmh,costMeas,varargin)
% varargin is thought to be a struct containing the additional fields
% required for some local measures


availableMeasVec = Experiment.getAvailableLocalMeasures(); %Vector of available dissimilarity measures
assert(any(strcmpi(availableMeasVec,costMeas)), strcat(['Unknown cost measure. The available measures are:',' ',strjoin(availableMeasVec,', '),'.']));

switch costMeas
    case 'W2ij'
        bar = W2Barycenter(gmh,varargin{:});
    case 'L2ij'
        bar = L2Barycenter(gmh);
    case 'NL2ij'
        bar = NL2Barycenter(gmh);
    case 'CSDij'
        bar = CSDBarycenter(gmh,varargin{:});
    case 'TSLij'
        bar = TSLBarycenter(gmh);
    case 'BDij'
        bar = BDBarycenter(gmh,varargin{:});
    case 'RKLDij'
        bar = RKLDBarycenter(gmh);
    case 'H2ij'
        bar = H2Barycenter(gmh,varargin{:});
    case 'alpha1Dij'
        bar = Da1Barycenter(gmh,varargin{:});
    case 'alpha2Dij'
        bar = Da2Barycenter(gmh,varargin{:});
    case 'alphaJDij'
        bar = alphaJDBarycenter(gmh,varargin{:});
    case 'SKLDij'
        bar = SKLDBarycenter(gmh,varargin{:});
    case 'FKLDij'
        bar = FKLDBarycenter(gmh);
    otherwise
        disp('Assuming FKLDij as D-measure.')
        bar = FKLDBarycenter(gmh);
end

end

