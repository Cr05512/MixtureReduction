function dsBC = alphaCij(pdfi,pdfj,alpha)


mui = pdfi.mu;
muj = pdfj.mu;
Sigmai = pdfi.Sigma;
Sigmaj = pdfj.Sigma;
alphaSigma = alpha*Sigmai + (1-alpha)*Sigmaj;

dsBC = (det(Sigmai)^(alpha/2)*det(Sigmaj)^((1-alpha)/2))/sqrt(det(alphaSigma))*exp(-0.5*alpha*(1-alpha)*(mui-muj)'*(alphaSigma\(mui-muj)));
end

