function dBC = BC123(gmh,gmr,nPoints)

d = size(gmh(1).mu,1);
if nargin < 3
    nPoints = ceil(1000/d);
end

dBC = ChernAlphaC123(gmh,gmr,nPoints,0.5);
end

