function dH2 = H2123(gmh,gmr,nPoints)

d = size(gmh(1).mu,1);
if nargin < 3
    nPoints = ceil(1000/d);
end

dH2 = 0.25*ChernAlpha1D123(gmh,gmr,nPoints,0.5);

end

