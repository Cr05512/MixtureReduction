function dBC = BC12(gmh,gmr,nPoints)

if nargin < 3
    nPoints = 1000;
end

dBC = ChernAlphaC12(gmh,gmr,nPoints,0.5);
end

