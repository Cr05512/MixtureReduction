function [gmr,pruneParamsBlock] = pruneGaussMix(prune,gmh,pruneParams)

if nargin < 3
    disp('Assuming default parameters for pruning.');
    pruneParams = {};
end

if ~iscell(pruneParams)
    pruneParams = {pruneParams};
end

pruneParamsBlock = {};
if ~isempty(prune)
    availablePruningAlgorithms = Experiment.getAvailablePrunings();
    prunings = split(prune,'+');
    for i=1:numel(prunings)
        res = strcmpi(prunings{i},availablePruningAlgorithms);
        assert(any(res), strcat(['Unknown refinement method. The available refinement methods are:',' ',strjoin(availablePruningAlgorithms,', '),'.']));
        
        pruneInputList = getFunArgNames(prunings{i});
        
        pruneInputList(strcmpi(pruneInputList,'gmh')) = [];
        pruneParamsBlock{i} = cell2struct(cell(length(pruneInputList),1),pruneInputList);
        
        

        if ~isempty(pruneParams)
            if isstruct(pruneParams{i})
                userPruneFields = fieldnames(pruneParams{i});
                for j=1:length(userPruneFields)
                    if any(strcmpi(pruneInputList,userPruneFields{j}))
                        pruneParamsBlock{i}.(userPruneFields{j}) = pruneParams{i}.(userPruneFields{j});
                    end
                end
            end
        end
        
        pruneParamsBlock = defaultPruneFieldsFill(pruneParamsBlock);

        
        pruneArgs = struct2cell(pruneParamsBlock{i});
        gmr = feval(availablePruningAlgorithms{res},gmh,pruneArgs{:});
    end

end
    


end
