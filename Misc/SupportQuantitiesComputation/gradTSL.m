function [gfw,gfmu,gfL] = gradTSL(wr,mur,L,wh,muh,Sigmah)

[dJhrdw,dJrrdw,dJhrdmu,dJrrdmu,dJhrdL,dJrrdL,Jhh,Jhr,Jrr] = partialISE(wr,mur,L,wh,muh,Sigmah);


a = -2*(1 + 4*Jrr);
b = 1 - 2*Jhh + 4*Jhr + 2*Jrr;
c = 1 + 4*Jrr*sqrt(1+4*Jrr);

gfw = 1/c*(a*dJhrdw + b*dJrrdw);

gfmu = 1/c*(a*dJhrdmu + b*dJrrdmu);

gfL = 1/c*(a*dJhrdL + b*dJrrdL);


end

