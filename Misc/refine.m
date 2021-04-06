function gmr = refine(ref,gmr,gmh,refArgs)

if nargin < 4
    refArgs = {};
end
    availableRefAlgorithms = Experiment.getAvailableRefinements();
    if ~isempty(ref)
        refinements = split(ref,'+');

        for k=1:numel(refinements)
            res = strcmpi(refinements{k},availableRefAlgorithms);
            assert(any(res), strcat(['Unknown refinement method. The available refinement methods are:',' ',strjoin(availableRefAlgorithms,', '),'.']));
            refArgVector = {};
            if isstruct(refArgs)
                refArgVector = struct2cell(refArgs);
            elseif iscell(refArgs)
                if any(size(refArgs))
                    refArgVector = struct2cell(refArgs{k});
                end
            end
            gmr = feval(availableRefAlgorithms{res},gmr,gmh,refArgVector{:});
        end
    end

end
