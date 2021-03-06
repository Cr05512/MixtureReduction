function IB = ISEBarycenter(gmh)

gmr = mpMerge(gmh);

IB = refine('ISEOptCon',gmr,gmh,1000,1e-21);

end

