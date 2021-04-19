function dW2Bij = W2Bij(pdfh,pdfr)

[w1,mu1,Sigma1] = paramsFromMixture(pdfh);
[w2,mu2,Sigma2] = paramsFromMixture(pdfr);
bar = W2Barycenter([pdfh;pdfr]);
[~,mub,Sigmab] = paramsFromMixture(bar);
Sigma1sr = chol(Sigma1,'lower');
Sigma2sr = chol(Sigma2,'lower');

dW2Bij = w1*norm(mu1-mub)^2 + w2*norm(mu2-mub)^2 + trace(w1*Sigma1+w2*Sigma2+(w1+w2)*Sigmab +...
        -2*(w1*sqrtm(Sigma1sr'*Sigmab*Sigma1sr) + w2*sqrtm(Sigma2sr*Sigmab*Sigma2sr)));
end

