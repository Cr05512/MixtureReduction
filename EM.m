function gmNew = EM(gm_init, samples, numIter)
% gmNew = EM(gm_init, samples, numIter):
% INPUTS:
% - gm_init, initial Gaussian mixture,
% - samples, data obtained by sampling the Gaussian mixture, check GMSamples(gm,nSamples) for further info,
% - numIter, maximum number of allowed iterations.
% OUTPUTS:
% - gmNew, the refined mixture according to the EM algorithm.
% This function performs an EM refinement over the gm_init mixture by using samples from the full mixture.
if nargin < 3
    numIter = 100;
end
assert(~isempty(gm_init) && ~isempty(samples),'Check input parameters, either the gm or samples are empty.');
assert(numIter>0,'The number of iterations has to be non-negative.');

n = size(gm_init(1).mu,1);
N = length(gm_init);
M = size(samples,2);
priors = [gm_init.w]';
responsibilities = zeros(M,N);
gmNew = gm_init;
llh = -Inf;
llh_prev = llh;
for k=1:numIter
    
    % (Expectation)
   for i = 1:M
        for j=1:N
            responsibilities(i,j) = mvnpdf(samples(:,i)',gmNew(j).mu',gmNew(j).Sigma)*priors(j);
        end
        normFactor = sum(responsibilities(i,:));
        responsibilities(i,:) = responsibilities(i,:)/normFactor;
    end
    
    %Maximization
    Nk = sum(responsibilities,1)'; %Total responsibility allocated for the clusters
    priors = Nk./M;
    for i=1:N
        gmNew(i).w = priors(i);
        gmNew(i).mu = ((1/Nk(i))*responsibilities(:,i)'*samples')';
        newCov = zeros(n,n);
        for j=1:M
            diff = samples(:,j)-gmNew(i).mu;
            newCov = newCov + responsibilities(j,i)*(diff*diff');
        end
        gmNew(i).Sigma = newCov/Nk(i);
    end
    
    if ~mod(k,20)
        llh = llhEM(gmNew,samples);
        if abs(llh-llh_prev)<log(1.105)
            break;
        end
        llh_prev = llh;
    end

end

end

