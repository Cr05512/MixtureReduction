
clear
close all
%%
Nh = 25;
Nr = 5;
numMCRuns = 100;
d = 1;
alpha = randi(Nh)/(d^2);
beta = 2*rand();

test = 'random';



exp1 = Experiment('',           {struct('rho',0.7),struct('k',2)},...
                  'IL2MRA',        struct('Nr',Nr,'maxiter',150,'tol',1e-12),...
                  '',           {struct('costMeas','KLDij','lambda',0),struct()},...
                  test,          struct('Nh',Nh,'alpha',alpha','beta',beta,'d',d));              

              
exp2 = Experiment('',           {},...
                  'Williams',       struct('Nr',Nr),...
                  '',           {struct('costMeas','KLDij','lambda',0),struct()},...
                  test,         struct('Nh',Nh,'alpha',alpha,'beta',beta,'d',d));


exp3 = Experiment('',           {},...
                  'modWilliams',       struct('Nr',Nr,'maxiter',150,'tol',1e-12),...
                  '',  {struct('costMeas','KLDij','lambda',0.0),struct()},...
                  test,         struct('Nh',Nh,'alpha',alpha','beta',beta,'d',d));
              
experiments = [exp1;exp2;exp3];
numExperiments = numel(experiments);


globalMeas = {struct('globMeas','CTD','costMeas','L2ij'),struct('globMeas','ISE')}';


perfMatrix = zeros(numExperiments,numMCRuns,numel(globalMeas)+1);
h = waitbar(0,'Processing...');
gmr_vector = cell(numExperiments,1);
%set(h,'Position', [550,350,280,70]);
for k=1:numMCRuns
    
    %disp(strcat(['MC Run: ',num2str(k),'/',num2str(numMCRuns)]));
    
    rngSeed = randi(100000000);
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




