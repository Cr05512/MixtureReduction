function pdfMerge = mpMerge(pdfs)
%This function takes as input an array of gaussian components and returns
%the gaussian component resulting from their merge
pdfMerge = wGaussPDF();

w_merged = 0;
for i=1:length(pdfs)
    w_merged = w_merged + pdfs(i).getWeight();
end

mu_merged = zeros(size(pdfs(1).getMean()));
for i=1:length(pdfs)
    mu_merged = mu_merged + pdfs(i).getWeight()*pdfs(i).getMean();
end
mu_merged = (1/w_merged)*mu_merged;

Sigma_merged = zeros(size(pdfs(1).getCovariance()));

for i=1:length(pdfs)
    Sigma_merged = Sigma_merged + (pdfs(i).getWeight()/w_merged)*(pdfs(i).getCovariance()...
        + (pdfs(i).getMean() - mu_merged)*(pdfs(i).getMean() - mu_merged)');
end
          
pdfMerge.setWeight(w_merged);
pdfMerge.setMean(mu_merged);
pdfMerge.setCovariance(Sigma_merged);

end

