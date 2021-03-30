function CSDB = CSDBSGA(gmh)

gmr = KLDBarycenter(gmh);

CSDB = refine('CSDOptCon',gmr,gmh,200,1e-12);

end

