function w2Dist = W2ij(pdfi,pdfj)
% w2Dist = W2ij(pdf1,pdf2):
% INPUTS:
% - pdf1, pdf2, two Gaussian densities.
% OUTPUTS:
% - w2Dist, the Squared 2-Wasserstein distance between pdf1 and pdf2 (scalar).
% This function computes the Squared 2-Wasserstein distance between two
% Gaussian components.

mu1 = pdfi.mu;
mu2 = pdfj.mu;
P1 = pdfi.Sigma;
P2 = pdfj.Sigma;

P1sr = chol(P1,'lower');

w2Dist = norm(mu1-mu2)^2 + trace(P1 + P2 - 2*real(sqrtm((P1sr'*P2*P1sr))));
end

