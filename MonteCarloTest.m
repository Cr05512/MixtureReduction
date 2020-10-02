
clear
close all

%Parameters to play with
global Nh Nr n alpha delta
Nh = 20;  %Full mixture component number
Nr = 5;   %Reduced mixture component number
n = 1;    %Dimension
NumTests = 100;

assert(Nh>=Nr,'The number of reduced components can not be higher than the original ones.');

alpha = Nh/4;  %GM mean spreading factor
beta = 0.09; %GM covariance tuning parameter
delta = 0; %GM Init center offset

%Entropic Regularization Parameters
lambda = 0.1; %Entropy parameter
assert(lambda>=0,'The regularization parameter has to be non-negative.');

%CTDGMRA & MRICTDGMRA
maxiter = 100;
cost_measure = 'KLD'; %cost measure used to compute the cost matrix in the Composite transportation distance
init_method = 'greedy'; %We can choose between kmeans, greedy (Runnals or Wasserstein) and random
kRandomInit = Nh/4;

%Expectation Maximization Parameters
nPoints = 300;  %Evaluation points per dimension 
nSamples = Nh*nPoints*n;
NEMiter = 10;
init_method_EM = 'greedy';

%KMeans Parameters
NKMeansSteps = 100;

%ISE Optimization Parameters
opt = 0;
sk = 0.01; %Gradient step
NOptSteps = 20; %Gradient iterations
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

algorithms = {'Runnals','CTDGMRA','COWA'};
numAlgorithms = length(algorithms);
% gmr_times = zeros(1,numAlgorithms);


nISEVector = zeros(numAlgorithms,NumTests);
gmr_times = zeros(numAlgorithms,NumTests);
CTDVector = zeros(numAlgorithms,NumTests);
h = waitbar(0,'Processing...');


for m = 1:NumTests
    
    gm = GMGen(Nh,n,alpha,beta,delta);
    waitbar(m/NumTests,h)
    
    for i=1:numAlgorithms
        switch lower(algorithms{i})
            case 'williams'
                tic;
                gmr = WilliamsMRA(gm,Nr);
                [gmr, nISETrajWilliams] = ISEOpt(gm,gmr,sk,NOptSteps,optWeights);
                time = toc;
                gmr_times(contains(lower(algorithms),'williams'),m) = time;
                CTDVector(contains(lower(algorithms),'williams'),m) = CTD(gm,gmr,cost_measure);
                nISEVector(contains(lower(algorithms),'williams'),m) = nISE(gm,gmr);
            case 'gmrc'
                tic;
                gmr = GMRC(gm,Nr,NKMeansSteps,opt,sk,NOptSteps,optWeights);
                time = toc;
                gmr_times(contains(lower(algorithms),'gmrc'),m) = time;
                CTDVector(contains(lower(algorithms),'gmrc'),m) = CTD(gm,gmr,cost_measure);
                nISEVector(contains(lower(algorithms),'gmrc'),m) = nISE(gm,gmr);
            case 'runnals'
                tic;
                gmr = RunnalsMRA(gm,Nr);
                time = toc;
                gmr_times(contains(lower(algorithms),'runnals'),m) = time;
                CTDVector(contains(lower(algorithms),'runnals'),m) = CTD(gm,gmr,cost_measure);
                nISEVector(contains(lower(algorithms),'runnals'),m) = nISE(gm,gmr);
            case 'wasserstein'
                tic;
                gmr = WassersteinMRA(gm,Nr);
                time = toc;
                gmr_times(contains(lower(algorithms),'wasserstein'),m) = time;
                CTDVector(contains(lower(algorithms),'wasserstein'),m) = CTD(gm,gmr,cost_measure);
                nISEVector(contains(lower(algorithms),'wasserstein'),m) = nISE(gm,gmr);
            case 'salmond'
                tic;
                gmr = SalmondMRA(gm,Nr);
                time = toc;
                gmr_times(contains(lower(algorithms),'salmond'),m) = time;
                CTDVector(contains(lower(algorithms),'salmond'),m) = CTD(gm,gmr,cost_measure);
                nISEVector(contains(lower(algorithms),'salmond'),m) = nISE(gm,gmr);
            case 'cowa'
                tic;
                gmr = COWAMRA(gm,Nr);
                time = toc;
                gmr_times(contains(lower(algorithms),'cowa'),m) = time;
                CTDVector(contains(lower(algorithms),'cowa'),m) = CTD(gm,gmr,cost_measure);
                nISEVector(contains(lower(algorithms),'cowa'),m) = nISE(gm,gmr);
            case 'gmrcwas'
                tic;
                gmr = GMRCWas(gm,Nr,NKMeansSteps);
                time = toc;
                gmr_times(contains(lower(algorithms),'gmrcwas'),m) = time;
                CTDVector(contains(lower(algorithms),'gmrcwas'),m) = CTD(gm,gmr,cost_measure);
                nISEVector(contains(lower(algorithms),'gmrcwas'),m) = nISE(gm,gmr);
            case 'ctdgmra'
                tic;
                switch lower(init_method)
                    case 'kmeans'
                      gm_init = KMeans(gm,SalmondMRA(gm,Nr),cost_measure,NKMeansSteps);
                      %gm_init = KMeans(gm,GMGen(Nr,n,alpha,beta,delta),cost_measure,NKMeansSteps);
                    case 'greedy'
                        if strcmp(cost_measure,'KLD')
                            gm_init = SalmondMRA(AWCPruning(gm),Nr);
                        elseif strcmp(cost_measure,'W2')
                            gm_init = SalmondMRA(gm,Nr);
                        end
                    case 'random'
                        %gm_init = GMGen(Nr,n,alpha,beta,delta);
                        gm_init = GMRGen2(gm,Nr);
                end


                gmr = CTDGMRA(gm,gm_init,cost_measure,lambda,maxiter);
%                 if strcmp(cost_measure,'KLD')
%                     gmr = ISEOpt(gm,gmr,sk,NOptSteps,optWeights);
%                 end

                time = toc;
                gmr_times(contains(lower(algorithms),'ctdgmra'),m) = time;
                CTDVector(contains(lower(algorithms),'ctdgmra'),m) = CTD(gm,gmr,cost_measure);
                nISEVector(contains(lower(algorithms),'ctdgmra'),m) = nISE(gm,gmr);
            case 'mrictdgmra'
                tic;
                [gmr,gm_init_MRI] = MRICTDGMRA(AWCPruning(gm),Nr,cost_measure,lambda,maxiter,kRandomInit);

                time = toc;
                gmr_times(contains(lower(algorithms),'mrictdgmra'),m) = time;
                CTDVector(contains(lower(algorithms),'mrictdgmra'),m) = CTD(gm,gmr,cost_measure);
                nISEVector(contains(lower(algorithms),'mrictdgmra'),m) = nISE(gm,gmr);
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
                gmr_times(contains(lower(algorithms),'emmra'),m) = time;
                CTDVector(contains(lower(algorithms),'emmra'),m) = CTD(gm,gmr,cost_measure);
                nISEVector(contains(lower(algorithms),'emmra'),m) = nISE(gm,gmr);
        end

    end

   
    
end

close(h);
%%
avgnISE = sum(nISEVector,2)./NumTests;
avgTime = sum(gmr_times,2)./NumTests;
avgCTD = sum(CTDVector,2)./NumTests;

T=table(avgnISE,avgTime,avgCTD);
T.Properties.RowNames = algorithms;
T.Properties.VariableUnits = {'NISE','s','CTD'};
disp(T)
