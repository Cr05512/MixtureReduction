function pruneParamsBlock = defaultPruneFieldsFill(pruneParamsBlock)

n = length(pruneParamsBlock);
if n==0
    return
end

for i=1:n
    
    fieldList = fieldnames(pruneParamsBlock{i});
    
    for j=1:length(fieldList)
        param = pruneParamsBlock{i}.(fieldList{j});
        if isempty(param)
            if ~strcmpi(fieldList{j},'varargin')
            
                if strcmpi(fieldList{j},'rho')
                    pruneParamsBlock{i}.(fieldList{j}) = 0.9544;
                elseif strcmpi(fieldList{j},'k')
                    pruneParamsBlock{i}.(fieldList{j}) = 1;
                elseif strcmpi(fieldList{j},'gamma')
                    pruneParamsBlock{i}.(fieldList{j}) = 0.05;
                end


                p = pruneParamsBlock{i}.(fieldList{j});
                if ~ischar(p)
                    p = num2str(p);
                end
                disp(strcat(['Filled in:',' ',p,' ','in',' ',fieldList{j}]));
            else
                pruneParamsBlock{i} = rmfield(pruneParamsBlock{i},'varargin');
            end
        end
    end
            
    
end



end

