function dH2 = H212(gmh,gmr,nPoints)

if nargin < 3
    nPoints = 1000;
end

dH2 = 0.25*ChernAlpha1D12(gmh,gmr,nPoints,0.5);

end

