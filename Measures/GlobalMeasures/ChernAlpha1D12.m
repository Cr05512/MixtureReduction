function dCA1D = ChernAlpha1D12(gmh,gmr,nPoints,alpha)

if nargin < 3
    nPoints = 1000;
    alpha = 0.5;
elseif nargin < 4
    alpha = 0.5;
end

dCA1D = 1/(alpha*(1-alpha))*(1-ChernAlphaC12(gmh,gmr,nPoints,alpha));

end

