clc
clear
close all
Nh = 30;
d = 7;
pa = GMGen(Nh,d);
pb = IW2MRA(pa,10);
costMeas = 'W2ij';
%%
CTDval = CTD(pa,pb,costMeas)
RCTDVal = RCTD(pa,pb,costMeas)
%FKLD123(pa,pb)

[pbRef,~,pi] = CTDRef(pb,pa,costMeas);
CTD(pa,pbRef,costMeas)

if d==1
figure(1)
X = genAxisPoints(pa,1000);
plotGM1D(pa,X,{'Color','k'});
plotGM1D(pb,X); hold on
grid minor
plotGM1D(pbRef,X,{'Color','r','LineStyle','-.'});
legend('Original','red','ref')
end


