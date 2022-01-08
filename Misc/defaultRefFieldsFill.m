function refParamsBlock = defaultRefFieldsFill(refParamsBlock)

n = length(refParamsBlock);
if n==0
    return
end

for i=1:n
    
    fieldList = fieldnames(refParamsBlock{i});
    
    for j=1:length(fieldList)
        param = refParamsBlock{i}.(fieldList{j});
        if isempty(param)
            if ~strcmpi(fieldList{j},'varargin')
            
                if strcmpi(fieldList{j},'costMeas')
                    refParamsBlock{i}.(fieldList{j}) = 'KLDij';
                elseif strcmpi(fieldList{j},'maxiter')
                    refParamsBlock{i}.(fieldList{j}) = 100;
                elseif strcmpi(fieldList{j},'I')
                    refParamsBlock{i}.(fieldList{j}) = 10;
                elseif strcmpi(fieldList{j},'tol')
                    refParamsBlock{i}.(fieldList{j}) = 1e-6;
                elseif strcmpi(fieldList{j},'lambda')
                    refParamsBlock{i}.(fieldList{j}) = 0;
                end


                p = refParamsBlock{i}.(fieldList{j});
                if ~ischar(p)
                    p = num2str(p);
                end
                disp(strcat(['Filled in:',' ',p,' ','in',' ',fieldList{j}]));
            else
                refParamsBlock{i} = rmfield(refParamsBlock{i},'varargin');
            end
        end
    end
            
    
end



end

