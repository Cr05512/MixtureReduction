function IB = ISEBarycenter(gmh)

gmr = mpMerge(gmh);

IB = refine('ISEOptCon',gmr,gmh,100,1e-12);

end

