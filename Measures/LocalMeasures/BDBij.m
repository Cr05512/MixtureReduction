function dBDBij = BDBij(pdfi,pdfj)

bar = KLDBarycenter([pdfi;pdfj]);
dBDBij = pdfi.w*BDij(pdfi,bar) + pdfj.w*BDij(pdfj,bar);

end

