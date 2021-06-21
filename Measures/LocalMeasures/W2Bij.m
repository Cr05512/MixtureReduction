function dW2Bij = W2Bij(pdfh,pdfr)

w1 = pdfh.w;
w2 = pdfr.w;
bar = W2Barycenter([pdfh;pdfr]);

dW2Bij = w1*W2ij(pdfh,bar) + w2*W2ij(pdfr,bar);
end

