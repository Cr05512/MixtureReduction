function [] = plotGM2D(gm,x1,x2,X)

global plotTotalGM

if plotTotalGM
    gmTot = zeros(length(x1)*length(x2),1);
    for i=1:length(gm)
        gmTot = gmTot + gm(i).getPDF(X);
    end
    gmTot = reshape(gmTot,length(x1),length(x2));
    mesh(x1,x2,gmTot,'LineWidth',1.5);
end

end

