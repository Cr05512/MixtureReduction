function NE = Entropy12(gmh,nPoints)
% NE = Entropy12(gmh,gmr,nPoints):
% INPUT:
% - gmh, gmr, two Gaussian Mixture,
% - nPoints, number of evaluation points.
% OUTPUT:
% - NE, numerically computed Entropy.
% This function computes the numerical Entropy only for 1 and 2 dimensional
% problems.
if nargin < 2
    nPoints = 1000;
end
assert(~isempty(gmh),'The mixtures have to be non-empty.');
assert(nPoints>0,'The number of evaluation points has to be greater than zero.');

d = size(gmh(1).mu,1);

assert(d==1 || d==2,'This function allows to evaluate the Entropy only for dimensions 1 and 2.');

if d==1
    X = genAxisPoints(gmh,nPoints);
    sOrig = evalGM(gmh,X);

    f = -sOrig.*log(sOrig);
    f(isnan(f)) = 0;

    NE = trapz(X,f);
elseif d==2
    [X,x1,x2] = genAxisPoints(gmh,nPoints);
    sOrig = evalGM(gmh,X');
    
    f = -sOrig.*log(sOrig);

    f(isnan(f)) = 0;
    f = reshape(f,nPoints,nPoints);
    
    NE = trapz(x2,trapz(x1,f,2));
end

