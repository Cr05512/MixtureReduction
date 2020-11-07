function params = initParams(Nh)

params = struct('Nh',Nh,... % Full mixture components
                'Nr',5,... % Reduced Mixture components
                'd',1,... % State dimension
                'alpha',Nh/4,... % Component means spreading. In general setting it to Nh/4 gives nice visual results
                'beta',0.09,... % Component covariance tuning parameter.
                'delta',0,... % Component center
                'pruneGMComps',0,... % 0 to skip pruning, 1 to perform pruning
                'pruningMethod',1,... % 0 for standard pruning, 1 for adaptive pruning
                'pruningThresh',0.01,... % Standard pruning threshold
                'rho',0.9544,... % Adaptive pruning threshold
                'lambda',0.05,... % Entropic regularization parameter
                'maxiter',30,... % Maximum number of iterations
                'cost_measure','KLD',... % Cost measure
                'alphaGJSD',0.5,... %alpha used in the generalized JSD
                'initMethodCTD','Runnals',... % Init method for CTDGMRA
                'reduction_step',1,... % Reduction step for the SCMRA
                'algoWest',1,... % 0 for West algorithm, 1 for Enhanced West algorithm
                'gammaWest',Inf,... % West/EWest dissimilarity threshold
                'EMSamples',1500,... % Number of samples for the EM. In general 150*Nh*n gives nice approximations
                'I',Nh,... % Number of virtual samples for the MKLD/DPHEM algorithm. Setting it equal to Nh yields good results.
                'nEMIter',50,... % Number of EM iterations
                'initMethodEM','Runnals',... % Init method for the EM/DPHEM algorithms
                'nKMeansSteps',100,... % Number of KMeans iterations
                'initMethodGMRC','Runnals',... % Init method for the GMRC
                'ISEOpt',0,... % 0 to skip ISE Optimization for corresponding algorithms (Williams, GMRC), 1 to perform it
                'sk',0.005,... % Gradient step size in the ISE Opt
                'nOptSteps',50,... % Number of ISE Opt iterations
                'optWeights',1,... % 0 to skip weight opt, 1 to perform weight opt in the ISE optimization
                'showResults',1,... % 0 to skip result visualization, 1 to show results
                'nPoints',300); % Number of evaluation points for plots
            
end

