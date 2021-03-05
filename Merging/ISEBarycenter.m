function IB = ISEBarycenter(gmh)

gmr = mpMerge(gmh);

IB = refine('ISEOptCon',gmr,gmh,600,1e-21);

end

