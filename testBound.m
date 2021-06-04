clc
clear
close all

N = 1000;
d = 1;

res = zeros(2,N);
for i=1:N
    
    gmh = GMGen(20,d,20,0.2);
    gmr = Runnalls(gmh,5);
    %gmr = GMGen(randi(50),d,5,0.1,10);
    
    a = -tKLDB(gmh,gmr);
    b = Entropy12(gmh,1000/(d^2));
    c = GMEntropyBound(gmh,'bhattDij');
    res(1,i) = b-a;
    res(2,i) = b-c;
end

%%
res1 = res(1,:);
res1(res1==-Inf) = [];
mean(res1)

res2 = res(2,:);
res2(res2==-Inf) = [];
mean(res2)
