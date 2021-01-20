clc
clear
close all

rngSeed = randi(1000000);  %With seed 5504, Nh=36 and sk=0.01, Runnals takes more time than PCMRA
Nh = 30;

d = 2;
alpha = Nh/3;
beta = 0.09;

%INSTRUCTIONS:

%To retrieve available choices type:
% - getAvailablePrunings(), for pruning algorithms,
% - getAvailableAlgorithms(), for greedy reduction algorithms,
% - getAvailableRefinements(), for refinement algorithms,
% - Experiment.getAvailableTests(), for tests.

% In order to create an experiment it is necessary to provide ordered
% parameters:
% 1. The chosen initial pruning algorithm (char array); can be left empty
% by passing '' in order to skip pruning.
% 2. The structure containing the pruning parameters (struct).
% 3. The chosen reduction algorithm (char array); if it is left empty the
% experiment won't take place.
% 4. The structure containing the algorithm parameters (struct).
% 5. The chosen refinement algorithm (char array); can be left empty or it
% is possible to stack several subsequent refinements by using the '+'
% sign, e.g. 'ISEOpt+COWAOpt' will perform the ISEOpt at first and the
% COWAOpt at last.
% 6. The structure containing the necessary refinement parameters for all
% the chosen algorithms (struct).
% 7. The chosen test (char array); if it is left empty the experiment won't
% take place.1.0
% 8. The structure containing the parameters necessary for the test
% (struct).
% After creating the Experiment object, it is possible to execute it
% through the methos .execute(), e.g. exp1 = Experiment(...),
% exp1.execute().

test = 'random';
Nr = 5;

exp1 = Experiment('',           struct(),...
                  'Runnalls',   struct('Nr',Nr),...
                  '',           struct(),...
                  test,     struct('Nh',Nh,'alpha',alpha','beta',beta,'d',d,'rngSeed',rngSeed));
              
exp2 = Experiment('',           struct(),...
                  'Runnalls',       struct('Nr',Nr),...
                  'clusteringGMRC',           struct(),...
                  test,         struct('Nh',Nh,'alpha',alpha','beta',beta,'d',d,'rngSeed',rngSeed));
              
exp3 = Experiment('',           struct(),...
                  'Runnalls',      struct('Nr',Nr),...
                  'clusteringApproxKLD',           struct(),...
                  test,     struct('Nh',Nh,'alpha',alpha','d',d,'beta',beta,'rngSeed',rngSeed));

experiments = [exp1;exp2;exp3];
numTests = numel(experiments);

gm_vector = cell(numTests,1);
gmr_vector = cell(numTests,1);
time_vector = zeros(numTests,1);

%%

for i=1:numTests
    [gmr_vector{i},gm_vector{i},time_vector(i)] = experiments(i).execute();
end

%%
plotResults(gmr_vector,gm_vector,time_vector,experiments,'KLD');


