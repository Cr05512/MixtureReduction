clear
close all

seed = randi(1000000); % Nice Seed 703006, Nh = 30, Nr = 5, d = 1, seed 109270
rng(seed);

Nh = 20;
Nalpha = 50;
% Nr = 10;
d = 1;
gm =  GMGen(Nh,d,Nh,0.5*d);
Nh = numel(gm);

%%

alpha = linspace(0,1,Nalpha);
numComps = zeros(1,Nalpha);
for i=1:Nalpha
    [gmr,~,minCosts] = ada3IFKLDMRA(gm,alpha(i),2);
    numComps(i) = length(gmr);
end
figure(1)
plot(alpha,numComps); hold on
grid minor
axis([0 1 1 Nh])