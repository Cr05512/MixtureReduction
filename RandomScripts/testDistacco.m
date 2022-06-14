clear
close all

for k=1:1000
    
seed = randi(1000000); % Nice Seed 703006, Nh = 30, Nr = 5, d = 1, seed 109270
rng(seed);
Nh = 20;
% Nr = 10;
d = 2;
gm = GMGen(Nh,d,Nh,0.3);
RTL = 0.15;


%%
I = 0;
%tic; gmr = ada3IFKLDMRA(gm,I,RTL); toc
tic; gmr = adaIFKLDMRA(gm,RTL); toc;
[~,~,minCosts] = adaIFKLDMRA(gm,1);

KLDVec = zeros(Nh,1);
% tKLDVec = KLDVec;
CTDVec1 = KLDVec;
CTDVec2 = KLDVec;
for i=2:Nh
    red = IFKLDMRA(gm,Nh-i+1);
    %KLDVec(i) = FKLD123(gm,red,5000);

    %CTDVec1(i) = CTDVec1(i-1) + CTD(IFKLDMRA(gm,Nh-i+2),red,'FKLDij');
    CTDVec2(i) = CTD(gm,red,'FKLDij');
end
barCost = CTD(gm,FKLDBarycenter(gm),'FKLDij');
KLDVec = KLDVec./barCost;
CTDVec2 = CTDVec2./barCost;
CTDVec1 = CTDVec1./barCost;

a = abs(CTDVec2-minCosts);
if any(a>1e-9)
    disp('AAAAA');
    break
end
end
