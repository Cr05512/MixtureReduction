function [gfw,gfmu,gfL] = gradJR2D(wr,mur,L,wh,muh,Sigmah)

[dJhrdw,dJrrdw,dJhrdmu,dJrrdmu,dJhrdL,dJrrdL,Jhh,Jhr,Jrr] = partialISE(wr,mur,L,wh,muh,Sigmah);

den = 2*Jrr*(Jhh + 2*Jhr + Jrr);
a = -4*Jrr;
b = -Jrr + Jhh + 2*Jhr;
c = den;

gfw = 1/c*(a*dJhrdw + b*dJrrdw);

gfmu = 1/c*(a*dJhrdmu + b*dJrrdmu);

gfL = 1/c*(a*dJhrdL + b*dJrrdL);


end

