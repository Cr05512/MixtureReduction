clc
clear
close all

Nh = 30;
Nr = 5;
d = 10;
alpha = 10;
beta = 0.09;
test = 'random';

exp1 = Experiment('',           struct(),...
                  'Runnalls',   struct('Nr',Nr),...
                  '',           struct(),...
                  test,     struct('Nh',Nh,'alpha',alpha','beta',beta,'d',d));
              
exp2 = Experiment('',           struct(),...
                  'Runnalls',       struct('Nr',Nr),...
                  'clusteringGMRC',           struct(),...
                  test,         struct('Nh',Nh,'alpha',alpha','beta',beta,'d',d));
              
exp3 = Experiment('',           struct(),...
                  'Runnalls',      struct('Nr',Nr),...
                  'clusteringApproxKLD',           struct(),...
                  test,     struct('Nh',Nh,'alpha',alpha','d',d,'beta',beta));
              
experiments = [exp1;exp3];
numExperiments = numel(experiments);




numMCRuns = 100;
NISEVector = zeros(numExperiments,numMCRuns);
timeVector = NISEVector;
CTDVector = NISEVector;
h = waitbar(0,'Processing...');
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
        %CTDVector(i,k) = CTD(gm,gmr,'KLD');
        CTDVector(i,k) = ApproxMCKLD(gm,gmr,1000000);
    end
    CTDVector(:,k)
    
end
%%

close(h);

avgnISE = sum(NISEVector,2)./numMCRuns;
avgTime = sum(timeVector,2)./numMCRuns;
avgCTD = sum(CTDVector,2)./numMCRuns;

T=table(avgnISE,avgTime,avgCTD);
rowNames = cell(numExperiments,1);
for i=1:numExperiments
    rowNames{i} = strcat('Experiment ',num2str(i));
end
T.Properties.RowNames = rowNames;
T.Properties.VariableUnits = {'NISE','s','CTD'};
disp(T)




