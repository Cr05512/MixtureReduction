function sKLD = SKLDij(pdfh,pdfr)
% sKLD = SKLDij(pdfh,pdfr):
% INPUTS:
% - pdfh, pdfr, two Gaussian densities.
% OUTPUTS:
% - sKLD, resulting symmetrization of the Kullback-Leibler divergence (scalar).
% This function computes the KLD symmetrization between two multivariate Gaussians. It is
% not suitable for other kind of distributions.

% muh = pdfh.mu;
% mur = pdfr.mu;
% Ph = pdfh.Sigma;
% Pr = pdfr.Sigma;
% Phinv = inv(Ph);
% Prinv = inv(Pr);

sKLD = KLDij(pdfh,pdfr) + KLDij(pdfr,pdfh);
% sKLD = 0.5*((muh-mur)'*(Phinv + Prinv)*(muh-mur) + trace((Prinv - Phinv)*(Ph - Pr)));

end

