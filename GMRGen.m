function gmr_init = GMRGen(gmh,Nr)
n = size(gmh(1).mu,1);
beta = 0.5;
w = [gmh.w]';
mu = [gmh.mu];
[~,ind] = maxk(w,Nr);
%ind = randperm(length(gmh),Nr);
w = w(ind);
w = w./sum(w);
mu = mu(:,ind);
%mu = mu + -0.1*rand() + 2*0.1*rand();
Sigma = gmh(ind(1)).Sigma - beta*ones(n,n) + 2*beta*rand(n,n,Nr);


gmr_init(Nr) = struct('w',[],'mu',[],'Sigma',[]);
for i=1:Nr
    gmr_init(i).w = w(i);
    gmr_init(i).mu = mu(:,i);
    gmr_init(i).Sigma = Sigma(:,:,i);
end

end

