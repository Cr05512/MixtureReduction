clc
clear
close all

%Type in the following list the algorithms you want to compare. Check
%documentation for available algorithms.
algorithms = {'Runnals','Salmond','EM'};

%Type it the test to use. Check documentation for available tests.
test = 'random';

%Check documentation for parameter meaning
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
                'cost_measure','L2',... % Cost measure
                'initMethodCTD','greedy',... % Init method for CTDGMRA
                'algoWest',0,... % 0 for West algorithm, 1 for Enhanced West algorithm
                'gammaWest',Inf,... % West/EWest dissimilarity threshold
                'EMSamples',1500,... % Number of samples for the EM. In general 150*Nh*n gives nice approximations
                'I',5,... % Number of virtual samples for the MKLD/DPHEM algorithm
                'nEMIter',50,... % Number of EM iterations
                'initMethodEM','greedy',... % Init method for the EM/DPHEM algorithms
                'nKMeansSteps',100,... % Number of KMeans iterations
                'opt',1,... % 0 to skip ISE Optimization for corresponding algorithms (Williams, GMRC), 1 to perform it
                'sk',0.005,... % Gradient step size in the ISE Opt
                'nOptSteps',100,... % Number of ISE Opt iterations
                'optWeights',1,... % 0 to skip weight opt, 1 to perform weight opt in the ISE optimization
                'showResults',1,... % 0 to skip result visualization, 1 to show results
                'nPoints',300); % Number of evaluation points for plots

[fullMixture, gmr_vector, gmr_times] = GaussianMixtureReduction(algorithms,test,params);


