function gmr = ISEOptUnc(gmr,gmh,NOptSteps,accThresh)
% gmr = ISEOptUnc(gmr,gmh,NOptSteps):
% - gmr, gmh, two Gaussian Mixtures,
% - NOptSteps
% This function performs the ISE Optimization on the parameters of the
% reduced mixture by using the builtin Matlab function fminunc.

if nargin < 3
    NOptSteps = 50;
    accThresh = 1e-05;
end

Nr = numel(gmr);
dr = size(gmr(1).mu,1);

q = sqrt([gmr.w]');
mur = [gmr.mu];
Sigmar = cat(3,gmr.Sigma);
L = zeros(size(Sigmar));
for i=1:Nr
    L(:,:,i) = chol(gmr(i).Sigma);
end

x0 = [q;reshape(mur,dr*Nr,1);reshape(L,dr*dr*Nr,1)];

f = @(x) funGradComp(x,gmh,Nr);

options = optimoptions('fminunc','OptimalityTolerance',accThresh,...
                       'MaxFunctionEvaluations',NOptSteps,...
                       'Algorithm','trust-region','SpecifyObjectiveGradient',true,'display','none');

x = fminunc(f,x0,options);


q = x(1:Nr);
muLen = dr*Nr;
mu = reshape(x(Nr+1:Nr+muLen),dr,Nr);
L = reshape(x(Nr+muLen+1:end),[dr dr Nr]);

gmr(Nr,1) = struct('w',[],'mu',[],'Sigma',[]);
for i=1:Nr
    gmr(i).w = q(i)^2;
    gmr(i).mu = mu(:,i);
    gmr(i).Sigma = L(:,:,i)'*L(:,:,i);
end

gmr = refine('weightISEOpt',gmr,gmh);

end

function [f,grad] = funGradComp(x,gmh,Nr)
    %We rebuild back the gmr in order to evaluate the ISE
    dr = size(gmh(1).mu,1);
    
    q = x(1:Nr);
    muLen = dr*Nr;
    mu = reshape(x(Nr+1:Nr+muLen),dr,Nr);
    L = reshape(x(Nr+muLen+1:end),[dr dr Nr]);
    
    gmr(Nr,1) = struct('w',[],'mu',[],'Sigma',[]);
    for i=1:Nr
        gmr(i).w = q(i)^2;
        gmr(i).mu = mu(:,i);
        gmr(i).Sigma = L(:,:,i)'*L(:,:,i);
    end
    
    f = ISE(gmh,gmr);
    
    wh = [gmh.w]';
    muh = [gmh.mu];
    Sigmah = cat(3,gmh.Sigma);
    
    Nh = numel(wh);
    
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
    
    grad = [gfq; reshape(gfmu,dr*Nr,1); reshape(gfL,dr*dr*Nr,1)];


end
