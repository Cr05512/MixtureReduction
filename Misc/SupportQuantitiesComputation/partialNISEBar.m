function [Dfmu,DfL] = partialNISEBar(mur,L,wh,muh,Sigmah)

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
    
    Dfmu = Dfmu + wh(i)*dJhirdmu/(Jhhi+Jrr);
    DfL = DfL + wh(i)/(Jhhi+Jrr)^2 * (dJhridL*(Jhhi+Jrr) - Jhri*dJrrdL);
    
    
end

Dfmu = -2*Dfmu;
DfL = -2*DfL;



end

