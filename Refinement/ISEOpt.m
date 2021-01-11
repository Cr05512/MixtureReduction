function gmr_Opt = ISEOpt(gmr,gmh,sk,NOptSteps,optWeights,accThresh)
% gmr_Opt = ISEOpt(gmr,gmh,sk,NOptSteps,optWeights,accThresh):
% INPUTS:
% - gmr, gmh, respectively the reduced and original mixtures,
% - sk, gradient step size (scalar),
% - NOptSteps, number of optimization iterations (scalar),
% - optWeights, binary parameter which accounts for the weight optimization. If
%   set to 1 the weights will be optimized, viceversa (binary variable).
% OUTPUTS:
% - gmr_Opt, optimized mixture,
% This function operates an iterative optimization over the reduced mixture
% parameters in order to get a better approximation.
if nargin < 3
    sk = 0.01;
    NOptSteps = 20;
    optWeights = 1;
    accThresh = 1e-06;
elseif nargin < 4
    NOptSteps = 20;
    optWeights = 1;
    accThresh = 1e-06;
elseif nargin < 5
    optWeights = 1;
    accThresh = 1e-06;
elseif nargin < 6
    accThresh = 1e-06;
end
assert(numel(gmh)>=numel(gmr) && ~isempty(gmr),'The mixtures have to contain at least on element and N must be greater or equal to R.');
assert(sk>0,'The gradient step has to be greater than zero.');
assert(NOptSteps>=0,'The number of optimization steps has to be non-negative.');
assert(optWeights==0 || optWeights==1,'The optWeights parameter can take values either 0 or 1.');

gmr_Opt = gmr;

dr = size(gmr_Opt(1).mu,1);
Nr = numel(gmr_Opt);
Nh = numel(gmh);

wh = [gmh.w]';
muh = [gmh.mu];
Sigmah = cat(3,gmh.Sigma);

q = sqrt([gmr_Opt.w]');
mu = [gmr_Opt.mu];
L = zeros(dr,dr,Nr);
for i=1:Nr
    L(:,:,i) = chol(gmr_Opt(i).Sigma);
end


J = Inf;
J_prev = J;

%The gradient formula is xk+1 = xk - sk*gf(xk)/||gf(xk)||, with sk the step
%and gf is the gradient of the cost function

%We are optimizing with respect to the reduced mixture parameters. Taking
%into account that J = Jhh -2*Jhr + Jrr, we find out that the term Jhh does
%not depend on the parameters of the reduced mixture, that is we can skip
%calculations over that term (it is always zero).

Jhh = selfLikeness(gmh);
for k=1:NOptSteps
    if optWeights == 1
        dJrrdq = zeros(length(q),1);
        dJhrdq = dJrrdq;
    end
    dJhrdmu = zeros(dr,Nr);
    dJrrdmu = dJhrdmu;
    dJhrdL = zeros(dr,dr,Nr);
    dJrrdL = dJhrdL;
   
    for j=1:Nr
        for i=1:Nh
            prodPDFhr = struct('w',1,'mu',mu(:,j),'Sigma',Sigmah(:,:,i) + L(:,:,j)'*L(:,:,j));
            %Weights
            if optWeights == 1
                dJhrdq(j) = dJhrdq(j) + wh(i)*mvnpdf(muh(:,i), prodPDFhr.mu, prodPDFhr.Sigma);
            end
            %Means
            dJhrdmu(:,j) = dJhrdmu(:,j) + wh(i)*inv(Sigmah(:,:,i)...
                + L(:,:,j)'*L(:,:,j))*(mu(:,j)-muh(:,i))*mvnpdf(muh(:,i), prodPDFhr.mu, prodPDFhr.Sigma);
            %Covariances
            dJhrdL(:,:,j) = dJhrdL(:,:,j) + wh(i)*q(j)^2*mvnpdf(muh(:,i), prodPDFhr.mu, prodPDFhr.Sigma)...
                *inv(Sigmah(:,:,i) + L(:,:,j)'*L(:,:,j))*((muh(:,i)-mu(:,j))*...
                (muh(:,i)-mu(:,j))' - (Sigmah(:,:,i)+ L(:,:,j)'*L(:,:,j)))...
                *inv(Sigmah(:,:,i) + L(:,:,j)'*L(:,:,j))*L(:,:,j);
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
    
    for j=1:Nr
        for i=1:Nr
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
    
    if dr==1
        gfLTemp = reshape(gfL,1,Nr);
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
       % p = p./sum(p);
    end

    
   
    for i=1:Nr
        if optWeights == 1
            gmr_Opt(i).w = p(i);
        end
        gmr_Opt(i).mu = mu(:,i);
        gmr_Opt(i).Sigma = L(:,:,i)'*L(:,:,i);
    end

    
    J = Jhh - 2*crossLikeness(gmh,gmr_Opt) + selfLikeness(gmr_Opt);
    if abs(J-J_prev)<accThresh
%          disp(strcat(['ISEOpt converged after',' ',num2str(k),' ','iterations.']));
        break
    end
    J_prev = J;
    
    
end

if optWeights==1
    renormalizeWeights(gmr_Opt);
end

    
end