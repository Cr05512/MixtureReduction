function gmr = pruning(prune,gmr,pruneArgs)

if nargin < 4
    pruneArgs = {};
end
    availablePruningAlgorithms = Experiment.getAvailablePrunings();
    if ~isempty(prune)
        prunings = split(prune,'+');

        for k=1:numel(prunings)
            res = strcmpi(prunings{k},availablePruningAlgorithms);
            assert(any(res), strcat(['Unknown pruning method. The available pruning methods are:',' ',strjoin(availablePruningAlgorithms,', '),'.']));
            pruneArgVector = {};
            if isstruct(pruneArgs)
                pruneArgVector = struct2cell(pruneArgs);
            elseif iscell(pruneArgs)
                if any(size(pruneArgs))
                    pruneArgVector = struct2cell(pruneArgs{k});
                end
            end
            gmr = feval(availablePruningAlgorithms{res},gmr,pruneArgVector{:});
        end
    end

    
end

