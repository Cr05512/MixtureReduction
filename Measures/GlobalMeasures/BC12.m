function NBhattC = BC12(gmh,gmr,nPoints)
% NBhattC = BhattC12(gmh,gmr,nPoints):
% INPUT:
% - gmh, gmr, two Gaussian Mixture,
% - nPoints, number of evaluation points.
% OUTPUT:
% - NBhattC, numerically computed Bhattacharyya coefficient.
% This function computes the numerical Bhattacharyya coefficient only for 1 and 2 dimensional
% problems.
if nargin < 3
    nPoints = 1000;
end
assert(~isempty(gmh) && ~isempty(gmr),'The mixtures have to be non-empty.');
assert(nPoints>0,'The number of evaluation points has to be greater than zero.');

d = size(gmh(1).mu,1);

assert(d==1 || d==2,'This function allows to evaluate the Bhattacharyya coefficient only for dimensions 1 and 2.');

[offset,P] = getMixtureMoments(gmh);
errorEll = errorEllipses(offset,P,1-eps);
alpha = max(max(abs(errorEll)));

if d==1
    X = linspace(-alpha+offset, alpha+offset,nPoints);
    
    sOrig = evalGM(gmh,X);
    sRed = evalGM(gmr,X);

    f = sqrt(sOrig.*sRed);

    NBhattC = trapz(X,f);
elseif d==2
    x1 = linspace(-alpha + offset(1), alpha + offset(1),nPoints);
    x2 = linspace(-alpha + offset(2), alpha + offset(2),nPoints);
    [X1,X2] = meshgrid(x1,x2);
    X = [X1(:) X2(:)];
    
    sOrig = evalGM(gmh,X');
    sRed = evalGM(gmr,X');
    
    f = sqrt(sOrig.*sRed);

    f(isnan(f)) = 0;
    f = reshape(f,nPoints,nPoints);
    
    NBhattC = trapz(x2,trapz(x1,f,2));
end

end

