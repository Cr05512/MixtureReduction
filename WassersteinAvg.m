function  pdf_avg = WassersteinAvg(cluster)

n = size(cluster(1).mu,1);
Ki = length(cluster);

w_avg = 0;
mu_avg = zeros(n,1);
Sigma_avg = zeros(n,n);

for i=1:Ki
    w_avg = w_avg + cluster(i).w;
end

for i=1:Ki
    mu_avg = mu_avg + (cluster(i).w/w_avg)*cluster(i).mu;
end

for i=1:Ki
    for j=1:Ki
        Sigma_avg = Sigma_avg + (cluster(i).w*cluster(j).w)/(w_avg^2) * chol(cluster(i).Sigma)' * chol(cluster(j).Sigma);
    end
end

pdf_avg = struct('w',w_avg,'mu',mu_avg,'Sigma',Sigma_avg);

end

