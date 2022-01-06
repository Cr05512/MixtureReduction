function dTSL = TSLij(pdfi,pdfj)


Jhh = mvnpdf(pdfi.mu,pdfi.mu,2*pdfi.Sigma);
Jrr = mvnpdf(pdfj.mu,pdfj.mu,2*pdfj.Sigma);
Jhr = mvnpdf(pdfi.mu,pdfj.mu,pdfi.Sigma+pdfj.Sigma);


dTSL = (Jhh - 2*Jhr + Jrr)/sqrt(1+4*Jrr);

end

