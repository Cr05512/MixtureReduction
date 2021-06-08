function [] = plotKRings2D(gm,k,gamma)

if nargin < 3
    gamma = 0.5;
end

figure(1)
SPs = kRingUT(gm,k,gamma);
[X,x1,x2] = genAxisPoints(gm,500);
plotGM2D(gm,X,x1,x2); hold on
scatter(SPs(1,:),SPs(2,:),'g'); hold on
for i=1:numel(gm)
    
    errEll = errorEllipses(gm(i).mu,gm(i).Sigma,0.99);
    
    plot(errEll(1,:),errEll(2,:)); hold on
    
end

grid minor
axis square

end

