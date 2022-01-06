function dH2 = H2ij(pdfi,pdfj)

dH2 = 1-BCij(pdfi,pdfj);

% mu1 = pdf1.mu;
% mu2 = pdf2.mu;
% diff = mu1 - mu2;
% Sigma1 = pdf1.Sigma;
% Sigma2 = pdf2.Sigma;
% meanSigma = (Sigma1+Sigma2)/2;
% dH2 = 1 - (det(Sigma1)*det(Sigma2)/det(meanSigma)^2)^(1/4)*exp(-1/8*diff'*(meanSigma\diff));
end

