function [gmr,refParamsBlock] = refineGaussMix(ref,gmr,gmh,refParams)


if nargin < 4
    disp('Assuming default parameters for the refinement.');
    refParams = {};
end

if ~iscell(refParams)
    refParams = {refParams};
end

refParamsBlock = {};
if ~isempty(ref)
    availableRefAlgorithms = Experiment.getAvailableRefinements();
    refs = split(ref,'+');
    for i=1:numel(refs)
        res = strcmpi(refs{i},availableRefAlgorithms);
        assert(any(res), strcat(['Unknown refinement method. The available refinement methods are:',' ',strjoin(availableRefAlgorithms,', '),'.']));
        
        refInputList = getFunArgNames(refs{i});
        
        refInputList(strcmpi(refInputList,'gmh')) = [];
        refInputList(strcmpi(refInputList,'gmr')) = [];
        refParamsBlock{i} = cell2struct(cell(length(refInputList),1),refInputList);
        
        

        if ~isempty(refParams)
            if isstruct(refParams{i})
                userRefFields = fieldnames(refParams{i});
                for j=1:length(userRefFields)
                    if any(strcmpi(refInputList,userRefFields{j}))
                        refParamsBlock{i}.(userRefFields{j}) = refParams{i}.(userRefFields{j});
                    end
                end
            end
        end
        
        refParamsBlock = defaultRefFieldsFill(refParamsBlock);

        
        refArgs = struct2cell(refParamsBlock{i});
        gmr = feval(availableRefAlgorithms{res},gmr,gmh,refArgs{:});
    end

end
    


end
