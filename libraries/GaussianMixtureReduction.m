function [fullMixture,gmr_vector,gmr_times] = GaussianMixtureReduction(algorithms, test, params)
% [fullMixture,gmr_vector,gmr_times] = GaussianMixtureReduction(algorithms,test, params):
% INPUTS:
% - algorithms, a cell array containing all the names of the algorithms to
%   be compared,
% - test, string containing the test to be executed,
% - params, struct containing all the parameters necessary for executing
%   the available algorithms. More on this below.
% OUTPUTS:
% - fullMixture, initial mixture to be reduced,
% - gmr_vector, a cell array containing the reduced mixture(s) according to
%   the order given in the algorithms parameter,
% - gmr_times, array containing execution times of the algorithms provided
%   in the algorithms parameter.
% This function implements a batch of Gaussian mixture reduction
% algorithms. It returns the initial mixture, the reduced mixtures
% according to each desired algorithm and the corresponding execution
% times.
% Available algorithms:
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
% - Custom -> Write your own algorithm and fill in the custom case in the loop below.
% Available tests:
% - Random, the full mixture is generated randomly according to the GMGen function,
% - Test2, Test3, Test4, the full mixture is bivariate. Check documentation for more details.
% - Williams, the full mixture is generated according to the example
%   proposed in the Williams' Master's thesis. Check doc for more details.
% - Runnals, the full mixture is generated according to the example
%   proposed in the Runnals' paper. Check doc for more details.
% - Crouse, the full mixture is generated according to the example proposed
%   in the Crouse's paper. Check doc for more details.
% Parameters to pass in a struct with fields:
% - Nh, full mixture component number,
% - Nr, reduced mixture component number,
% - d, state dimension,
% - alpha, tuning parameter which accounts for the spread of the means.
%   This parameter tunes the boundaries of the uniform distribution used to
%   generate the means randomly,
% - beta, tuning parameter which accounts for the average covariance of the
%   components. The covariance matrices are generated according to a Wishart
%   distribution with average covariance beta*eye(d) and d+5 degrees of
%   freedom,
% - delta, tuning parameter which accounts for the mean value of the means,
% - pruneGMComps, if set to 0 no pruning is performed on the full mixture,
%   if set to 1 a pruning will be applied before further processing,
% - pruningMethod, if pruning is enabled, set this parameter to 0 for
%   standard pruning or set it to 1 for adaptive pruning,
% - pruningThresh, standard pruning weight threshold in [0,1],
% - rho, threshold in [0,1] respondible for the adaptive pruning,
% - lambda, entropic regularization parameter. Set it to 0 using either
%   KLD, W2 or L2 as measures to emulate corresponding hard clustering algorithms,
%   set it to 1 using MKLD measure to emulate the DPHEM algorithm,
% - maxiter, maximum number of iterations in several algorithms,
% - cost_measure, cost measure used to compute the cost matrix. The
%   available measures are KLD, W2, GJSD, L2, MKLD,
% - initMethodCTD, initialization method used for the CTDGMR algorithm. 
%   Available init methods are KMeans, Salmond, West, Runnals, Wasserstein, Williams, Random,
% - algoWest, set it to 0 for West algorithm, to 1 for Enhanced West algorithm,
% - gammaWest, the maximum dissimilarity threshold. If left empty or set to Inf
%   all the components will be merged according to the algorithm principle.
%   Setting it to a lower value will prevent to merge nearest neighbors
%   which are too far.
% - EMSamples, number of samples to draw from the fullMixture used for the
%   EM refinement,
% - I, DPHEM virtual samples number. Use this parameter carefully. By setting
%   it too high the DPHEM algorithm incurs in numerical problems.
% - nEMIter, number of EM/DPHEM maximum iterations,
% - initMethodEM, initialization method used for the EM/DPHEM algorithms. 
%   Available init methods are KMeans, greedy, random,
% - nKMeansSteps, number of KMeans maximum iterations,
% - ISEOpt, set this parameter to 0 to skip ISE optimization in the algorithms
%   concerning it, set it to 1 to perform the optimization,
% - sk, gradient step size in the ISE optimization,
% - nOptSteps, number of optimization steps for the ISE optimization,
% - optWeights, set it to 0 to skip weight optimization in the ISE 
%   optimization or set it to 1 to perform weight optimization.
% - showResults, set this parameter 0 to skip result visualization, to 1
%   for plotting the results in the 1D/2D case and for a summary table in
%   the case d>2
% - nPoints, number of evaluation points used in the plot function.

availableAlgorithms = {'Williams','Runnals','Salmond','West','COWA','GMRC','Wasserstein','GMRCWas','EM','DPHEM','CTDGMRA','BF','Custom'}; %Check the corresponding documentation for further details
availableMeasVec = {'KLD','W2','GJSD','MKLD','L2'}; %Vector of available dissimilarity measures
availableInitMethodVec = {'KMeans','Salmond','West','Runnals','Wasserstein','Williams','Random'}; %Vector of available initialization methods for certain algorithms
availableTests = {'Random','Test2','Test3','Test4','Test5','Williams','Runnals','Crouse'}; %Check the corresponding documentation for further details


%Result variables
numAlgorithms = length(algorithms);
gmr_vector = cell(numAlgorithms,1);
gmr_times = zeros(numAlgorithms,1);

%Initial Gaussian Mixture
switch lower(test)
    case 'random'
        gm = GMGen(params.Nh,params.d,params.alpha,params.beta,params.delta);
    case 'test2'
        [gm,params.d,params.alpha] = test2CompGen(params.Nh,10,params.beta);
    case 'test3'
        [gm,params.d,params.alpha] = test3CompGen(params.Nh,10,params.beta);
    case 'test4'
        [gm,params.d,params.alpha] = test4CompGen(params.Nh,10,params.beta);
    case 'test5'
        [gm,params.Nr,params.d] = test5CompGen(params.alpha,params.beta);
    case 'williams'
        [gm,params.Nh,params.Nr,params.d,params.delta] = testWilliamsCompGen();
    case 'runnals'
        [gm,params.Nh,params.Nr,params.d] = testRunnalsCompGen();
    case 'crouse'
        [gm,params.Nh,params.Nr,params.d,params.delta] = testCrouseCompGen();
    otherwise
        disp('Unknown test.');
end




%Pruning condition
fullMixture = gm;
if params.pruneGMComps==1
    if params.pruningMethod==0
        gm = prune(gm,params.pruningThresh);
    elseif params.pruningMethod==1
        gm = AWCPruning(gm,params.rho);
    end
    params.Nh = length(gm);
    if params.Nh==0
        disp('All the components have been pruned, choose another pruning threshold.');
        return
    end
end

assert(all(ismember(lower(algorithms),lower(availableAlgorithms))), strcat(['Unknown algorithm(s). The available algorithms are:',' ',strjoin(availableAlgorithms,', '),'.']));
assert(params.Nh>=params.Nr,'The number of reduced components can not be higher than the original ones.');
assert(any(strcmpi(availableTests,test)), strcat(['Unknown test. The available tests are:',' ',strjoin(availableTests,', '),'.']));
assert(any(strcmpi(availableMeasVec,params.cost_measure)), strcat(['Unknown cost measure. The available measures are:',' ',strjoin(availableMeasVec,', '),'.']));
assert(params.pruneGMComps==0 || params.pruneGMComps==1,'Pruning can be either performed (1) or not (0).');
assert(params.pruningMethod==0 || params.pruningMethod==1,'Pruning methods can be either standard (0) or adaptive (1).');
assert(params.showResults==0 || params.showResults==1,'The parameter showResults can take either 0 or 1 as values.');
assert(params.nPoints>0 && floor(params.nPoints)==params.nPoints,'The nPoints parameter has to be an integer greater than zero.');

%Computation loop

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
            gmr = WilliamsMRA(gm,params.Nr);
            if params.ISEOpt==1
                gmr = ISEOptimization(fullMixture,gmr,params.sk,params.nOptSteps,params.optWeights);
            end
            time = toc;
            gmr_times(strcmpi(algorithms,'williams')) = time;
            gmr_vector(strcmpi(algorithms,'williams')) = {gmr};
        case 'gmrc'
            tic;
            gmr = GMRC(fullMixture,params.Nr,params.nKMeansSteps,params.ISEOpt,params.sk,params.nOptSteps,params.optWeights);
            time = toc;
            gmr_times(strcmpi(algorithms,'gmrc')) = time;
            gmr_vector(strcmpi(algorithms,'gmrc')) = {gmr};
        case 'runnals'
            %%
            tic;
            gmr = RunnalsMRA(gm,params.Nr);
            time = toc;
            gmr_times(strcmpi(algorithms,'runnals')) = time;
            gmr_vector(strcmpi(algorithms,'runnals')) = {gmr};
            %%
        case 'wasserstein'
            tic;
            gmr = WassersteinMRA(gm,params.Nr);
            time = toc;
            gmr_times(strcmpi(algorithms,'wasserstein')) = time;
            gmr_vector(strcmpi(algorithms,'wasserstein')) = {gmr};
        case 'salmond'
            tic;
            gmr = SalmondMRA(gm,params.Nr);
            time = toc;
            gmr_times(strcmpi(algorithms,'salmond')) = time;
            gmr_vector(strcmpi(algorithms,'salmond')) = {gmr};
        case 'west'
            tic;
            gmr = WestMRA(gm,params.Nr,params.algoWest,params.gammaWest);
            time = toc;
            gmr_times(strcmpi(algorithms,'west')) = time;
            gmr_vector(strcmpi(algorithms,'west')) = {gmr};
        case 'cowa'
            tic;
            gmr = COWAMRA(gm,params.Nr,params.algoWest,params.gammaWest);
            time = toc;
            gmr_times(strcmpi(algorithms,'cowa')) = time;
            gmr_vector(strcmpi(algorithms,'cowa')) = {gmr};
        case 'bf'
            tic;
            gmr = bruteForceGaussMixRed(fullMixture,params.Nr,true);
            gmr = ISEOptimization(fullMixture,gmr,params.sk,params.nOptSteps,params.optWeights);
            time = toc;
            gmr_times(strcmpi(algorithms,'bf')) = time;
            gmr_vector(strcmpi(algorithms,'bf')) = {gmr};
        case 'gmrcwas'
            tic;
            gmr = GMRCWas(gm,params.Nr,params.nKMeansSteps);
            time = toc;
            gmr_times(strcmpi(algorithms,'gmrcwas')) = time;
            gmr_vector(strcmpi(algorithms,'gmrcwas')) = {gmr};
            %%
        case 'ctdgmra'
            assert(any(strcmpi(availableInitMethodVec,params.initMethodCTD)),'Unknown init method for the CTDGMRA. Aborting...');
            tic;
            switch lower(params.initMethodCTD)
                case 'kmeans'
                    gm_init = KMeans(fullMixture,GMRGen2(gm,params.Nr),params.cost_measure,params.nKMeansSteps);
                case 'salmond'
                    gm_init = SalmondMRA(gm,params.Nr);
                case 'west'
                    gm_init = WestMRA(gm,params.Nr,params.algoWest,params.gammaWest);
                case 'runnals'
                    gm_init = RunnalsMRA(gm,params.Nr);
                case 'wasserstein'
                    gm_init = WassersteinMRA(gm,params.Nr);
                case 'williams'
                    gm_init = WilliamsMRA(gm,params.Nr);
                case 'random'
                    gm_init = GMRGen2(gm,params.Nr);
            end

            gmr = CTDGMRA(fullMixture,gm_init,params.cost_measure,params.lambda,params.maxiter,params.I);

            time = toc;
            gmr_times(strcmpi(algorithms,'ctdgmra')) = time;
            gmr_vector(strcmpi(algorithms,'ctdgmra')) = {gmr};
        case 'em'
            assert(any(strcmpi(availableInitMethodVec,params.initMethodEM)),'Unknown init method for the EM/DPHEM algorithm. Aborting...');
            tic;
            switch lower(params.initMethodEM)
                case 'kmeans'
                    gm_init_EM = KMeans(fullMixture,GMRGen2(gm,params.Nr),params.cost_measure,params.nKMeansSteps);
                case 'salmond'
                    gm_init_EM = SalmondMRA(gm,params.Nr);
                case 'west'
                    gm_init_EM = WestMRA(gm,params.Nr,params.algoWest,params.gammaWest);
                case 'runnals'
                    gm_init_EM = RunnalsMRA(gm,params.Nr);
                case 'wasserstein'
                    gm_init_EM = WassersteinMRA(gm,params.Nr);
                case 'williams'
                    gm_init = WilliamsMRA(gm,params.Nr);
                case 'random'
                    gm_init_EM = GMRGen2(gm,params.Nr);
            end

            samples = GMSamples(fullMixture,params.EMSamples);
            gmr = EM(gm_init_EM,samples,params.nEMIter);
            time = toc;
            gmr_times(strcmpi(algorithms,'em')) = time;
            gmr_vector(strcmpi(algorithms,'em')) = {gmr};

        case 'dphem'
            assert(any(strcmpi(availableInitMethodVec,params.initMethodEM)),'Unknown init method for the EM/DPHEM algorithm. Aborting...');
            tic;
            switch lower(params.initMethodEM)
                case 'kmeans'
                    gm_init_EM = KMeans(fullMixture,GMRGen2(gm,params.Nr),params.cost_measure,params.nKMeansSteps);
                case 'salmond'
                    gm_init_EM = SalmondMRA(gm,params.Nr);
                case 'west'
                    gm_init_EM = WestMRA(gm,params.Nr,params.algoWest,params.gammaWest);
                case 'runnals'
                    gm_init_EM = RunnalsMRA(gm,params.Nr);
                case 'wasserstein'
                    gm_init_EM = WassersteinMRA(gm,params.Nr);
                case 'williams'
                    gm_init = WilliamsMRA(gm,params.Nr);
                case 'random'
                    gm_init_EM = GMRGen2(gm,params.Nr);
            end
            gmr = DPHEM(fullMixture,gm_init_EM,params.I,params.nEMIter);
            time = toc;
            gmr_times(strcmpi(algorithms,'dphem')) = time;
            gmr_vector(strcmpi(algorithms,'dphem')) = {gmr};
        otherwise
            disp(strcat('The algorithm "',algorithms{i},'" is not available.'));
    end

end

if params.showResults == 1

    if params.d==1
        maxMu = max([fullMixture.mu]);
        minMu = min([fullMixture.mu]);
        maxSigma = max([fullMixture.Sigma]);
        center = (maxMu - minMu)/2;
        X = linspace(-(abs(minMu) + 2*sqrt(maxSigma) + center), (abs(maxMu) + 2*sqrt(maxSigma) + center),params.nPoints);
        %X = linspace(-1.5*(params.alpha + center), 1.5*(center + params.alpha), params.nPoints);
    elseif params.d==2
        x1 = linspace(-2*params.alpha, 2*params.alpha,4*params.nPoints);
        x2 = linspace(-2*params.alpha, 2*params.alpha,4*params.nPoints);
        [X1,X2] = meshgrid(x1,x2);
        X = [X1(:) X2(:)];

    end


    if ~isempty(algorithms) && params.d<=2
        figure(1)
        set(gcf,'units','pixels','position',[300,150,1280,720]);

    end


    %Plot loop
    if params.d==1
        numPlotCols = ceil(sqrt(length(algorithms)));
        numPlotRows = ceil(length(algorithms)/numPlotCols);

        for i=1:length(algorithms)
            subplot(numPlotRows,numPlotCols,i)
            plotGM1D(fullMixture,X); hold on
            plotGM1D(gmr_vector{i},X); hold on
            if strcmp(algorithms{i},'CTDGMRA')
                plotGM1D(gm_init,X); hold on
            elseif strcmp(algorithms{i},'EM') || strcmp(algorithms{i},'DPHEM')
                plotGM1D(gm_init_EM,X); hold on
            end
            grid minor
            title(strcat('nISE: ',num2str(nISE(fullMixture,gmr_vector{i})),' CTD',params.cost_measure,': ',num2str(CTD(fullMixture,gmr_vector{i},params.cost_measure)),' Time: ',num2str(gmr_times(i)),'s'),'FontSize',10);
            if any(strcmpi(algorithms{i},{'CTDGMRA','EM','DPHEM'}))
                legend('Original',algorithms{i},'Init','FontSize',11);
            else
                legend('Original',algorithms{i},'FontSize',11);
            end
        end
    elseif params.d==2
        numPlotCols = ceil(sqrt(length(algorithms) + 1));
        numPlotRows = ceil((length(algorithms) + 1)/numPlotCols);
        subplot(numPlotRows,numPlotCols,1)
        plotGM2D(fullMixture,x1,x2,X); hold on
        title('Original Mixture')
        for i=1:length(algorithms)
            subplot(numPlotRows,numPlotCols,i+1)
            plotGM2D(gmr_vector{i},x1,x2,X);
            title(strcat(algorithms{i},' nISE: ',num2str(nISE(fullMixture,gmr_vector{i})),' CTD',params.cost_measure,': ',num2str(CTD(fullMixture,gmr_vector{i},params.cost_measure)),', Time: ',num2str(gmr_times(i)),'s'));

        end
    else
        nISEVec = zeros(length(algorithms),1);
        CTDVec = nISEVec;
        TimeVec = nISEVec;

        for i=1:length(algorithms)
            nISEVec(i) = nISE(fullMixture,gmr_vector{i});
            CTDVec(i) = CTD(fullMixture,gmr_vector{i},params.cost_measure);
            TimeVec(i) = gmr_times(i);
        end

        nISEVec =  str2num(sprintf('%3.7f\n',nISEVec));
        CTDVec = str2num(sprintf('%3.7f\n',CTDVec));
        TimeVec = str2num(sprintf('%3.7f\n',TimeVec));

        T=table(nISEVec,CTDVec,TimeVec);
        T.Properties.RowNames = algorithms;
        T.Properties.VariableNames = {'nISE',strcat('CTD',params.cost_measure),'Time'};
        T.Properties.VariableUnits = {'NISE','CTD','s'};
        disp(T)

    end
    
end


end

