clc
clear
close all

Nh = 50;
Nr = 10;
d = 2;
alpha = Nh/3;
test = 'random';

exp1 = Experiment('',           struct(),...
                  'Runnalls',   struct('Nr',Nr),...
                  '',           struct('costMeas','MKLD','lambda',1.0,'I',10),...
                  test,     struct('Nh',Nh,'alpha',alpha','d',d));
              
exp2 = Experiment('',           struct(),...
                  'Runnalls',   struct('Nr',Nr),...
                  '',           struct('costMeas','MKLD','lambda',1.0,'I',10),...
                  test,     struct('Nh',Nh,'alpha',alpha','d',d));
                 
exp3 = Experiment('',           struct(),...
                  'newPCMRA',      struct('Nr',Nr,'p',3,'h',2,'lambda',0.2,'costMeas','KLD','redAlgo','Runnalls'),...
                  '',           struct(),...
                  test,     struct('Nh',Nh,'alpha',alpha','d',d));
              
experiments = [exp1;exp3];
numExperiments = numel(experiments);




numMCRuns = 100;
NISEVector = zeros(numExperiments,numMCRuns);
timeVector = NISEVector;
CTDVector = NISEVector;
h = waitbar(0,'Processing...');
%set(h,'Position', [550,350,280,70]);
for k=1:numMCRuns
    clc
    disp(strcat(['MC Run: ',num2str(k),'/',num2str(numMCRuns)]));
    
    rngSeed = randi(10000000);
    waitbar(k/numMCRuns,h,strcat(['Processing...','Run: ',num2str(k),' of ',num2str(numMCRuns),'.']));
    for i=1:numExperiments
        experiments(i).setTestParams(struct('rngSeed',rngSeed));
        [gmr,gm,time] = experiments(i).execute();
        NISEVector(i,k) = nISE(gm,gmr);
        timeVector(i,k) = time;
        CTDVector(i,k) = CTD(gm,gmr,'KLD');
    end
    
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




