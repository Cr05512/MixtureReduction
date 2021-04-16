function dTSL = TSLij(pdfh,pdfr)


Jhh = mvnpdf(pdfh.mu,pdfh.mu,2*pdfh.Sigma);
Jrr = mvnpdf(pdfr.mu,pdfr.mu,2*pdfr.Sigma);
Jhr = mvnpdf(pdfh.mu,pdfr.mu,pdfh.Sigma+pdfr.Sigma);


dTSL = (Jhh - 2*Jhr + Jrr)/sqrt(1+4*Jrr);

end

