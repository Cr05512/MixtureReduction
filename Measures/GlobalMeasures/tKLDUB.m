function tB = tKLDUB(fa,gb)

na = numel(fa);
nb = numel(gb);
[wa,mua,Sigmaa] = paramsFromMixture(fa);
wb = [gb.w]';
d = size(fa(1).mu,1);
C = CostMatrix(fa,gb,'KLDij');

expC = exp(-1*C);
W = zeros(na,nb);

for i=1:na
    normFactor = wb'*expC(i,:)';
    for j=1:nb
        W(i,j) = wb(j)*expC(i,j)/normFactor;
    end
end

W = diag(wa)*W;

logW = log(W);

V = 0;

for i=1:na
    for j=1:nb
        c1 = -W(i,j)*log(wb(j));
        c2 = W(i,j)*logW(i,j);
        c3 = W(i,j)*C(i,j);
        if isnan(c1)
            c1 = 0;
        end
        if isnan(c2)
            c2 = 0;
        end
        if isnan(c3)
            c3 = 0;
        end
        V = V + c1 + c2 + c3;
    end
end

Jaa = matrixUnwSelfLikeness(mua,Sigmaa);
B = log(Jaa*wa);
D = zeros(na,1);
for i=1:na
    D(i) = mvEntropy(fa(i));
end
hwa = - wa'*log(wa);

tB = wa'*(B+D)+hwa+V;
end

