function [] = plotGM1D(gm,X)

global plotTotalGM plotComponents

gmTot = zeros(1,length(X));

if plotComponents
    for i=1:length(gm)
        plot(X,gm(i).getWeight()*gm(i).getPDFValues(X),'k'); hold on

    end
end

if plotTotalGM
    for i=1:length(gm)
        gmTot = gmTot + gm(i).getWeight()*gm(i).getPDFValues(X);
    end
    plot(X,gmTot,'LineWidth',1.5); hold on
end
%axis([min(X) max(X) 0 max(gmTot)*1.3]);


end

