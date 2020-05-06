function samples = GMSamples(gm, Nsamples)

n = size(gm(1).mu,1);
samples = zeros(n,Nsamples);
w_bar = [gm.w]';

for i=1:Nsamples
    r = rand();
    cdf = cumsum(w_bar);
    ind = find(r<cdf,1,'first');
    samples(:,i) = mvnrnd(gm(ind).mu, gm(ind).Sigma);

    %samples(:,i+1) = gm(ind).mu - sign(samples(:,i) - gm(ind).mu)*abs(samples(:,i) - gm(ind).mu);
end


end

