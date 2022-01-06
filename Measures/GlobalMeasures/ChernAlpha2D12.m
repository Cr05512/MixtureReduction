function dCA1D = ChernAlpha2D12(gmh,gmr,nPoints,alpha)

if nargin < 3
    nPoints = 1000;
    alpha = 0.5;
elseif nargin < 4
    alpha = 0.5;
end

dCA1D = -log(ChernAlphaC12(gmh,gmr,nPoints,alpha));

end

