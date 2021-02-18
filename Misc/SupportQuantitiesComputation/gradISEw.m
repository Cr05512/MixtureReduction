function [gfw,gfmu,gfL] = gradISEw(wr,mur,L,wh,muh,Sigmah)
% [gfq,gfmu,gfL] = gradISEw(qr,mur,L,wh,muh,Sigmah):
% INPUT:
% - wr, reduced mixture weights,
% - mur, reduced mixture means,
% - L, reduced mixture cholesky factorizations of covariance matrices,
% - wh, original mixture weights,
% - muh, original mixture means,
% - Sigmah, original mixture covariances.
% OUTPUT:
% - gfw, weight gradient,
% - gfmu, mean gradient,
% - gfL, covariance gradient.
% This function implements the gradient computation for the constrained
% ISE Optimization.


dr = size(mur,1);
Nr = size(mur,2);
Nh = size(muh,2);
dJhrdmu = zeros(dr,Nr);
dJrrdmu = dJhrdmu;
dJhrdL = zeros(dr,dr,Nr);
dJrrdL = dJhrdL;


Sigmar = zeros(dr,dr,Nr);
for i=1:Nr
    Sigmar(:,:,i) = L(:,:,i)'*L(:,:,i);
end

Sigmahrijinv = zeros(dr,dr,Nh,Nr);
for i=1:Nh
    for j=1:Nr
        Sigmahrijinv(:,:,i,j) = inv(Sigmah(:,:,i) + Sigmar(:,:,j));
    end
end

H1 = matrixUnwCrossLikeness(mixtureFromParams(wh,muh,Sigmah),mixtureFromParams(wr,mur,Sigmar));

dJhrdw = (wh'*H1)';
for j=1:Nr
    for i=1:Nh
        %Means
        dJhrdmu(:,j) = dJhrdmu(:,j) + wh(i)*Sigmahrijinv(:,:,i,j)*...
            (mur(:,j)-muh(:,i))*H1(i,j);
        %Covariances
        dJhrdL(:,:,j) = dJhrdL(:,:,j) + wh(i)*wr(j)*H1(i,j)...
            *Sigmahrijinv(:,:,i,j)*((muh(:,i)-mur(:,j))*...
            (muh(:,i)-mur(:,j))' - (Sigmah(:,:,i) + Sigmar(:,:,j)))...
            *Sigmahrijinv(:,:,i,j)*L(:,:,j);
    end
    %Weights
    
    %Means
    dJhrdmu(:,j) = -wr(j)*dJhrdmu(:,j);
    %Covariances
end

Sigmarijinv = zeros(dr,dr,Nr,Nr);
for i=1:Nr
    for j=1:Nr
        Sigmarijinv(:,:,i,j) = inv(Sigmar(:,:,i) + Sigmar(:,:,j));
    end
end

H2 = matrixUnwSelfLikeness(mixtureFromParams(wr,mur,Sigmar));
dJrrdw = (2*wr'*H2)';

for j=1:Nr
    for i=1:Nr
        %Means
        dJrrdmu(:,j) = dJrrdmu(:,j) + wr(i)*Sigmarijinv(:,:,i,j)*(mur(:,j)-mur(:,i))*H2(i,j);
        %Covariances
        dJrrdL(:,:,j) = dJrrdL(:,:,j) + wr(i)*wr(j)*H2(i,j)...
            *Sigmarijinv(:,:,i,j)*((mur(:,i)-mur(:,j))*(mur(:,i)-mur(:,j))'...
            -(Sigmar(:,:,i) + Sigmar(:,:,j)))*Sigmarijinv(:,:,i,j)*L(:,:,j);
    end
    %Weights
    %Means
    dJrrdmu(:,j) = -2*wr(j)*dJrrdmu(:,j);
    %Covariances
    dJrrdL(:,:,j) = 2*dJrrdL(:,:,j);
end

gfw = dJrrdw - 2*dJhrdw;
gfmu = dJrrdmu - 2*dJhrdmu;
gfL = dJrrdL - 2*dJhrdL;
end

