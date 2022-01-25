function val = sampleReducedBIC(gmh,gmr,nPoints)


d = size(gmh(1).mu,1);
if nargin < 3
    nPoints = 100000*d^2;
end

X = GMSamples(gmh,nPoints);

val = BIC(gmr,X);
end

