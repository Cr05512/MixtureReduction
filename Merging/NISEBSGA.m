function NIB = NISEBSGA(gmh,NOptSteps,accThresh)

if nargin < 2
    NOptSteps = 100;
    accThresh = 1e-12;
elseif nargin < 3
    accThresh = 1e-12;
end

gmr = KLDBarycenter(gmh);

NIB = refineGaussMix('NISEOptCon',gmr,gmh,struct('NOptSteps',NOptSteps,'accThresh',accThresh));

end

