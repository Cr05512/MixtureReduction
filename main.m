clc
clear
close all


%Parameters to play with
global Nh Nr n alpha delta
Nh = 60;  %Full mixture component number
Nr = 8;   %Reduced mixture component number
n = 1;    %Dimension

assert(Nh>=Nr,'The number of reduced components can not be higher than the original ones.');

alpha = 30;  %GM mean spreading factor
beta = 2; %GM covariance tuning parameter
delta = 0; %GM Init center offset

%Entropic Regularization Parameters
lambda = 0.1; %Entropy parameter
assert(lambda>=0,'The regularization parameter has to be non-negative.');

%CTDGMRA & MRICTDGMRA
maxiter = 100;
cost_measure = 'KLD'; %cost measure used to compute the cost matrix in the Composite transportation distance
init_method = 'kmeans'; %We can choose between kmeans, greedy (Runnals or Wasserstein) and random
kRandomInit = 10;


assert(strcmp(cost_measure,'KLD') || strcmp(cost_measure,'W2'), 'Unknown cost measure. Aborting...');
assert(strcmpi(init_method,'random') || strcmpi(init_method,'kmeans') || strcmpi(init_method,'greedy'),'Unknown init method. Aborting...');

%Expectation Maximization Parameters
nPoints = 300;  %Evaluation points per dimension 
nSamples = Nh*nPoints*n;
NEMiter = 10;
init_method_EM = 'kmeans';

%KMeans Parameters
NKMeansSteps = 20;

%ISE Optimization Parameters
sk = 0.005; %Gradient step
NOptSteps = 50; %Gradient iterations
optWeights = 1; %flag to optimize weights or not

%List of algorithms we want to compare. We can choose between the
%following:
% - Williams -> Cost-Function-Based Gaussian Mixture Reduction for Target Tracking, J.L. Williams, P.S. Maybeck
% - Runnals -> Kullback-Leibler Approach to Gaussian Mixture Reduction, A.R. Runnals
% - Salmond -> Mixture reduction algorithms for target tracking in clutter, D.J. Salmond
% - GMRC -> Gaussian Mixture Reduction via Clustering, D. Schieferdecker, M.F. Huber
% - Wasserstein -> Wasserstein-Distance-Based Gaussian Mixture Reduction, A. Assa, K.N. Plataniotis
% - GMRCWas -> Wasserstein-Distance-Based Gaussian Mixture Reduction, A. Assa, K.N. Plataniotis
% - CTDMRA -> A Unified Framework for Gaussian Mixture Reduction with Composite Transportation Distance, Q. Zhang, J. Chen
% - EMMRA -> Expectation Maximization Refinement Algorithm

algorithms = {'Runnals','CTDGMRA','Salmond'};
numAlgorithms = length(algorithms);
gmr_vector = cell(numAlgorithms,1);
gmr_times = zeros(numAlgorithms,1);

%Initial Gaussian Mixture

gm = GMGen(Nh,n,alpha,beta,delta);
%gm = test3CompGen(Nh,20);
%gm = testWilliamsCompGen();
%gm = testRunnalsCompGen();
%gm = test5CompGen();
%gm = testCrouseCompGen();
%%

if n==1
    [maxMu,indMax] = max([gm.mu]);
    [minMu,indMin] = min([gm.mu]);
    maxSigma = max([gm.Sigma]);
    center = (maxMu-minMu)/2;
    
    X = linspace(-(abs(minMu) + 1.5*sqrt(maxSigma) + center), (abs(maxMu) + 1.5*sqrt(maxSigma) + center),nPoints);
elseif n==2
    x1 = linspace(-2*alpha, 2*alpha,nPoints);
    x2 = linspace(-2*alpha, 2*alpha,nPoints);
    [X1,X2] = meshgrid(x1,x2);
    X = [X1(:) X2(:)];

end

if numAlgorithms>0 && n<=2
    figure(1)
    set(gcf,'units','pixels','position',[300,1200,1280,720]);
end

for i=1:numAlgorithms
    switch lower(algorithms{i})
        case 'williams'
            tic;
            gmr = WilliamsMRA(gm,Nr);
            [gmr, nISETrajWilliams] = ISEOpt(gm,gmr,sk,NOptSteps,optWeights);
            time = toc;
            gmr_times(contains(lower(algorithms),'williams')) = time;
            gmr_vector(contains(lower(algorithms),'williams')) = {gmr};
        case 'gmrc'
            tic;
            gmr = GMRC(gm,Nr,NKMeansSteps,sk,NOptSteps,optWeights);
            time = toc;
            gmr_times(contains(lower(algorithms),'gmrc')) = time;
            gmr_vector(contains(lower(algorithms),'gmrc')) = {gmr};
        case 'runnals'
            tic;
            gmr = RunnalsMRA(gm,Nr);
            time = toc;
            gmr_times(contains(lower(algorithms),'runnals')) = time;
            gmr_vector(contains(lower(algorithms),'runnals')) = {gmr};
        case 'wasserstein'
            tic;
            gmr = WassersteinMRA(gm,Nr);
            time = toc;
            gmr_times(contains(lower(algorithms),'wasserstein')) = time;
            gmr_vector(contains(lower(algorithms),'wasserstein')) = {gmr};
        case 'salmond'
            tic;
            gmr = SalmondMRA(gm,Nr);
            time = toc;
            gmr_times(contains(lower(algorithms),'salmond')) = time;
            gmr_vector(contains(lower(algorithms),'salmond')) = {gmr};
        case 'gmrcwas'
            tic;
            gmr = GMRCWas(gm,Nr,NKMeansSteps);
            time = toc;
            gmr_times(contains(lower(algorithms),'gmrcwas')) = time;
            gmr_vector(contains(lower(algorithms),'gmrcwas')) = {gmr};
        case 'ctdgmra'
            tic;
            switch lower(init_method)
                case 'kmeans'
                  gm_init = KMeans(gm,SalmondMRA(gm,Nr),cost_measure,NKMeansSteps);
                  %gm_init = KMeans(gm,GMGen(Nr,n,alpha,beta,delta),cost_measure,NKMeansSteps);
                case 'greedy'
                    if strcmp(cost_measure,'KLD')
                        gm_init = SalmondMRA(gm,Nr);
                    elseif strcmp(cost_measure,'W2')
                        gm_init = WassersteinMRA(gm,Nr);
                    end
                case 'random'
                    %gm_init = GMGen(Nr,n,alpha,beta,delta);
                    gm_init = GMRGen(gm,Nr);
            end


            gmr = CTDGMRA(gm,gm_init,cost_measure,lambda,maxiter);

            time = toc;
            gmr_times(contains(lower(algorithms),'ctdgmra')) = time;
            gmr_vector(contains(lower(algorithms),'ctdgmra')) = {gmr};
        case 'mrictdgmra'
            tic;
            [gmr,gm_init_MRI] = MRICTDGMRA(gm,Nr,cost_measure,lambda,maxiter,kRandomInit);

            time = toc;
            gmr_times(contains(lower(algorithms),'mrictdgmra')) = time;
            gmr_vector(contains(lower(algorithms),'mrictdgmra')) = {gmr'};
        case 'emmra'
            switch lower(init_method_EM)
                case 'kmeans'
                  gm_init_EM = KMeans(gm,GMGen(Nr,n,alpha,beta,delta),cost_measure,NKMeansSteps);
                case 'greedy'
                    if strcmp(cost_measure,'KLD')
                        gm_init = RunnalsMRA(gm,Nr);
                    elseif strcmp(cost_measure,'W2')
                        gm_init = WassersteinMRA(gm,Nr);
                    end
                case 'random'
                    %gm_init_EM = GMGen(Nr,n,alpha,beta,delta);
                    gm_init_EM = GMRGen(gm,Nr);
            end
            tic;
            samples = GMSamples(gm,nSamples);
            gmr = EM(gm_init_EM,samples,NEMiter);
            time = toc;
            gmr_times(contains(lower(algorithms),'emmra')) = time;
            gmr_vector(contains(lower(algorithms),'emmra')) = {gmr};
    end

end


%%
if n==1
    numPlotCols = ceil(sqrt(numAlgorithms));
    numPlotRows = ceil(numAlgorithms/numPlotCols);
    
    for i=1:numAlgorithms
        subplot(numPlotRows,numPlotCols,i)
        plotGM1D(gm,X); hold on
        plotGM1D(gmr_vector{i},X); hold on
        if strcmp(algorithms{i},'CTDGMRA')
            plotGM1D(gm_init,X); hold on
        elseif strcmp(algorithms{i},'EMMRA')
            plotGM1D(gm_init_EM,X); hold on
        elseif strcmp(algorithms{i},'MRICTDGMRA')
            plotGM1D(gm_init_MRI,X); hold on
        end
        grid minor
        title(strcat('nISE: ',num2str(nISE(gm,gmr_vector{i})),' ERCTD',cost_measure,': ',num2str(ERCTD(gm,gmr_vector{i},cost_measure,lambda,maxiter)),' Time: ',num2str(gmr_times(i)),'s'),'FontSize',14);
        if strcmp(algorithms{i},'CTDGMRA') || strcmp(algorithms{i},'EMMRA') || strcmp(algorithms{i},'MRICTDGMRA')
            legend('Original',algorithms{i},'Init','FontSize',11);
        else
            legend('Original',algorithms{i},'FontSize',11);
        end
    end
elseif n==2
    numPlotCols = ceil(sqrt(numAlgorithms + 1));
    numPlotRows = ceil((numAlgorithms + 1)/numPlotCols);
    subplot(numPlotRows,numPlotCols,1)
    plotGM2D(gm,x1,x2,X); hold on
    title('Original Mixture')
    for i=1:numAlgorithms
        subplot(numPlotRows,numPlotCols,i+1)
        plotGM2D(gmr_vector{i},x1,x2,X);
        title(strcat(algorithms{i},' MRA',' nISE: ',num2str(nISE(gm,gmr_vector{i})),' ERCTD',cost_measure,': ',num2str(ERCTD(gm,gmr_vector{i},cost_measure,lambda,maxiter)),', Time: ',num2str(gmr_times(i)),'s'));

    end
else
    for i=1:numAlgorithms
        disp(strcat(algorithms{i},' MRA',' nISE: ',num2str(nISE(gm,gmr_vector{i})),' ERCTD',cost_measure,': ',num2str(ERCTD(gm,gmr_vector{i},cost_measure,lambda,maxiter)),', Time: ',num2str(gmr_times(i)),'s'));
    end
end
