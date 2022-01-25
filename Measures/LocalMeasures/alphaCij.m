function dsBC = alphaCij(pdfi,pdfj,alpha)

if nargin < 3
    alpha = 0.5;
end

mui = pdfi.mu;
muj = pdfj.mu;
Sigmai = pdfi.Sigma;
Sigmaj = pdfj.Sigma;
alphaSigma = alpha*Sigmaj + (1-alpha)*Sigmai;

dsBC = (sqrt(det(Sigmaj)^alpha*det(Sigmai)^(1-alpha)))/sqrt(det(alphaSigma))*exp(-0.5*alpha*(1-alpha)*(mui-muj)'*(alphaSigma\(mui-muj)));
end

