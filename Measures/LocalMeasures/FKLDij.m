function dKLij = FKLDij(pdfi,pdfj)
% dKLij = KLDij(pdfi,pdfj):
% INPUTS:
% - pdfi, pdfj, two Gaussian densities.
% OUTPUTS:
% - dKLij, resulting Kullback-Leibler divergence (scalar).
% This function computes the KLD between two multivariate Gaussians. It is
% not suitable for other kind of distributions.

mui = pdfi.mu;
muj = pdfj.mu;
Pi = pdfi.Sigma;
Pj = pdfj.Sigma;
%Pjinv = inv(Pj);
d = size(mui,1);

%dKLij = 0.5*(trace(Pjinv*Pi) + log(det(2*pi*Pj))-d)-log(mvnpdf(mui,muj,Pj));
dKLij = 0.5*(trace(Pj\Pi) + (mui-muj)'*(Pj\(mui-muj))-d+log(det(Pj)/det(Pi)));
%The previous two expressions are equivalent

end

