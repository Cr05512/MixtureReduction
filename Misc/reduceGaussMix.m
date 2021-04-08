function [gmr,algoParamsBlock] = reduceGaussMix(algo,gmr,algoParams)

if nargin < 3
    disp('Assuming default parameters for the greedy reduction.');
    algoParams = {};
end

availableGreedyAlgorithms = Experiment.getAvailableAlgorithms(); %Check the corresponding documentation for further details
res = strcmpi(algo,availableGreedyAlgorithms);
assert(any(res), strcat(['Unknown greedy algorithm. The available algorithms are:',' ',strjoin(availableGreedyAlgorithms,', '),'.']));

algoParamsBlock = struct();
algoParamsBlock.('Nr') = 5;
if ismember(lower(algo),{'west','cowa'})
    algoParamsBlock.('costMeas') = 'L2ij';
    algoParamsBlock.('algo') = 0;
    algoParamsBlock.('gamma') = Inf;
elseif strcmpi(algo,'gmrc')
    algoParamsBlock.('initMethod') = 'Runnalls';
    algoParamsBlock.('NKmeansSteps') = 1;
    algoParamsBlock.('NOptSteps') = 100;
    algoParamsBlock.('accThresh') = 1e-09;
elseif strcmpi(algo,'gmrcwas')
    algoParamsBlock.('NKMeansSteps') = 100;
elseif strcmpi(algo,'bf')
    algoParamsBlock.('seq') = 1;
end

if isstruct(algoParams)
    userAlgoFields = fieldnames(algoParams);
    for i=1:length(userAlgoFields)
        if isfield(algoParamsBlock,userAlgoFields{i})
            algoParamsBlock.(userAlgoFields{i}) = algoParams.(userAlgoFields{i}); 
        else
            disp('The provided param is not a known param.');
        end
    end
end

algoArgVector = struct2cell(algoParamsBlock);
gmr = feval(availableGreedyAlgorithms{res},gmr,algoArgVector{:});
    
end

