clc
clear
close all

Nh = 20;
d = 1;
alpha = Nh/4;
rngSeed = randi(100000);

exp1 = Experiment('',           struct(),...
                  'Runnalls',      struct('Nr',5),...
                  '',     struct('NOptSteps',40,'sk',0.01),...
                  'random',     struct('Nh',Nh,'alpha',alpha','d',d,'rngSeed',rngSeed));
              
exp2 = Experiment('',           struct(),...
                  'GMRC',       struct('Nr',5,'ISEOpt',0,'NOptSteps',30,'sk',0.005),...
                  '',           struct('I',20),...
                  'random',     struct('Nh',Nh,'alpha',alpha','d',d,'rngSeed',rngSeed));
              
exp3 = Experiment('',           struct(),...
                  'PCMRA',      struct('Nr',5,'p',round(Nh/4),'lambda',0.05,'costMeas','KLD','redAlgo','Runnalls'),...
                  '',     struct('NOptSteps',30,'sk',0.005),...
                  'random',     struct('Nh',Nh,'alpha',alpha','d',d,'rngSeed',rngSeed));
              
experiments = [exp1;exp2;exp3];
numExperiments = numel(experiments);




numMCRuns = 50;
NISEVector = zeros(numExperiments,numMCRuns);
timeVector = NISEVector;
CTDVector = NISEVector;
h = waitbar(0,'Processing...');
set(h,'Position', [550,350,280,70]);
for k=1:numMCRuns
    clc
    disp(strcat(['MC Run: ',num2str(k),'/',num2str(numMCRuns)]));
    
    rngSeed = randi(100000000);
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




