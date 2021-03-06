function [gfw,gfmu,gfL] = gradCSD(wr,mur,L,wh,muh,Sigmah)

[dJhrdw,dJrrdw,dJhrdmu,dJrrdmu,dJhrdL,dJrrdL,~,Jhr,Jrr] = partialISE(wr,mur,L,wh,muh,Sigmah);

a = -1/Jhr;
b = 0.5/Jrr;
c = 1;

gfw = 1/c*(a*dJhrdw + b*dJrrdw);

gfmu = 1/c*(a*dJhrdmu + b*dJrrdmu);

gfL = 1/c*(a*dJhrdL + b*dJrrdL);


end

