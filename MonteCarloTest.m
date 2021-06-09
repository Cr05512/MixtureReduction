
clear
close all
%%
Nh = 30;
Nr = 5;
numMCRuns = 500;
d = 1;
alpha = 5;
beta = 0.2;

test = 'random';



exp1 = Experiment('',           {struct('rho',0.7),struct('k',2)},...
                  'Runnalls',        struct('Nr',Nr,'seq',0),...
                  '',           {struct('costMeas','KLDij','lambda',0),struct()},...
                  test,          struct('Nh',Nh,'alpha',alpha','beta',beta,'d',d));              

              
exp2 = Experiment('',           {},...
                  'BDMRA',       struct('Nr',Nr,'costMeas','KLDij'),...
                  '',           {struct('costMeas','KLDBij','lambda',0),struct()},...
                  test,         struct('Nh',Nh,'alpha',alpha,'beta',beta,'d',d));


exp3 = Experiment('',           {},...
                  'Runnalls',       struct('Nr',Nr,'costMeas','W2ij'),...
                  '',  {struct('costMeas','KLDij','lambda',0.0),struct()},...
                  test,         struct('Nh',Nh,'alpha',alpha','beta',beta,'d',d));
              
experiments = [exp1;exp2];
numExperiments = numel(experiments);


globalMeas = {struct('globMeas','KLD12','nPoints',1000/(d^2)),...
              struct('globMeas','BD12','nPoints',1000/(d^2)),...
              struct('globMeas','CTD','costMeas','W2ij')}';


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
        perfMatrix(i,k,end) = time;
    end

    
end

%%
close(h);
%%
avgPerfMatrix = reshape(sum(perfMatrix,2)./numMCRuns,numExperiments,numel(globalMeas)+1);
stdMatrix = zeros(numel(experiments),numel(globalMeas)+1);
for i=1:numel(globalMeas)+1
    for j=1:numel(experiments)
        stdMatrix(j,i) = std(perfMatrix(j,:,i));
    end
end

%%

strAvgPerfMatrix = string(avgPerfMatrix);

for i=1:numel(globalMeas)+1
    for j=1:numel(experiments)
        strAvgPerfMatrix(j,i) = sprintf('%2.6f +- %2.6f',avgPerfMatrix(j,i),stdMatrix(j,i));
    end
end

T=array2table(strAvgPerfMatrix);
rowNames = cell(numExperiments,1);
colNames = cell(numel(globalMeas,1));
for i=1:numel(globalMeas)
    colNames{i} = globalMeas{i}.globMeas;
end
colNames{end+1} = 'Time';
for i=1:numExperiments
    str = strcat(num2str(i),'-',experiments(i).getAlgo);
    if ~isempty(experiments(i).getRef)
        str = strcat(str,'-',experiments(i).getRef);
    end
    rowNames{i} = str;
end
T.Properties.RowNames = rowNames;
T.Properties.VariableNames = colNames;
disp(T)




