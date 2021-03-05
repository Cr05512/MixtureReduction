function [gfw,gfmu,gfL] = gradNISE(wr,mur,L,wh,muh,Sigmah)

[dJhrdw,dJrrdw,dJhrdmu,dJrrdmu,dJhrdL,dJrrdL,Jhh,Jhr,Jrr] = partialISE(wr,mur,L,wh,muh,Sigmah);
denhr = Jhh + Jrr;

gfw = -2*(dJhrdw*denhr - Jhr*dJrrdw)./denhr^2;

gfmu = -2*(dJhrdmu*denhr - Jhr*dJrrdmu)./denhr^2;

gfL = -2*(dJhrdL*denhr - Jhr*dJrrdL)./denhr^2;


end

