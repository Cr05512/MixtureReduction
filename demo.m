%This demo uses all the algorithms available (or almost) in the framework
%in order to reduced the Gaussian mixture proposed by Crouse et al. in "A
%look at Gaussian mixture reduction algorithms." This demo evaluates the
%performances by means of Normalized Integral Squared Error and through
%earth mover's distance (W2). The results are plotted in a 4x4 matrix
%containing all the corresponding subplots.


clc
clear
close all


%Type in the following list the algorithms you want to compare. Check
%GaussianMixtureReduction documentation for available algorithms.
algorithms = {'Williams','Runnals','Salmond','West','COWA','GMRC','Wasserstein','GMRCWas','EM','DPHEM','CTDGMRA','BF'};

%Type it the test to use.  Check GaussianMixtureReduction documentation for available tests.
test = 'Crouse';

%Check GaussianMixtureReduction documentation for parameter meaning
params = struct('Nh',10,... % Full mixture components
                'Nr',5,... % Reduced Mixture components
                'd',1,... % State dimension
                'alpha',10,... % Component means spreading. In general setting it to Nh/4 gives nice visual results
                'beta',0.09,... % Component covariance tuning parameter.
                'delta',0,... % Component center
                'pruneGMComps',0,... % 0 to skip pruning, 1 to perform pruning
                'pruningMethod',1,... % 0 for standard pruning, 1 for adaptive pruning
                'pruningThresh',0.01,... % Standard pruning threshold
                'rho',0.9544,... % Adaptive pruning threshold
                'lambda',0.0,... % Entropic regularization parameter
                'maxiter',100,... % Maximum number of iterations
                'cost_measure','W2',... % Cost measure
                'initMethodCTD','Wasserstein',... % Init method for CTDGMRA
                'algoWest',0,... % 0 for West algorithm, 1 for Enhanced West algorithm
                'gammaWest',Inf,... % West/EWest dissimilarity threshold
                'EMSamples',500,... % Number of samples for the EM. In general 150*Nh*n gives nice approximations
                'I',10,... % Number of virtual samples for the MKLD/DPHEM algorithm. Setting it equal to Nh yields good results.
                'nEMIter',30,... % Number of EM iterations
                'initMethodEM','Runnals',... % Init method for the EM/DPHEM algorithms
                'nKMeansSteps',100,... % Number of KMeans iterations
                'ISEOpt',1,... % 0 to skip ISE Optimization for corresponding algorithms (Williams, GMRC), 1 to perform it
                'sk',0.001,... % Gradient step size in the ISE Opt
                'nOptSteps',60,... % Number of ISE Opt iterations
                'optWeights',1,... % 0 to skip weight opt, 1 to perform weight opt in the ISE optimization
                'showResults',1,... % 0 to skip result visualization, 1 to show results
                'nPoints',300); % Number of evaluation points for plots

[fullMixture, gmr_vector, gmr_times] = GaussianMixtureReduction(algorithms,test,params);


