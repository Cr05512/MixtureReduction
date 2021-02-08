function dBhatt = bhattD(pdfi,pdfj)

mui = pdfi.mu;
muj = pdfj.mu;
Sigmai = pdfi.Sigma;
Sigmaj = pdfj.Sigma;
meanSigma = (Sigmai+Sigmaj)/2;

dBhatt = (1/8)*(muj-mui)'*((meanSigma)\(muj-mui)) + 0.5*log(det(meanSigma)/sqrt(det(Sigmai)*det(Sigmaj)));
end

