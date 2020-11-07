
clear
close all

%Type in the following list the algorithms you want to compare. Check
%GaussianMixtureReduction documentation for available algorithms.
algorithms = {'Runnals','Custom','CTDGMRA'};

%Type it the test to use.  Check GaussianMixtureReduction documentation for available tests.
test = 'random'; %set this to random for MC tests

NumTests = 100; %MC runs
%Check GaussianMixtureReduction documentation for parameter meaning
params = struct('Nh',40,'Nr',5,'d',1,'lambda',0.05,'showResults',0);
            
numAlgorithms = length(algorithms);



nISEVector = zeros(numAlgorithms,NumTests);
timeVector = zeros(numAlgorithms,NumTests);
CTDVector = zeros(numAlgorithms,NumTests);
h = waitbar(0,'Processing...');
set(h,'Position', [550,350,280,70]);

for m = 1:NumTests


    waitbar(m/NumTests,h,strcat(['Processing...','Test: ',num2str(m),' of ',num2str(NumTests),'.']));
    
    
    [fullMixture, gmr_vector, gmr_times, params] = GaussianMixtureReduction(algorithms,test,params);
    
    for i=1:numAlgorithms
        nISEVector(i,m) = nISE(fullMixture,gmr_vector{i});
        timeVector(i,m) = gmr_times(i);
        CTDVector(i,m) = CTD(fullMixture,gmr_vector{i},params.cost_measure);
        %CTDVector(i,m) = convUpperBoundKLD(fullMixture,gmr_vector{i});
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
