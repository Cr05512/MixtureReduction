function NIB = NISEBSGA(gmh)

gmr = KLDBarycenter(gmh);

NIB = refine('NISEOptCon',gmr,gmh,struct('NOptSteps',1000,'accThresh',1e-21));

end

