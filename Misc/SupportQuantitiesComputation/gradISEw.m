function [gfw,gfmu,gfL] = gradISEw(wr,mur,L,wh,muh,Sigmah)

[dJhrdw,dJrrdw,dJhrdmu,dJrrdmu,dJhrdL,dJrrdL] = partialISE(wr,mur,L,wh,muh,Sigmah);


gfw = -2*dJhrdw + dJrrdw;

gfmu = -2*dJhrdmu + dJrrdmu;

gfL = -2*dJhrdL + dJrrdL;


end

