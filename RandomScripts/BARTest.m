clc
clear
close all

N = 20;
d = 8;
gm = GMGen(N,d);
S = rand(d,d);
S = S*S';
%gm = mixtureFromParams([gm.w]',[gm.mu],cat(3,S.*ones(1,1,N))); %Homoscedasticity
%%
tic;
barOS = W2Barycenter(gm);
toc

tic;
barIT = gm(1);


for i=2:N
    barIT = W2Barycenter([barIT;gm(i)]);
end
toc
CTD(gm,barIT,'W2ij')
CTD(gm,barOS,'W2ij')