function [pruneParamsBlock,algoParamsBlock,refParamsBlock,testParamsBlock] = procParams(prune,userPruneParams,algo,userAlgoParams,ref,userRefParams,test,userTestParams)
% [pruneParamsBlock,algoParamsBlock,refParamsBlock,testParamsBlock] = procParams(prune,userPruneParams,algo,userAlgoParams,ref,userRefParams,test,userTestParams):
% INPUT:
% - prune, the desired pruning algorithm (char array),
% - algo, the desired greedy reduction algorithm (char array),
% - ref, the desired refinement algorithm (char array),
% - test, the desired test to execture (char array).
% OUTPUT:
% - pruneParamsBlock, a struct containing all the default parameters for
%   the chosen pruning algorithm (cell),
% - algoParamsBlock, a struct containing all the default parameters for
%   the chosen greedy reduction algorithm (struct),
% - refParamsBlock, a struct containing all the default parameters for
%   the chosen refinement algorithm (cell),
% - testParamsBlock, a struct containing all the default parameters for
%   the chosen test (struct).
% This function provides to the experiment class the ability to retrieve
% default parameters for each pruning, greedy reduction and refinement
% algorithm together with the parameters for the chosen test. It allows the
% user to skip the parameter specification in the main.m file.

    %Pruning processing
    pruneParamsBlock = {};
    if ~isempty(prune)
        prunings = split(prune,'+');
        for i=1:numel(prunings)
            
            if strcmpi(prunings(i),'adaptivePruning')
                pruneParamsBlock{i}.('rho') = 0.9544;
            elseif strcmpi(prunings(i),'standardPruning')
                pruneParamsBlock{i}.('threshold') = 0.05;
            elseif strcmpi(prunings(i),'kSmallestPruning')
                pruneParamsBlock{i}.('k') = 1;
            else
                pruneParamsBlock{i} = struct();
            end
            
            if ~isempty(userPruneParams)
                if isstruct(userPruneParams{i})
                    userPruneFields = fieldnames(userPruneParams{i});
                    for j=1:length(userPruneFields)
                        if isfield(pruneParamsBlock{i},userPruneFields{j})
                            pruneParamsBlock{i}.(userPruneFields{j}) = userPruneParams{i}.(userPruneFields{j});
                        end
                    end
                end
            end
            
        end
        
    end

    
    algoParamsBlock = struct();
    if ~isempty(algo)
        algoParamsBlock.('Nr') = 5;
        if ismember(lower(algo),{'west','cowa'})
            algoParamsBlock.('costMeas') = 'L2';
            algoParamsBlock.('algo') = 0;
            algoParamsBlock.('gamma') = Inf;
        elseif strcmpi(algo,'gmrc')
            algoParamsBlock.('initMethod') = 'Runnalls';
            algoParamsBlock.('NKmeansSteps') = 1;
            algoParamsBlock.('ISEOpt') = 1;
            algoParamsBlock.('sk') = 0.01;
            algoParamsBlock.('NOptSteps') = 30;
            algoParamsBlock.('optWeights') = 1;
            algoParamsBlock.('accThresh') = 1e-06;
        elseif strcmpi(algo,'gmrcwas')
            algoParamsBlock.('NKMeansSteps') = 50;
        elseif strcmpi(algo,'bf')
            algoParamsBlock.('seq') = 1;
        end
        
        if isstruct(userAlgoParams)
            userAlgoFields = fieldnames(userAlgoParams);
            for i=1:length(userAlgoFields)
                if isfield(algoParamsBlock,userAlgoFields{i})
                    algoParamsBlock.(userAlgoFields{i}) = userAlgoParams.(userAlgoFields{i}); 
                else
                    disp('The provided param is not a known param.');
                end
            end
        end
    end

    refParamsBlock = {};
    if ~isempty(ref)
        refs = split(ref,'+');
        for i=1:numel(refs)
        
            if strcmpi(refs(i),'ISEOpt')
                refParamsBlock{i}.('sk') = 0.01;
                refParamsBlock{i}.('NOptSteps') = 30;
                refParamsBlock{i}.('optWeights') = 1;
                refParamsBlock{i}.('accThresh') = 1e-06;
            elseif strcmpi(refs(i),'ISEOptUncMBI')
                refParamsBlock{i}.('NOptSteps') = 50;
            elseif strcmpi(refs(i),'CTDGMRA')
                refParamsBlock{i}.('costMeas') = 'KLD';
                refParamsBlock{i}.('lambda') = 0.05;
                refParamsBlock{i}.('maxiter') = 50;
            elseif strcmpi(refs(i),'DPHEM')
                refParamsBlock{i}.('I') = 20;
                refParamsBlock{i}.('maxiter') = 50;
            elseif strcmpi(refs(i),'GMEM')
                refParamsBlock{i}.('nSamples') = 1500;
                refParamsBlock{i}.('maxiter') = 30;
            elseif strcmpi(refs(i),'GMKMeans')
                refParamsBlock{i}.('costMeas') = 'KLD';
                refParamsBlock{i}.('NKMeansSteps') = 50;
            elseif strcmpi(refs(i),'clusteringGMRC')
                refParamsBlock{i}.('NSteps') = 1;
            elseif strcmpi(refs(i),'clusteringUTKLD')
                refParamsBlock{i}.('NSteps') = 1;
                refParamsBlock{i}.('numRings') = 1;
            elseif strcmpi(refs(i),'clusteringUTKLDord')
                refParamsBlock{i}.('NSteps') = 1;
                refParamsBlock{i}.('numRings') = 1;
                refParamsBlock{i}.('order') = 'ascend';
            else
                refParamsBlock{i} = struct();
            end
            
            if ~isempty(userRefParams)
                if isstruct(userRefParams{i})
                    userRefFields = fieldnames(userRefParams{i});
                    for j=1:length(userRefFields)
                        if isfield(refParamsBlock{i},userRefFields{j})
                            refParamsBlock{i}.(userRefFields{j}) = userRefParams{i}.(userRefFields{j});
                        end
                    end
                end
            end
            
            %Additional parameter case
            
            if isfield(refParamsBlock{i},'costMeas')
                if strcmpi(refParamsBlock{i}.('costMeas'),'MKLD')
                    if any(strcmpi(userRefFields,'I'))
                        refParamsBlock{i}.('I') = userRefParams{i}.I;
                    else
                        refParamsBlock{i}.('I') = 20;
                    end

                elseif any(strcmpi(refParamsBlock{i}.('costMeas'),{'GJSD','chernoffAlphaD','RenyiAlphaDiv'}))
                    if any(strcmpi(userRefFields,'alpha'))
                        refParamsBlock{i}.('alpha') = userRefParams{i}.alpha;
                    else
                        refParamsBlock{i}.('alpha') = 0.5;
                    end
                end
           end
            
        end
        
    end
    
    testParamsBlock = struct();
    if ~isempty(test)
        
        if strcmpi(test,'random')
            testParamsBlock.('Nh') = 20;
            testParamsBlock.('d') = 1;
            testParamsBlock.('alpha') = 5;
            testParamsBlock.('beta') = 0.09;
            testParamsBlock.('delta') = 0;
            testParamsBlock.('rngSeed') = randi(100000);
            
        elseif ismember(lower(test),{'test2','test3','test4'})
            testParamsBlock.('Nh') = 20;
            testParamsBlock.('r') = 10;
            testParamsBlock.('beta') = 0.09;
  
        end
        
        if isstruct(userTestParams)
            userTestFields = fieldnames(userTestParams);
            for i=1:length(userTestFields)
                if isfield(testParamsBlock,userTestFields{i})
                    testParamsBlock.(userTestFields{i}) = userTestParams.(userTestFields{i});
                else
                    disp('The provided param is not a known param.');
                end
            end
        end
    end
    

    

    

    
                
            
end

