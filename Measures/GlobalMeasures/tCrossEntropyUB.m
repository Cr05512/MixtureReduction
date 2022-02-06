function tB = tCrossEntropyUB(gmh,gmr)

na = numel(gmh);
nb = numel(gmr);
wa = [gmh.w]';
wb = [gmr.w]';
C = CostMatrix(gmh,gmr,'CEij');

expC = exp(-C);
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
%         if isnan(c3)
%             c3 = 0;
%         end
        V = V + c1 + c2 + c3;
    end
end

hwa = - wa'*log(wa);
tB = hwa+V;
end

