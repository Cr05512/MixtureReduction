function gm_init = GMInitGen(fullMixture,gm,params,initMethod)
% gm_init = GMInitGen(fullMixture,gm,params,initMethod):
% INPUTS:
% - fullMixture, original mixture,
% - gm, a Gaussian mixture which can be equal to fullMixture if not preprocessed,
% - params, given parameters,
% - initMethod, initialization method.
% OUTPUTS:
% - gm_init, init Gaussian mixture.
% This function generates an initialization for the GMR algorithms.
% The available init methods are:
% - kmeans, which uses samples from the fullMixture in order to initialize
%   the reduced components on the centroids and with identity covariances,
% - salmond, it uses the Salmond greedy algorithm to provide a GM initialization,
% - west, it uses the West greedy algorithm to provide a GM initialization,
% - runnals, it uses the Runnals greedy algorithm to provide a GM initialization,
% - wasserstein, it uses the Wasserstein-based greedy algorithm to provide a GM initialization,
% - williams, it uses the Williams greedy algorithm to provide a GM initialization,
% - random, generates the initialization in a user defined pseudo-random way. Check GMRGen.m
%   and GMRGen2 for further details.
if nargin < 4
    initMethod = 'kmeans';
end

availableInitMethodVec = {'KMeans','Runnals','Salmond','Wasserstein','Williams','Random','West'};

assert(any(strcmpi(availableInitMethodVec,initMethod)),'Unknown init method. Aborting...');
assert(~isempty(fullMixture) && ~isempty(gm),'The mixture has to contain at least one element.');
assert(~isempty(params),'Inconsistencies with the parameter block. Check initParams.m script.');


switch lower(initMethod)
    case 'kmeans'
        gm_init = sampleKMeansGMInit(fullMixture,params.Nr,params.maxiter,10000);
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
            

end

