function dKLDUB = VKLDUB(gmh,gmr)
% This function implements the variational KLD upper bound proposed in
% Hershey-Olsen.

wa = [gmh.w]';
wb = [gmr.w]';

na = numel(wa);
nb = numel(wb);

phiba = wa*wb';
psiab = phiba;

C = CostMatrix(gmh,gmr,'FKLDij');
expC = exp(-C);

for k=1:100
    
    sumPhibarows = sum(phiba,1);
    for i=1:na
        for j=1:nb
            psiab(i,j) = wb(j)*phiba(i,j)/sumPhibarows(j);
        end
    end
    
    
    for i=1:na
        for j=1:nb
            phiba(i,j) = wa(i)*psiab(i,j)*expC(i,j);
        end
        phiba(i,:) = phiba(i,:)./(psiab(i,:)*expC(i,:)');
    end
    
end

dKLDUB = matrixKLD(phiba,psiab) + sum(sum(phiba.*C));


end

