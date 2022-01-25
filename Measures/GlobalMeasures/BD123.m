function dBD = BD123(gmh,gmr,nPoints)

d = size(gmh(1).mu,1);
if nargin < 3
    nPoints = ceil(1000/d);
end

dBD = ChernAlpha2D123(gmh,gmr,nPoints,0.5);
end

