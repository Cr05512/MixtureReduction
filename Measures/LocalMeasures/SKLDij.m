function sKLD = SKLDij(pdfi,pdfj)
% sKLD = SKLDij(pdfh,pdfr):
% INPUTS:
% - pdfh, pdfr, two Gaussian densities.
% OUTPUTS:
% - sKLD, resulting symmetrization of the Kullback-Leibler divergence (scalar).
% This function computes the KLD symmetrization between two multivariate Gaussians. It is
% not suitable for other kind of distributions.

mui = pdfi.mu;
muj = pdfj.mu;
diff = mui-muj;
Sigmai = pdfi.Sigma;
Sigmaj = pdfj.Sigma;
d = size(mui,1);
Sigmaiinv = eye(d)/Sigmai;
Sigmajinv = eye(d)/Sigmaj;

%sKLD = KLDij(pdfi,pdfj) + KLDij(pdfj,pdfi);
sKLD = 0.5*(trace(Sigmajinv*Sigmai) + trace(Sigmaiinv*Sigmaj) + diff'*(Sigmaiinv+Sigmajinv)*diff - 2*d);

end

