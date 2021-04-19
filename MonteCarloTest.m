
clear
close all

Nh = 20;
Nr = 5;
d = 1;
alpha = 5;
beta = 0.1;

test = 'random';



exp1 = Experiment('',           {struct('rho',0.7),struct('k',2)},...
                  'GMRCw2',        struct('Nr',Nr,'seq',0),...
                  '',           {struct('nRings',5),struct()},...
                  test,          struct('Nh',Nh,'alpha',alpha','beta',beta,'d',d));              

              
exp2 = Experiment('',           {},...
                  'Williams',       struct('Nr',Nr),...
                  '',           {struct('costMeas','MKLDij','lambda',1),struct()},...
                  test,         struct('Nh',Nh,'alpha',alpha','beta',beta,'d',d));

exp3 = Experiment('',           {},...
                  'G2RA',       struct('Nr',Nr,'costMeas','W2ij'),...
                  'ERCTDRef',  {struct('costMeas','W2ij','lambda',0.0),struct()},...
                  test,         struct('Nh',Nh,'alpha',alpha','beta',beta,'d',d));
              
experiments = [exp1;exp3];
numExperiments = numel(experiments);


globalMeas = {struct('globMeas','ISE'),...
              struct('globMeas','NISE'),...
              struct('globMeas','KLD12','nPoints',10000),...
              struct('globMeas','CTD','costMeas','W2ij')}';

numMCRuns = 100;
perfMatrix = zeros(numExperiments,numMCRuns,numel(globalMeas)+1);
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
        gmr_vector{i} = gmr;
        for j=1:numel(globalMeas)
            perfMatrix(i,k,j) = evalGlobalMeas(gm,gmr,globalMeas{j});
        end
        perfMatrix(i,j,end) = time;
    end

    
end

%%
close(h);
perfMatrix = reshape(sum(perfMatrix,2)./numMCRuns,numExperiments,numel(globalMeas)+1);

T=array2table(perfMatrix);
rowNames = cell(numExperiments,1);
colNames = cell(numel(globalMeas,1));
for i=1:numel(globalMeas)
    colNames{i} = globalMeas{i}.globMeas;
end
colNames{end+1} = 'Time';
for i=1:numExperiments
    rowNames{i} = strcat(experiments(i).getAlgo,'-',experiments(i).getRef);
end
T.Properties.RowNames = rowNames;
T.Properties.VariableNames = colNames;
disp(T)




