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

rngSeed = randi(1000000);  %For Orguner: Seed 537646, Nh = 15, d=1, gamma = 20, beta = 0.1, Nr = 5, Runnalls vs alphaRed
                           %Other seed: Seed 26205 Nh = 15 d=1 gamma=35
                           %beta = 0.1 Nr = 5 Runnalls vs alpha1Red vs
                           %alpha2Red

Nh = 30;

d = 12;
gamma = 10;
beta = 0.2*d;



test = 'random';
Nr = 10;

%%
alphaJD = 0;
alpha1D = 0.9;
showPlot = 1;
exp1 = Experiment('',           {struct('rho',0.7),struct('k',2)},...
                  'IFKLDMRA',        struct('Nr',Nr),...
                  '',           {struct('I',50)},...
                  test,          struct('Nh',Nh,'gamma',gamma','beta',beta,'d',d,'rngSeed',rngSeed));              

              
exp2 = Experiment('',           {},...
                  'IFKLDMRA',       struct('Nr',Nr,'alpha',alphaJD,'maxiter',500,'tol',1e-09),... 
                  'CTDRef',           {struct('costMeas','FKLDij','maxiter',100)},...
                  test,         struct('Nh',Nh,'gamma',gamma,'beta',beta,'d',d,'rngSeed',rngSeed));

exp3 = Experiment('',           {},...
                  'IFKLDMRA',        struct('Nr',Nr,'maxiter',100,'tol',1e-9),...
                  'tightFKLDBRef',  {struct('I',1+Nr/gamma,'tol',1e-9)},...
                  test,         struct('Nh',Nh,'gamma',gamma','beta',beta,'d',d,'rngSeed',rngSeed));
              
exp4 = Experiment('adaptivePruning',           {struct()},...
                  'IFKLDMRA',        struct('Nr',Nr),...
                  'CTDRef',  {struct('costMeas','FKLDij','maxiter',100)},...
                  test,         struct('Nh',Nh,'gamma',gamma','beta',beta,'d',d,'rngSeed',rngSeed));
              
exp5 = Experiment('',           {},...
                  'IW2MRA',       struct('Nr',Nr,'maxiter',100,'tol',1e-12),...
                  '',  {struct('costMeas','CSDij'),struct()},...
                  test,         struct('Nh',Nh,'gamma',gamma','beta',beta,'d',d,'rngSeed',rngSeed));
              
exp6 = Experiment('',           {},...
                  'IRKLDMRA',       struct('Nr',Nr),...
                  '',  {struct('costMeas','L2ij','lambda',0,'maxiter',100),struct()},...
                  test,         struct('Nh',Nh,'gamma',gamma','beta',beta,'d',d,'rngSeed',rngSeed));
              
exp7 = Experiment('',           {},...
                  'modWilliams',       struct('Nr',Nr,'maxiter',100,'tol',1e-9),...
                  '',  {struct('costMeas','CSDij'),struct()},...
                  test,         struct('Nh',Nh,'gamma',gamma','beta',beta,'d',d,'rngSeed',rngSeed));
                

experiments = [exp2;exp3];
numTests = numel(experiments);

gms = cell(numTests,1);
gmrs = cell(numTests,1);
times = zeros(numTests,1);
for i=1:numTests
    [gmrs{i},gms{i},times(i)] = experiments(i).execute();
end


close all
globalMeas = {struct('globMeas','UTKLD'),...
              struct('globMeas','tFKLDUB'),...
              struct('globMeas','MCKLD','nPoints',200000),...
              struct('globMeas','FKLD123','nPoints',500),...
              struct('globMeas','CTD','costMeas','FKLDij')}';
plotResults(gmrs,gms,times,experiments,showPlot,globalMeas);

WCTD = computeOTP(CostMatrix(gms{1},gmrs{1},'FKLDij'),[gms{1}.w]',[gmrs{1}.w]');
WRel = EffEROTP([gms{1}.w]',CostMatrix(gms{1},gmrs{1},'MKLDij',struct('I',1)),1);
norm(WCTD-WRel)
%CTD(gms{1},gmrs{1},'FKLDij')
%RCTD(gms{1},gmrs{1},'FKLDij')
%draw2DOTP(WRel,gms{1},gmrs{1})




