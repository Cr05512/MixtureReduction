
clear
close all

%Parameters to play with
global Nh Nr n alpha delta
Nh = 20;  %Full mixture component number
Nr = 5;   %Reduced mixture component number
n = 1;    %Dimension
NumTests = 100;

assert(Nh>=Nr,'The number of reduced components can not be higher than the original ones.');

alpha = 18;  %GM mean spreading factor
beta = 1; %GM covariance tuning parameter
delta = 0; %GM Init center offset

%Entropic Regularization Parameters
gamma = 0.1; %Entropy parameter
assert(gamma>=0,'The regularization parameter has to be non-negative.');
maxiter = 100;
cost_measure = 'KLD'; %cost measure used to compute the cost matrix in the Composite transportation distance
init_method = 'greedy'; %We can choose between kmeans, greedy (Runnals or Wasserstein) and random

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

algorithms = {'Runnals','CTDGMRA'};
numAlgorithms = length(algorithms);
gmr_vector = {};
% gmr_times = zeros(1,numAlgorithms);


nISEVector = zeros(numAlgorithms,NumTests);
timeVector = zeros(numAlgorithms,NumTests);
CTDVector = zeros(numAlgorithms,NumTests);
h = waitbar(0,'Processing...');


for m = 1:NumTests
    
    gm = GMGen(Nh,n,alpha,beta,delta);
    waitbar(m/NumTests,h)
    if any(contains(algorithms,'Williams'))
        tic;
        gm_Williams = WilliamsMRA(gm,Nr);
        [gm_Williams, nISETrajWilliams] = ISEOpt(gm,gm_Williams,sk,NOptSteps,optWeights);
        WilliamsTime = toc;
        timeVector(contains(algorithms,'Williams'),m) = WilliamsTime;
        nISEVector(contains(algorithms,'Williams'),m) = nISE(gm,gm_Williams);
        CTDVector(contains(algorithms,'Williams'),m) = CTD(gm,gm_Williams,cost_measure);
    end

    if any(contains(algorithms,'GMRC'))
        tic;
        gm_GMRC = GMRC(gm,Nr,NKMeansSteps,sk,NOptSteps,optWeights);
        GMRCTime = toc;
        timeVector(contains(algorithms,'GMRC'),m) = GMRCTime;
        nISEVector(contains(algorithms,'GMRC'),m) = nISE(gm,gm_GMRC);
        CTDVector(contains(algorithms,'GMRC'),m) = CTD(gm,gm_GMRC,cost_measure);
    end

    if any(contains(algorithms,'Runnals'))
        tic;
        gm_Runnals = RunnalsMRA(gm,Nr);
        RunnalsTime = toc;
        timeVector(contains(algorithms,'Runnals'),m) = RunnalsTime;
        nISEVector(contains(algorithms,'Runnals'),m) = nISE(gm,gm_Runnals);
        CTDVector(contains(algorithms,'Runnals'),m) = CTD(gm,gm_Runnals,cost_measure);
    end

    if any(contains(algorithms,'Wasserstein'))
        tic;
        gm_Wasserstein = WassersteinMRA(gm,Nr);
        WassersteinTime = toc;
        timeVector(contains(algorithms,'Wasserstein'),m) = WassersteinTime;
        nISEVector(contains(algorithms,'Wasserstein'),m) = nISE(gm,gm_Wasserstein);
        CTDVector(contains(algorithms,'Wasserstein'),m) = CTD(gm,gm_Wasserstein,cost_measure);
    end

    if any(contains(algorithms,'Salmond'))
        tic;
        gm_Salmond = SalmondMRA(gm,Nr);
        SalmondTime = toc;
        timeVector(contains(algorithms,'Salmond'),m) = SalmondTime;
        nISEVector(contains(algorithms,'Salmond'),m) = nISE(gm,gm_Salmond);
        CTDVector(contains(algorithms,'Salmond'),m) = CTD(gm,gm_Salmond,cost_measure);
    end

    if any(contains(algorithms,'GMRCWas'))
        tic;
        gm_GMRCWas = GMRCWas(gm,Nr,NKMeansSteps);
        GMRCWasTime = toc;
        timeVector(contains(algorithms,'GMRCWas'),m) = GMRCWasTime;
        nISEVector(contains(algorithms,'GMRCWas'),m) = nISE(gm,gm_GMRCWas);
        CTDVector(contains(algorithms,'GMRCWas'),m) = CTD(gm,gm_GMRCWas,cost_measure);
    end
    %%
    if any(contains(algorithms,'CTDGMRA'))
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



        gm_CTDGMRA = CTDGMRA(gm,gm_init,cost_measure,gamma,maxiter);
        CTDGMRATime = toc;
        timeVector(contains(algorithms,'CTDGMRA'),m) = CTDGMRATime;
        nISEVector(contains(algorithms,'CTDGMRA'),m) = nISE(gm,gm_CTDGMRA);
        CTDVector(contains(algorithms,'CTDGMRA'),m) = CTD(gm,gm_CTDGMRA,cost_measure);
    end

    if any(contains(algorithms,'EMMRA'))

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
                gm_init_EM = GMGen(Nr,n,alpha,beta,delta);
        end
        tic;
        samples = GMSamples(gm,nSamples);
        gm_EM = EM(gm_init_EM,samples,NEMiter);
        EMTime = toc;
        timeVector(contains(algorithms,'EMMRA'),m) = EMMRATime;
        nISEVector(contains(algorithms,'EMMRA'),m) = nISE(gm,gm_EMMRA);
        CTDVector(contains(algorithms,'EMMRA'),m) = CTD(gm,gm_EMMRA,cost_measure);
    end


    
end

close(h);
%%
avgnISE = sum(nISEVector,2)./NumTests
avgTime = sum(timeVector,2)./NumTests
avgCTD = sum(CTDVector,2)./NumTests
