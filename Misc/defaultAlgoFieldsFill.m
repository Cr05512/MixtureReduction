function algoParamsBlock = defaultAlgoFieldsFill(algoParamsBlock)



fieldList = fieldnames(algoParamsBlock);

for j=1:length(fieldList)
    param = algoParamsBlock.(fieldList{j});
    if isempty(param)
        if ~strcmpi(fieldList{j},'varargin')

            if strcmpi(fieldList{j},'costMeas')
                algoParamsBlock.(fieldList{j}) = 'KLDij';
            elseif strcmpi(fieldList{j},'maxiter')
                algoParamsBlock.(fieldList{j}) = 100;
            elseif strcmpi(fieldList{j},'tol')
                algoParamsBlock.(fieldList{j}) = 1e-6;
            elseif strcmpi(fieldList{j},'alpha')
                algoParamsBlock.(fieldList{j}) = 0.5;
            elseif strcmpi(fieldList{j},'Nr')
                algoParamsBlock.(fieldList{j}) = 5;
            elseif strcmpi(fieldList{j},'seq')
                algoParamsBlock.(fieldList{j}) = 1;
            elseif strcmpi(fieldList{j},'gamma')
                algoParamsBlock.(fieldList{j}) = Inf;
            end


            p = algoParamsBlock.(fieldList{j});
            if ~ischar(p)
                p = num2str(p);
            end
            disp(strcat(['Filled in:',' ',p,' ','in',' ',fieldList{j}]));
        else
            algoParamsBlock = rmfield(algoParamsBlock,'varargin');
        end
    end
end


end

