function NIB = TSLBSGA(gmh,NOptSteps,accThresh)

if nargin < 2
    NOptSteps = 100;
    accThresh = 1e-12;
elseif nargin < 3
    accThresh = 1e-12;
end

[~,ind] = max([gmh.w]);
gmr = struct('w',sum([gmh.w]),'mu',gmh(ind).mu,'Sigma',gmh(ind).Sigma);

NIB = refineGaussMix('TSLOptCon',gmr,gmh,struct('NOptSteps',NOptSteps,'accThresh',accThresh));

end

