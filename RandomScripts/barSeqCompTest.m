clc
clear
close all
d = randi(5);
gm = GMGen(3,d,3);
a = gm(1);
b = gm(2);
c = gm(3);
costMeas = 'FKLDij';

ab = computeBarycenter([a;b],costMeas);
abc = computeBarycenter([ab;c],costMeas);
bc = computeBarycenter([b;c],costMeas);
bca = computeBarycenter([bc;a],costMeas);
ca = computeBarycenter([c;a],costMeas);
cab = computeBarycenter([ca;b],costMeas);
feval(costMeas,abc,bca)
feval(costMeas,bca,cab)
feval(costMeas,cab,abc)