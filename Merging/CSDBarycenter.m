function CSDB = CSDBarycenter(gmh)

gmr = mpMerge(gmh);

CSDB = refine('CSDOptCon',gmr,gmh,1000,1e-21);

end

