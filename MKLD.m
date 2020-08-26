function MKL = MKLD(pdfi,pdfj,gamma,I)
MKL = -(1/gamma)*log(pdfj.w) + (I/gamma)*KLD(pdfi,pdfj);
end

