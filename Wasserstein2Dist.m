function w2Dist = Wasserstein2Dist(pdf1,pdf2)
% w2Dist = Wasserstein2Dist(pdf1,pdf2):
% INPUTS:
% - pdf1, pdf2, two Gaussian densities.
% OUTPUTS:
% - w2Dist, the Squared 2-Wasserstein distance between pdf1 and pdf2.
% This function computes the Squared 2-Wasserstein distance between two
% Gaussian components.

mu1 = pdf1.mu;
mu2 = pdf2.mu;
P1 = pdf1.Sigma;
P2 = pdf2.Sigma;

P1sr = real(sqrtm((P1)));

w2Dist = norm(mu1-mu2)^2 + trace(P1 + P2 - 2*real(sqrtm((P1sr'*P2*P1sr))));
end

