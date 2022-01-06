function NRKLD = RKLD12(gmh,gmr,nPoints)
% NKLD = RKLD12(gmh,gmr,nPoints):
% INPUT:
% - gmh, gmr, two Gaussian Mixture,
% - nPoints, number of evaluation points.
% OUTPUT:
% - NKLD, numerically computed KLD.
% This function computes the numerical KLD only for 1 and 2 dimensional
% problems.
if nargin < 3
    nPoints = 1000;
end
assert(~isempty(gmh) && ~isempty(gmr),'The mixtures have to be non-empty.');
assert(nPoints>0,'The number of evaluation points has to be greater than zero.');

d = size(gmh(1).mu,1);

assert(d==1 || d==2,'This function allows to evaluate the KLD only for dimensions 1 and 2.');


[offset,P] = getMixtureMoments(gmh);
errorEll = errorEllipses(offset,P,0.999999);
alpha = max(max(abs(errorEll)));
    
if d==1
   
    X = linspace(-alpha+offset, alpha+offset,nPoints);
    
    sOrig = evalGM(gmr,X);
    sRed = evalGM(gmh,X);

    f = sOrig.*log(sOrig./sRed);
    f(isnan(f)) = 0;

    NRKLD = trapz(X,f);
elseif d==2
    x1 = linspace(-alpha + offset(1), alpha + offset(1),nPoints);
    x2 = linspace(-alpha + offset(2), alpha + offset(2),nPoints);
    [X1,X2] = meshgrid(x1,x2);
    X = [X1(:) X2(:)];
    
    sOrig = evalGM(gmr,X');
    sRed = evalGM(gmh,X');
    
    f = sOrig.*log(sOrig./sRed);

    f(isnan(f)) = 0;
    f = reshape(f,nPoints,nPoints);
    
    NRKLD = trapz(x2,trapz(x1,f,2));
end

