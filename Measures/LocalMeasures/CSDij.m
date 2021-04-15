function dCSD = CSDij(pdfi,pdfj)
%CS Divergence between two Gaussian densities

mui = pdfi.mu;
muj = pdfj.mu;
Sigmai = pdfi.Sigma;
Sigmaj = pdfj.Sigma;
d = size(mui,1);

dCSD = 0.5*(log(det(Sigmai+Sigmaj))-0.5*log(det(Sigmai))-0.5*log(det(Sigmaj))-...
         d*log(2)+(mui-muj)'*((Sigmai+Sigmaj)\(mui-muj)));

end

