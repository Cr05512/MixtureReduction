function dRA1D = RAlphaD123(gmh,gmr,nPoints,alpha)

d = size(gmh(1).mu,1);
if nargin < 3
    nPoints = ceil(1000/d);
    alpha = 0.5;
elseif nargin < 4
    alpha = 0.5;
end

dRA1D = 1/(alpha-1)*log(ChernAlphaC123(gmh,gmr,nPoints,alpha));

end

