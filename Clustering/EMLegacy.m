function gm = EMLegacy(initGM, samples, maxiter)
% gm = EM(gmr, samples, maxiter):
% INPUTS:
% - initGM, initial Gaussian mixture,
% - samples, samples to fit (d x N),
% - maxiter, maximum number of allowed iterations (scalar).
% OUTPUTS:
% - gmr, the fit mixture according to the EM algorithm.
% This function implements the EM algorithm as presented in:
% Maximum Likelihood from Incomplete Data via the EM Algorithm,  A. P. Dempster, N. M. Laird, D. B. Rubin
if nargin < 3
    maxiter = 50;
end
assert(~isempty(initGM),'The Gaussian Mixtures have to contain at least one element.');
assert(size(samples,2)>0,'The number of samples has to be a non-negative integer.');
assert(maxiter>0,'The number of iterations has to be non-negative.');

d = size(initGM(1).mu,1);
N = numel(initGM);
M = size(samples,2);
priors = [initGM.w]';
responsibilities = zeros(M,N);
llh = -Inf;
llh_prev = llh;
for k=1:maxiter
    
    % (Expectation)
   for i = 1:M
        for j=1:N
            responsibilities(i,j) = mvnpdf(samples(:,i),initGM(j).mu,initGM(j).Sigma)*priors(j);
        end
        normFactor = sum(responsibilities(i,:));
        responsibilities(i,:) = responsibilities(i,:)/normFactor;
    end
    
    %Maximization
    Nk = sum(responsibilities,1)'; %Total responsibility allocated for the clusters
    priors = Nk./M;
    for i=1:N
        initGM(i).w = priors(i);
        initGM(i).mu = ((1/Nk(i))*responsibilities(:,i)'*samples')';
        newCov = zeros(d,d);
        for j=1:M
            diff = samples(:,j)-initGM(i).mu;
            newCov = newCov + responsibilities(j,i)*(diff*diff');
        end
        initGM(i).Sigma = newCov/Nk(i);
    end
    
    if ~mod(k,20)
        llh = logLikelihoodGM(initGM,samples);
        if abs(llh-llh_prev)<log(1.105)
            break;
        end
        llh_prev = llh;
    end

end

gm = initGM;

end

