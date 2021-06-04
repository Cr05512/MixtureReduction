clc
clear
close all

N = 10;
d = 1;
gm = testCrouse;
%%
tic;
barOS = CSDBarycenter(gm);
toc

tic;
barIT = gm(1);


for i=2:N
    barIT = CSDBarycenter([barIT;gm(i)]);
end
toc
CSD(gm,barIT)
CSD(gm,barOS)