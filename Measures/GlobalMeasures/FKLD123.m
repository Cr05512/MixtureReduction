function NKLD = FKLD123(gmh,gmr,nPoints)
% NKLD = KLD12(gmh,gmr,nPoints):
% INPUT:
% - gmh, gmr, two Gaussian Mixture,
% - nPoints, number of evaluation points.
% OUTPUT:
% - NKLD, numerically computed KLD.
% This function computes the numerical KLD only for 1 and 2 dimensional
% problems.

assert(~isempty(gmh) && ~isempty(gmr),'The mixtures have to be non-empty.');


d = size(gmh(1).mu,1);

if nargin < 3
    nPoints = ceil(1000/d^2);
end

assert(nPoints>0,'The number of evaluation points has to be greater than zero.');

%assert(d==1 || d==2,'This function allows to evaluate the KLD only for dimensions 1 and 2.');
if d>3
    disp('This function allows to evaluate the KLD only for dimensions 1 and 2.');
    NKLD = -1;
    return
end


[offset,P] = getMixtureMoments(gmh);
% errorEll = errorEllipses(offset,P,0.999999);
% gamma = max(max(abs(errorEll)));
gamma = max(eig(P))*1.2;
    
if d==1
   
    X = linspace(-gamma+offset, gamma+offset,nPoints);
    
    sOrig = evalGM(gmh,X);
    sRed = evalGM(gmr,X);

    f = sOrig.*log(sOrig) - sOrig.*log(sRed);
    f(isnan(f)) = 0;

    NKLD = trapz(X,f);
elseif d==2
    x1 = linspace(-gamma + offset(1), gamma + offset(1),nPoints);
    x2 = linspace(-gamma + offset(2), gamma + offset(2),nPoints);
    [X1,X2] = meshgrid(x1,x2);
    X = [X1(:) X2(:)];
    
    sOrig = evalGM(gmh,X');
    sRed = evalGM(gmr,X');
    
    f = sOrig.*log(sOrig) - sOrig.*log(sRed);

    f(isnan(f)) = 0;
    f = reshape(f,nPoints,nPoints);
    
    NKLD = trapz(x2,trapz(x1,f,2));
elseif d==3
    x1 = linspace(-gamma + offset(1), gamma + offset(1),nPoints);
    x2 = linspace(-gamma + offset(2), gamma + offset(2),nPoints);
    x3 = linspace(-gamma + offset(3), gamma + offset(3),nPoints);
    
    [X1,X2,X3] = meshgrid(x1,x2,x3);
    X = [X1(:) X2(:) X3(:)];
    sOrig = evalGM(gmh,X');
    sRed = evalGM(gmr,X');
    
    f = sOrig.*log(sOrig) - sOrig.*log(sRed);

    f(isnan(f)) = 0;
    f = reshape(f,nPoints,nPoints,nPoints);
    NKLD = trapz(x3,trapz(x2,trapz(x1,f,3),2));
    
end
end

