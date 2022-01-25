function dCAC = ChernAlphaC123(gmh,gmr,nPoints,alpha)
% dCAC = ChernAlphaC12(gmh,gmr,nPoints):
% INPUT:
% - gmh, gmr, two Gaussian Mixture,
% - nPoints, number of evaluation points.
% OUTPUT:
% - dCAC, numerically computed KLD.

assert(~isempty(gmh) && ~isempty(gmr),'The mixtures have to be non-empty.');
d = size(gmh(1).mu,1);
if nargin < 3
    nPoints = ceil(1000/d);
    alpha = 0.5;
elseif nargin < 4
    alpha = 0.5;
end

assert(nPoints>0,'The number of evaluation points has to be greater than zero.');


%assert(d==1 || d==2,'This function allows to evaluate the KLD only for dimensions 1 and 2.');
if d>3
    disp('This function allows to evaluate the KLD only for dimensions 1 and 2.');
    dCAC = -1;
    return
end


[offset,P] = getMixtureMoments(gmh);
% errorEll = errorEllipses(offset,P,0.999999);
% gamma = max(max(abs(errorEll)));
gamma = max(eig(P));
    
if d==1
   
    X = linspace(-gamma+offset, gamma+offset,nPoints);
    
    sOrig = evalGM(gmh,X);
    sRed = evalGM(gmr,X);

    f = (sOrig.^alpha).*(sRed.^(1-alpha));
    f(isnan(f)) = 0;

    dCAC = trapz(X,f);
elseif d==2
    x1 = linspace(-gamma + offset(1), gamma + offset(1),nPoints);
    x2 = linspace(-gamma + offset(2), gamma + offset(2),nPoints);
    [X1,X2] = meshgrid(x1,x2);
    X = [X1(:) X2(:)];
    
    sOrig = evalGM(gmh,X');
    sRed = evalGM(gmr,X');
    
    f = (sOrig.^alpha).*(sRed.^(1-alpha));

    f(isnan(f)) = 0;
    f = reshape(f,nPoints,nPoints);
    
    dCAC = trapz(x2,trapz(x1,f,2));
elseif d==3
    x1 = linspace(-gamma + offset(1), gamma + offset(1),nPoints);
    x2 = linspace(-gamma + offset(2), gamma + offset(2),nPoints);
    x3 = linspace(-gamma + offset(3), gamma + offset(3),nPoints);
    
    [X1,X2,X3] = meshgrid(x1,x2,x3);
    X = [X1(:) X2(:) X3(:)];
    sOrig = evalGM(gmh,X');
    sRed = evalGM(gmr,X');
    
    f = (sOrig.^alpha).*(sRed.^(1-alpha));

    f(isnan(f)) = 0;
    f = reshape(f,nPoints,nPoints,nPoints);
    dCAC = trapz(x3,trapz(x2,trapz(x1,f,3),2));
end
end

