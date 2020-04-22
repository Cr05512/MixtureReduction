function gm = EM(initGM, samples, numIter)

n = size(initGM(1).mu,1);
N = length(initGM);
M = size(samples,2);
priors = [initGM.w]';
posteriors = zeros(M,N);
responsibilities = zeros(M,N);
responsibilities_prev = responsibilities;

for k=1:numIter
    
    % we compute the likelihoods (Expectation)
    for i = 1:M
        for j=1:N
            posteriors(i,j) = mvnpdf(samples(:,i)',initGM(j).mu',initGM(j).Sigma)*priors(j);
        end
    end
    
    for i = 1:M
        normFactor = sum(posteriors(i,:));
        for j=1:N
            responsibilities(i,j) = posteriors(i,j)/normFactor;
        end
    end
    
    
    if norm(responsibilities-responsibilities_prev)<1e-12
        k
        break
    end
    
    %Maximization
    Nk = sum(responsibilities,1)'; %Total responsibility allocated for the clusters
    
    for i=1:N
        priors(i) = Nk(i)/M;
        initGM(i).w = priors(i);
        initGM(i).mu = ((1/Nk(i))*responsibilities(:,i)'*samples')';
        newCov = zeros(n,n);
        for j=1:M
            newCov = newCov + responsibilities(j,i)*((samples(:,j)-initGM(i).mu)*(samples(:,j)-initGM(i).mu)');
        end
        initGM(i).Sigma = newCov/Nk(i);
    end
    

    responsibilities_prev = responsibilities;

end
gm = initGM;

end

