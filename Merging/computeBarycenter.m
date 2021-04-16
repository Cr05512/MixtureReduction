function bar = computeBarycenter(gmh,costMeas)


availableMeasVec = Experiment.getAvailableLocalMeasures(); %Vector of available dissimilarity measures
assert(any(strcmpi(availableMeasVec,costMeas)), strcat(['Unknown cost measure. The available measures are:',' ',strjoin(availableMeasVec,', '),'.']));

if strcmpi(costMeas,'W2ij')
    bar = W2Barycenter(gmh,100);
elseif strcmpi(costMeas,'L2ij')
    bar = ISEBSGA(gmh);
% elseif strcmpi(costMeas,'NL2ij') % To do
%     bar = NISEBarycenter(gmh);
elseif strcmpi(costMeas,'CSDij')
    bar = CSDBarycenter(gmh);
elseif strcmpi(costMeas,'bhattDij')
    bar = BhattDBarycenter(gmh);
else
    bar = KLDBarycenter(gmh);
end

end

