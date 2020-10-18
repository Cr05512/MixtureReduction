function gmNew = EM(gm, samples, numIter)

n = size(gm(1).mu,1);
N = length(gm);
M = size(samples,2);
priors = [gm.w]';
responsibilities = zeros(M,N);
gmNew = gm;
llh = -Inf;
llh_prev = llh;
for k=1:numIter
    
    % (Expectation)
   for i = 1:M
        for j=1:N
            responsibilities(i,j) = mvnpdf(samples(:,i)',gmNew(j).mu',gmNew(j).Sigma)*priors(j);
        end
        normFactor = sum(responsibilities(i,:));
        responsibilities(i,:) = responsibilities(i,:)/normFactor;
    end
    
    %Maximization
    Nk = sum(responsibilities,1)'; %Total responsibility allocated for the clusters
    priors = Nk./M;
    for i=1:N
        gmNew(i).w = priors(i);
        gmNew(i).mu = ((1/Nk(i))*responsibilities(:,i)'*samples')';
        newCov = zeros(n,n);
        for j=1:M
            diff = samples(:,j)-gmNew(i).mu;
            newCov = newCov + responsibilities(j,i)*(diff*diff');
        end
        gmNew(i).Sigma = newCov/Nk(i);
    end
    
    if ~mod(k,20)
        llh = llhEM(gmNew,samples);
        if abs(llh-llh_prev)<log(1.105)
            break;
        end
        llh_prev = llh;
    end

end
k

end

