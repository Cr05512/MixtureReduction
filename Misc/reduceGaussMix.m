function [gmr,algoParamsBlock] = reduceGaussMix(algo,gmr,algoParams)

if nargin < 3
    disp('Assuming default parameters for the greedy reduction.');
    algoParams = {};
end

availableGreedyAlgorithms = Experiment.getAvailableAlgorithms(); %Check the corresponding documentation for further details
res = strcmpi(algo,availableGreedyAlgorithms);
assert(any(res), strcat(['Unknown greedy algorithm. The available algorithms are:',' ',strjoin(availableGreedyAlgorithms,', '),'.']));

algoInputList = getFunArgNames(algo);
algoInputList(strcmpi(algoInputList,'gmh')) = [];
algoParamsBlock = cell2struct(cell(length(algoInputList),1),algoInputList);


if isstruct(algoParams)
    userAlgoFields = fieldnames(algoParams);
    for i=1:length(userAlgoFields)
        if any(strcmpi(algoInputList,userAlgoFields{i}))
            algoParamsBlock.(userAlgoFields{i}) = algoParams.(userAlgoFields{i}); 
        else
            disp('The provided param is not a known param.');
        end
    end
end

algoParamsBlock = defaultAlgoFieldsFill(algoParamsBlock);


algoArgVector = struct2cell(algoParamsBlock);
gmr = feval(availableGreedyAlgorithms{res},gmr,algoArgVector{:});
    
end

