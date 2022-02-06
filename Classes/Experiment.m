classdef Experiment < handle
% Experiment Class:
% This class provides methods to generate and operate on Experiments.
%To retrieve available choices type:
% - getAvailablePrunings(), for pruning algorithms,
% - getAvailableAlgorithms(), for greedy reduction algorithms,
% - getAvailableRefinements(), for refinement algorithms,
% - Experiment.getAvailableTests(), for tests.
% In order to create an experiment it is necessary to provide parameters in the following order:
% 1. The chosen initial pruning algorithm (char array); can be left empty
%    by passing '' in order to skip pruning.
% 2. The structure containing the pruning parameters (struct).
% 3. The chosen reduction algorithm (char array); if it is left empty the
%    experiment won't take place.
% 4. The structure containing the algorithm parameters (struct).
% 5. The chosen refinement algorithm (char array); can be left empty or it
%    is possible to stack several subsequent refinements by using the '+'
%    sign, e.g. 'ISEOptLegacy+weightISEOpt' will perform the ISEOpt at first and the
%    weightISEOpt at last.
% 6. The structure containing the necessary refinement parameters for all
%    the chosen algorithms (struct).
% 7. The chosen test (char array); if it is left empty the experiment won't
%    take place.
% 8. The structure containing the parameters necessary for the test (struct).
% After creating the Experiment object, it is possible to execute it
% through the methos .execute(), e.g. exp1 = Experiment(...),
% exp1.execute().


    properties (Access=public)
        prune %The pruning algorithm (char array)
        algorithm %The greedy reduction algorithm (char array)
        refinement %The refinement algorithm (char array)
        test %The test to execute (char array)
        pruneParams %Parameters for the pruning algorithm (cell)
        algoParams %Parameters for the greedy reduction algorithm (struct)
        refParams %Parameters for the refinement algorithm (cell)
        testParams %Parameters for the chosen test (struct)
    end
    

    
    methods (Access=public)
        function obj = Experiment(prune,pruneParams,algo,algoParams,ref,refParams,test,testParams)
            
            if nargin == 0
                obj.prune = '';
                obj.pruneParams = {};
                obj.algorithm = '';
                obj.algoParams = struct();
                obj.refinement = '';
                obj.refParams = {};
                obj.test = '';
                obj.testParams = struct();
                
            else
                
                if ~isempty(prune)
                    obj.prune = prune;
                    obj.pruneParams = pruneParams;
                end
                
                obj.algorithm = algo;
                obj.algoParams = algoParams;

                if ~isempty(ref)
                    obj.refinement = ref;
                    obj.refParams = refParams;
                end
               
                obj.test = test;
                
                obj.testParams = testParams;
            end
            
        end
        
        function prune = getPrune(obj)
            prune = obj.prune;
        end
        
        function algo = getAlgo(obj)
            algo = obj.algorithm;
        end

        function ref = getRef(obj)
            ref = obj.refinement;
        end
        
        function test = getTest(obj)
            test = obj.test;
        end
        
        function params = getPruneParams(obj)
            params = obj.pruneParams;
        end
        
        function params = getAlgoParams(obj)
            params = obj.algoParams;
        end
        
        function params = getRefParams(obj)
            params = obj.refParams;
        end
        
        function params = getTestParams(obj)
            params = obj.testParams;
        end
        
        function setPrune(obj,prune)
            obj.prune = prune;
        end

        function setAlgo(obj,algo)
            obj.algorithm = algo;
        end

        function setRef(obj,ref)
            obj.refinement = ref;
        end
        
        function setTest(obj,test)
            obj.test = test;
        end
        
        function setPruneParams(obj,prune,pruneParams)
            if ~isempty(obj.prune)
                prunings = split(obj.prune,'+');
                if any(strcmpi(prune,prunings))
                    idx = find(strcmpi(prune,prunings));
                    assert(isstruct(pruneParams),'Wrong input type. It has to be a struct.');
                    userPruneFields = fieldnames(pruneParams);
                    for i=1:length(userPruneFields)
                        if any(strcmpi(userPruneFields{:},fieldnames(obj.pruneParams{idx})))
                            obj.pruneParams{idx}.(userPruneFields{i}) = pruneParams.(userPruneFields{i});
                        end
                    end
                else
                    disp('The provided pruning algorithm is not proper of this experiment. Set it at first in case.');
                end
            else
                disp('The experiment does not provide any pruning. Set it at first.');
            end
        end

        function setAlgoParams(obj,algoParams)
            assert(isstruct(algoParams),'Wrong input type. It has to be a struct.');
            userAlgoFields = fieldnames(algoParams);
            for i=1:length(userAlgoFields)
                obj.algoParams.(userAlgoFields{i}) = algoParams.(userAlgoFields{i});
            end
        end
        
        function setRefParams(obj,ref,refParams)
            if ~isempty(obj.refinement)
                refs = split(obj.refinement,'+');
                if any(strcmpi(ref,refs))
                    idx = find(strcmpi(ref,refs));
                    assert(isstruct(refParams),'Wrong input type. It has to be a struct.');
                    userRefFields = fieldnames(refParams);
                    for i=1:length(userRefFields)
                        if any(strcmpi(userRefFields{:},fieldnames(obj.refParams{idx})))
                            obj.refParams{idx}.(userRefFields{i}) = refParams.(userRefFields{i});
                        end
                    end
                else
                    disp('The provided refinement algorithm is not proper of this experiment. Set it at first in case.');
                end
            else
                disp('The experiment does not provide any refinement. Set it at first.');
            end
        end
        
        
        function setTestParams(obj,testParams)
            assert(isstruct(testParams),'Wrong input type. It has to be a struct.');
            userTestFields = fieldnames(testParams);
            for i=1:length(userTestFields)
                obj.testParams.(userTestFields{i}) = testParams.(userTestFields{i});
            end
        end
        
        
        function [gmr,gm,time] = execute(obj)
           
            assert(~isempty(obj.algorithm),'The algorithm has not been assigned. Returning...');
            assert(~isempty(obj.test),'The test has not been assigned. Returning...');
            
            %We get the init GM
            [gm,obj.testParams] = genGaussMixFromTest(obj.test,obj.testParams);
            gmr = gm;
            timeVec = zeros(1,3);
            
            %We can perform pruning
            tic;
            if ~isempty(obj.prune)
                [gmr,obj.pruneParams] = pruneGaussMix(obj.prune,gmr,obj.pruneParams);
            end
            timeVec(1) = toc;
            
            %We apply the greedy reduction
            tic;
            [gmr,obj.algoParams] = reduceGaussMix(obj.algorithm,gmr,obj.algoParams);
            timeVec(2) = toc;
            
            %We can perform the refinement
            tic;
            [gmr,obj.refParams] = refineGaussMix(obj.refinement,gmr,gm,obj.refParams);
            timeVec(3) = toc;

            
            time = sum(timeVec);
        end
                       
            
    end
     
    methods (Static)
        
        function pruningList = getAvailablePrunings()
            tmp = split({dir(strcat(what('Pruning').path,'/*.m')).name}','.m');
            pruningList = tmp(:,1);
        end
        
        function algoList = getAvailableAlgorithms()
            tmp = split({dir(strcat(what('GreedyReduction').path,'/*.m')).name}','.m');
            algoList = tmp(:,1);
        end
        
        function refList = getAvailableRefinements()
            tmp = split({dir(strcat(what('Refinement').path,'/*.m')).name}','.m');
            refList = tmp(:,1);
        end
        
        function testList = getAvailableTests()
            tmp = split({dir(strcat(what('TestsList').path,'/*.m')).name}','.m');
            testList = tmp(:,1);
        end
        
        function globMeasList = getAvailableGlobalMeasures()
           tmp = split({dir(strcat(what('GlobalMeasures').path,'/*.m')).name}','.m');
           globMeasList = tmp(:,1);
        end
        
        function locMeasList = getAvailableLocalMeasures()
           tmp = split({dir(strcat(what('LocalMeasures').path,'/*.m')).name}','.m');
           locMeasList = tmp(:,1);
        end
        
        function mergeList = getAvailableMerging()
           tmp = split({dir(strcat(what('Merging').path,'/*.m')).name}','.m');
           mergeList = tmp(:,1);
        end
    end
end

