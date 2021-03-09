function NIB = NISEBarycenter(gmh)

gmr = KLDBarycenter(gmh);

NIB = refine('NISEOptCon',gmr,gmh,1000,1e-21);

end

