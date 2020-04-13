function dKLij = KLD(pdfi,pdfj)
%This function computes the KLD between two multivariate gaussians. It is
%not suitable for other kind of distributions
mui = pdfi.getMean();
muj = pdfj.getMean();
Pi = pdfi.getCovariance();
Pj = pdfj.getCovariance();

dKLij = trace(inv(Pj)*(Pi-Pj+(mui-muj)*(mui-muj)'))+log(det(Pj)/det(Pi));

end

