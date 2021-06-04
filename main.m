%clc
clear


%INSTRUCTIONS:

%To retrieve available choices type:
% - Experiment.getAvailablePrunings(), for pruning algorithms,
% - Experiment.getAvailableAlgorithms(), for greedy reduction algorithms,
% - Experiment.getAvailableRefinements(), for refinement algorithms,
% - Experiment.getAvailableTests(), for tests,
% - Experiment.getAvailableLocalMeasures(), for local measures,
% - Experiment.getAvailableGlobalMeasures(), for global measures.

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
% sign, e.g. 'ISEOpt+weightISEOpt' will perform the ISEOpt at first and the
% weightISEOpt at last.
% 6. The structure containing the necessary refinement parameters for all
% the chosen algorithms (struct).
% 7. The chosen test (char array); if it is left empty the experiment won't
% take place.1.0
% 8. The structure containing the parameters necessary for the test
% (struct).
% After creating the Experiment object, it is possible to execute it
% through the methos .execute(), e.g. exp1 = Experiment(...),
% exp1.execute().

rngSeed = randi(1000000);  %926458
%%
Nh = 10;

d = 6;
alpha = 8;
beta = 0.1;
showPlot = 1;

test = 'random';
Nr = 5;

exp1 = Experiment('',           {struct('rho',0.7),struct('k',2)},...
                  'BDMRA',        struct('Nr',Nr,'costMeas','KLDij'),...
                  '',           {struct('lambda',0.0,'costMeas','NL2ij'),struct()},...
                  test,          struct('Nh',Nh,'alpha',alpha','beta',beta,'d',d,'rngSeed',rngSeed));              

              
exp2 = Experiment('',           {},...
                  'Runnalls',       struct('Nr',Nr,'costMeas','BDij'),...
                  '',           {struct('NSteps',2)},...
                  test,         struct('Nh',Nh,'alpha',alpha,'beta',beta,'d',d,'rngSeed',rngSeed));

exp3 = Experiment('',           {},...
                  'G2RA',       struct('Nr',Nr,'costMeas','TSLij'),...
                  '',  {struct('I',2),struct()},...
                  test,         struct('Nh',Nh,'alpha',alpha','beta',beta,'d',d,'rngSeed',rngSeed));
              
exp4 = Experiment('',           {},...
                  'G2RA',       struct('Nr',Nr,'costMeas','CSDij'),...
                  '',  {struct('I',2),struct()},...
                  test,         struct('Nh',Nh,'alpha',alpha','beta',beta,'d',d,'rngSeed',rngSeed));
              
exp5 = Experiment('',           {},...
                  'G2RA',       struct('Nr',Nr,'costMeas','BDij'),...
                  '',  {struct('I',2),struct()},...
                  test,         struct('Nh',Nh,'alpha',alpha','beta',beta,'d',d,'rngSeed',rngSeed));
              
          

experiments = [exp1;exp2];
numTests = numel(experiments);

gms = cell(numTests,1);
gmrs = cell(numTests,1);
times = zeros(numTests,1);
for i=1:numTests
    [gmrs{i},gms{i},times(i)] = experiments(i).execute();
end
%%
close all
globalMeas = {struct('globMeas','CTD','costMeas','KLDij'),...
              struct('globMeas','CTD','costMeas','W2ij'),...
              struct('globMeas','CTD','costMeas','BDij')}';
plotResults(gmrs,gms,times,experiments,showPlot,globalMeas);


