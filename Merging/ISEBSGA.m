function IB = ISEBSGA(gmh)

gmr = KLDBarycenter(gmh);
%gmr = refine('NISEOptCon',gmr,gmh,100,1e-06);
IB = refine('ISEOptCon',gmr,gmh,100,1e-12);

end

