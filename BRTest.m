clc
clear
d = 2;
g1 = GMGen(1,d);
g2 = GMGen(1,d);
%%

mu1 = g1.mu;
mu2 = g2.mu;
Sigma1 = g1.Sigma;
Sigma2 = g2.Sigma;

theta11 = Sigma1\mu1;
theta12 = inv(Sigma1);
theta21 = Sigma2\mu2;
theta22 = inv(Sigma2);

F1 = 0.5*theta11'*(theta12\theta11) - 0.5*log(det(theta12)) + 0.5*d*log(2*pi);
F2 = 0.5*theta21'*(theta22\theta21) - 0.5*log(det(theta22)) + 0.5*d*log(2*pi);

alpha = 0.5;
thetaTilde1 = (alpha*theta11+(1-alpha)*theta21);
thetaTilde2 = (alpha*theta12+(1-alpha)*theta22);

FTilde = 0.5*thetaTilde1'*(thetaTilde2\thetaTilde1) - 0.5*log(det(thetaTilde2)) + 0.5*d*log(2*pi);

BR = (alpha*F1+(1-alpha)*F2) - FTilde
BDij(g1,g2)
CSDij(g1,g2)
Hell1ij(g1,g2)