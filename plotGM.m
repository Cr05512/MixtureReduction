function [] = plotGM(gm,x)

global plotTotalGM plotComponents

gmTot = zeros(1,length(x));

if plotComponents
    for i=1:length(gm)
        plot(x,gm(i).getPDF(x)); hold on

    end
end

if plotTotalGM
    for i=1:length(gm)
        gmTot = gmTot + gm(i).getPDF(x);
    end
    plot(x,gmTot,'LineWidth',1.5);
end


end

