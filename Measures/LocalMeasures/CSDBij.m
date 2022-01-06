function dCSDBij = CSDBij(pdfi,pdfj)

bar = CSDBarycenter([pdfi;pdfj]);
dCSDBij = pdfi.w*CSDij(pdfi,bar) + pdfj.w*CSDij(pdfj,bar);

end

