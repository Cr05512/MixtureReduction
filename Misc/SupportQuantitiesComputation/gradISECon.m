function [gfw,gfmu,gfL] = gradISECon(w,mu,L,wh,muh,Sigmah)
% [gfq,gfmu,gfL] = gradISEUnc(q,mu,L,wh,muh,Sigmah):
% INPUT:
% - w, reduced mixture weights,
% - mu, reduced mixture means,
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


dr = size(mu,1);
Nr = size(mu,2);
Nh = size(muh,2);
dJhrdmu = zeros(dr,Nr);
dJrrdmu = dJhrdmu;
dJhrdL = zeros(dr,dr,Nr);
dJrrdL = dJhrdL;


LtL = zeros(dr,dr,Nr);
for i=1:Nr
    LtL(:,:,i) = L(:,:,i)'*L(:,:,i);
end

SigmahLijinv = zeros(dr,dr,Nh,Nr);
for i=1:Nh
    for j=1:Nr
        SigmahLijinv(:,:,i,j) = inv(Sigmah(:,:,i) + LtL(:,:,j));
    end
end

H1 = zeros(Nh,Nr);

for i=1:Nh
    for j=1:Nr
        H1(i,j) = mvnpdf(muh(:,i),mu(:,j),Sigmah(:,:,i) + LtL(:,:,j));
    end
end

dJhrdw = (wh'*H1)';
for j=1:Nr
    for i=1:Nh
        prodPDFhr = struct('w',1,'mu',mu(:,j),'Sigma',Sigmah(:,:,i) + LtL(:,:,j));
        %Means
        dJhrdmu(:,j) = dJhrdmu(:,j) + wh(i)*SigmahLijinv(:,:,i,j)*...
            (mu(:,j)-muh(:,i))*mvnpdf(muh(:,i), prodPDFhr.mu, prodPDFhr.Sigma);
        %Covariances
        dJhrdL(:,:,j) = dJhrdL(:,:,j) + wh(i)*w(j)*mvnpdf(muh(:,i), prodPDFhr.mu, prodPDFhr.Sigma)...
            *SigmahLijinv(:,:,i,j)*((muh(:,i)-mu(:,j))*...
            (muh(:,i)-mu(:,j))' - (Sigmah(:,:,i)+ LtL(:,:,j)))...
            *SigmahLijinv(:,:,i,j)*L(:,:,j);
    end
    %Weights
    
    %Means
    dJhrdmu(:,j) = -w(j)*dJhrdmu(:,j);
    %Covariances
end

LtLijinv = zeros(dr,dr,Nr,Nr);
for i=1:Nr
    for j=1:Nr
        LtLijinv(:,:,i,j) = inv(LtL(:,:,i) + LtL(:,:,j));
    end
end

H2 = zeros(Nr,Nr);
for i=1:Nr
    for j=1:Nr
        H2(i,j) = mvnpdf(mu(:,i),mu(:,j),LtL(:,:,i) + LtL(:,:,j));
    end
end
dJrrdw = (2*w'*H2)';

for j=1:Nr
    for i=1:Nr
        prodPDFrr = struct('w',1,'mu',mu(:,j),'Sigma',LtL(:,:,i) + LtL(:,:,j));
        %Means
        dJrrdmu(:,j) = dJrrdmu(:,j) + w(i)*LtLijinv(:,:,i,j)*(mu(:,j)-mu(:,i))*mvnpdf(mu(:,i)', prodPDFrr.mu', prodPDFrr.Sigma);
        %Covariances
        dJrrdL(:,:,j) = dJrrdL(:,:,j) + w(i)*w(j)*mvnpdf(mu(:,i)', prodPDFrr.mu', prodPDFrr.Sigma)...
            *LtLijinv(:,:,i,j)*((mu(:,i)-mu(:,j))*(mu(:,i)-mu(:,j))'...
            -(LtL(:,:,i) + LtL(:,:,j)))*LtLijinv(:,:,i,j)*L(:,:,j);
    end
    %Weights
    %Means
    dJrrdmu(:,j) = -2*w(j)*dJrrdmu(:,j);
    %Covariances
    dJrrdL(:,:,j) = 2*dJrrdL(:,:,j);
end

gfw = dJrrdw - 2*dJhrdw;
gfmu = dJrrdmu - 2*dJhrdmu;
gfL = dJrrdL - 2*dJhrdL;
end

