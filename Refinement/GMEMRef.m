function gmr = GMEMRef(gmr, gmh, nSamples, maxiter)
% gmr = GMEMRef(gmr, samples, maxiter):
% INPUTS:
% - gmr, initial Gaussian mixture,
% - gmh, reference Gaussian mixture,
% - nSamples, number of samples to draw from the reference mixture (scalar),
% - maxiter, maximum number of allowed iterations (scalar).
% OUTPUTS:
% - gmr, the refined mixture according to the EM algorithm.
% This function implements EM refinement over the gm_init mixture by using samples from the full mixture
% as presented in:
% Maximum Likelihood from Incomplete Data via the EM Algorithm,  A. P. Dempster, N. M. Laird, D. B. Rubin
if nargin < 3
    maxiter = 30;
end
assert(~isempty(gmr) && ~isempty(gmh),'The Gaussian Mixtures have to contain at least one element.');
assert(nSamples>0,'The number of samples has to be a non-negative integer.');
assert(maxiter>0,'The number of iterations has to be non-negative.');

samples = GMSamples(gmh,nSamples);
d = size(gmr(1).mu,1);
Nr = numel(gmr);
M = nSamples;
priors = [gmr.w]';
responsibilities = zeros(M,Nr);
llh = -Inf;
llh_prev = llh;
for k=1:maxiter
    
    % (Expectation)
   for i = 1:M
        for j=1:Nr
            responsibilities(i,j) = mvnpdf(samples(:,i),gmr(j).mu,gmr(j).Sigma)*priors(j);
        end
        normFactor = sum(responsibilities(i,:));
        responsibilities(i,:) = responsibilities(i,:)/normFactor;
    end
    
    %Maximization
    Nk = sum(responsibilities,1)'; %Total responsibility allocated for the clusters
    priors = Nk./M;
    for i=1:Nr
        gmr(i).w = priors(i);
        gmr(i).mu = ((1/Nk(i))*responsibilities(:,i)'*samples')';
        newCov = zeros(d,d);
        for j=1:M
            diff = samples(:,j)-gmr(i).mu;
            newCov = newCov + responsibilities(j,i)*(diff*diff');
        end
        gmr(i).Sigma = newCov/Nk(i);
    end
    
    if ~mod(k,20)
        llh = logLikelihoodGM(gmr,samples);
        if abs(llh-llh_prev)<log(1.105)
            break;
        end
        llh_prev = llh;
    end

end

end

