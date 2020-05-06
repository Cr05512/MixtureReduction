function initGM = EM(initGM, samples, numIter)

n = size(initGM(1).mu,1);
N = length(initGM);
M = size(samples,2);
priors = [initGM.w]';
responsibilities = zeros(M,N);
% nISEPrev = nISE(initGM,gmh);
for k=1:numIter
    
    % (Expectation)
   for i = 1:M
        for j=1:N
            responsibilities(i,j) = mvnpdf(samples(:,i)',initGM(j).mu',initGM(j).Sigma)*priors(j);
        end
        normFactor = sum(responsibilities(i,:));
        responsibilities(i,:) = responsibilities(i,:)/normFactor;
    end
    
    
%     if norm(responsibilities-responsibilities_prev)<1e-08
%         k
%         return
%     end
    
    %Maximization
    Nk = sum(responsibilities,1)'; %Total responsibility allocated for the clusters
    priors = Nk./M;
    for i=1:N
        initGM(i).w = priors(i);
        initGM(i).mu = ((1/Nk(i))*responsibilities(:,i)'*samples')';
        newCov = zeros(n,n);
        for j=1:M
            diff = samples(:,j)-initGM(i).mu;
            newCov = newCov + responsibilities(j,i)*diff*diff';
        end
        initGM(i).Sigma = newCov/Nk(i);
    end
    
%     nISENew = nISE(gmh,initGM);
%     if nISENew >= nISEPrev
%         k
%         return
%     else
%         nISEPrev = nISENew;
%     end

end
%gm = initGM;

end

