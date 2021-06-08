clc
clear
close all

N = 1000;
d = 1;
for i=1:N
   
    gm1 = GMGen(randi(20),d);
    gm2 = GMGen(randi(10),d);
    
    dOrig = BD12(gm1,gm2,10000);
    dCTD = CTD(gm1,gm2,'BDij');
    
    dCTD - dOrig
    
    if dCTD<dOrig
        disp("Not an upper bound.");
        pause()
    end
    
end