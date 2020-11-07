function samples = GMSamples(gm, nSamples)
% samples = GMSamples(gm,nSamples):
% INPUTS:
% - gm, a Gaussian mixture to sample from,
% - nSamples, number of samples.
% OUTPUTS:
% - samples, dataset obtained by sampling the Gaussian mixture.
% This function samples a Gaussian mixture and returns the set of all
% samples.
assert(~isempty(gm),'The mixture has to contain at least one element.');
assert(nSamples>0,'The number of samples has to be non-negative.');

n = size(gm(1).mu,1);
samples = zeros(n,nSamples);
w_bar = [gm.w]';
if length(w_bar)==1 %Single component muxture
    for i=1:nSamples
        samples(:,i) = mvnrnd(gm.mu,gm.Sigma);
    end
else
    cdf = cumsum(w_bar);
    for i=1:nSamples
        r = rand();
        ind = find(r<=cdf,1,'first');
        samples(:,i) = mvnrnd(gm(ind).mu, gm(ind).Sigma);
    end
end


end

