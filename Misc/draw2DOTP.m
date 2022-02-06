function [] = draw2DOTP(W,gmh,gmr)

close all
assert(all(size(W)==[numel(gmh),numel(gmr)]),'The OTP dimensions are inconsistent with the provided mixtures');

Nh = numel(gmh);
Nr = numel(gmr);
[wh,muh,~] = paramsFromMixture(gmh);
[wr,mur,~] = paramsFromMixture(gmr);

figure(1)
grid minor; hold on

maxW = max(max(W));

for i=1:Nh
    for j=1:Nr
        scatter(muh(1,i),muh(2,i),ceil(3000*wh(i)),'ro','LineWidth',2); hold on
        scatter(mur(1,j),mur(2,j),ceil(3000*wr(j)),'bo','LineWidth',2); hold on
        if W(i,j)>1e-14
            plot([muh(1,i) mur(1,j)],[muh(2,i) mur(2,j)],'LineWidth',W(i,j)/maxW); hold on
%             p1 = muh(:,i);
%             p2 = mur(:,j);
%             dp = p2-p1;
%             quiver(p1(1),p1(2),dp(1),dp(2),0,'LineWidth',2*wh(i)/maxWh);
        end
    end
end




end