function [gmr,pruneParamsBlock] = pruneGaussMix(prune,gmr,pruneParams)

if nargin < 3
    disp('Assuming default parameters for the pruning.');
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
        assert(any(res), strcat(['Unknown pruning method. The available pruning methods are:',' ',strjoin(availablePruningAlgorithms,', '),'.']));
        
        if strcmpi(prunings(i),'adaptivePruning')
            pruneParamsBlock{i}.('rho') = 0.9544;
        elseif strcmpi(prunings(i),'standardPruning')
            pruneParamsBlock{i}.('threshold') = 0.05;
        elseif strcmpi(prunings(i),'kSmallestPruning')
            pruneParamsBlock{i}.('k') = 1;
        else
            pruneParamsBlock{i} = struct();
        end

        if ~isempty(pruneParams)
            if isstruct(pruneParams{i})
                userPruneFields = fieldnames(pruneParams{i});
                for j=1:length(userPruneFields)
                    if isfield(pruneParamsBlock{i},userPruneFields{j})
                        pruneParamsBlock{i}.(userPruneFields{j}) = pruneParams{i}.(userPruneFields{j});
                    end
                end
            end
        end
        
        pruneArgVector = struct2cell(pruneParamsBlock{i});
        gmr = feval(availablePruningAlgorithms{res},gmr,pruneArgVector{:});

    end

end

    
end

