function CSDB = CSDBSGA(gmh)

gmr = KLDBarycenter(gmh);

CSDB = refineGaussMix('CSDOptCon',gmr,gmh,struct('NOptSteps',200,'accThresh',1e-12));

end

