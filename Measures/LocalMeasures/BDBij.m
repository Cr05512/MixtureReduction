function dBDBij = BDBij(pdfh,pdfr)

bar = BDBarycenter([pdfh;pdfr]);
dBDBij = pdfh.w*BDij(pdfh,bar) + pdfr.w*BDij(pdfr,bar);

end

