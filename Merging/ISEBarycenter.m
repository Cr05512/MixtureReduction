function IB = ISEBarycenter(gmh)
%Note: ISE BSGA coincides with the ISE Barycenter
[~,ind] = max([gmh.w]);
gmr = struct('w',sum([gmh.w]),'mu',gmh(ind).mu,'Sigma',gmh(ind).Sigma);
%gmr = refine('NISEOptCon',gmr,gmh,100,1e-06);
IB = refineGaussMix('ISEOptUnc',gmr,gmh,struct('NOptSteps',100,'optWeights',0,'accThresh',1e-12));

end

