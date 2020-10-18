function MKL = MKLD(pdfi,pdfj,lambda,I)
MKL = -(1/lambda)*log(pdfj.w) + (I/lambda)*KLD(pdfi,pdfj);
end

