function samples = GMSamples(gm, Nsamples)
n = size(gm(1).getMean(),1);
samples = zeros(n,Nsamples);
w_bar = zeros(length(gm));
for i=1:length(gm)
    w_bar(i) = gm(i).getWeight();
end
[w_sort,indexes] = sort(w_bar);
gm = gm(indexes);

for i=1:Nsamples
    r = rand*max(w_sort);
    ind = find(w_sort>r,1,'first');
    if n==1
        samples(:,i) = sqrt(gm(ind).getCovariance())*randn + gm(ind).getMean();
    else
        samples(:,i) = mvnrnd(gm(ind).getMean(),gm(ind).getCovariance())';
    end

end

