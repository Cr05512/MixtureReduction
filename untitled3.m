clc
clear
close all

costMeas = 'KLDij';
N = 1000;

for k=1:N
    gm = GMGen(10,1);

    [gmr2,pairs,minCost] = Runnalls(gm,9);

    gmr = gm;
    gmr(pairs(2)) = [];
    gmr = renormalizeWeights(gmr);
    cost1 = CTD(gm,gmr,costMeas);
    cost2 = CTD(gmr,gm,costMeas);
    
    cost1-minCost
    cost2-minCost
end