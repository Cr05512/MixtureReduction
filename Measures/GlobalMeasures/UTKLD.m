function UTKLDVal = UTKLD(gmh,gmr,coeffs)
if nargin < 3
    coeffs = [0.5 1.1];
end
d = size(gmh(1).mu,1);
Nh = numel(gmh);
numCoeffs = numel(coeffs);
SPs = zeros(d,Nh*(numCoeffs*d+1));
for i=1:Nh
    x = gmh(i).mu;
    P = gmh(i).Sigma;
    [V,D] = svd(P);
    lambda = diag(D);
    SPs(:,((i-1)*(2*numCoeffs*d+1)+1):i*(2*numCoeffs*d+1)) = [x x+kron(coeffs,sqrt(lambda)'.*V) x-kron(coeffs,sqrt(lambda)'.*V)];
end

logVals = log(evalGM(gmh,SPs)./evalGM(gmr,SPs));
val = 0;
for m=1:Nh
    val = val + gmh(m).w*sum(logVals(((m-1)*(2*numCoeffs*d+1)+1):m*(2*numCoeffs*d+1)));
end

UTKLDVal = val/(2*numCoeffs*d+1);
end

