function [Dfmu,DfL] = partialH2Bar(mur,L,wh,muh,Sigmah)

N = numel(wh);
d = size(muh(:,1),1);
Dfmu = zeros(d,1);
DfL = zeros(d,d);
Sigmar = L*L';
detSigmar = det(Sigmar)^(1/4);
Sigmaradj = adjoint(Sigmar);
for i=1:N
    Sigmai = Sigmah(:,:,i);
    detSigmai = det(Sigmai)^(1/4);
    detSigmaiSigmar = sqrt(det(0.5*(Sigmai+Sigmar)));
    diff = (mur - muh(:,i) );
    Sigmahetainvdiff = (0.5*(Sigmai + Sigmar))\diff;
    expVal = exp(-(1/8) * diff'*Sigmahetainvdiff);
    
    mugrad = 0.25*(detSigmar*detSigmai/detSigmaiSigmar)*expVal * Sigmahetainvdiff;
    
    Dfmu = Dfmu + wh(i)*mugrad;
    
    L1 = -(0.5*(det(Sigmar)^(-3/4)*detSigmai/detSigmaiSigmar)*expVal)*Sigmaradj*L;
    L2 = 0.5*(det(0.5*(Sigmai+Sigmar))^(-3/2)*detSigmar*detSigmai*expVal)*adjoint(0.5*(Sigmai+Sigmar))*L;
    L3 = -1/8 *(detSigmar*detSigmai/detSigmaiSigmar)*expVal*Sigmahetainvdiff*Sigmahetainvdiff'*L;
    
    Lgrad = L1 + L2 + L3;
    
    DfL = DfL + wh(i)*Lgrad;
end



end

