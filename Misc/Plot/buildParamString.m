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

    for i=1:numel(globalMeas)
        if isstruct(globalMeas{i})
            assert(any(strcmpi(Experiment.getAvailableGlobalMeasures,globalMeas{i}.globMeas)),'Wrong global measure. Check the available ones by typing Experiment.getAvailableGlobalMeasures.');
            if strcmpi(globalMeas{i}.globMeas,'CTD')
                performanceStr = strcat(performanceStr,strcat([' ',globalMeas{i}.globMeas,globalMeas{i}.costMeas,':',' ',num2str(feval(globalMeas{i}.globMeas,gmh,gmr,globalMeas{i}.costMeas)),',']));
            elseif any(strcmpi(globalMeas{i}.globMeas,{'MCKLD','ISMCKLD'}))
                performanceStr = strcat(performanceStr,strcat([' ',globalMeas{i}.globMeas,':',' ',num2str(feval(globalMeas{i}.globMeas,gmh,gmr,globalMeas{i}.nSamples)),',']));
            elseif any(strcmpi(globalMeas{i}.globMeas,{'UTKLD','ISUTKLD'}))
                performanceStr = strcat(performanceStr,strcat([' ',globalMeas{i}.globMeas,':',' ',num2str(feval(globalMeas{i}.globMeas,gmh,gmr,globalMeas{i}.nRings)),',']));
            else
                performanceStr = strcat(performanceStr,strcat([' ',globalMeas{i}.globMeas,':',' ',num2str(feval(globalMeas{i}.globMeas,gmh,gmr)),',']));
            end
        end
    end
end

performanceStr = strcat(performanceStr(2:end),strcat(' Time:',' ',num2str(time),'s.'));
str = [str,performanceStr];


end

