function pdfMerge = mpMerge(pdfs)
% pdfMerge = mpMerge(pdfs):
% INPUTS:
% - pdfs, a vector of Gaussian components.
% OUTPUTS:
% - pdfMerge, the moment preserving merge of the input components.
% This function takes as input a vecot of Gaussian components and returns
% their moment-preseving merge (KLD-barycenter).

assert(~isempty(pdfs),'The number of components in the merge has to be greater than zero.');

pdfMerge = struct('w',0,'mu',zeros(size(pdfs(1).mu)),'Sigma',size(pdfs(1).Sigma));

w_merged = 0;
for i=1:length(pdfs)
    w_merged = w_merged + pdfs(i).w;
end

mu_merged = zeros(size(pdfs(1).mu));
for i=1:length(pdfs)
    mu_merged = mu_merged + pdfs(i).w*pdfs(i).mu;
end
mu_merged = (1/w_merged)*mu_merged;

Sigma_merged = zeros(size(pdfs(1).Sigma));

for i=1:length(pdfs)
    Sigma_merged = Sigma_merged + (pdfs(i).w/w_merged)*(pdfs(i).Sigma...
        + (pdfs(i).mu - mu_merged)*(pdfs(i).mu - mu_merged)');
end
          
pdfMerge.w = w_merged;
pdfMerge.mu = mu_merged;
pdfMerge.Sigma = Sigma_merged;

end

