function L = llhEM(gmr,samples)
%log-likelihood function for the EM algorithm
L = 0;
for i=1:size(samples,2)
    tmp = 0;
    for j=1:length(gmr)
        tmp = tmp + gmr(j).w*mvnpdf(samples(:,i),gmr(j).mu,gmr(j).Sigma);
    end
    L = L + log(tmp);
end
end

