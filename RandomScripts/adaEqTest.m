clear
close all

for l = 1:100
    seed = randi(1000000); % Nice Seed 703006, Nh = 30, Nr = 5, d = 1, seed 109270
    rng(seed);
    
    Nh = 20;
    % Nr = 10;
    d = randi(10);
    gm = GMGen(Nh,randi(5),randi(Nh),0.1+rand*0.9);
    RTL = 0.15;
    
    tic; [gmr,~,minCosts] = adaIFKLDMRA(gm,1); toc
 
 
    
    %%
    KLDVec = zeros(Nh,1);
 
    CTDVec1 = KLDVec;
    CTDVec2 = KLDVec;
    barCost = CTD(gm,FKLDBarycenter(gm),'FKLDij');
    for i=2:Nh
        red = IFKLDMRA(gm,Nh-i+1);

    
        %CTDVec1(i) = CTDVec1(i-1) + CTD(IFKLDMRA(gm,Nh-i+2),red,'FKLDij');
        CTDVec2(i) = CTD(gm,red,'FKLDij')/barCost;
    end

    %CTDVec2 = CTDVec2./barCost;
    %CTDVec1 = CTDVec1./barCost;
  
    %norm(CTDVec1-minCosts)
    a = norm(CTDVec2-minCosts)
    if a>1e-2
        break
    end
end