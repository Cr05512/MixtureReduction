clc
clear
close all

%Type in the following list the algorithms you want to compare. Check
%documentation for available algorithms.
algorithms = {'Runnals','CTDGMRA'};

%Type it the test to use. Check documentation for available tests.
test = 'random'; %set this to random for MC tests

NumTests = 100; %MC runs

%Check documentation for parameter meaning
params = struct('Nh',30,...
                'Nr',5,...
                'd',3,...
                'alpha',7.5,... %In general setting it to Nh/4 gives nice visual results
                'beta',0.09,...
                'delta',0,...
                'pruneGMComps',0,...
                'pruningMethod',1,...
                'pruningThresh',0.01,...
                'rho',0.9544,...
                'lambda',0.0,... %Set this to zero for L2 measure
                'maxiter',100,...
                'cost_measure','L2',...
                'initMethodCTD','greedy',...
                'algoWest',0,...
                'gammaWest',Inf,...
                'EMSamples',1000,... %In general 150*Nh*n gives nice approximations
                'I',5,...
                'nEMIter',20,...
                'initMethodEM','greedy',...
                'nKMeansSteps',100,...
                'opt',1,...
                'sk',0.005,...
                'nOptSteps',100,...
                'optWeights',1,...
                'showResults',0,... % Set this to zero in MC tests
                'nPoints',300);

numAlgorithms = length(algorithms);



nISEVector = zeros(numAlgorithms,NumTests);
timeVector = zeros(numAlgorithms,NumTests);
CTDVector = zeros(numAlgorithms,NumTests);
h = waitbar(0,'Processing...');


for m = 1:NumTests


    waitbar(m/NumTests,h)
    
    
    [fullMixture, gmr_vector, gmr_times] = GaussianMixtureReduction(algorithms,test,params);
    
    for i=1:numAlgorithms
        nISEVector(i,m) = nISE(fullMixture,gmr_vector{i});
        timeVector(i,m) = gmr_times(i);
        CTDVector(i,m) = CTD(fullMixture,gmr_vector{i},params.cost_measure);
    end

end

   
    

close(h);
%%
avgnISE = sum(nISEVector,2)./NumTests;
avgTime = sum(timeVector,2)./NumTests;
avgCTD = sum(CTDVector,2)./NumTests;

T=table(avgnISE,avgTime,avgCTD);
T.Properties.RowNames = algorithms;
T.Properties.VariableUnits = {'NISE','s','CTD'};
disp(T)
