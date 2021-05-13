function NCE = CrossEntropy12(gmh,gmr,nPoints)
% NCE = CrossEntropy12(gmh,gmr,nPoints):
% INPUT:
% - gmh, gmr, two Gaussian Mixture,
% - nPoints, number of evaluation points.
% OUTPUT:
% - NCE, numerically computed CE.
% This function computes the numerical cross-entropy only for 1 and 2 dimensional
% problems.
if nargin < 3
    nPoints = 10000;
end
assert(~isempty(gmh) && ~isempty(gmr),'The mixtures have to be non-empty.');
assert(nPoints>0,'The number of evaluation points has to be greater than zero.');

d = size(gmh(1).mu,1);

assert(d==1 || d==2,'This function allows to evaluate the CE only for dimensions 1 and 2.');

if d==1
    X = genAxisPoints(gmh,nPoints);
    sOrig = evalGM(gmh,X);
    sRed = evalGM(gmr,X);

    f = -sOrig.*log(sRed);
    f(isnan(f)) = 0;

    NCE = trapz(X,f);
elseif d==2
    [X,x1,x2] = genAxisPoints(gmh,nPoints);
    sOrig = evalGM(gmh,X');
    sRed = evalGM(gmr,X');
    
    f = -sOrig.*log(sRed);

    f(isnan(f)) = 0;
    f = reshape(f,nPoints,nPoints);
    
    NCE = trapz(x2,trapz(x1,f,2));
end

