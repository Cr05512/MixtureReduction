clc
clear
close all

Nh = 15;
dVec = [1 2 4 6 8 10 12 14];
alpha = Nh/3;

d = 1;

numMCRuns = 50;

              
exp2 = Experiment('',           struct(),...
                  'GMRC',       struct('Nr',5,'ISEOpt',0),...
                  '',           struct('I',10),...
                  'random',     struct('Nh',Nh,'alpha',alpha));
              
exp3 = Experiment('',           struct(),...
                  'PCMRA',      struct('Nr',5,'p',3,'lambda',0.05,'costMeas','KLD','redAlgo','Runnalls'),...
                  '',           struct('NOptSteps',50,'sk',0.005),...
                  'random',     struct('Nh',Nh,'alpha',alpha));
experiments = [exp2;exp3];
numExperiments = numel(experiments);

NISEVecTot = zeros(numExperiments,numel(dVec));
TimeVecTot = zeros(numExperiments,numel(dVec));
multiWaitbar( 'CloseAll' );

for n=1:numel(dVec)
    d = dVec(n);
    multiWaitbar( 'd steps',n/numel(dVec), 'Color', [0.8 0.0 0.1] );
    
    for i=1:numExperiments
        experiments(i).setTestParams(struct('d',d));
    end

    NISEVector = zeros(numExperiments,numMCRuns);
    timeVector = NISEVector;
    
    
    for k=1:numMCRuns

        rngSeed = randi(100000);
        
        for i=1:numExperiments
            experiments(i).setTestParams(struct('rngSeed',rngSeed));
            [gmr,gm,time] = experiments(i).execute();
            NISEVector(i,k) = nISE(gm,gmr);
            timeVector(i,k) = time;
        end
        multiWaitbar( 'MonteCarlo steps',  k/numMCRuns, 'Color', [0.2 0.9 0.3] );

    end
    
    NISEVecTot(:,n) = sum(NISEVector,2)./numMCRuns;
    TimeVecTot(:,n) = sum(timeVector,2)./numMCRuns;
end
multiWaitbar( 'CloseAll' );

%%

Legend = cell(numExperiments,1);
for i=1:numExperiments
    Legend{i} = experiments(i).getAlgo;
end

figure(1)
subplot(2,1,1)
for i=1:numExperiments
    plot(dVec,NISEVecTot(i,:)); hold on
end
grid minor
title('NISE');
legend(Legend);


subplot(2,1,2)
for i=1:numExperiments
    plot(dVec,TimeVecTot(i,:)); hold on
end
grid minor
title('Time');
legend(Legend);








