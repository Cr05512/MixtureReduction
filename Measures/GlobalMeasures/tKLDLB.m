function tB = tKLDLB(gmh,gmr)

na = numel(gmh);
[wa,mua,Sigmaa] = paramsFromMixture(gmh);
[wb,mub,Sigmab] = paramsFromMixture(gmr);


D = zeros(na,1);
for i=1:na
    D(i) = mvEntropy(gmh(i));
end
hwa = - wa'*log(wa);
C = CostMatrix(gmh,gmh,'KLDij');

expC = exp(-1*C);
W = zeros(na,na);

for i=1:na
    normFactor = wa'*expC(i,:)';
    for j=1:na
        W(i,j) = wa(j)*expC(i,j)/normFactor;
    end
end

W = diag(wa)*W;

logW = log(W);

V = 0;

for i=1:na
    for j=1:na
        c1 = -W(i,j)*log(wa(j));
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

GLfa = -wa'*D - hwa - V;

Hab = matrixUnwCrossLikeness(mua,Sigmaa,mub,Sigmab);
B = log(Hab*wb);

GLgb = wa'*B;

tB = GLfa - GLgb;




end

