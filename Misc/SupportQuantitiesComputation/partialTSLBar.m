function [Dfmu,DfL] = partialTSLBar(mur,L,wh,muh,Sigmah)

N = numel(wh);
d = size(muh(:,1),1);
Dfmu = zeros(d,1);
DfL = zeros(d,d);
Sigmar = L*L';
Linv = inv(L);
Jrr = 1/sqrt((2*pi)^d * det(2*Sigmar));
for i=1:N
    diff = (muh(:,i) - mur);
    Sigmaheta = (Sigmah(:,:,i) + Sigmar);
    Jhhi = 1/sqrt((2*pi)^d * det(2*Sigmah(:,:,i)));
    Jhri = mvnpdf(muh(:,i),mur,Sigmah(:,:,i)+Sigmar);
    
    dJhirdmu = Jhri*(Sigmaheta\diff);
    dJhridL = Jhri*(Sigmaheta\(diff*(diff'/Sigmaheta)*L - L));
    dJrrdL = -Jrr*Linv;
    
    a = -2*(1 + 4*Jrr);
    b = 1 - 2*Jhhi + 4*Jhri + 2*Jrr;
    c = 1 + 4*Jrr*sqrt(1+4*Jrr);
    
    Dfmu = Dfmu + a*wh(i)/c * dJhirdmu;
    DfL = DfL + wh(i)/c * (a*dJhridL + b*dJrrdL);
    
end




end

