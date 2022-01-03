clc
clear
close all

N = 10000;
d = 1;
alpha = 25;
for i=1:N
   
    gm1 = GMGen(randi(20),d,alpha);
    gm2 = GMGen(randi(15),d,alpha);
    
    dOrig = Hell212(gm1,gm2,50000);
    dCTD = CTD(gm1,gm2,'H2ij');
    
    res = dCTD - dOrig
    
    if res<-1e6 && res ~= -Inf
        disp("Not an upper bound.");
        pause()
    end
    
end