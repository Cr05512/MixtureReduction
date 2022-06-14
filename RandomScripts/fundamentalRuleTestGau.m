clc
clear
close all

d = randi(10);
gm = GMGen(3+randi(30),d,2);

idxs = randperm(numel(gm),3);
i = idxs(1);
j = idxs(2);
k = idxs(3);
i1 = gm(i);
i2 = gm(j);
i3 = gm(k);
bar = L2Barycenter([i1,i2]);
w1 = i1.w;
w2 = i2.w;
C1 = w1*L2ij(i1,bar) + w2*L2ij(i2,bar) + (w1+w2)*L2ij(bar,i3);
C2 = w1*L2ij(i1,i3) + w2*L2ij(i2,i3);
C1 - C2