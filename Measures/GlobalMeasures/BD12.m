function dBD = BD12(gmh,gmr,nPoints)

if nargin < 3
    nPoints = 1000;
end

dBD = ChernAlpha2D12(gmh,gmr,nPoints,0.5);
end

