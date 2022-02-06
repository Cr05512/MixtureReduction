function dCE = CEij(pdfi,pdfj)
dCE = FKLDij(pdfi,pdfj) + mvEntropy(pdfi);
end