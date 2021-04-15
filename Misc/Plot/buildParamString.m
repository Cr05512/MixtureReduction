function str = buildParamString(exp,gmh,gmr,time,globalMeas)
% str = buildParamString(exp,gmh,gmr,time,costMeas):
% INPUT:
% - exp, the current experiment,
% - gmh, gmr, two Gaussian Mixtures result of the experiment,
% - time, execution time of the experiment,
% - globalMeas, string cell array containing the global measures to use in
%   the evaluation of the results.
% OUTPUT:
% - str, multiline string containing all the parameters relative to the
% experiment.
% This function builds a string containing all the parameters used in the
% experiment together with the NISE, CTD and exec time. 

str = {};

test = exp.getTest;
strTest = 'Test$\rightarrow$';
if ~isempty(test)
    strTest = strcat([strTest,'\textbf{',test,'}',':']);
    testParams = exp.getTestParams;
    if ~isempty(testParams)
        fieldNames = fieldnames(testParams);
        numFields = numel(fieldNames);

        for m=1:numFields
            strTest = strcat([strTest,' ',fieldNames{m},'=',num2str(testParams.(fieldNames{m})),',']);
        end
    end
else
    strTest = strcat([strTest,'\textbf{None},']);
end

str = [str,strTest];

algo = exp.getAlgo;
strAlgo = 'Algorithm$\rightarrow$';
if ~isempty(algo)
    strAlgo = strcat([strAlgo,'\textbf{',algo,'}',':']);
    algoParams = exp.getAlgoParams;
    if ~isempty(algoParams)
        fieldNames = fieldnames(algoParams);
        numFields = numel(fieldNames);
        for m=1:numFields
            strAlgo = strcat([strAlgo,' ',fieldNames{m},'=',num2str(algoParams.(fieldNames{m})),',']);
        end

    end
else
    strAlgo = strcat([strAlgo,'\textbf{None},']);
end
str = [str,strAlgo];


strRef = 'Refinement$\rightarrow$';
if ~isempty(exp.getRef)
    refs = split(exp.getRef,'+');
else
    refs = [];
end

if ~isempty(refs)
    refParams = exp.getRefParams;

    for k=1:numel(refParams)
        strRef = strcat([strRef,' \textbf{',refs{k},'}:']);
        if ~isempty(fieldnames(refParams{k}))
            fieldNames = fieldnames(refParams{k});
            numFields = numel(fieldNames);
            for m=1:numFields
                strRef = strcat([strRef,' ',fieldNames{m},'=',num2str(refParams{k}.(fieldNames{m})),',']);
            end

        else
            strRef = strcat([strRef,' None,']);
        end
    end
else
    strRef = strcat([strRef,'\textbf{None},']);
end
str = [str,strRef];


strPrune = 'Pruning$\rightarrow$';
if ~isempty(exp.getPrune)
    prunings = split(exp.getPrune,'+');
else
    prunings = [];
end
prune = exp.getPrune;
if ~isempty(prune)
    pruneParams = exp.getPruneParams;

    for k=1:numel(pruneParams)
        strPrune = strcat([strPrune,' \textbf{',prunings{k},'}:']);
        if ~isempty(fieldnames(pruneParams{k}))
            fieldNames = fieldnames(pruneParams{k});
            numFields = numel(fieldNames);
            for m=1:numFields
                strPrune = strcat([strPrune,' ',fieldNames{m},'=',num2str(pruneParams{k}.(fieldNames{m})),',']);
            end

        else
            strPrune = strcat([strPrune,' None,']);
        end
    end
else
    strPrune = strcat([strPrune,'\textbf{None},']);
end
str = [str,strPrune];


performanceStr = '';
if ~isempty(globalMeas)
    availableGlobMeas = Experiment.getAvailableGlobalMeasures();

    for i=1:numel(globalMeas)
        if isstruct(globalMeas{i})
            res = strcmpi(globalMeas{i}.globMeas,availableGlobMeas);
            meas = Experiment.getAvailableGlobalMeasures{res};
            assert(any(strcmpi(availableGlobMeas,meas)),'Wrong global measure. Check the available ones by typing Experiment.getAvailableGlobalMeasures.');
            if strcmpi(meas,'CTD')
                performanceStr = strcat(performanceStr,strcat([' ',meas,globalMeas{i}.costMeas,':',' ',num2str(feval(meas,gmh,gmr,globalMeas{i}.costMeas),'%3.6f'),',']));
            elseif any(strcmpi(meas,{'MCKLD','ISMCKLD'}))
                performanceStr = strcat(performanceStr,strcat([' ',meas,':',' ',num2str(feval(meas,gmh,gmr,globalMeas{i}.nSamples),'%3.6f'),',']));
            elseif any(strcmpi(meas,{'UTKLD','ISUTKLD'}))
                performanceStr = strcat(performanceStr,strcat([' ',meas,':',' ',num2str(feval(meas,gmh,gmr,globalMeas{i}.nRings),'%3.6f'),',']));
            elseif strcmpi(meas,'KLD12')
                performanceStr = strcat(performanceStr,strcat([' ',meas,':',' ',num2str(feval(meas,gmh,gmr,globalMeas{i}.nPoints),'%3.6f'),',']));
            else
                performanceStr = strcat(performanceStr,strcat([' ',meas,':',' ',num2str(feval(meas,gmh,gmr),'%3.6f'),',']));
            end
        end
    end
end

performanceStr = strcat(performanceStr(2:end),strcat(' Time:',' ',num2str(time,'%3.6f'),'s.'));
str = [str,performanceStr];


end

