clc
clear
close all

N = 100;
errors = zeros(1,N);

for i=1:N
    gm = GMGen(10,1);
    gmr1 = CSDBarycenter(gm);
    gmr2 = CSDBarycenterGD(gm);
    
    i
    errors(i) = ISE(gmr1,gmr2);
end

sum(errors)