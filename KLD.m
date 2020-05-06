function dKLij = KLD(pdfi,pdfj)
%This function computes the KLD between two multivariate gaussians. It is
%not suitable for other kind of distributions
mui = pdfi.mu;
muj = pdfj.mu;
Pi = pdfi.Sigma;
Pj = pdfj.Sigma;
d = size(mui,1);

%dKLij = trace(inv(Pj)*(Pi-Pj+(mui-muj)*(mui-muj)'))+log(det(Pj)/det(Pi));
dKLij = 0.5*(trace(inv(pdfj.Sigma)*pdfi.Sigma) + log(det(2*pi*pdfj.Sigma)) - d) - log(mvnpdf(pdfi.mu,pdfj.mu,pdfj.Sigma));

end

