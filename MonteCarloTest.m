clc
clear
close all

Nh = 20;
Nr = 5;
d = 1;
alpha = 5;
beta = 0.09;
test = 'random';

exp1 = Experiment('',           struct(),...
                  'Runnalls',      struct('Nr',Nr),...
                  '',           struct('NSteps',2),...
                  test,     struct('Nh',Nh,'alpha',alpha','d',d,'beta',beta));
              
exp2 = Experiment('',           struct(),...
                  'Runnalls',      struct('Nr',Nr),...
                  'clusteringApproxKLD',           struct('NSteps',1),...
                  test,     struct('Nh',Nh,'alpha',alpha','d',d,'beta',beta));
              
exp3 = Experiment('',           struct(),...
                  'Runnalls',      struct('Nr',Nr),...
                  '',           struct('NSteps',2),...
                  test,     struct('Nh',Nh,'alpha',alpha','d',d,'beta',beta));              
experiments = [exp1;exp2];
numExperiments = numel(experiments);




numMCRuns = 100;
NISEVector = zeros(numExperiments,numMCRuns);
timeVector = NISEVector;
MCKLDVector = NISEVector;
h = waitbar(0,'Processing...');
gmr_vector = cell(numExperiments,1);
%set(h,'Position', [550,350,280,70]);
for k=1:numMCRuns
    
    %disp(strcat(['MC Run: ',num2str(k),'/',num2str(numMCRuns)]));
    
    rngSeed = randi(10000000);
    waitbar(k/numMCRuns,h,strcat(['Processing...','Run: ',num2str(k),' of ',num2str(numMCRuns),'.']));
    for i=1:numExperiments
        experiments(i).setTestParams(struct('rngSeed',rngSeed));
        [gmr,gm,time] = experiments(i).execute();
        NISEVector(i,k) = nISE(gm,gmr);
        timeVector(i,k) = time;
        gmr_vector{i} = gmr;
    end
    MCKLDVector(:,k) = ApproxMCKLD(gm,gmr_vector,2000000);
    MCKLDVector(:,k)
    
end


close(h);
%%
avgnISE = sum(NISEVector,2)./numMCRuns;
avgTime = sum(timeVector,2)./numMCRuns;
avgMCKLD = sum(MCKLDVector,2)./numMCRuns;

T=table(avgnISE,avgTime,avgMCKLD);
rowNames = cell(numExperiments,1);
for i=1:numExperiments
    rowNames{i} = strcat('Experiment ',num2str(i));
end
T.Properties.RowNames = rowNames;
T.Properties.VariableUnits = {'NISE','s','MCKLD'};
disp(T)




