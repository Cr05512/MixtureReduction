function dH1 = H112(gmh,gmr,nPoints)

if nargin < 3
    nPoints = 1000;
end

dH1 = sqrt(H212(gmh,gmr,nPoints));

end

