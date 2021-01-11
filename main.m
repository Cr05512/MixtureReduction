clc
clear
close all

rngSeed = 758363; %randi(1000000);  %With seed 5504, Nh=36 and sk=0.01, Runnals takes more time than PCMRA
Nh = 20;

d = 1;
alpha = Nh/4;

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
% take place.
% 8. The structure containing the parameters necessary for the test
% (struct).
% After creating the Experiment object, it is possible to execute it
% through the methos .execute(), e.g. exp1 = Experiment(...),
% exp1.execute().


exp1 = Experiment('',           struct(),...
                  'Runnalls',       struct('Nr',5,'seq',1),...
                  'ISEOpt+COWAOpt',           struct('NOptSteps',50,'sk',0.005),...
                  'testCrouse', struct('Nh',Nh,'alpha',alpha','d',d,'rngSeed',rngSeed));
              
exp2 = Experiment('',           struct(),...
                  'GMRC',       struct('Nr',5,'ISEOpt',0,'NOptSteps',50,'sk',0.005),...
                  '',           struct(),...
                  'random',     struct('Nh',Nh,'alpha',alpha','d',d,'rngSeed',rngSeed));
              
exp3 = Experiment('',           struct(),...
                  'PCMRA',      struct('Nr',5,'p',round(Nh/4),'lambda',0.05,'costMeas','KLD','redAlgo','Runnalls'),...
                  '',           struct('NOptSteps',50,'sk',0.005),...
                  'random',     struct('Nh',Nh,'alpha',alpha','d',d,'rngSeed',rngSeed));

experiments = [exp1];
numTests = numel(experiments);

gm_vector = cell(numTests,1);
gmr_vector = cell(numTests,1);
time_vector = zeros(numTests,1);

%%

for i=1:numTests
    [gmr_vector{i},gm_vector{i},time_vector(i)] = experiments(i).execute();
end

%%
plotResults(gmr_vector,gm_vector,time_vector,experiments,'W2');


