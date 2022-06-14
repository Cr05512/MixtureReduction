function gm = EM(samples,K,maxiter,initGM)
% gm = EM(samples,K,maxiter,initGM):
% INPUT:
% - samples, samples to fit the mixture with (d x N),
% - K, number of components to fit,
% - maxiter, maximum iterations,
% - initGM, starting mixture for the EM algorithm.
% OUTPUT:
% - gm, Gaussian mixture fit according to the EM algorithm.
% This function fits a Gaussian mixture of K components to the provided
% samples by using the MATLAB built-in EM algorithm.
% By providing the fourth argument it is possible to set the starting
% mixture. Be sure that K and the number of components in initGM are equal.

if nargin < 3
    maxiter = 500;
    gmdist = fitgmdist(samples',K,'Options',struct('MaxIter',maxiter));
elseif nargin == 4
    assert(numel(initGM)==K,'The number of components in the init mixture is not equal to K.');
    [w,mu,Sigma] = paramsFromMixture(initGM);
    S = struct('mu',mu','Sigma',Sigma,'ComponentProportion',w);
    gmdist = fitgmdist(samples',K,'Options',struct('MaxIter',maxiter),'Start',S);
end

gm = gmdist2GaMARTdist(gmdist);

end

