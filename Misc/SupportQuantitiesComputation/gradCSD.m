function [gfw,gfmu,gfL] = gradCSD(wr,mur,L,wh,muh,Sigmah)

[dJhrdw,dJrrdw,dJhrdmu,dJrrdmu,dJhrdL,dJrrdL,~,Jhr,Jrr] = partialISE(wr,mur,L,wh,muh,Sigmah);

gfw = -1/Jhr*dJhrdw + 0.5/Jrr*dJrrdw;

gfmu = -1/Jhr*dJhrdmu + 0.5/Jrr*dJrrdmu;

gfL = -1/Jhr*dJhrdL + 0.5/Jrr*dJrrdL;


end

