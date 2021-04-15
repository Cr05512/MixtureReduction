function IB = ISEBSGA(gmh)
%Note: ISE BSGA coincides with the ISE Barycenter
gmr = KLDBarycenter(gmh);
%gmr = refine('NISEOptCon',gmr,gmh,100,1e-06);
IB = refineGaussMix('ISEOptUnc',gmr,gmh,struct('NOptSteps',100,'optWeights',0,'accThresh',1e-12));

end

