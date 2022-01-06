function dW2Bij = W2Bij(pdfi,pdfj)

w1 = pdfi.w;
w2 = pdfj.w;
bar = W2Barycenter([pdfi;pdfj]);

dW2Bij = w1*W2ij(pdfi,bar) + w2*W2ij(pdfj,bar);
end

