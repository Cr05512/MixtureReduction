function gmr = ISEOpt(gmh,gmr,sk,Nstep)
%This function operates an iterative optimization over the reduced mixture
%parameters in order to approximate better the original one

%First of all we apply some transformations to the parameters in order to
%simplify the optimization process
q = zeros(length(gmr),1);
mu = zeros(length(gmr(1).getMean()),length(gmr));
L = zeros([size(gmr(1).getCovariance()),length(gmr)]);
for i=1:length(gmr)
    q(i) = sqrt(gmr(i).getWeight());
    mu(:,i) = gmr(i).getMean();
    L(:,:,i) = chol(gmr(i).getCovariance());
end


%The gradient formula is xk+1 = xk - sk*gf(xk)/||gf(xk)||, with sk the step
%and gf is the gradient of the cost function

%We are optimizing with respect to the reduced mixture parameters. Taking
%into account that J = Jhh -2*Jhr + Jrr, we find out that the term Jhh does
%not depend on the parameters of the reduced mixture, that is we can skip
%calculations over that term (it is always zero).

for k=1:Nstep
    %dJrrdq = zeros(length(q),1);
    %dJhrdq = dJrrdq;
    dJhrdmu = zeros(length(gmr(1).getMean()),length(gmr));
    dJrrdmu = dJhrdmu;
    dJhrdL = zeros([size(gmr(1).getCovariance()),length(gmr)]);
    dJrrdL = dJhrdL;
   
    for j=1:length(gmr)
        for i=1:length(gmh)
            prodPDFhr = wGaussPDF(1, mu(:,j), gmh(i).getCovariance() + L(:,:,j)'*L(:,:,j));
            %Weights
            %dJhrdq(j) = dJhrdq(j) + gmh(i).getWeight()*prodPDFhr.getPDFValues(gmh(i).getMean()');
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
        %dJhrdq(j) = 2*q(j)*dJhrdq(j);
        %Means
        dJhrdmu(:,j) = -(q(j)^2)*dJhrdmu(:,j);
        %Covariances
        %No need
    end
    
    for j=1:length(gmr)
        for i=1:length(gmr)
            prodPDFrr = wGaussPDF(1, mu(:,j), L(:,:,i)'*L(:,:,i) + L(:,:,j)'*L(:,:,j));
            %Weights
            %dJrrdq(j) = dJrrdq(j) + (q(i)^2)*prodPDFrr.getPDFValues(mu(:,i)');
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
        %dJrrdq(j) = 4*q(j)*dJrrdq(j);
        %Means
        dJrrdmu(:,j) = -2*(q(j)^2)*dJrrdmu(:,j);
        %Covariances
        dJrrdL(:,:,j) = 2*dJrrdL(:,:,j);
    end
   
    
    %gfq = dJrrdq - 2*dJhrdq;
    %q = q + sk*gfq/norm(gfq);
    
    gfmu = dJrrdmu - 2*dJhrdmu;
    gfmu = gfmu/norm(gfmu);
    gfL = dJrrdL - 2*dJhrdL;
    
    if size(mu,1)>1
        for i = 1:length(gmr)
            gfL(:,:,i) = gfL(:,:,i)/norm(gfL(:,:,i));
        end
    end
    
    mu = mu - sk*gfmu;
    L = L - sk*gfL;
    
end

%p = q.^2;
%p = p./sum(p);
    
for i=1:length(gmr)
        %gmr(i).setWeight(q(i)^2);
        gmr(i).setMean(mu(:,i));
        gmr(i).setCovariance(L(:,:,i)'*L(:,:,i));
end
    
end