function UTKLDVal = UTKLD(gmh,gmr)
d = size(gmh(1).mu,1);
Nh = numel(gmh);
SPs = zeros(d,Nh*(2*d+1));
for i=1:Nh
    x = gmh(i).mu;
    P = gmh(i).Sigma;
    [V,D] = svd(P);
    lambda = diag(D);
    SPs(:,((i-1)*(2*d+1)+1):i*(2*d+1)) = [x x+sqrt(lambda).*V  x-sqrt(lambda).*V];
end
logVals = log(evalGM(gmh,SPs)./evalGM(gmr,SPs));
val = 0;
for i=1:Nh
    val = val + gmh(i).w*sum(logVals(((i-1)*(2*d+1)+1):i*(2*d+1)));
end

UTKLDVal = val/(2*d+1);
end

