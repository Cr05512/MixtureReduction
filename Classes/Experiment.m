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
%    sign, e.g. 'ISEOpt+COWAOpt' will perform the ISEOpt at first and the
%    COWAOpt at last.
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
        pruneParams %Parameters for the pruning algorithm (struct)
        algoParams %Parameters for the greedy reduction algorithm (struct)
        refParams %Parameters for the refinement algorithm (struct)
        testParams %Parameters for the chosen test (struct)
    end
    

    
    methods (Access=public)
        function obj = Experiment(prune,pruneParams,algo,algoParams,ref,refParams,test,testParams)
            
            if nargin == 0
                obj.prune = '';
                obj.pruneParams = struct();
                obj.algorithm = '';
                obj.algoParams = struct();
                obj.refinement = '';
                obj.refParams = struct();
                obj.test = '';
                obj.testParams = struct();
                
            else
                
                if ~isempty(prune)
                    obj.prune = prune;
                end
                
                assert(~isempty(algo),'The algorithm has not been assigned. Returning...');
                obj.algorithm = algo;

                if ~isempty(ref)
                   
                    obj.refinement = ref;
                end

                assert(~isempty(test),'The test has not been assigned. Returning...');
                availableTests = Experiment.getAvailableTests();
                assert(ismember(lower(test),lower(availableTests)), strcat(['Unknown test. The available tests are:',' ',strjoin(availableTests,', '),'.']));
                obj.test = test;
                
                [obj.pruneParams,obj.algoParams,obj.refParams,obj.testParams] = Experiment.paramParser(prune,pruneParams,algo,algoParams,ref,refParams,test,testParams);
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
        
        function setPruneParams(obj,pruneParams)
            assert(isstruct(pruneParams),'Wrong input type. It has to be a struct.');
            userPruneFields = fieldnames(pruneParams);
            for i=1:length(userPruneFields)
                obj.pruneParams.(userPruneFields{i}) = pruneParams.(userPruneFields{i});
            end
        end

        function setAlgoParams(obj,algoParams)
            assert(isstruct(algoParams),'Wrong input type. It has to be a struct.');
            userAlgoFields = fieldnames(algoParams);
            for i=1:length(userAlgoFields)
                obj.algoParams.(userAlgoFields{i}) = algoParams.(userAlgoFields{i});
            end
        end
        
        function setRefParams(obj,refParams)
            assert(isstruct(refParams),'Wrong input type. It has to be a struct.');
            userRefFields = fieldnames(refParams);
            for i=1:length(userRefFields)
                obj.refParams.(userRefFields{i}) = refParams.(userRefFields{i});
            end
        end
        
        
        function setTestParams(obj,testParams)
            assert(isstruct(testParams),'Wrong input type. It has to be a struct.');
            userTestFields = fieldnames(testParams);
            for i=1:length(userTestFields)
                obj.testParams.(userTestFields{i}) = testParams.(userTestFields{i});
            end
        end
        
        function gm = initGMGen(obj)
            
            availableTests = obj.getAvailableTests(); %Check the corresponding documentation for further details
            assert(ismember(lower(obj.test),lower(availableTests)), strcat(['Unknown test. The available tests are:',' ',strjoin(availableTests,', '),'.']));
            varargout = cell(1,nargout(obj.test));
            
            varargin = cell(nargin(obj.test),1);
            if numel(varargin)>0
                varargin = struct2cell(obj.testParams);
            end
            [varargout{:}] = feval(obj.test,varargin{:});
            gm = varargout{1};
            if numel(varargout)>1
                newParams = varargout{2};
                if isstruct(newParams)
                    customFields = fieldnames(newParams);
                    for i=1:length(customFields)
                         obj.testParams.(customFields{i}) = newParams.(customFields{i});
                    end
                end
                
            end
            
        end
        
        
        function [gmr,gm,time] = execute(obj)
           
            
            %We get the init GM
            gm = obj.initGMGen();

            timeVec = zeros(1,3);
            
            %We can perform pruning
            if ~isempty(obj.prune)
                pruneArgVector = struct2cell(obj.pruneParams);
                tic;
                gmr = pruning(obj.prune,gm,pruneArgVector{:});
                timeVec(1) = toc;
            else
                gmr = gm;
            end
            
            %We apply the greedy reduction
            
            algoArgVector = struct2cell(obj.algoParams);
            
            tic;
            gmr =reduce(obj.algorithm,gmr,algoArgVector{:});
            timeVec(2) = toc;
            
            tic;
            if ~isempty(obj.refinement)
                refinements = split(obj.refinement,'+');
                
                for k=1:numel(refinements)
                    refArgVector = struct2cell(obj.refParams{k});
                    gmr = refine(refinements{k},gmr,gm,refArgVector{:});
                end
            end
            timeVec(3) = toc;

            
            time = sum(timeVec);
        end
                       
            
    end
     
    methods (Static)
        
        function [pruneParams,algoParams,refParams,testParams] = paramParser(prune,userPruneParams,algo,userAlgoParams,ref,userRefParams,test,userTestParams)
            %params should be a struct containing used defined parameters
            [pruneParams,algoParams,refParams,testParams] = defParams(prune,algo,ref,test);
            
            if isstruct(userPruneParams)
                userPruneFields = fieldnames(userPruneParams);
                for i=1:length(userPruneFields)
                    if isfield(pruneParams,userPruneFields{i})
                        pruneParams.(userPruneFields{i}) = userPruneParams.(userPruneFields{i});
                    else
                        disp('The provided param is not a known param.');
                    end
                end
            end
            
            if isstruct(userAlgoParams)
                userAlgoFields = fieldnames(userAlgoParams);
                for i=1:length(userAlgoFields)
                    if isfield(algoParams,userAlgoFields{i})
                        algoParams.(userAlgoFields{i}) = userAlgoParams.(userAlgoFields{i}); 
                    else
                        disp('The provided param is not a known param.');
                    end
                end
            end
            
            for k=1:numel(refParams)
                if isstruct(userRefParams)
                    userRefFields = fieldnames(userRefParams);
                    for i=1:length(userRefFields)
                        if isfield(refParams{k},userRefFields{i})
                            refParams{k}.(userRefFields{i}) = userRefParams.(userRefFields{i});
                        end
                    end
                end
                
            end
            
            if isstruct(userTestParams)
                userTestFields = fieldnames(userTestParams);
                for i=1:length(userTestFields)
                    if isfield(testParams,userTestFields{i})
                        testParams.(userTestFields{i}) = userTestParams.(userTestFields{i});
                    else
                        disp('The provided param is not a known param.');
                    end
                end
            end
         

        end
        
        function testList = getAvailableTests()
            tmp = split({dir(strcat(what('TestsList').path,'/*.m')).name}','.m');
            testList = tmp(:,1);
        end
    end
end

