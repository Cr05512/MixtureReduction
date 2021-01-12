function str = buildParamString(exp,gmh,gmr,time,costMeas)
% str = buildParamString(exp,gmh,gmr,time,costMeas):
% INPUT:
% - exp, the current experiment,
% - gmh, gmr, two Gaussian Mixtures result of the experiment,
% - time, execution time of the experiment,
% - costMeas, cost measure used in the CTD computation.
% OUTPUT:
% - str, multiline string containing all the parameters relative to the
% experiment.
% This function builds a string containing all the parameters used in the
% experiment together with the NISE, CTD and exec time. 

str = {};

test = exp.getTest;
strTest = '\textbf{Test}$\rightarrow$';
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
strAlgo = '\textbf{Algorithm}$\rightarrow$';
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


strRef = '\textbf{Refinement}$\rightarrow$';
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


strPrune = '\textbf{Pruning}$\rightarrow$'; 
prune = exp.getPrune;
if ~isempty(prune)
    strPrune = strcat([strPrune,'\textbf{',prune,'}',':']);
    pruneParams = exp.getPruneParams;
    if ~isempty(pruneParams)
        fieldNames = fieldnames(pruneParams);
        numFields = numel(fieldNames);
        for m=1:numFields
            strPrune = strcat([strPrune,' ',fieldNames{m},'=',num2str(pruneParams.(fieldNames{m})),',']);
        end

    else
        strPrune = strcat([strPrune,'\textbf{None},']);
    end
else
    strPrune = strcat([strPrune,'\textbf{None},']);
end
str = [str,strPrune];

str = [str,strcat('\textbf{NISE}:',' ',num2str(nISE(gmh,gmr)),', \textbf{CTD',costMeas,'}:',' ',num2str(CTD(gmh,gmr,costMeas)),', \textbf{Time}:',' ',num2str(time),'s')];



end

