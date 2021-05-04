function dCSDBij = CSDBij(pdfh,pdfr)

bar = CSDBarycenter([pdfh;pdfr]);
dCSDBij = pdfh.w*CSDij(pdfh,bar) + pdfr.w*CSDij(pdfr,bar);

end

