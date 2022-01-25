function dH1 = H1123(gmh,gmr,nPoints)

d = size(gmh(1).mu,1);
if nargin < 3
    nPoints = ceil(1000/d);
end

dH1 = sqrt(H2123(gmh,gmr,nPoints));

end

