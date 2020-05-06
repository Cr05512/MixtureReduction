function [] = plotGM1D(gm,X)


gmTot = zeros(1,length(X));


for i=1:length(gm)
    gmTot = gmTot + gm(i).w*normpdf(X,gm(i).mu,sqrt(gm(i).Sigma));
end
plot(X,gmTot,'LineWidth',1.5); hold on
%axis([min(X) max(X) 0 max(gmTot)*1.3]);


end

