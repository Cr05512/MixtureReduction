
clear
close all

Nh = 20;
Nr = 5;
d = 1;
alpha = 5;
beta = 0.3;

test = 'random';

exp1 = Experiment('',           {struct('rho',0.3)},...
                  'Runnalls',   struct('Nr',Nr),...
                  'ISEOptCon',           {struct()},...
                  test,     struct('Nh',Nh,'alpha',alpha','beta',beta,'d',d));              

              
exp2 = Experiment('',           {},...
                  'Runnalls',       struct('Nr',Nr),...
                  'NISEOptCon',           {struct()},...
                  test,         struct('Nh',Nh,'alpha',alpha','beta',beta,'d',d));

exp3 = Experiment('',           {},...
                  'Runnalls',       struct('Nr',Nr),...
                  'clusteringISUTKLD',  {struct('NSteps',2,'numRings',1)},...
                  test,         struct('Nh',Nh,'alpha',alpha','beta',beta,'d',d));
 
experiments = [exp1;exp2];
numExperiments = numel(experiments);




numMCRuns = 100;
NISEVector = zeros(numExperiments,numMCRuns);
timeVector = NISEVector;
ISEVector = NISEVector;
ISMCKLDVector = NISEVector;
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
        ISEVector(i,k) = ISE(gm,gmr);
        gmr_vector{i} = gmr;
    end
%     ISMCKLDVector(:,k) = ISMCKLD(gm,gmr_vector);
%     ISMCKLDVector(:,k)
    
end


close(h);
%%
avgNISE = sum(NISEVector,2)./numMCRuns;
avgTime = sum(timeVector,2)./numMCRuns;
avgISE = sum(ISEVector,2)./numMCRuns;
% avgISUTKLD = sum(ISUTKLDVector,2)./numMCRuns;
% avgISMCKLD = sum(ISMCKLDVector,2)./numMCRuns;

T=table(avgNISE,avgISE,avgTime);
rowNames = cell(numExperiments,1);
for i=1:numExperiments
    rowNames{i} = strcat('Experiment ',num2str(i));
end
T.Properties.RowNames = rowNames;
disp(T)




