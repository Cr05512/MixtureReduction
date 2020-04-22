function dKLij = KLD(pdfi,pdfj)
%This function computes the KLD between two multivariate gaussians. It is
%not suitable for other kind of distributions
mui = pdfi.mu;
muj = pdfj.mu;
Pi = pdfi.Sigma;
Pj = pdfj.Sigma;

dKLij = trace(inv(Pj)*(Pi-Pj+(mui-muj)*(mui-muj)'))+log(det(Pj)/det(Pi));

end

