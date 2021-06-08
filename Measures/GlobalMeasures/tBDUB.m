function dtBDUB = tBDUB(fa,gb)

wa = [fa.w]';
wb = [gb.w]';
C = CostMatrix(fa,gb,'BDij');
expC = exp(-C);

na = numel(wa);
nb = numel(wb);
pi = zeros(na,nb);

for i=1:na
    for j=1:nb
        pi(i,j) = wa(i)*wb(j)*expC(i,j);
    end
end
pi = pi./sum(sum(pi));




dtBDUB = trace(pi'*C) + matrixKLD(pi,wa*wb');

end

