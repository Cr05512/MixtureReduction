function dBDBij = BDBij(pdfi,pdfj)

%bar = FKLDBarycenter([pdfi;pdfj]);
bar = BDBarycenter([pdfi;pdfj]);
dBDBij = pdfi.w*BDij(pdfi,bar) + pdfj.w*BDij(pdfj,bar);

end

