function [SPs,alphas] = kRingUT(gm,k)

N = numel(gm);
d = size(gm(1).mu,1);
SPs = zeros(d,N*(2*k*d+1));
r = sqrt((2*d*k + 1)/2);

alphas = zeros(1,k);

hs = 1:k;
h4s = hs.^4;
sumh4s = sum(h4s);
alphas(1) = 1/sqrt(sumh4s) * r;
for i=2:k
    alphas(i) = i^2*alphas(1);
end

for i=1:N
    x = gm(i).mu;
    P = gm(i).Sigma;
    [~,D,V] = svd(P);
    lambda = diag(D);
    SPs(:,((i-1)*(2*k*d+1)+1):i*(2*k*d+1)) = [x x+kron(alphas,sqrt(lambda)'.*V) x-kron(alphas,sqrt(lambda)'.*V)];
end

end

