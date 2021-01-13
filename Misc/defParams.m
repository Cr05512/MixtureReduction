function [pruneParamsBlock,algoParamsBlock,refParamsBlock,testParamsBlock] = defParams(prune,algo,ref,test)
% [pruneParamsBlock,algoParamsBlock,refParamsBlock,testParamsBlock] = defParams(prune,algo,ref,test):
% INPUT:
% - prune, the desired pruning algorithm (char array),
% - algo, the desired greedy reduction algorithm (char array),
% - ref, the desired refinement algorithm (char array),
% - test, the desired test to execture (char array).
% OUTPUT:
% - pruneParamsBlock, a struct containing all the default parameters for
%   the chosen pruning algorithm (struct),
% - algoParamsBlock, a struct containing all the default parameters for
%   the chosen greedy reduction algorithm (struct),
% - refParamsBlock, a struct containing all the default parameters for
%   the chosen refinement algorithm (struct),
% - testParamsBlock, a struct containing all the default parameters for
%   the chosen test (struct).
% This function provides to the experiment class the ability to retrieve
% default parameters for each pruning, greedy reduction and refinement
% algorithm together with the parameters for the chosen test. It allows the
% user to skip the parameter specification in the main.m file.

    pruneParamsBlock = struct();
    if ~isempty(prune)
        if strcmpi(prune,'Adaptive')
            pruneParamsBlock.('rho') = 0.9544;
        elseif strcmpi(prune,'Standard')
            pruneParamsBlock.('threshold') = 0.05;
        elseif strcmpi(prune,'kSmallest')
            pruneParamsBlock.('k') = 1;
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
        elseif strcmpi(algo,'pcmra')
            algoParamsBlock.('redAlgo') = 'Runnalls';
            algoParamsBlock.('measFlag') = 0;
            algoParamsBlock.('costMeas') = 'KLD';
            algoParamsBlock.('lambda') = 0.05;
            algoParamsBlock.('maxiter') = 50;
            algoParamsBlock.('p') = 5;
            algoParamsBlock.('h') = 1;
        elseif strcmpi(algo,'bf')
            algoParamsBlock.('seq') = 1;
        elseif strcmpi(algo,'testAlgo')
            algoParamsBlock.('nPoints') = 1000;
        end
    end

    refParamsBlock = {};
    if ~isempty(ref)
        %By convention the suffix "_ref" is added to refinement parameters
        refs = split(ref,'+');
        for i=1:numel(refs)
        
            if strcmpi(refs(i),'ISEOpt')
                refParamsBlock{i}.('sk') = 0.01;
                refParamsBlock{i}.('NOptSteps') = 50;
                refParamsBlock{i}.('optWeights') = 1;
                refParamsBlock{i}.('accThresh') = 1e-06;
            elseif strcmpi(refs(i),'CTDGMRA')
                refParamsBlock{i}.('costMeas') = 'KLD';
                refParamsBlock{i}.('lambda') = 0.05;
                refParamsBlock{i}.('maxiter') = 50;
                refParamsBlock{i}.('I') = 20;
                refParamsBlock{i}.('alphaGJSD') = 0.5;
            elseif strcmpi(refs(i),'DPHEM')
                refParamsBlock{i}.('I') = 20;
                refParamsBlock{i}.('maxiter') = 50;
            elseif strcmpi(refs(i),'GMEM')
                refParamsBlock{i}.('nSamples') = 1500;
                refParamsBlock{i}.('maxiter') = 30;
            elseif strcmpi(refs(i),'GMKMeans')
                refParamsBlock{i}.('costMeas') = 'KLD';
                refParamsBlock{i}.('NKMeansSteps') = 50;
            else
                refParamsBlock{i} = struct();
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

    end
            
                
            
end

