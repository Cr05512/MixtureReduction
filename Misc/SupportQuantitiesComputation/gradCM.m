function [gfw,gfmu,gfL] = gradCM(wr,mur,L,wh,muh,Sigmah)

[dJhrdw,dJrrdw,dJhrdmu,dJrrdmu,dJhrdL,dJrrdL,Jhh,Jhr,Jrr] = partialISE(wr,mur,L,wh,muh,Sigmah);

a = -sqrt(Jhh*Jrr);
b = Jhr*Jhh/(2*sqrt(Jhh*Jrr));
c = Jhh*Jrr;

gfw = 1/c*(a*dJhrdw + b*dJrrdw);

gfmu = 1/c*(a*dJhrdmu + b*dJrrdmu);

gfL = 1/c*(a*dJhrdL + b*dJrrdL);


end

