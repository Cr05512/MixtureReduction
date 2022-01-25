function samples = GMSamples(gm, nPoints)
% samples = GMSamples(gm,nPoints):
% INPUTS:
% - gm, a Gaussian mixture to sample from,
% - nSamples, number of samples (scalar).
% OUTPUTS:
% - samples, dataset obtained by sampling the Gaussian mixture (stateDim x nSamples matrix).
% This function samples a Gaussian mixture and returns the set of all
% samples.
assert(~isempty(gm),'The mixture has to contain at least one element.');
assert(nPoints>0,'The number of samples has to be non-negative.');

d = size(gm(1).mu,1);
samples = zeros(d,nPoints);
w_bar = [gm.w]'./sum([gm.w]);
if length(w_bar)==1 %Single component mixture
    for i=1:nPoints
        samples(:,i) = mvnrnd(gm.mu,gm.Sigma);
    end
else
    cdf = cumsum(w_bar);
    for i=1:nPoints
        r = rand();
        ind = find(r<=cdf,1,'first');
        samples(:,i) = mvnrnd(gm(ind).mu, gm(ind).Sigma);
    end
end


end

