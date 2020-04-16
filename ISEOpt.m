function [gmr_Opt, nISETraj] = ISEOpt(gmh,gmr,sk,Nsteps,optWeights)
%This function operates an iterative optimization over the reduced mixture
%parameters in order to approximate better the original one

%First of all we apply some transformations to the parameters in order to
%simplify the optimization process
gmr_Opt(1,length(gmr)) = wGaussPDF();
for i=1:length(gmr)
    gmr_Opt(i).copyComponent(gmr(i));
end

n = size(gmr(1).getMean(),1);
m = length(gmr);

q = zeros(m,1);
mu = zeros(n,m);
L = zeros(n,n,m);

for i=1:length(gmr_Opt)
    q(i) = sqrt(gmr_Opt(i).getWeight());
    mu(:,i) = gmr_Opt(i).getMean();
    L(:,:,i) = chol(gmr_Opt(i).getCovariance());
end

nISETraj = zeros(1,Nsteps);

%The gradient formula is xk+1 = xk - sk*gf(xk)/||gf(xk)||, with sk the step
%and gf is the gradient of the cost function

%We are optimizing with respect to the reduced mixture parameters. Taking
%into account that J = Jhh -2*Jhr + Jrr, we find out that the term Jhh does
%not depend on the parameters of the reduced mixture, that is we can skip
%calculations over that term (it is always zero).

for k=1:Nsteps
    if optWeights == 1
        dJrrdq = zeros(length(q),1);
        dJhrdq = dJrrdq;
    end
    dJhrdmu = zeros(n,m);
    dJrrdmu = dJhrdmu;
    dJhrdL = zeros(n,n,m);
    dJrrdL = dJhrdL;
   
    for j=1:length(gmr_Opt)
        for i=1:length(gmh)
            prodPDFhr = wGaussPDF(1, mu(:,j), gmh(i).getCovariance() + L(:,:,j)'*L(:,:,j));
            %Weights
            if optWeights == 1
                dJhrdq(j) = dJhrdq(j) + gmh(i).getWeight()*prodPDFhr.getPDFValues(gmh(i).getMean()');
            end
            %Means
            dJhrdmu(:,j) = dJhrdmu(:,j) + gmh(i).getWeight()*inv(gmh(i).getCovariance()...
                + L(:,:,j)'*L(:,:,j))*(mu(:,j)-gmh(i).getMean())*prodPDFhr.getPDFValues(gmh(i).getMean()');
            %Covariances
            dJhrdL(:,:,j) = dJhrdL(:,:,j) + gmh(i).getWeight()*q(j)^2*prodPDFhr.getPDFValues(gmh(i).getMean()')...
                *inv(gmh(i).getCovariance() + L(:,:,j)'*L(:,:,j))*((gmh(i).getMean()-mu(:,j))*...
                (gmh(i).getMean()-mu(:,j))' - (gmh(i).getCovariance()+ L(:,:,j)'*L(:,:,j)))...
                *inv(gmh(i).getCovariance() + L(:,:,j)'*L(:,:,j))*L(:,:,j);
        end
        %Weights
        if optWeights == 1
            dJhrdq(j) = 2*q(j)*dJhrdq(j);
        end
        %Means
        dJhrdmu(:,j) = -(q(j)^2)*dJhrdmu(:,j);
        %Covariances
        %No need
    end
    
    for j=1:length(gmr_Opt)
        for i=1:length(gmr_Opt)
            prodPDFrr = wGaussPDF(1, mu(:,j), L(:,:,i)'*L(:,:,i) + L(:,:,j)'*L(:,:,j));
            %Weights
            if optWeights == 1
                dJrrdq(j) = dJrrdq(j) + (q(i)^2)*prodPDFrr.getPDFValues(mu(:,i)');
            end
            %Means
            dJrrdmu(:,j) = dJrrdmu(:,j) + (q(i)^2)*inv(L(:,:,i)'*L(:,:,i)...
                + L(:,:,j)'*L(:,:,j))*(mu(:,j)-mu(:,i))*prodPDFrr.getPDFValues(mu(:,i)');
            %Covariances
            dJrrdL(:,:,j) = dJrrdL(:,:,j) + (q(i)^2)*(q(j)^2)*prodPDFrr.getPDFValues(mu(:,i)')...
                *inv(L(:,:,i)'*L(:,:,i) + L(:,:,j)'*L(:,:,j))*((mu(:,i)-mu(:,j))*(mu(:,i)-mu(:,j))'...
                -(L(:,:,i)'*L(:,:,i) + L(:,:,j)'*L(:,:,j)))*inv(L(:,:,i)'*L(:,:,i)...
                +L(:,:,j)'*L(:,:,j))*L(:,:,j);
        end
        %Weights
        if optWeights == 1
            dJrrdq(j) = 4*q(j)*dJrrdq(j);
        end
        %Means
        dJrrdmu(:,j) = -2*(q(j)^2)*dJrrdmu(:,j);
        %Covariances
        dJrrdL(:,:,j) = 2*dJrrdL(:,:,j);
    end
   
    if optWeights == 1
        gfq = dJrrdq - 2*dJhrdq;
        gfq = gfq/norm(gfq);
        q = q - sk*gfq;
    end
    gfmu = dJrrdmu - 2*dJhrdmu;
    gfmu = gfmu/norm(gfmu);
    gfL = dJrrdL - 2*dJhrdL;
    
    
    if n>1
        for i = 1:length(gmr_Opt)
            gfL(:,:,i) = gfL(:,:,i)./norm(gfL(:,:,i));
        end
    else
        gfLTemp = reshape(gfL,1,m);
        gfL = gfL./norm(gfLTemp);
    end
    
    mu = mu - sk*gfmu;
    L = L - sk*gfL;
    
    if optWeights == 1
        p = q.^2;
        p = p./sum(p);
    end
    for i=1:length(gmr_Opt)
        if optWeights == 1
            gmr_Opt(i).setWeight(p(i));
        end
        gmr_Opt(i).setMean(mu(:,i));
        gmr_Opt(i).setCovariance(L(:,:,i)'*L(:,:,i));
    end
    
    nISETraj(k) = nISE(gmh,gmr_Opt);
    
end

    
end