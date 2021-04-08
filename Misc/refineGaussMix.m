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
        
        if strcmpi(refs(i),'ISEOptUnc')
            refParamsBlock{i}.('NOptSteps') = 500;
            refParamsBlock{i}.('optWeights') = 1;
            refParamsBlock{i}.('accThresh') = 1e-21;
        elseif any(strcmpi(refs(i),{'ISEOptCon','ISEOptConQ','NISEOptCon','CSDOptCon',...
                                    'CMOptCon','TSLOptCon','JR2DOptCon'}))
            refParamsBlock{i}.('NOptSteps') = 1000;
            refParamsBlock{i}.('accThresh') = 1e-21;
        elseif strcmpi(refs(i),'CTDGMRA')
            refParamsBlock{i}.('costMeas') = 'KLDij';
            refParamsBlock{i}.('lambda') = 0.05;
            refParamsBlock{i}.('maxiter') = 50;
        elseif strcmpi(refs(i),'DPHEM')
            refParamsBlock{i}.('I') = 20;
            refParamsBlock{i}.('maxiter') = 50;
        elseif strcmpi(refs(i),'GMEMRef')
            refParamsBlock{i}.('nSamples') = 1500;
            refParamsBlock{i}.('maxiter') = 200;
        elseif strcmpi(refs(i),'GMKMeansRef')
            refParamsBlock{i}.('costMeas') = 'KLDij';
            refParamsBlock{i}.('NKMeansSteps') = 50;
        elseif strcmpi(refs(i),'clusteringGMRC')
            refParamsBlock{i}.('NSteps') = 1;
        elseif strcmpi(refs(i),'clusteringUTKLD')
            refParamsBlock{i}.('NSteps') = 1;
            refParamsBlock{i}.('numRings') = 1;
        else
            refParamsBlock{i} = struct();
        end

        if ~isempty(refParams)
            if isstruct(refParams{i})
                userRefFields = fieldnames(refParams{i});
                for j=1:length(userRefFields)
                    if isfield(refParamsBlock{i},userRefFields{j})
                        refParamsBlock{i}.(userRefFields{j}) = refParams{i}.(userRefFields{j});
                    end
                end
            end
        end

        %Additional parameter case

        if isfield(refParamsBlock{i},'costMeas')
            if strcmpi(refParamsBlock{i}.('costMeas'),'MKLDij')
                if any(strcmpi(userRefFields,'I'))
                    refParamsBlock{i}.('I') = refParams{i}.I;
                else
                    refParamsBlock{i}.('I') = 20;
                end

            elseif any(strcmpi(refParamsBlock{i}.('costMeas'),{'GJSDij','chernoffAlphaD','RenyiAlphaDiv'}))
                if any(strcmpi(userRefFields,'alpha'))
                    refParamsBlock{i}.('alpha') = refParams{i}.alpha;
                else
                    refParamsBlock{i}.('alpha') = 0.5;
                end
            end
        end
        refArgs = struct2cell(refParamsBlock{i});
        gmr = feval(availableRefAlgorithms{res},gmr,gmh,refArgs{:});
    end

end
    


end
