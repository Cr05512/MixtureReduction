function pdfMerge = mpMerge(pdf1, pdf2)

pdfMerge = GaussPDF();

w1 = pdf1.getWeight();
w2 = pdf2.getWeight();
mu1 = pdf1.getMean();
mu2 = pdf2.getMean();
P1 = pdf1.getCovariance();
P2 = pdf2.getCovariance();

w_merge = w1 + w2;
mu_merge = 1/w_merge * (w1*mu1 + w2*mu2);
Sigma_merge = 1/w_merge * (w1*P1 + w2*P2) + w1/w_merge * w2/w_merge * (mu1 - mu2) * (mu1 - mu2)';
          
pdfMerge.setWeight(w_merge);
pdfMerge.setMean(mu_merge);
pdfMerge.setCovariance(Sigma_merge);

end

