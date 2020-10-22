
clear
close all

%Parameters to play with
global Nh Nr d alpha delta
Nh = 40;  %Full mixture component number
Nr = 5;   %Reduced mixture component number
d = 1;    %Dimension
NumTests = 100; %Number of MC runs

availableMeasVec = {'KLD','W2','GJSD','MKLD','L2'}; %Vector of available dissimilarity measures
availableInitMethodVec = {'KMeans','Greedy','Random'}; %Vector of available initialization methods


assert(Nh>=Nr,'The number of reduced components can not be higher than the original ones.');

alpha = Nh/4;  %GM mean spreading factor
beta = 0.09; %GM covariance tuning parameter
delta = 0; %GM Init center offset

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
lambda = 0.1; %Entropy parameter (set to 0 (using either KLD, W2 or L2 as measures)
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
opt = 0;
sk = 0.01; %Gradient step
NOptSteps = 20; %Gradient iterations
optWeights = 1; %flag to optimize weights or not

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


algorithms = {'Runnals','CTDGMRA'};
numAlgorithms = length(algorithms);
% gmr_times = zeros(1,numAlgorithms);


nISEVector = zeros(numAlgorithms,NumTests);
gmr_times = zeros(numAlgorithms,NumTests);
CTDVector = zeros(numAlgorithms,NumTests);
h = waitbar(0,'Processing...');


for m = 1:NumTests
    
    gm = GMGen(Nh,d,alpha,beta,delta);
    
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

    waitbar(m/NumTests,h)
    
    for i=1:numAlgorithms
        switch lower(algorithms{i})
            
        case 'custom'
            tic;
            gmr = CustomMRA();
            time = toc;
            gmr_times(strcmpi(algorithms,'custom'),m) = time;
            CTDVector(strcmpi(algorithms,'custom'),m) = CTD(gm,gmr,cost_measure);
            nISEVector(strcmpi(algorithms,'custom'),m) = nISE(gm,gmr);
        case 'williams'
            tic;
            gmr = WilliamsMRA(gm,Nr);
            [gmr, nISETrajWilliams] = ISEOpt(fullMixture,gmr,sk,NOptSteps,optWeights);
            time = toc;
            gmr_times(strcmpi(algorithms,'williams'),m) = time;
            CTDVector(strcmpi(algorithms,'williams'),m) = CTD(gm,gmr,cost_measure);
            nISEVector(strcmpi(algorithms,'williams'),m) = nISE(gm,gmr);
        case 'gmrc'
            tic;
            gmr = GMRC(fullMixture,Nr,NKMeansSteps,opt,sk,NOptSteps,optWeights);
            time = toc;
            gmr_times(strcmpi(algorithms,'gmrc'),m) = time;
            CTDVector(strcmpi(algorithms,'gmrc'),m) = CTD(gm,gmr,cost_measure);
            nISEVector(strcmpi(algorithms,'gmrc'),m) = nISE(gm,gmr);
        case 'runnals'
            tic;
            gmr = RunnalsMRA(gm,Nr);
            time = toc;
            gmr_times(strcmpi(algorithms,'runnals'),m) = time;
            CTDVector(strcmpi(algorithms,'runnals'),m) = CTD(gm,gmr,cost_measure);
            nISEVector(strcmpi(algorithms,'runnals'),m) = nISE(gm,gmr);
        case 'wasserstein'
            tic;
            gmr = WassersteinMRA(gm,Nr);
            time = toc;
            gmr_times(strcmpi(algorithms,'wasserstein'),m) = time;
            CTDVector(strcmpi(algorithms,'wasserstein'),m) = CTD(gm,gmr,cost_measure);
            nISEVector(strcmpi(algorithms,'wasserstein'),m) = nISE(gm,gmr);
        case 'west'
            tic;
            gmr = WestMRA(gm,Nr,algo,gamma);
            time = toc;
            gmr_times(strcmpi(algorithms,'west'),m) = time;
            CTDVector(strcmpi(algorithms,'west'),m) = CTD(gm,gmr,cost_measure);
            nISEVector(strcmpi(algorithms,'west'),m) = nISE(gm,gmr);
        case 'salmond'
            tic;
            gmr = SalmondMRA(gm,Nr);
            time = toc;
            gmr_times(strcmpi(algorithms,'salmond'),m) = time;
            CTDVector(strcmpi(algorithms,'salmond'),m) = CTD(gm,gmr,cost_measure);
            nISEVector(strcmpi(algorithms,'salmond'),m) = nISE(gm,gmr);
        case 'cowa'
            tic;
            gmr = COWAMRA(gm,Nr);
            time = toc;
            gmr_times(strcmpi(algorithms,'cowa'),m) = time;
            CTDVector(strcmpi(algorithms,'cowa'),m) = CTD(gm,gmr,cost_measure);
            nISEVector(strcmpi(algorithms,'cowa'),m) = nISE(gm,gmr);
        case 'gmrcwas'
            tic;
            gmr = GMRCWas(gm,Nr,NKMeansSteps);
            time = toc;
            gmr_times(strcmpi(algorithms,'gmrcwas'),m) = time;
            CTDVector(strcmpi(algorithms,'gmrcwas'),m) = CTD(gm,gmr,cost_measure);
            nISEVector(strcmpi(algorithms,'gmrcwas'),m) = nISE(gm,gmr);
        case 'ctdgmra'
            tic;
            switch lower(init_method)
                case 'kmeans'
                  gm_init = KMeans(fullMixture,GMRGen2(gm,Nr),cost_measure,NKMeansSteps);
                  %gm_init = KMeans(gm,GMGen(Nr,n,alpha,beta,delta),cost_measure,NKMeansSteps);
                case 'greedy'
                    if strcmpi(cost_measure,'W2')
                        gm_init = WassersteinMRA(gm,Nr);
                   % elseif strcmp(cost_measure,'L2')
                   %     gm_init = WilliamsMRA(gm,Nr);
                    else
                        gm_init = RunnalsMRA(gm,Nr);
                    end
                case 'random'
                    %gm_init = GMGen(Nr,n,alpha,beta,delta);
                    gm_init = GMRGen2(gm,Nr);
            end


            gmr = CTDGMRA(fullMixture,gm_init,cost_measure,lambda,maxiter,I);

            time = toc;
            gmr_times(strcmpi(algorithms,'ctdgmra'),m) = time;
            CTDVector(strcmpi(algorithms,'ctdgmra'),m) = CTD(gm,gmr,cost_measure);
            nISEVector(strcmpi(algorithms,'ctdgmra'),m) = nISE(gm,gmr);
        case 'em'
            tic;
            switch lower(init_method_EM)
                case 'kmeans'
                  gm_init_EM = KMeans(fullMixture,GMRGen2(gm,Nr),cost_measure,NKMeansSteps);
                case 'greedy'
                    if strcmp(cost_measure,'W2')
                        gm_init_EM = WassersteinMRA(gm,Nr);
                    else
                        gm_init_EM = RunnalsMRA(gm,Nr);
                    end
                case 'random'
                    %gm_init_EM = GMGen(Nr,n,alpha,beta,delta);
                    gm_init_EM = GMRGen(gm,Nr);
            end

            samples = GMSamples(fullMixture,EMSamples);
            gmr = EM(gm_init_EM,samples,NEMiter);
            time = toc;
            gmr_times(strcmpi(algorithms,'em'),m) = time;
            CTDVector(strcmpi(algorithms,'em'),m) = CTD(gm,gmr,cost_measure);
            nISEVector(strcmpi(algorithms,'em'),m) = nISE(gm,gmr);
         case 'dphem'
            tic;
            switch lower(init_method_EM)
                case 'kmeans'
                  gm_init_EM = KMeans(fullMixture,GMRGen2(gm,Nr),cost_measure,NKMeansSteps);
                case 'greedy'
                    if strcmp(cost_measure,'W2')
                        gm_init_EM = WassersteinMRA(gm,Nr);
                    else
                        gm_init_EM = RunnalsMRA(gm,Nr);
                    end
                case 'random'
                    %gm_init_EM = GMGen(Nr,n,alpha,beta,delta);
                    gm_init_EM = GMRGen(gm,Nr);
            end

            gmr = DPHEM(fullMixture,gm_init_EM,I,NEMiter);
            time = toc;
            gmr_times(strcmpi(algorithms,'dphem'),m) = time;
            CTDVector(strcmpi(algorithms,'dphem'),m) = CTD(gm,gmr,cost_measure);
            nISEVector(strcmpi(algorithms,'dphem'),m) = nISE(gm,gmr);
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
