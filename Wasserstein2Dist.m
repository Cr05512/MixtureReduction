function w2Dist = Wasserstein2Dist(pdf1,pdf2)

mu1 = pdf1.mu;
mu2 = pdf2.mu;
P1 = pdf1.Sigma;
P2 = pdf2.Sigma;

P1sr = real(sqrtm((P1)));

w2Dist = norm(mu1-mu2)^2 + trace(P1 + P2 - 2*real(sqrtm((P1sr'*P2*P1sr))));
end

