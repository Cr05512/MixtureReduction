function dBDBij = BDBij(pdfh,pdfr)

bar = KLDBarycenter([pdfh;pdfr]);
dBDBij = pdfh.w*BDij(pdfh,bar) + pdfr.w*BDij(pdfr,bar);

end

