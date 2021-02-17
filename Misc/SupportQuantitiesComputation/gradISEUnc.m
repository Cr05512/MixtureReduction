function [gfq,gfmu,gfL] = gradISEUnc(q,mu,L,wh,muh,Sigmah)
% [gfq,gfmu,gfL] = gradISEUnc(q,mu,L,wh,muh,Sigmah):
% INPUT:
% - q, reduced mixture square-root weights,
% - mu, reduced mixture means,
% - L, reduced mixture cholesky factorizations of covariance matrices,
% - wh, original mixture weights,
% - muh, original mixture means,
% - Sigmah, original mixture covariances.
% OUTPUT:
% - gfq, square-root weight gradient,
% - gfmu, mean gradient,
% - gfL, covariance gradient.
% This function implements the gradient computation for the unconstrained
% ISE Optimization. q represents the square-root of the reduced mixture
% weights, while L is the cholesky factorization of the reduced mixture
% covariance matrices.



dr = size(mu,1);
Nr = size(mu,2);
Nh = size(muh,2);
dJrrdq = zeros(length(q),1);
dJhrdq = dJrrdq;
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


for j=1:Nr
    for i=1:Nh
        prodPDFhr = struct('w',1,'mu',mu(:,j),'Sigma',Sigmah(:,:,i) + LtL(:,:,j));
        %Weights
        dJhrdq(j) = dJhrdq(j) + wh(i)*mvnpdf(muh(:,i), prodPDFhr.mu, prodPDFhr.Sigma);
        %Means
        dJhrdmu(:,j) = dJhrdmu(:,j) + wh(i)*SigmahLijinv(:,:,i,j)*...
            (mu(:,j)-muh(:,i))*mvnpdf(muh(:,i), prodPDFhr.mu, prodPDFhr.Sigma);
        %Covariances
        dJhrdL(:,:,j) = dJhrdL(:,:,j) + wh(i)*q(j)^2*mvnpdf(muh(:,i), prodPDFhr.mu, prodPDFhr.Sigma)...
            *SigmahLijinv(:,:,i,j)*((muh(:,i)-mu(:,j))*...
            (muh(:,i)-mu(:,j))' - (Sigmah(:,:,i)+ LtL(:,:,j)))...
            *SigmahLijinv(:,:,i,j)*L(:,:,j);
    end
    %Weights
    dJhrdq(j) = 2*q(j)*dJhrdq(j);
    %Means
    dJhrdmu(:,j) = -(q(j)^2)*dJhrdmu(:,j);
    %Covariances
    %No need
end

LtLijinv = zeros(dr,dr,Nr,Nr);
for i=1:Nr
    for j=1:Nr
        LtLijinv(:,:,i,j) = inv(LtL(:,:,i) + LtL(:,:,j));
    end
end

for j=1:Nr
    for i=1:Nr
        prodPDFrr = struct('w',1,'mu',mu(:,j),'Sigma',LtL(:,:,i) + LtL(:,:,j));
        %Weights
        dJrrdq(j) = dJrrdq(j) + (q(i)^2)*mvnpdf(mu(:,i)', prodPDFrr.mu', prodPDFrr.Sigma);
        %Means
        dJrrdmu(:,j) = dJrrdmu(:,j) + (q(i)^2)*LtLijinv(:,:,i,j)*(mu(:,j)-mu(:,i))*mvnpdf(mu(:,i)', prodPDFrr.mu', prodPDFrr.Sigma);
        %Covariances
        dJrrdL(:,:,j) = dJrrdL(:,:,j) + (q(i)^2)*(q(j)^2)*mvnpdf(mu(:,i)', prodPDFrr.mu', prodPDFrr.Sigma)...
            *LtLijinv(:,:,i,j)*((mu(:,i)-mu(:,j))*(mu(:,i)-mu(:,j))'...
            -(LtL(:,:,i) + LtL(:,:,j)))*LtLijinv(:,:,i,j)*L(:,:,j);
    end
    %Weights
    dJrrdq(j) = 4*q(j)*dJrrdq(j);
    %Means
    dJrrdmu(:,j) = -2*(q(j)^2)*dJrrdmu(:,j);
    %Covariances
    dJrrdL(:,:,j) = 2*dJrrdL(:,:,j);
end

gfq = dJrrdq - 2*dJhrdq;
gfmu = dJrrdmu - 2*dJhrdmu;
gfL = dJrrdL - 2*dJhrdL;
end

