gm = GMGen(10,5);

%%

[wi,mui,Sigmai] = paramsFromMixture(gm);
sumWi = sum(wi);

n = numel(wi);
d = size(mui(:,1),1);

wSqSigmai = zeros(d,d,n);
for i=1:n
    wSqSigmai(:,:,i) = wi(i)*sqrtm(Sigmai(:,:,i));
end

S = 1/sumWi * sum(wSqSigmai,3);

Sigma = S*S;

bar1 = W2Barycenter(gm,200,1e-16);

bar2 = struct('w',sumWi,'mu',bar1.mu,'Sigma',Sigma);

CTD(gm,bar1,'W2ij')
CTD(gm,bar2,'W2ij')