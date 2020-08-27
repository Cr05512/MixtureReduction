clc
clear
close all


%Parameters to play with
global Nh Nr n alpha delta
Nh = 4;  %Full mixture component number
Nr = 3;   %Reduced mixture component number
n = 1;    %Dimension

assert(Nh>=Nr,'The number of reduced components can not be higher than the original ones.');

alpha = 15;  %GM mean spreading factor
beta = 2; %GM covariance tuning parameter
delta = 0; %GM Init center offset

%Entropic Regularization Parameters
gamma = 0.1; %Entropy parameter
assert(gamma>=0,'The regularization parameter has to be non-negative.');
maxiter = 100;
cost_measure = 'KLD'; %cost measure used to compute the cost matrix in the Composite transportation distance
init_method = 'random'; %We can choose between kmeans, greedy (Runnals or Wasserstein) and random

%Expectation Maximization Parameters
nPoints = 300;  %Evaluation points per dimension 
nSamples = Nr*nPoints*n;
NEMiter = 10;
init_method_EM = 'greedy';

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

algorithms = {'Runnals','Wasserstein','CTDGMRA','EMMRA'};
numAlgorithms = length(algorithms);
gmr_vector = {};
gmr_times = zeros(1,numAlgorithms);

%Initial Gaussian Mixture

gm = GMGen(Nh,n,alpha,beta,delta);
%gm = test2CompGen(Nh,r);
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
end

if any(contains(algorithms,'Williams'))
    tic;
    gm_Williams = WilliamsMRA(gm,Nr);
    [gm_Williams, nISETrajWilliams] = ISEOpt(gm,gm_Williams,sk,NOptSteps,optWeights);
    WilliamsTime = toc;
    gmr_times(contains(algorithms,'Williams')) = WilliamsTime;
    gmr_vector(contains(algorithms,'Williams')) = {gm_Williams};
end

if any(contains(algorithms,'GMRC'))
    tic;
    gm_GMRC = GMRC(gm,Nr,NKMeansSteps,sk,NOptSteps,optWeights);
    GMRCTime = toc;
    gmr_times(contains(algorithms,'GMRC')) = GMRCTime;
    gmr_vector(contains(algorithms,'GMRC')) = {gm_GMRC};
end

if any(contains(algorithms,'Runnals'))
    tic;
    gm_Runnals = RunnalsMRA(gm,Nr);
    RunnalsTime = toc;
    gmr_times(contains(algorithms,'Runnals')) = RunnalsTime;
    gmr_vector(contains(algorithms,'Runnals')) = {gm_Runnals};
end

if any(contains(algorithms,'Wasserstein'))
    tic;
    gm_Wasserstein = WassersteinMRA(gm,Nr);
    WassersteinTime = toc;
    gmr_times(contains(algorithms,'Wasserstein')) = WassersteinTime;
    gmr_vector(contains(algorithms,'Wasserstein')) = {gm_Wasserstein};
end

if any(contains(algorithms,'Salmond'))
    tic;
    gm_Salmond = SalmondMRA(gm,Nr);
    SalmondTime = toc;
    gmr_times(contains(algorithms,'Salmond')) = SalmondTime;
    gmr_vector(contains(algorithms,'Salmond')) = {gm_Salmond};
end

if any(contains(algorithms,'GMRCWas'))
    tic;
    gm_GMRCWas = GMRCWas(gm,Nr,NKMeansSteps);
    GMRCWasTime = toc;
    gmr_times(contains(algorithms,'GMRCWas')) = GMRCWasTime;
    gmr_vector(contains(algorithms,'GMRCWas')) = {gm_GMRCWas};
end

if any(contains(algorithms,'CTDGMRA'))
  
    switch lower(init_method)
        case 'kmeans'
          gm_init = KMeans(gm,GMGen(Nr,n,alpha,beta,delta),cost_measure,NKMeansSteps);
        case 'greedy'
            if strcmp(cost_measure,'KLD')
                gm_init = gm_Runnals;
            elseif strcmp(cost_measure,'W2')
                gm_init = gm_Wasserstein;
            end
        case 'random'
            gm_init = GMGen(Nr,n,alpha,beta,delta);
    end

    tic;

    gm_CTDGMRA = CTDGMRA(gm,gm_init,cost_measure,gamma,maxiter);
    CTDGMRATime = toc;
    gmr_times(contains(algorithms,'CTDGMRA')) = CTDGMRATime;
    gmr_vector(contains(algorithms,'CTDGMRA')) = {gm_CTDGMRA};
end

if any(contains(algorithms,'EMMRA'))
    
    switch lower(init_method_EM)
        case 'kmeans'
          gm_init_EM = KMeans(gm,GMGen(Nr,n,alpha,beta,delta),cost_measure,NKMeansSteps);
        case 'greedy'
            if strcmp(cost_measure,'KLD')
                gm_init_EM = gm_Runnals;
            elseif strcmp(cost_measure,'W2')
                gm_init_EM = gm_Wasserstein;
            end
        case 'random'
            gm_init_EM = GMGen(Nr,n,alpha,beta,delta);
    end
    tic;
    samples = GMSamples(gm,nSamples);
    gm_EM = EM(gm_init_EM,samples,NEMiter);
    EMTime = toc;
    gmr_times(contains(algorithms,'EMMRA')) = EMTime;
    gmr_vector(contains(algorithms,'EMMRA')) = {gm_EM};
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
        end
        grid minor
        title(strcat('nISE: ',num2str(nISE(gm,gmr_vector{i})),' CTD',cost_measure,': ',num2str(CTD(gm,gmr_vector{i},cost_measure)),' Time: ',num2str(gmr_times(i)),'s'),'FontSize',14);
        if strcmp(algorithms{i},'CTDGMRA') || strcmp(algorithms{i},'EMMRA')
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
        title(strcat(algorithms{i},' MRA',' nISE: ',num2str(nISE(gm,gmr_vector{i})),' CTD',cost_measure,': ',num2str(CTD(gm,gmr_vector{i},cost_measure)),', Time: ',num2str(gmr_times(i)),'s'));

    end
else
    for i=1:numAlgorithms
        disp(strcat(algorithms{i},' MRA',' nISE: ',num2str(nISE(gm,gmr_vector{i})),' CTD',cost_measure,': ',num2str(CTD(gm,gmr_vector{i},cost_measure)),', Time: ',num2str(gmr_times(i)),'s'));
    end
end
