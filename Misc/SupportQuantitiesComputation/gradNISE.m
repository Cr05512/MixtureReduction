function [gfw,gfmu,gfL] = gradNISE(wr,mur,L,wh,muh,Sigmah)

[dJhrdw,dJrrdw,dJhrdmu,dJrrdmu,dJhrdL,dJrrdL,Jhh,Jhr,Jrr] = partialISE(wr,mur,L,wh,muh,Sigmah);

a = -2*(Jhh + Jrr);
b = 2*Jhr;
c = (Jhh + Jrr)^2;

gfw = 1/c*(a*dJhrdw + b*dJrrdw);

gfmu = 1/c*(a*dJhrdmu + b*dJrrdmu);

gfL = 1/c*(a*dJhrdL + b*dJrrdL);


end

