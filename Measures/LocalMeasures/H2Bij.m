function dH2Bij = H2Bij(pdfi,pdfj)

bar = KLDBarycenter([pdfi;pdfj]);
dH2Bij = pdfi.w*H2ij(pdfi,bar) + pdfj.w*H2ij(pdfj,bar);

end

