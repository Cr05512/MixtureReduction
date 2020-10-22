clc
clear
close all


global Nh Nr d alpha delta
Nh = 8;  %Full mixture component number
Nr = 4;   %Reduced mixture component number
d = 1;    %State dimension

assert(Nh>=Nr,'The number of reduced components can not be higher than the original ones.');

availableMeasVec = {'KLD','W2','GJSD','MKLD','L2'}; %Vector of available dissimilarity measures
availableInitMethodVec = {'KMeans','Greedy','Random'}; %Vector of available initialization methods
availableTests = {'Random','Test2','Test3','Test4','Test5','Williams','Runnals','Crouse'};
availableAlgorithms = {'Williams','Runnals','Salmond','West','COWA','GMRC','Wasserstein','GMRCWas','EM','DPHEM','CTDGMRA','BF','Custom'};

%Available Tests description:
% - Random, the full mixture is generated randomly according to the GMGen function,
% - Test2, Test3, Test4, the full mixture is bivariate. Check documentation for more details.
% - Williams, the full mixture is generated according to the example
%   proposed in the Williams' Master's thesis. Check doc for more details.
% - Runnals, the full mixture is generated according to the example
%   proposed in the Runnals' paper. Check doc for more details.
% - Crouse, the full mixture is generated according to the example proposed
%   in the Crouse's paper. Check doc for more details.

test = 'test4';
assert(any(strcmpi(availableTests,test)), strcat(['Unknown test. The available tests are:',' ',strjoin(availableTests,', '),'.']));


%List of algorithms we want to compare. We can choose between the
%following:
% - Williams -> Cost-Function-Based Gaussian Mixture Reduction for Target Tracking, J.L. Williams, P.S. Maybeck
% - Runnals -> Kullback-Leibler Approach to Gaussian Mixture Reduction, A.R. Runnals
% - Salmond -> Mixture reduction algorithms for target tracking in clutter, D.J. Salmond
% - West -> Approximating Posterior Distributions by Mixture, M. West - Pass 0 for West algorithm and 1 for Enhanced West in the third parameter
% - COWA -> Constrained optimized weight adaption for Gaussian mixture reduction, H.Chen, K. C. Chang, C. Smith
% - GMRC -> Gaussian Mixture Reduction via Clustering, D. Schieferdecker, M.F. Huber
% - Wasserstein -> Wasserstein-Distance-Based Gaussian Mixture Reduction, A. Assa, K.N. Plataniotis
% - GMRCWas -> Wasserstein-Distance-Based Gaussian Mixture Reduction, A. Assa, K.N. Plataniotis
% - EM -> Maximum Likelihood from Incomplete Data via the EM Algorithm,  A. P. Dempster, N. M. Laird, D. B. Rubin
% - DPHEM -> Density-Preserving Hierarchical EM Algorithm: Simplifying GMMs for Approximate Inference, L. Yu, T. Yang, A. B. Chan
% - CTDMRA -> A Unified Framework for Gaussian Mixture Reduction with Composite Transportation Distance, Q. Zhang, J. Chen
% - BF -> A Look at Gaussian Mixture Reduction Algorithms, D. F. Crouse, P.Willett, K. Pattipati, L. Svensson
% - Custom -> Write your own algorithm and fill in the custom case in the loop below



%Type in the following list the algorithms you want to compare, with the
%name written as in the above list.
algorithms = {'Runnals'}; %Algorithms to compare

assert(all(ismember(lower(algorithms),lower(availableAlgorithms))), strcat(['Unknown algorithm(s). The available algorithms are:',' ',strjoin(availableAlgorithms,', '),'.']));



%Full mixture generation parameters
alpha = Nh/4;  %GM component means spreading factor
beta = 0.09; %GM component covariances tuning parameter
delta = 0; %GM component center offsets

%Pruning parameters
pruneGMComps = 0; %If set to 0 no pruning is performed on the full mixture, if set to 1 a pruning will be applied before further processing
pruningMethod = 1; %If pruning is enabled, set this parameter to 0 for standard pruning or set it to 1 for adaptive pruning.
pruningThresh = 0.01;
rho = 0.9544; % set to default at 2*sigma "explanation" in the Adaptive pruning.
assert(pruneGMComps==0 || pruneGMComps==1,'Pruning can be either performed (1) or not (0).');
assert(pruningMethod==0 || pruningMethod==1,'Pruning methods can be either standard (0) or adaptive (1).');

%Plot parameters
nPoints = 300;  %Evaluation points in plots (300 points are used to represent the mixture supports)

%Entropic Regularization Parameters
lambda = 0.0; %Entropy parameter (set to 0 (using either KLD, W2 or L2 as measures)
            %if you want to emulate the corresponding hard clustering algorithms,
            %set to 1 using MKLD to emulate the DPHEM)
maxiter = 100;

cost_measure = 'KLD'; %cost measure used to compute the cost matrix in the Composite transportation distance - KLD / W2 / GJSD / MKLD / L2
init_method = 'greedy'; %We can choose between kmeans, greedy and random
assert(any(strcmpi(availableMeasVec,cost_measure)), strcat(['Unknown cost measure. The available measures are:',' ',strjoin(availableMeasVec,', '),'.']));
assert(any(strcmpi(availableInitMethodVec,init_method)),'Unknown init method for the CTDGMRA. Aborting...');

%West/eWest algorithms parameters
algo = 0;
gamma = Inf;

%EM/DPHEM Parameters
EMSamples = 150*Nh*d;
I = Nh; %DPHEM Samples. Use this parameter carefully. By setting it too high the DPHEM algorithm incurs in numerical problems.
NEMiter = 100;
init_method_EM = 'greedy';
assert(any(strcmpi(availableInitMethodVec,init_method_EM)),'Unknown init method for the EM/DPHEM algorithm. Aborting...');


%KMeans Parameters
NKMeansSteps = 100;

%ISE Optimization Parameters
opt = 0; %Set this parameter to 0 to skip ISE optimization in the algorithms concerning it, set it to 1 to perform the optimization
sk = 0.005; %Gradient step
NOptSteps = 1000; %Gradient iterations
optWeights = 1; %flag to optimize weights or not




numAlgorithms = length(algorithms);
gmr_vector = cell(numAlgorithms,1);
gmr_times = zeros(numAlgorithms,1);

%Initial Gaussian Mixture
switch lower(test)
    case 'random'
        gm = GMGen(Nh,d,alpha,beta,delta);
    case 'test2'
        gm = test2CompGen(Nh,5);
    case 'test3'
        gm = test3CompGen(Nh,5);
    case 'test4'
        gm = test4CompGen(Nh,5);
    case 'test5'
        gm = test5CompGen();
    case 'williams'
        gm = testWilliamsCompGen();
    case 'runnals'
        gm = testRunnalsCompGen();
    case 'crouse'
        gm = testCrouseCompGen();
    otherwise
        disp('Unknown test.');
end
%%
fullMixture = gm;
if pruneGMComps==1
    if pruningMethod==0
        gm = prune(gm,pruningThresh);
    elseif pruningMethod==1
        gm = AWCPruning(gm,rho);
    end
    Nh = length(gm);
    if Nh==0
        disp('All the components have been pruned, choose another pruning threshold.');
        return
    end
end

if d==1
    [maxMu,indMax] = max([gm.mu]);
    [minMu,indMin] = min([gm.mu]);
    maxSigma = max([gm.Sigma]);
    center = (maxMu - minMu)/2;
    
    X = linspace(-(abs(minMu) + 2*sqrt(maxSigma) + center), (abs(maxMu) + 2*sqrt(maxSigma) + center),nPoints);
elseif d==2
    x1 = linspace(-2*alpha, 2*alpha,nPoints);
    x2 = linspace(-2*alpha, 2*alpha,nPoints);
    [X1,X2] = meshgrid(x1,x2);
    X = [X1(:) X2(:)];

end

for i=1:numAlgorithms
    switch lower(algorithms{i})
    
        case 'custom'
            tic;
            gmr = CustomMRA();
            time = toc;
            gmr_times(strcmpi(algorithms,'custom')) = time;
            gmr_vector(strcmpi(algorithms,'custom')) = {gmr};
        
        case 'williams'
            tic;
            gmr = WilliamsMRA(gm,Nr);
            [gmr, nISETrajWilliams] = ISEOpt(fullMixture,gmr,sk,NOptSteps,optWeights);
            time = toc;
            gmr_times(strcmpi(algorithms,'williams')) = time;
            gmr_vector(strcmpi(algorithms,'williams')) = {gmr};
        case 'gmrc'
            tic;
            gmr = GMRC(fullMixture,Nr,NKMeansSteps,opt,sk,NOptSteps,optWeights);
            time = toc;
            gmr_times(strcmpi(algorithms,'gmrc')) = time;
            gmr_vector(strcmpi(algorithms,'gmrc')) = {gmr};
        case 'runnals'
            %%
            tic;
            gmr = RunnalsMRA(gm,Nr);
            time = toc;
            gmr_times(strcmpi(algorithms,'runnals')) = time;
            gmr_vector(strcmpi(algorithms,'runnals')) = {gmr};
            %%
        case 'wasserstein'
            tic;
            gmr = WassersteinMRA(gm,Nr);
            time = toc;
            gmr_times(strcmpi(algorithms,'wasserstein')) = time;
            gmr_vector(strcmpi(algorithms,'wasserstein')) = {gmr};
        case 'salmond'
            tic;
            gmr = SalmondMRA(gm,Nr);
            time = toc;
            gmr_times(strcmpi(algorithms,'salmond')) = time;
            gmr_vector(strcmpi(algorithms,'salmond')) = {gmr};
        case 'west'
            tic;
            gmr = WestMRA(gm,Nr,algo,gamma);
            time = toc;
            gmr_times(strcmpi(algorithms,'west')) = time;
            gmr_vector(strcmpi(algorithms,'west')) = {gmr};
        case 'cowa'
            tic;
            gmr = COWAMRA(gm,Nr,algo,gamma);
            time = toc;
            gmr_times(strcmpi(algorithms,'cowa')) = time;
            gmr_vector(strcmpi(algorithms,'cowa')) = {gmr};
        case 'bf'
            tic;
            gmr = bruteForceGaussMixRed(fullMixture,Nr,true);
            gmr = ISEOpt(fullMixture,gmr,sk,NOptSteps,optWeights);
            time = toc;
            gmr_times(strcmpi(algorithms,'bf')) = time;
            gmr_vector(strcmpi(algorithms,'bf')) = {gmr};
        case 'gmrcwas'
            tic;
            gmr = GMRCWas(gm,Nr,NKMeansSteps);
            time = toc;
            gmr_times(strcmpi(algorithms,'gmrcwas')) = time;
            gmr_vector(strcmpi(algorithms,'gmrcwas')) = {gmr};
            %%
        case 'ctdgmra'
            tic;
            switch lower(init_method)
                case 'kmeans'
                  gm_init = KMeans(fullMixture,GMRGen2(gm,Nr),cost_measure,NKMeansSteps);
                  %gm_init = KMeans(gm,GMGen(Nr,d,alpha,beta,delta),cost_measure,NKMeansSteps);
                case 'greedy'
                    if strcmpi(cost_measure,'W2')
                        gm_init = WassersteinMRA(gm,Nr);
                   % elseif strcmp(cost_measure,'L2')
                   %     gm_init = WilliamsMRA(gm,Nr);
                    else
                        gm_init = RunnalsMRA(gm,Nr);
                    end
                case 'random'
                    %gm_init = GMGen(Nr,d,alpha,beta,delta);
                    gm_init = GMRGen2(gm,Nr);
            end

            gmr = CTDGMRA(fullMixture,gm_init,cost_measure,lambda,maxiter,I);

            time = toc;
            gmr_times(strcmpi(algorithms,'ctdgmra')) = time;
            gmr_vector(strcmpi(algorithms,'ctdgmra')) = {gmr};
        case 'em'
            tic;
            switch lower(init_method_EM)
                case 'kmeans'
                  gm_init_EM = KMeans(fullMixture,GMRGen2(gm,Nr),cost_measure,NKMeansSteps);
                case 'greedy'
                    if strcmpi(cost_measure,'W2')
                        gm_init_EM = WassersteinMRA(gm,Nr);
                   % elseif strcmp(cost_measure,'L2')
                   %     gm_init_EM = WilliamsMRA(gm,Nr);
                    else
                        gm_init_EM = RunnalsMRA(gm,Nr);
                    end
                case 'random'
                    %gm_init_EM = GMGen(Nr,d,alpha,beta,delta);
                    gm_init_EM = GMRGen2(gm,Nr);
            end

            samples = GMSamples(fullMixture,EMSamples);
            gmr = EM(gm_init_EM,samples,NEMiter);
            time = toc;
            gmr_times(strcmpi(algorithms,'em')) = time;
            gmr_vector(strcmpi(algorithms,'em')) = {gmr};

        case 'dphem'
            tic;
            switch lower(init_method_EM)
                case 'kmeans'
                    gm_init_EM = KMeans(fullMixture,GMRGen2(gm,Nr),cost_measure,NKMeansSteps);
                case 'greedy'
                    if strcmpi(cost_measure,'W2')
                        gm_init_EM = WassersteinMRA(gm,Nr);
                    else
                        gm_init_EM = RunnalsMRA(gm,Nr);
                    end
                case 'random'
                    %gm_init_EM = GMGen(Nr,d,alpha,beta,delta);
                    gm_init_EM = GMRGen(gm,Nr);
            end
            gmr = DPHEM(fullMixture,gm_init_EM,I,NEMiter);
            time = toc;
            gmr_times(strcmpi(algorithms,'dphem')) = time;
            gmr_vector(strcmpi(algorithms,'dphem')) = {gmr};
        otherwise
            disp(strcat('The algorithm "',algorithms{i},'" is not available.'));
    end

end

if numAlgorithms>0 && d<=2
    figure(1)
    set(gcf,'units','pixels','position',[300,1200,1280,720]);
end


%%
if d==1
    numPlotCols = ceil(sqrt(numAlgorithms));
    numPlotRows = ceil(numAlgorithms/numPlotCols);
    
    for i=1:numAlgorithms
        subplot(numPlotRows,numPlotCols,i)
        plotGM1D(fullMixture,X); hold on
        plotGM1D(gmr_vector{i},X); hold on
        if strcmp(algorithms{i},'CTDGMRA')
            plotGM1D(gm_init,X); hold on
        elseif strcmp(algorithms{i},'EM') || strcmp(algorithms{i},'DPHEM')
            plotGM1D(gm_init_EM,X); hold on
        end
        grid minor
        title(strcat('nISE: ',num2str(nISE(fullMixture,gmr_vector{i})),' CTD',cost_measure,': ',num2str(CTD(fullMixture,gmr_vector{i},cost_measure)),' Time: ',num2str(gmr_times(i)),'s'),'FontSize',14);
        if any(strcmpi(algorithms{i},{'CTDGMRA','EM','DPHEM'}))
            legend('Original',algorithms{i},'Init','FontSize',11);
        else
            legend('Original',algorithms{i},'FontSize',11);
        end
    end
elseif d==2
    numPlotCols = ceil(sqrt(numAlgorithms + 1));
    numPlotRows = ceil((numAlgorithms + 1)/numPlotCols);
    subplot(numPlotRows,numPlotCols,1)
    plotGM2D(fullMixture,x1,x2,X); hold on
    title('Original Mixture')
    for i=1:numAlgorithms
        subplot(numPlotRows,numPlotCols,i+1)
        plotGM2D(gmr_vector{i},x1,x2,X);
        title(strcat(algorithms{i},' MRA',' nISE: ',num2str(nISE(fullMixture,gmr_vector{i})),' CTD',cost_measure,': ',num2str(CTD(fullMixture,gmr_vector{i},cost_measure)),', Time: ',num2str(gmr_times(i)),'s'));

    end
else
    nISEVec = zeros(numAlgorithms,1);
    CTDVec = nISEVec;
    TimeVec = nISEVec;
    
    for i=1:numAlgorithms
        nISEVec(i) = nISE(fullMixture,gmr_vector{i});
        CTDVec(i) = CTD(fullMixture,gmr_vector{i},cost_measure);
        TimeVec(i) = gmr_times(i);
    end
    
    nISEVec =  str2num(sprintf('%3.7f\n',nISEVec));
    CTDVec = str2num(sprintf('%3.7f\n',CTDVec));
    TimeVec = str2num(sprintf('%3.7f\n',TimeVec));
    
    T=table(nISEVec,CTDVec,TimeVec);
    T.Properties.RowNames = algorithms;
    T.Properties.VariableNames = {'nISE',strcat('CTD',cost_measure),'Time'};
    T.Properties.VariableUnits = {'NISE','CTD','s'};
    disp(T)
    
end
