function NIB = NISEBarycenter(gmh)

gmr = mpMerge(gmh);

NIB = refine('NISEOptCon',gmr,gmh,400,1e-18);

end

