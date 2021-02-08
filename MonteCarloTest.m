
clear
close all

Nh = 10;
Nr = 5;
d = 10;
alpha = 2;
beta = 0.09;
showPlot = 1;

test = 'random';

exp1 = Experiment('',           struct(),...
                  'Runnalls',   struct('Nr',Nr),...
                  '',           struct('costMeas','bhattD','lambda',0.0),...
                  test,     struct('Nh',Nh,'alpha',alpha','beta',beta,'d',d));              

              
exp2 = Experiment('',           struct(),...
                  'Runnalls',       struct('Nr',Nr),...
                  'clusteringUTKLD',           struct('NSteps',2,'numRings',5,'order','descend'),...
                  test,         struct('Nh',Nh,'alpha',alpha','beta',beta,'d',d));

exp3 = Experiment('',           struct(),...
                  'Runnalls',       struct('Nr',Nr),...
                  'clusteringUTKLDord+clusteringUTKLDord',  struct('NSteps',1,'numRings',6,'order',{'ascend','descend'}),...
                  test,         struct('Nh',Nh,'alpha',alpha','beta',beta,'d',d));      
experiments = [exp1;exp2;exp3];
numExperiments = numel(experiments);




numMCRuns = 50;
NISEVector = zeros(numExperiments,numMCRuns);
timeVector = NISEVector;
UTKLDVector = NISEVector;
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
        UTKLDVector(i,k) = UTKLD(gm,gmr,10);
        gmr_vector{i} = gmr;
    end
    MCKLDVector(:,k) = ApproxMCKLD(gm,gmr_vector);
    MCKLDVector(:,k)
    
end


close(h);
%%
avgnISE = sum(NISEVector,2)./numMCRuns;
avgTime = sum(timeVector,2)./numMCRuns;
avgUTKLD = sum(UTKLDVector,2)./numMCRuns;
avgMCKLD = sum(MCKLDVector,2)./numMCRuns;

T=table(avgnISE,avgTime,avgUTKLD,avgMCKLD);
rowNames = cell(numExperiments,1);
for i=1:numExperiments
    rowNames{i} = strcat('Experiment ',num2str(i));
end
T.Properties.RowNames = rowNames;
disp(T)




