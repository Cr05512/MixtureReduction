function [gfw,gfmu,gfL] = gradISEw(wr,mur,L,wh,muh,Sigmah)

[dJhrdw,dJrrdw,dJhrdmu,dJrrdmu,dJhrdL,dJrrdL] = partialISE(wr,mur,L,wh,muh,Sigmah);
a = -2;
b = 1;
c = 1;

gfw = 1/c*(a*dJhrdw + b*dJrrdw);

gfmu = 1/c*(a*dJhrdmu + b*dJrrdmu);

gfL = 1/c*(a*dJhrdL + b*dJrrdL);


end

