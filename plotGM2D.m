function [] = plotGM2D(gm,x1,x2,X)

gmTot = zeros(length(x1)*length(x2),1);
for i=1:length(gm)
    gmTot = gmTot + gm(i).w*mvnpdf(X,gm(i).mu',gm(i).Sigma);
end
gmTot = reshape(gmTot,length(x1),length(x2));
mesh(x1,x2,gmTot,'LineWidth',1.5);
axis([min(x1) max(x1) min(x2) max(x2)])

end

