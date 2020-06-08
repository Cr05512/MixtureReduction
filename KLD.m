function dKLij = KLD(pdfi,pdfj)
%This function computes the KLD between two multivariate gaussians. It is
%not suitable for other kind of distributions
mui = pdfi.mu;
muj = pdfj.mu;
Pi = pdfi.Sigma;
Pj = pdfj.Sigma;
d = size(mui,1);

%dKLij = 0.5*(trace(inv(Pj)*Pi) + log(det(2*pi*Pj))-d)-log(mvnpdf(mui,muj,Pj));
dKLij = 0.5*(trace(inv(Pj)*Pi) + (muj-mui)'*inv(Pj)*(muj-mui)-d+log(det(Pj)/det(Pi)));

end

