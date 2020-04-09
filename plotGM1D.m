function [] = plotGM1D(gm,x)

global plotTotalGM plotComponents

gmTot = zeros(1,length(x));

if plotComponents
    for i=1:length(gm)
        plot(x,gm(i).getWeight()*gm(i).getPDFValues(x),'k'); hold on

    end
end

if plotTotalGM
    for i=1:length(gm)
        gmTot = gmTot + gm(i).getWeight()*gm(i).getPDFValues(x);
    end
    plot(x,gmTot,'LineWidth',1.5); hold on
end


end

