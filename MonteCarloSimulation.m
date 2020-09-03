
clear
close all

%Parameters to play with
global Nh Nr n alpha delta
Nh = 100;  %Full mixture component number
Nr = 10;   %Reduced mixture component number
n = 1;    %Dimension
NumTests = 10;

assert(Nh>=Nr,'The number of reduced components can not be higher than the original ones.');

alpha = 30;  %GM mean spreading factor
beta = 2; %GM covariance tuning parameter
delta = 0; %GM Init center offset

%Entropic Regularization Parameters
lambda = 0.0; %Entropy parameter
assert(lambda>=0,'The regularization parameter has to be non-negative.');

%CTDGMRA & MRICTDGMRA
maxiter = 100;
cost_measure = 'KLD'; %cost measure used to compute the cost matrix in the Composite transportation distance
init_method = 'greedy'; %We can choose between kmeans, greedy (Runnals or Wasserstein) and random
kRandomInit = 10;

%Expectation Maximization Parameters
nPoints = 1000;  %Evaluation points per dimension 
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

algorithms = {'Runnals','CTDGMRA','MRICTDGMRA'};
numAlgorithms = length(algorithms);
gmr_vector = {};
% gmr_times = zeros(1,numAlgorithms);


nISEVector = zeros(numAlgorithms,NumTests);
gmr_times = zeros(numAlgorithms,NumTests);
ERCTDVector = zeros(numAlgorithms,NumTests);
h = waitbar(0,'Processing...');


for m = 1:NumTests
    
    gm = GMGen(Nh,n,alpha,beta,delta);
    waitbar(m/NumTests,h)
    
    if any(contains(lower(algorithms),'williams'))
        tic;
        gm_Williams = WilliamsMRA(gm,Nr);
        [gm_Williams, nISETrajWilliams] = ISEOpt(gm,gm_Williams,sk,NOptSteps,optWeights);
        WilliamsTime = toc;
        gmr_times(contains(lower(algorithms),'williams'),m) = WilliamsTime;
        ERCTDVector(contains(lower(algorithms),'williams'),m) = ERCTD(gm,gm_Williams,cost_measure,lambda,maxiter);
        nISEVector(contains(lower(algorithms),'williams'),m) = nISE(gm,gm_Williams);
    end

    if any(contains(lower(algorithms),'gmrc'))
        tic;
        gm_GMRC = GMRC(gm,Nr,NKMeansSteps,sk,NOptSteps,optWeights);
        GMRCTime = toc;
        gmr_times(contains(lower(algorithms),'gmrc'),m) = GMRCTime;
        ERCTDVector(contains(lower(algorithms),'gmrc'),m) = ERCTD(gm,gm_GMRC,cost_measure,lambda,maxiter);
        nISEVector(contains(lower(algorithms),'gmrc'),m) = nISE(gm,gm_GMRC);
    end

    if any(contains(lower(algorithms),'runnals'))
        tic;
        gm_Runnals = RunnalsMRA(gm,Nr);
        RunnalsTime = toc;
        gmr_times(contains(lower(algorithms),'runnals'),m) = RunnalsTime;
        ERCTDVector(contains(lower(algorithms),'runnals'),m) = ERCTD(gm,gm_Runnals,cost_measure,lambda,maxiter);
        nISEVector(contains(lower(algorithms),'runnals'),m) = nISE(gm,gm_Runnals);
    end

    if any(contains(lower(algorithms),'wasserstein'))
        tic;
        gm_Wasserstein = WassersteinMRA(gm,Nr);
        WassersteinTime = toc;
        gmr_times(contains(lower(algorithms),'wasserstein'),m) = WassersteinTime;
        ERCTDVector(contains(lower(algorithms),'wasserstein'),m) = ERCTD(gm,gm_Wasserstein,cost_measure,lambda,maxiter);
        nISEVector(contains(lower(algorithms),'wasserstein'),m) = nISE(gm,gm_Wasserstein);
    end

    if any(contains(lower(algorithms),'salmond'))
        tic;
        gm_Salmond = SalmondMRA(gm,Nr);
        SalmondTime = toc;
        gmr_times(contains(lower(algorithms),'salmond'),m) = SalmondTime;
        ERCTDVector(contains(lower(algorithms),'salmond'),m) = ERCTD(gm,gm_Salmond,cost_measure,lambda,maxiter);
        nISEVector(contains(lower(algorithms),'salmond'),m) = nISE(gm,gm_Salmond);
    end

    if any(contains(lower(algorithms),'gmrcwas'))
        tic;
        gm_GMRCWas = GMRCWas(gm,Nr,NKMeansSteps);
        GMRCWasTime = toc;
        gmr_times(contains(lower(algorithms),'gmrcwas'),m) = GMRCWasTime;
        ERCTDVector(contains(lower(algorithms),'gmrcwas'),m) = ERCTD(gm,gm_GMRCWas,cost_measure,lambda,maxiter);
        nISEVector(contains(lower(algorithms),'gmrcwas'),m) = nISE(gm,gm_GMRCWas);
    end
    %%
    if any(contains(lower(algorithms),'ctdgmra'))
        tic;
        switch lower(init_method)
            case 'kmeans'
              gm_init = KMeans(gm,GMRGen(gm,Nr),cost_measure,NKMeansSteps);
              %gm_init = KMeans(gm,GMGen(Nr,n,alpha,beta,delta),cost_measure,NKMeansSteps);
            case 'greedy'
                if strcmp(cost_measure,'KLD')
                    gm_init = RunnalsMRA(gm,Nr);
                elseif strcmp(cost_measure,'W2')
                    gm_init = WassersteinMRA(gm,Nr);
                end
            case 'random'
                %gm_init = GMGen(Nr,n,alpha,beta,delta);
                gm_init = GMRGen(gm,Nr);
        end


        
        gm_CTDGMRA = CTDGMRA(gm,gm_init,cost_measure,lambda,maxiter);

        CTDGMRATime = toc;
        gmr_times(contains(lower(algorithms),'ctdgmra'),m) = CTDGMRATime;
        ERCTDVector(contains(lower(algorithms),'ctdgmra'),m) = ERCTD(gm,gm_CTDGMRA,cost_measure,lambda,maxiter);
        nISEVector(contains(lower(algorithms),'ctdgmra'),m) = nISE(gm,gm_CTDGMRA);
    end

    if any(contains(lower(algorithms),'mrictdgmra'))
        tic;
        [gm_MRICTDGMRA,gm_init_MRI] = MRICTDGMRA(gm,Nr,cost_measure,lambda,maxiter,kRandomInit);

        MRICTDGMRATime = toc;
        gmr_times(contains(lower(algorithms),'mrictdgmra'),m) = MRICTDGMRATime;
        ERCTDVector(contains(lower(algorithms),'mrictdgmra'),m) = ERCTD(gm,gm_MRICTDGMRA,cost_measure,lambda,maxiter);
        nISEVector(contains(lower(algorithms),'mrictdgmra'),m) = nISE(gm,gm_MRICTDGMRA);
    end


    if any(contains(lower(algorithms),'emmra'))

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
        gm_EM = EM(gm_init_EM,samples,NEMiter);
        EMTime = toc;
        gmr_times(contains(lower(algorithms),'emmra'),m) = EMTime;
        ERCTDVector(contains(lower(algorithms),'emmra'),m) = ERCTD(gm,gm_EM,cost_measure,lambda,maxiter);
        nISEVector(contains(lower(algorithms),'emmra'),m) = nISE(gm,gm_EM);
    end



    
end

close(h);
%%
avgnISE = sum(nISEVector,2)./NumTests
avgTime = sum(gmr_times,2)./NumTests
avgCTD = sum(ERCTDVector,2)./NumTests
