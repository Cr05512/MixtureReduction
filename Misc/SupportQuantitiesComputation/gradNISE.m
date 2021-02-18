function [gfw,gfmu,gfL] = gradNISE(wr,mur,L,wh,muh,Sigmah)

% Weights

Nh = numel(wh);
Nr = numel(wr);
dr = size(mur(:,1),1);
Sigmar = zeros(dr,dr,Nr);
for i=1:Nr
    Sigmar(:,:,i) = L(:,:,i)'*L(:,:,i);
end

Sigmarijinv = zeros(dr,dr,Nr,Nr);
for i=1:Nr
    for j=1:Nr
       Sigmarijinv(:,:,i,j) = inv(Sigmar(:,:,i) + Sigmar(:,:,j));
    end
end

SigmahLijinv = zeros(dr,dr,Nh,Nr);
for i=1:Nh
    for j=1:Nr
        SigmahLijinv(:,:,i,j) = inv(Sigmah(:,:,i) + Sigmar(:,:,j));
    end
end

gmh = mixtureFromParams(wh,muh,Sigmah);
gmr = mixtureFromParams(wr,mur,Sigmar);
Jhh = selfLikeness(gmh);
Jhr = crossLikeness(gmh,gmr);
Jrr = selfLikeness(gmr);
Hselfr = matrixUnwSelfLikeness(gmr);
Hcross = matrixUnwCrossLikeness(gmh,gmr);
dJhrdmu = zeros(dr,Nr);
dJrrdmu = dJhrdmu;
dJhrdL = zeros(dr,dr,Nr);
dJrrdL = dJhrdL;

denhr = Jhh + Jrr;


dJhrdw = (wh'*Hcross)';

for j=1:Nr
    for i=1:Nh
        %Means
        dJhrdmu(:,j) = dJhrdmu(:,j) + wh(i)*SigmahLijinv(:,:,i,j)*...
            (mur(:,j)-muh(:,i))*Hcross(i,j);
        %Covariances
        dJhrdL(:,:,j) = dJhrdL(:,:,j) + wh(i)*wr(j)*Hcross(i,j)...
            *SigmahLijinv(:,:,i,j)*((muh(:,i)-mur(:,j))*...
            (muh(:,i)-mur(:,j))' - (Sigmah(:,:,i)+ Sigmar(:,:,j)))...
            *SigmahLijinv(:,:,i,j)*L(:,:,j);
    end
    %Weights
    
    %Means
    dJhrdmu(:,j) = -wr(j)*dJhrdmu(:,j);
    %Covariances
end

dJrrdw = (2*wr'*Hselfr)';

for j=1:Nr
    for i=1:Nr
        %Means
        dJrrdmu(:,j) = dJrrdmu(:,j) + wr(i)*Sigmarijinv(:,:,i,j)*(mur(:,j)-mur(:,i))*Hselfr(i,j);
        %Covariances
        dJrrdL(:,:,j) = dJrrdL(:,:,j) + wr(i)*wr(j)*Hselfr(i,j)...
            *Sigmarijinv(:,:,i,j)*((mur(:,i)-mur(:,j))*(mur(:,i)-mur(:,j))'...
            -(Sigmar(:,:,i) + Sigmar(:,:,j)))*Sigmarijinv(:,:,i,j)*L(:,:,j);
    end
    %Weights
    %Means
    dJrrdmu(:,j) = -2*wr(j)*dJrrdmu(:,j);
    %Covariances
    dJrrdL(:,:,j) = 2*dJrrdL(:,:,j);
end

gfw = -2*(dJhrdw*denhr - Jhr*dJrrdw)./denhr^2;

gfmu = -2*(dJhrdmu*denhr - Jhr*dJrrdmu)./denhr^2;

gfL = -2*(dJhrdL*denhr - Jhr*dJrrdL)./denhr^2;


end

