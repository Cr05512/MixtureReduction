function dCSDBij = CSDBij(pdfh,pdfr)

bar = CSDBarycenterCCCP([pdfh;pdfr]);
dCSDBij = pdfh.w*CSDij(pdfh,bar) + pdfr.w*CSDij(pdfr,bar);

end

