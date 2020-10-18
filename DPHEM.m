function gmr = DPHEM(gmh,gm_init,I,numIter)

gmr = gm_init;
d = size(gmh(1).mu,1);
Nh = length(gmh);
Nr = length(gmr);



E = zeros(Nh,Nr);
Z = E;

L = Inf; %Variational Lower Bound value
L_prev = L;

for k=1:numIter
    
    %Expectation
    Sigmarinv = arrayfun(@(Sigmaj) inv(Sigmaj),cat(3,gmr.Sigma));
    for i=1:Nh
        for j=1:Nr
            E(i,j) = log(mvnpdf(gmh(i).mu,gmr(j).mu,gmr(j).Sigma)) - 0.5*trace(Sigmarinv(:,:,j)*gmh(i).Sigma);
        end
    end
    
    expNE = exp(I*E);

    Nk = zeros(Nh,1);
    for i=1:Nh
        Z(i,:) = [gmr.w].*expNE(i,:);
        Nk(i) = [gmr.w]*expNE(i,:)';
        if Nk(i)>0
            Z(i,:) = Z(i,:)./Nk(i);
        end
    end
    
    L = varLowerBound(gmh,gmr,E,Z,I);
    if abs(L-L_prev)<1e-15
        break;
    end
    
    %Maximization
    for j=1:Nr
        gmr(j).w = Z(:,j)'*[gmh.w]';
        newMean = zeros(d,1);
        for i=1:Nh
            newMean = newMean + Z(i,j)*gmh(i).w*gmh(i).mu;
        end
        gmr(j).mu = (1/gmr(j).w)*newMean;
        newCov = zeros(d,d);
        for i=1:Nh
            newCov = newCov + Z(i,j)*gmh(i).w*(gmh(i).Sigma + (gmh(i).mu - gmr(j).mu)*(gmh(i).mu - gmr(j).mu)');
        end
        gmr(j).Sigma = (1/gmr(j).w)*newCov;
    end
    
    
    L_prev = L;
    
    
end


end

