function [gmr_Opt, nISETraj] = ISEOpt(gmh,gmr,sk,Nsteps,optWeights)
% [gmr_Opt, nISETraj] = ISEOpt(gmh,gmr,sk,Nsteps,optWeights):
% INPUTS:
% - gmh, gmr, two Gaussian mixtures,
% - sk, gradient step size,
% - Nsteps, number of optimization iterations,
% - optWeights, binary parameter which accounts for the weight optimization. If
%   set to 1 the weights will be optimized, viceversa.
% OUTPUTS:
% - gmr_Opt, optimized mixture,
% - nISETraj, this argument contains the normalized ISE values over the optimization phase.
% This function operates an iterative optimization over the reduced mixture
% parameters in order to get a better approximation.
if nargin < 3
    sk = 0.01;
    Nsteps = 30;
    optWeights = 1;
elseif nargin < 4
    Nsteps = 30;
    optWeights = 1;
elseif nargin < 5
    optWeights = 1;
end
assert(sk>0,'The gradient step has to be greater than zero.');
assert(Nsteps>=0,'The number of optimization steps has to be non-negative.');
assert(optWeights==0 || optWeights==1,'The optWeights parameter can take values either 0 or 1.');


n = size(gmr(1).mu,1);
m = length(gmr);

q = zeros(m,1);
mu = zeros(n,m);
L = zeros(n,n,m);

gmr_Opt = gmr;

for i=1:length(gmr_Opt)
    q(i) = sqrt(gmr_Opt(i).w);
    mu(:,i) = gmr_Opt(i).mu;
    L(:,:,i) = chol(gmr_Opt(i).Sigma);
end

nISETraj = zeros(1,Nsteps);

J = Inf;
J_prev = J;

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
            prodPDFhr = struct('w', 1, 'mu', mu(:,j), 'Sigma', gmh(i).Sigma + L(:,:,j)'*L(:,:,j));
            %Weights
            if optWeights == 1
                dJhrdq(j) = dJhrdq(j) + gmh(i).w*mvnpdf(gmh(i).mu', prodPDFhr.mu', prodPDFhr.Sigma);
            end
            %Means
            dJhrdmu(:,j) = dJhrdmu(:,j) + gmh(i).w*inv(gmh(i).Sigma...
                + L(:,:,j)'*L(:,:,j))*(mu(:,j)-gmh(i).mu)*mvnpdf(gmh(i).mu', prodPDFhr.mu', prodPDFhr.Sigma);
            %Covariances
            dJhrdL(:,:,j) = dJhrdL(:,:,j) + gmh(i).w*q(j)^2*mvnpdf(gmh(i).mu', prodPDFhr.mu', prodPDFhr.Sigma)...
                *inv(gmh(i).Sigma + L(:,:,j)'*L(:,:,j))*((gmh(i).mu-mu(:,j))*...
                (gmh(i).mu-mu(:,j))' - (gmh(i).Sigma+ L(:,:,j)'*L(:,:,j)))...
                *inv(gmh(i).Sigma + L(:,:,j)'*L(:,:,j))*L(:,:,j);
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
            prodPDFrr = struct('w',1,'mu',mu(:,j),'Sigma',L(:,:,i)'*L(:,:,i) + L(:,:,j)'*L(:,:,j));
            %Weights
            if optWeights == 1
                dJrrdq(j) = dJrrdq(j) + (q(i)^2)*mvnpdf(mu(:,i)', prodPDFrr.mu', prodPDFrr.Sigma);
            end
            %Means
            dJrrdmu(:,j) = dJrrdmu(:,j) + (q(i)^2)*inv(L(:,:,i)'*L(:,:,i)...
                + L(:,:,j)'*L(:,:,j))*(mu(:,j)-mu(:,i))*mvnpdf(mu(:,i)', prodPDFrr.mu', prodPDFrr.Sigma);
            %Covariances
            dJrrdL(:,:,j) = dJrrdL(:,:,j) + (q(i)^2)*(q(j)^2)*mvnpdf(mu(:,i)', prodPDFrr.mu', prodPDFrr.Sigma)...
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
        if norm(gfq)>0
            gfq = gfq/norm(gfq);
            q = q - sk*gfq;
        end
    end
    gfmu = dJrrdmu - 2*dJhrdmu;
    if norm(gfmu)>0
        gfmu = gfmu/norm(gfmu);
        mu = mu - sk*gfmu;
    end
    
    
    gfL = dJrrdL - 2*dJhrdL;
    
    if n==1
        gfLTemp = reshape(gfL,1,m);
        gfL = gfL./norm(gfLTemp);
    else
%        normTot = 0;
%         for i=1:size(gfL,3)
%             normTot = normTot + norm(gfL(:,:,i));
%         end
        for i=1:size(gfL,3)
            gfL(:,:,i) = gfL(:,:,i)./norm(gfL(:,:,i));
        end
        
    end
    
    
    L = L - sk*gfL;
    
    if optWeights == 1
        p = q.^2;
        p = p./sum(p);
    end
    for i=1:length(gmr_Opt)
        if optWeights == 1
            gmr_Opt(i).w = p(i);
        end
        gmr_Opt(i).mu = mu(:,i);
        gmr_Opt(i).Sigma = L(:,:,i)'*L(:,:,i);
    end
    
    J = ISE(gmh,gmr_Opt);
    if abs(J-J_prev)<1e-06
        break
    end
    J_prev = J;
    
    nISETraj(k) = nISE(gmh,gmr_Opt);
    
end

    
end