function dJR2D = JR2Dij(pdfi,pdfj)
% Jensen-Quadratic-Renyi divergence
mui = pdfi.mu;
muj = pdfj.mu;
Sigmai = pdfi.Sigma;
Sigmaj = pdfj.Sigma;
Jii = mvnpdf(mui,mui,2*Sigmai);
Jjj = mvnpdf(muj,muj,2*Sigmaj);
Jij = mvnpdf(mui,muj,Sigmai+Sigmaj);

dJR2D = 2*log(2) - log(Jii+Jjj+2*Jij) + 0.5*log(Jii*Jjj);
end

